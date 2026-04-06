(function () {
    var ids = window.__courseshowIds || {};

    function initBannerModal() {
        var trigger = document.getElementById(ids.heroEditLink);
        var modal = document.getElementById('BannerModal');
        var closeButton = document.getElementById('BannerModalClose');
        var cancelButton = document.getElementById('BannerModalCancel');
        var uploadButton = document.getElementById('BannerUploadButton');
        var dropzone = document.getElementById('BannerDropzone');
        var fileInput = document.getElementById('BannerFileInput');
        var stage = document.getElementById('BannerPreviewStage');
        var empty = document.getElementById('BannerPreviewEmpty');
        var status = document.getElementById('BannerUploadStatus');
        var progress = document.getElementById('BannerUploadProgress');
        var progressBar = document.getElementById('BannerUploadProgressBar');
        var currentState = document.getElementById('BannerCurrentState');
        var hero = document.getElementById(ids.heroSection);
        var hiddenBannerUrl = document.getElementById(ids.hiddenBannerUrl);
        var courseIdField = document.getElementById(ids.hiddenCourseId);
        var selectedFile = null;
        var localPreviewUrl = '';
        var previewUrl = hiddenBannerUrl ? hiddenBannerUrl.value : '';
        var originalUrl = previewUrl;
        var isUploading = false;

        if (!trigger || !modal || !dropzone || !fileInput || !stage || !uploadButton) {
            return;
        }

        function setStatus(message, cls) {
            if (!status) {
                return;
            }

            status.className = 'course-show-banner-status';
            if (cls) {
                status.className += ' ' + cls;
            }
            status.innerHTML = message || '';
        }

        function setCurrentState(hasBanner, pending) {
            if (!currentState) {
                return;
            }

            if (pending) {
                currentState.innerHTML = '当前封面：待上传新图片';
                return;
            }

            currentState.innerHTML = hasBanner ? '当前封面：已设置课程横幅' : '当前封面：默认样式';
        }

        function setProgress(value, visible) {
            if (!progress || !progressBar) {
                return;
            }

            if (visible) {
                progress.removeAttribute('hidden');
            } else {
                progress.setAttribute('hidden', 'hidden');
            }

            progressBar.style.width = Math.max(0, Math.min(100, value || 0)) + '%';
        }

        function setUploadingState(uploading) {
            isUploading = uploading;
            uploadButton.disabled = uploading;
            uploadButton.innerHTML = uploading ? '正在上传...' : '重新上传';
            if (!uploading) {
                setProgress(0, false);
            }
        }

        function pulsePreviewStage() {
            stage.className = stage.className.replace(/\s?is-refreshing/g, '');
            stage.offsetWidth;
            stage.className += ' is-refreshing';
            window.setTimeout(function () {
                stage.className = stage.className.replace(/\s?is-refreshing/g, '');
            }, 460);
        }

        function pulseHero() {
            if (!hero) {
                return;
            }

            hero.className = hero.className.replace(/\s?is-refreshing/g, '');
            hero.offsetWidth;
            hero.className += ' is-refreshing';
            window.setTimeout(function () {
                hero.className = hero.className.replace(/\s?is-refreshing/g, '');
            }, 460);
        }

        function applyStage(url) {
            previewUrl = url || '';
            stage.style.backgroundImage = previewUrl ? "url('" + previewUrl.replace(/'/g, "%27") + "')" : '';
            if (previewUrl) {
                if (stage.className.indexOf('has-image') === -1) {
                    stage.className += ' has-image';
                }
                if (empty) {
                    empty.style.display = 'none';
                }
            } else {
                stage.className = stage.className.replace(/\s?has-image/g, '');
                if (empty) {
                    empty.style.display = 'flex';
                }
            }
        }

        function clearLocalPreview() {
            if (localPreviewUrl && window.URL && window.URL.revokeObjectURL) {
                window.URL.revokeObjectURL(localPreviewUrl);
            }
            localPreviewUrl = '';
        }

        function applyHero(url) {
            if (!hero) {
                return;
            }

            if (url) {
                if (hero.className.indexOf('has-banner') === -1) {
                    hero.className += ' has-banner';
                }
                hero.style.backgroundImage = "url('" + url.replace(/'/g, "%27") + "')";
            } else {
                hero.className = hero.className.replace(/\s?has-banner/g, '');
                hero.style.backgroundImage = '';
            }

            pulseHero();
        }

        function uploadSelectedBanner() {
            var cid = courseIdField ? courseIdField.value : '';
            var formData;

            if (isUploading) {
                return false;
            }

            if (!selectedFile) {
                setStatus('请先选择一张新的横幅图片', 'is-error');
                return false;
            }

            if (!cid) {
                setStatus('缺少课程编号，无法上传横幅', 'is-error');
                return false;
            }

            if (!window.FormData || !window.jQuery || !jQuery.ajax) {
                setStatus('当前页面缺少上传能力支持', 'is-error');
                return false;
            }

            formData = new FormData();
            formData.append('action', 'upload');
            formData.append('cid', cid);
            formData.append('banner', selectedFile);

            setUploadingState(true);
            setProgress(8, true);
            setStatus('正在上传并更新横幅...', '');

            jQuery.ajax({
                url: 'coursebanner.ashx',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                dataType: 'json',
                xhr: function () {
                    var xhr = jQuery.ajaxSettings.xhr();
                    if (xhr && xhr.upload) {
                        xhr.upload.onprogress = function (ev) {
                            if (ev.lengthComputable) {
                                setProgress(Math.round((ev.loaded / ev.total) * 100), true);
                            }
                        };
                    }
                    return xhr;
                },
                success: function (response) {
                    setUploadingState(false);
                    if (!response || response.success !== true || !response.bannerUrl) {
                        setStatus(response && response.message ? response.message : '横幅更新失败，请重试', 'is-error');
                        return;
                    }

                    originalUrl = response.bannerUrl;
                    selectedFile = null;
                    clearLocalPreview();
                    if (hiddenBannerUrl) {
                        hiddenBannerUrl.value = response.bannerUrl;
                    }
                    fileInput.value = '';
                    applyStage(response.bannerUrl);
                    applyHero(response.bannerUrl);
                    setCurrentState(true, false);
                    setStatus(response.message || '横幅已更新', 'is-success');
                    window.setTimeout(function () {
                        closeModal();
                    }, 700);
                },
                error: function () {
                    setUploadingState(false);
                    setStatus('上传失败，请检查网络后重试', 'is-error');
                }
            });

            return false;
        }

        function validateAndPreview(file) {
            var type = (file.type || '').toLowerCase();
            var objectUrl;
            var img;

            if (type.indexOf('image/') !== 0) {
                setStatus('请选择图片文件', 'is-error');
                return;
            }

            if (file.size > 5 * 1024 * 1024) {
                setStatus('图片大小不能超过 5MB', 'is-error');
                return;
            }

            if (!window.URL || !window.URL.createObjectURL) {
                selectedFile = file;
                setStatus('已选择新图片，正在上传横幅...', '');
                uploadSelectedBanner();
                return;
            }

            clearLocalPreview();
            objectUrl = window.URL.createObjectURL(file);
            localPreviewUrl = objectUrl;
            img = new Image();
            img.onload = function () {
                var width = img.width || 0;
                var height = img.height || 0;
                var ratio = height ? (width / height) : 0;
                var tips = [];

                if (width < 960 || height < 320) {
                    clearLocalPreview();
                    setStatus('建议上传更大的横幅图片，至少 960 x 320', 'is-error');
                    return;
                }

                if (ratio < 2.1) {
                    tips.push('当前图片偏窄，建议使用更宽的横向封面');
                }

                if (ratio > 4.6) {
                    tips.push('当前图片过宽，封面展示时可能被裁切');
                }

                selectedFile = file;
                applyStage(objectUrl);
                pulsePreviewStage();
                setCurrentState(true, true);
                setStatus(tips.length ? tips.join('；') + '，正在上传横幅...' : '图片校验通过，正在上传横幅...', tips.length ? '' : '');
                uploadSelectedBanner();
            };

            img.onerror = function () {
                clearLocalPreview();
                setStatus('图片读取失败，请重新选择', 'is-error');
            };

            img.src = objectUrl;
        }

        function openModal() {
            selectedFile = null;
            fileInput.value = '';
            modal.className += modal.className.indexOf('is-open') === -1 ? ' is-open' : '';
            modal.setAttribute('aria-hidden', 'false');
            setStatus('', '');
            setCurrentState(!!originalUrl, false);
            applyStage(originalUrl);
        }

        function closeModal() {
            modal.className = modal.className.replace(/\s?is-open/g, '');
            modal.setAttribute('aria-hidden', 'true');
            dropzone.className = dropzone.className.replace(/\s?is-dragover/g, '');
            clearLocalPreview();
            selectedFile = null;
            if (!selectedFile) {
                applyStage(originalUrl);
            }
        }

        function pickFile(file) {
            if (!file) {
                return;
            }

            validateAndPreview(file);
        }

        trigger.onclick = function () {
            if (trigger.getAttribute('aria-disabled') === 'true') {
                return false;
            }
            openModal();
            return false;
        };

        if (closeButton) {
            closeButton.onclick = function () {
                closeModal();
                return false;
            };
        }

        if (cancelButton) {
            cancelButton.onclick = function () {
                closeModal();
                return false;
            };
        }

        modal.onclick = function (ev) {
            ev = ev || window.event;
            if (ev.target === modal) {
                closeModal();
            }
        };

        if (document.addEventListener) {
            document.addEventListener('keydown', function (ev) {
                ev = ev || window.event;
                if ((ev.key === 'Escape' || ev.keyCode === 27) && modal.className.indexOf('is-open') > -1) {
                    closeModal();
                }
            }, false);
        }

        fileInput.onchange = function () {
            if (fileInput.files && fileInput.files.length) {
                pickFile(fileInput.files[0]);
            }
        };

        if (modal.addEventListener) {
            modal.addEventListener('paste', function (ev) {
                var items = ev.clipboardData && ev.clipboardData.items ? ev.clipboardData.items : null;
                var i;
                if (!items) {
                    return;
                }

                for (i = 0; i < items.length; i++) {
                    if (items[i].kind === 'file' && items[i].type.indexOf('image/') === 0) {
                        pickFile(items[i].getAsFile());
                        if (ev.preventDefault) {
                            ev.preventDefault();
                        }
                        return;
                    }
                }
            }, false);
        }

        function stopEvent(ev) {
            if (ev.preventDefault) {
                ev.preventDefault();
            }
            if (ev.stopPropagation) {
                ev.stopPropagation();
            }
        }

        dropzone.ondragenter = dropzone.ondragover = function (ev) {
            stopEvent(ev);
            if (dropzone.className.indexOf('is-dragover') === -1) {
                dropzone.className += ' is-dragover';
            }
            return false;
        };

        dropzone.ondragleave = function (ev) {
            stopEvent(ev);
            dropzone.className = dropzone.className.replace(/\s?is-dragover/g, '');
            return false;
        };

        dropzone.ondrop = function (ev) {
            stopEvent(ev);
            dropzone.className = dropzone.className.replace(/\s?is-dragover/g, '');
            var files = ev.dataTransfer ? ev.dataTransfer.files : null;
            if (files && files.length) {
                pickFile(files[0]);
            }
            return false;
        };

        uploadButton.onclick = function () {
            return uploadSelectedBanner();
        };

        applyStage(originalUrl);
        setCurrentState(!!originalUrl, false);
    }

    function initDragSort() {
        var list = document.getElementById('MenuList');
        if (!list) { return; }

        var activeRow = null;
        var dragProxy = null;
        var placeholder = null;
        var dragOffsetY = 0;
        var startOrder = '';
        var lastClientY = 0;
        var rafId = 0;
        var moveHandler = null;
        var endHandler = null;
        var currentOrderValue = '';
        var isDirty = false;
        var isSaving = false;
        var saveButton = document.getElementById('MenuSortSaveButton');
        var statusNode = document.getElementById('MenuSortStatus');
        var hiddenOrder = document.getElementById(ids.hiddenSortOrder);
        var courseIdField = document.getElementById(ids.hiddenCourseId);
        var saveButtonDefaultText = saveButton ? (saveButton.innerHTML || '保存排序') : '保存排序';
        var statusTimer = 0;

        function getRows() {
            return Array.prototype.slice.call(list.children).filter(function (el) {
                return el.getAttribute && el.getAttribute('data-lid');
            });
        }

        function getOrder() {
            return getRows().map(function (r) { return r.getAttribute('data-lid'); });
        }

        function setStatus(message, statusClass) {
            if (!statusNode) { return; }
            if (statusTimer) { window.clearTimeout(statusTimer); statusTimer = 0; }
            statusNode.className = 'course-show-save-status' + (statusClass ? ' ' + statusClass : '');
            statusNode.innerHTML = message || '';
            if (statusClass === 'is-success' && message) {
                statusTimer = window.setTimeout(function () {
                    statusNode.className = 'course-show-save-status is-success is-fading';
                    window.setTimeout(function () {
                        if (!isDirty) { statusNode.className = 'course-show-save-status'; statusNode.innerHTML = ''; }
                    }, 280);
                }, 1600);
            }
        }

        function setSaveButtonState(saving) {
            if (!saveButton) { return; }
            saveButton.disabled = saving;
            saveButton.innerHTML = saving ? '保存中...' : saveButtonDefaultText;
        }

        function setDirtyState(dirty) {
            isDirty = dirty;
            currentOrderValue = getOrder().join(',');
            if (hiddenOrder) { hiddenOrder.value = currentOrderValue; }
            if (saveButton) { saveButton.style.display = dirty ? 'inline-flex' : 'none'; setSaveButtonState(false); }
            if (!dirty) { setStatus('', ''); } else { setStatus('顺序已调整，点击保存后生效', ''); }
        }

        function updateSortBadges() {
            getRows().forEach(function (row, i) {
                var label = row.querySelector('[id$="LabelLsort"]');
                if (label) { label.textContent = String(i + 1); }
            });
        }

        function removeProxy() {
            if (dragProxy && dragProxy.parentNode) { dragProxy.parentNode.removeChild(dragProxy); }
            dragProxy = null;
        }

        function removePlaceholder() {
            if (placeholder && placeholder.parentNode) { placeholder.parentNode.removeChild(placeholder); }
            placeholder = null;
        }

        function createProxy(row) {
            removeProxy();
            var rect = row.getBoundingClientRect();
            var clone = row.cloneNode(true);
            clone.className = clone.className.replace(/\s?dragging/g, '');
            clone.style.width = rect.width + 'px';
            clone.style.boxSizing = 'border-box';
            var wrapper = document.createElement('div');
            wrapper.className = 'course-show-drag-proxy';
            wrapper.style.width = rect.width + 'px';
            wrapper.appendChild(clone);
            document.body.appendChild(wrapper);
            dragProxy = wrapper;
        }

        function createPlaceholder() {
            removePlaceholder();
            var el = document.createElement('div');
            el.className = 'course-show-placeholder';
            placeholder = el;
        }

        function moveProxy(clientY) {
            if (!dragProxy || !activeRow) { return; }
            var rect = activeRow.getBoundingClientRect();
            dragProxy.style.transform = 'translate3d(' + rect.left + 'px,' + (clientY - dragOffsetY) + 'px,0)';
        }

        function movePlaceholder(clientY) {
            if (!placeholder || !activeRow) { return; }
            var rows = getRows().filter(function (r) { return r !== activeRow; });
            for (var i = 0; i < rows.length; i++) {
                var rect = rows[i].getBoundingClientRect();
                if (clientY < rect.top + rect.height / 2) {
                    list.insertBefore(placeholder, rows[i]);
                    return;
                }
            }
            list.appendChild(placeholder);
        }

        function applyRowMove() {
            if (!activeRow || !placeholder || !placeholder.parentNode) { return; }
            list.insertBefore(activeRow, placeholder);
            updateSortBadges();
        }

        function autoScroll(clientY) {
            var edge = 72, step = 18;
            if (clientY < edge) { window.scrollBy(0, -step); }
            else if (clientY > window.innerHeight - edge) { window.scrollBy(0, step); }
        }

        function handlePointerMove(clientY) {
            lastClientY = clientY;
            if (rafId) { return; }
            rafId = window.requestAnimationFrame(function () {
                rafId = 0;
                moveProxy(lastClientY);
                movePlaceholder(lastClientY);
                applyRowMove();
                autoScroll(lastClientY);
            });
        }

        function bindActiveEvents() {
            if (!moveHandler) {
                moveHandler = function (ev) {
                    if (!activeRow) { return; }
                    ev = ev || window.event;
                    if (ev.preventDefault && ev.touches) { ev.preventDefault(); }
                    handlePointerMove(getClientY(ev));
                };
            }
            if (!endHandler) { endHandler = function () { finishDrag(); }; }
            if (document.addEventListener) {
                document.addEventListener('mousemove', moveHandler, false);
                document.addEventListener('mouseup', endHandler, false);
                document.addEventListener('touchmove', moveHandler, false);
                document.addEventListener('touchend', endHandler, false);
                document.addEventListener('touchcancel', endHandler, false);
            }
        }

        function unbindActiveEvents() {
            if (document.removeEventListener) {
                if (moveHandler) { document.removeEventListener('mousemove', moveHandler, false); document.removeEventListener('touchmove', moveHandler, false); }
                if (endHandler) { document.removeEventListener('mouseup', endHandler, false); document.removeEventListener('touchend', endHandler, false); document.removeEventListener('touchcancel', endHandler, false); }
            }
        }

        function saveSort() {
            if (!isDirty || isSaving) { return; }
            var cid = courseIdField ? courseIdField.value : '';
            var orderValue = currentOrderValue || getOrder().join(',');
            if (!cid || !orderValue) { setStatus('保存失败，缺少排序数据', 'is-error'); return; }
            isSaving = true;
            setSaveButtonState(true);
            setStatus('正在保存排序...', '');
            if (!window.jQuery || !jQuery.ajax) {
                isSaving = false; setSaveButtonState(false); setStatus('保存失败，页面缺少 AJAX 支持', 'is-error'); return;
            }
            jQuery.ajax({
                type: 'POST', url: 'courseshow.aspx/SaveSort',
                contentType: 'application/json; charset=utf-8', dataType: 'json',
                data: JSON.stringify({ cid: cid, order: orderValue }),
                success: function (response) {
                    isSaving = false;
                    var ok = response && response.d === true;
                    setSaveButtonState(false);
                    if (ok) { setDirtyState(false); setStatus('排序已保存', 'is-success'); }
                    else { setStatus('保存失败，请重试', 'is-error'); }
                },
                error: function () { isSaving = false; setSaveButtonState(false); setStatus('保存失败，请检查网络后重试', 'is-error'); }
            });
        }

        function startDrag(row, clientY) {
            activeRow = row;
            startOrder = getOrder().join(',');
            dragOffsetY = Math.max(16, clientY - row.getBoundingClientRect().top);
            createProxy(row);
            row.className += ' dragging';
            createPlaceholder();
            list.insertBefore(placeholder, row.nextSibling);
            moveProxy(clientY);
            bindActiveEvents();
        }

        function finishDrag() {
            if (!activeRow) { return; }
            if (rafId) { window.cancelAnimationFrame(rafId); rafId = 0; }
            activeRow.className = activeRow.className.replace(/\s?dragging/g, '');
            removeProxy();
            removePlaceholder();
            unbindActiveEvents();
            var currentOrder = getOrder().join(',');
            if (startOrder && currentOrder && startOrder !== currentOrder) {
                updateSortBadges();
                setDirtyState(true);
            }
            activeRow = null;
            startOrder = '';
        }

        function getClientY(ev) {
            if (typeof ev.clientY === 'number') { return ev.clientY; }
            if (ev.touches && ev.touches.length) { return ev.touches[0].clientY; }
            if (ev.changedTouches && ev.changedTouches.length) { return ev.changedTouches[0].clientY; }
            return 0;
        }

        function bindRow(row) {
            if (!row || !row.getAttribute('data-lid')) { return; }
            var handle = row.querySelector('.course-show-drag');
            if (!handle) { return; }
            handle.onmousedown = function (ev) {
                ev = ev || window.event;
                if (ev.preventDefault) { ev.preventDefault(); }
                startDrag(row, getClientY(ev));
                return false;
            };
            handle.ontouchstart = function (ev) {
                ev = ev || window.event;
                if (ev.preventDefault) { ev.preventDefault(); }
                startDrag(row, getClientY(ev));
                return false;
            };
        }

        getRows().forEach(bindRow);
        updateSortBadges();
        currentOrderValue = getOrder().join(',');
        if (hiddenOrder) { hiddenOrder.value = currentOrderValue; }

        if (saveButton) {
            saveButton.onclick = function () { saveSort(); return false; };
        }

        if (window.addEventListener) {
            window.addEventListener('beforeunload', function (ev) {
                if (!isDirty) { return; }
                var message = '当前排序尚未保存，离开页面将丢失本次调整。';
                if (ev) { ev.returnValue = message; }
                return message;
            }, false);
        }
    }

    if (window.addEventListener) {
        window.addEventListener('load', initBannerModal, false);
        window.addEventListener('load', initDragSort, false);
    } else if (window.attachEvent) {
        window.attachEvent('onload', initBannerModal);
        window.attachEvent('onload', initDragSort);
    }
})();
