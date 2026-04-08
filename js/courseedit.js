var kindEditorObj;
                    var wangEditorObj;
                    var vditorObj;
                    var currentEditor = 'kindeditor';
                    var lastVditorMarkdown = null;
                    var lastVditorHtml = '';
                    var vditorReady = false;
                    var pendingVditorHtml = null;
                    var cid = window.__courseeditConfig.myCid;
                    var ty = "Course";
                    var upjs = '../kindeditor/aspnet/upload_json.aspx?cid=' + cid + '&ty=' + ty;
                    var fmjs = '../kindeditor/aspnet/file_manager_json.aspx?cid=' + cid + '&ty=' + ty;

                    KindEditor.ready(function (K) {
                        kindEditorObj = K.create('textarea[name="ctl00$Content$mcontent"]', {
                            resizeType: 1,
                            newlineTag: "br",
                            cssPath: ['../kindeditor/plugins/code/prettify.css'],
                            uploadJson: upjs,
                            fileManagerJson: fmjs,
                            allowFileManager: true,
                            filterMode: false,
                            afterCreate: function () {
                                window.setTimeout(autoSelectInitialEditor, 0);
                            }});
                    });
                     function isProbablyHtml(content) {
                         return /<\/?[a-z][\s\S]*>/i.test(content || '');
                     }

                     function isLikelyMarkdown(content) {
                         if (!content) return false;
                         return /```/.test(content)
                             || /^#{1,6}\s/m.test(content)
                             || /^\s*[-*+]\s/m.test(content)
                             || /^\s*\d+\.\s/m.test(content)
                             || /\[[^\]]+\]\([^)]+\)/.test(content);
                     }

                     function normalizeEditorContent(content) {
                         return (content || '').replace(/\s+/g, ' ').trim();
                     }

                     function getPreferredVditorValue(content) {
                         if (!content) return '';
                         return isProbablyHtml(content) ? safeHtml2Md(content) : content;
                     }

                     function rememberVditorState() {
                         if (!vditorObj) return;
                         lastVditorMarkdown = vditorObj.getValue();
                         lastVditorHtml = vditorObj.getHTML();
                     }

                     function shouldRestoreSavedMarkdown(currentHtml) {
                         if (lastVditorMarkdown === null) return false;
                         var currentNormalized = normalizeEditorContent(currentHtml);
                         var savedNormalized = normalizeEditorContent(lastVditorHtml);
                         return currentNormalized === '' || currentNormalized === savedNormalized;
                     }

                     function autoSelectInitialEditor() {
                         var selector = document.getElementById('editorSelector');
                         var field = document.getElementById(window.__courseeditConfig.mcontentId);
                         if (!selector || !field) return;
                         if (isLikelyMarkdown(field.value)) {
                             selector.value = 'vditor';
                             switchEditor('vditor');
                         }
                     }

                     function initWangEditor() {
                         if (wangEditorObj) return;
                         const { createEditor, createToolbar } = window.wangEditor;
                         const field = document.getElementById(window.__courseeditConfig.mcontentId);
                         wangEditorObj = createEditor({
                             selector: '#wangeditor-text',
                             html: kindEditorObj ? kindEditorObj.html() : (field ? field.value : ''),
                             config: {
                                 placeholder: '请输入内容...',
                                 MENU_CONF: {
                                     uploadImage: {
                                         server: upjs,
                                         customInsert(res, insertFn) {
                                             if (res.error === 0) insertFn(res.url);
                                             else alert(res.message || '图片上传失败');
                                         }
                                     },
                                     uploadAttachment: {
                                         server: upjs,
                                         customInsert(res) {
                                             if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res);
                                             else alert(res.message || '附件上传失败');
                                         }
                                     },
                                     uploadFile: {
                                         server: upjs,
                                         customInsert(res) {
                                             if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res);
                                             else alert(res.message || '文件上传失败');
                                         }
                                     }
                                 }
                             }
                         });
                         createToolbar({ editor: wangEditorObj, selector: '#wangeditor-toolbar', config: {} });
                     }

                     function safeHtml2Md(html) {
                         try {
                             if (vditorObj && vditorObj.vditor && vditorObj.vditor.lute) return vditorObj.vditor.lute.HTML2Md(html);
                             var l = Lute.New();
                             return l.HTML2Md(html);
                         } catch (e) {
                             return html;
                         }
                     }

                     function initVditor() {
                         if (vditorObj) return;
                         const field = document.getElementById(window.__courseeditConfig.mcontentId);
                         let initialContent = getPreferredVditorValue(lastVditorMarkdown !== null ? lastVditorMarkdown : (kindEditorObj ? kindEditorObj.html() : (field ? field.value : '')));
                         vditorObj = new Vditor('vditor-container', {
                             height: 400,
                                 width: '100%',
                             mode: 'ir',
                             upload: { handler: function (files) { LearnSiteEditorUploadHelper.handleVditorUpload(vditorObj, upjs, files); } },
                             preview: { mode: 'both' },
                             cache: { enable: false },
                             after: () => {
                                 vditorReady = true;
                                 let contentToSet = pendingVditorHtml !== null ? pendingVditorHtml : initialContent;
                                 vditorObj.setValue(contentToSet || '');
                                 rememberVditorState();
                                 pendingVditorHtml = null;
                             }
                         });
                     }

                     function switchEditor(type) {
                         currentEditor = type;
                         var kindContainer = document.querySelector('.ke-container');
                         var wangContainer = document.getElementById('wangeditor-wrap');
                         var vditorContainer = document.getElementById('vditor-wrap');
                         var currentHtml = '';
                         if (kindContainer && kindContainer.style.display !== 'none' && kindEditorObj) currentHtml = kindEditorObj.html();
                         else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) currentHtml = wangEditorObj.getHtml();
                         else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj && vditorReady) {
                             rememberVditorState();
                             currentHtml = lastVditorHtml;
                         }
                         if (kindContainer) kindContainer.style.display = 'none';
                         if (wangContainer) wangContainer.style.display = 'none';
                         if (vditorContainer) vditorContainer.style.display = 'none';
                         if (type === 'kindeditor') {
                             if (kindContainer) kindContainer.style.display = 'block';
                             if (kindEditorObj && currentHtml) kindEditorObj.html(currentHtml);
                         } else if (type === 'wangeditor') {
                             if (wangContainer) wangContainer.style.display = 'block';
                             initWangEditor();
                             if (wangEditorObj && currentHtml) wangEditorObj.setHtml(currentHtml);
                         } else if (type === 'vditor') {
                             if (vditorContainer) vditorContainer.style.display = 'block';
                             var vditorContent = shouldRestoreSavedMarkdown(currentHtml) ? lastVditorMarkdown : getPreferredVditorValue(currentHtml);
                             if (!vditorObj) {
                                 pendingVditorHtml = vditorContent;
                                 initVditor();
                             } else if (vditorReady) {
                                 vditorObj.setValue(vditorContent || '');
                                 rememberVditorState();
                             } else {
                                 pendingVditorHtml = vditorContent;
                             }
                         }
                     }

                     function syncContent() {
                         var field = document.getElementById(window.__courseeditConfig.mcontentId);
                         if (!field) return true;
                         if (currentEditor === 'kindeditor') {
                             if (kindEditorObj) field.value = kindEditorObj.html();
                         } else if (currentEditor === 'wangeditor') {
                             if (wangEditorObj) field.value = wangEditorObj.getHtml();
                         } else if (currentEditor === 'vditor') {
                             if (vditorObj) {
                                 rememberVditorState();
                                 field.value = lastVditorMarkdown || '';
                             }
                         }
                         return true;
                     }

(function(){
        var hero = document.getElementById('EditHeroSection');
        var modal = document.getElementById('CeBannerModal');
        var trigger = document.getElementById('BannerTrigger');
        var closeBtn = document.getElementById('CeBannerClose');
        var cancelBtn = document.getElementById('CeBannerCancel');
        var saveBtn = document.getElementById('CeBannerSave');
        var dropzone = document.getElementById('CeBannerDropzone');
        var fileInput = document.getElementById('CeBannerFile');
        var preview = document.getElementById('CeBannerPreview');
        var status = document.getElementById('CeBannerStatus');
        var hiddenUrl = document.getElementById(window.__courseeditConfig.hiddenBannerUrlId);
        var hlBanner = document.getElementById(window.__courseeditConfig.hLbannerId);
        var cidField = document.querySelector('input[id$="HiddenCourseId"]');
        var selectedFile = null;

        // 初始化：如果已有横幅则应用
        var initUrl = hlBanner ? hlBanner.href : '';
        if (initUrl && initUrl !== window.location.href) applyHero(initUrl);

        function applyHero(url) {
            if (!url) return;
            hero.style.backgroundImage = "url('" + url.replace(/'/g,"\\'"  ) + "')";
            hero.classList.add('has-banner');
        }

        function setStatus(msg, cls) {
            status.textContent = msg;
            status.className = 'ce-banner-status' + (cls ? ' ' + cls : '');
        }

        trigger.addEventListener('click', function(){ modal.classList.add('is-open'); });
        closeBtn.addEventListener('click', closeModal);
        cancelBtn.addEventListener('click', closeModal);
        modal.addEventListener('click', function(e){ if(e.target===modal) closeModal(); });

        function closeModal(){
            modal.classList.remove('is-open');
            selectedFile = null;
            preview.style.display = 'none';
            setStatus('');
            fileInput.value = '';
        }

        fileInput.addEventListener('change', function(){
            if (this.files && this.files[0]) previewFile(this.files[0]);
        });
        dropzone.addEventListener('dragover', function(e){ e.preventDefault(); dropzone.classList.add('is-dragover'); });
        dropzone.addEventListener('dragleave', function(){ dropzone.classList.remove('is-dragover'); });
        dropzone.addEventListener('drop', function(e){
            e.preventDefault(); dropzone.classList.remove('is-dragover');
            if (e.dataTransfer.files && e.dataTransfer.files[0]) previewFile(e.dataTransfer.files[0]);
        });

        function previewFile(file) {
            selectedFile = file;
            var url = URL.createObjectURL(file);
            preview.style.backgroundImage = "url('" + url + "')";
            preview.style.display = 'block';
            setStatus('已选择：' + file.name);
        }

        saveBtn.addEventListener('click', function(){
            if (!selectedFile) { setStatus('请先选择图片', 'is-error'); return; }
            var cid = new URLSearchParams(window.location.search).get('cid');
            if (!cid) { setStatus('缺少课程编号', 'is-error'); return; }
            var fd = new FormData();
            fd.append('action', 'upload');
            fd.append('cid', cid);
            fd.append('banner', selectedFile);
            saveBtn.disabled = true;
            setStatus('上传中...');
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'coursebanner.ashx');
            xhr.onload = function(){
                saveBtn.disabled = false;
                try {
                    var res = JSON.parse(xhr.responseText);
                    if (res.success && res.bannerUrl) {
                        applyHero(res.bannerUrl);
                        if (hlBanner) hlBanner.href = res.bannerUrl;
                        if (hiddenUrl) hiddenUrl.value = res.bannerUrl;
                        setStatus('横幅已更新', 'is-success');
                        setTimeout(closeModal, 700);
                    } else {
                        setStatus(res.message || '上传失败', 'is-error');
                    }
                } catch(e) { setStatus('响应解析失败', 'is-error'); }
            };
            xhr.onerror = function(){ saveBtn.disabled = false; setStatus('网络错误', 'is-error'); };
            xhr.send(fd);
        });
    })();
