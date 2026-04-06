var kindEditorObj;
            var wangEditorObj;
            var vditorObj;
            var currentEditor = 'kindeditor';
            var lastVditorMarkdown = null;
            var lastVditorHtml = '';

            var cid= window.__missioneditConfig.myCid;
            var ty="Course";
            var upjs= '../kindeditor/aspnet/upload_json.aspx?cid='+cid+'&Ty='+ty;
            var fmjs='../kindeditor/aspnet/file_manager_json.aspx?cid='+cid+'&Ty='+ty;

		    KindEditor.ready(function (K) {
		        kindEditorObj = K.create('textarea[name="ctl00$Content$mcontent"]', {
		            resizeType: 1,
		            newlineTag: "br", 
				uploadJson : upjs,
				fileManagerJson : fmjs,
				allowFileManager : true,
				filterMode : false,
					afterCreate : function() {
						this.loadPlugin('autoheight');
						window.setTimeout(autoSelectInitialEditor, 0);
					}		            
		        });
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
                var mcontent = document.getElementById(window.__missioneditConfig.mcontentId);
                if (!selector || !mcontent) return;
                if (isLikelyMarkdown(mcontent.value)) {
                    selector.value = 'vditor';
                    switchEditor('vditor');
                }
            }

            function initWangEditor() {
                if (wangEditorObj) return;
                const { createEditor, createToolbar } = window.wangEditor;
                const mcontent = document.getElementById(window.__missioneditConfig.mcontentId);

                wangEditorObj = createEditor({
                    selector: '#wangeditor-text',
                    html: kindEditorObj ? kindEditorObj.html() : mcontent.value,
                        config: {
                            placeholder: '请输入内容...',
                            MENU_CONF: {
                                uploadImage: {
                                    server: upjs,
                                    customInsert(res, insertFn) {
                                        if (res.error === 0) {
                                            insertFn(res.url);
                                        } else {
                                            alert(res.message || '图片上传失败');
                                        }
                                    }
                                },
                                uploadAttachment: {
                                    server: upjs,
                                    customInsert(res, insertFn) {
                                        if (res.error === 0) {
                                            if (wangEditorObj) {
                                                LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res);
                                            }
                                        } else {
                                            alert(res.message || '附件上传失败');
                                        }
                                    }
                                },
                                uploadFile: {
                                    server: upjs,
                                    customInsert(res, insertFn) {
                                        if (res.error === 0) {
                                            if (wangEditorObj) {
                                                LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res);
                                            }
                                        } else {
                                            alert(res.message || '文件上传失败');
                                        }
                                    }
                                }
                            }
                    }
                });

                createToolbar({
                    editor: wangEditorObj,
                    selector: '#wangeditor-toolbar',
                    config: {}
                });
            }

            let pendingVditorHtml = null;
            let vditorReady = false;

            function safeHtml2Md(html) {
                try {
                    if (vditorObj && vditorObj.vditor && vditorObj.vditor.lute) {
                        return vditorObj.vditor.lute.HTML2Md(html);
                    }
                    var l = Lute.New();
                    return l.HTML2Md(html);
                } catch(e) {
                    return html;
                }
            }

            function initVditor() {
                if (vditorObj) return;
                const mcontent = document.getElementById(window.__missioneditConfig.mcontentId);
                let initialContent = getPreferredVditorValue(lastVditorMarkdown !== null ? lastVditorMarkdown : mcontent.value);

                vditorObj = new Vditor('vditor-container', {
                    height: 400,
                    width: '100%',
                    mode: 'ir',
                    upload: {
                        handler: function (files) {
                            LearnSiteEditorUploadHelper.handleVditorUpload(vditorObj, upjs, files);
                        }
                    },
                    preview: {
                        mode: 'both'
                    },
                    cache: {
                        enable: false
                    },
                    after: () => {
                        vditorReady = true;
                        let contentToSet = pendingVditorHtml !== null ? getPreferredVditorValue(pendingVditorHtml) : initialContent;
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
                if (kindContainer && kindContainer.style.display !== 'none' && kindEditorObj) {
                    currentHtml = kindEditorObj.html();
                } else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) {
                    currentHtml = wangEditorObj.getHtml();
                } else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj) {
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
                    if (wangContainer) {
                        wangContainer.style.display = 'block';
                    }
                    initWangEditor();
                    if (wangEditorObj && currentHtml) {
                        wangEditorObj.setHtml(currentHtml);
                    }
                } else if (type === 'vditor') {
                    if (vditorContainer) {
                        vditorContainer.style.display = 'block';
                    }
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
                var mcontent = document.getElementById(window.__missioneditConfig.mcontentId);
                if (currentEditor === 'kindeditor') {
                    if (kindEditorObj) {
                        mcontent.value = kindEditorObj.html();
                    }
                } else if (currentEditor === 'wangeditor') {
                    if (wangEditorObj) {
                        mcontent.value = wangEditorObj.getHtml();
                    }
                } else if (currentEditor === 'vditor') {
                    if (vditorObj) {
                        rememberVditorState();
                        mcontent.value = lastVditorMarkdown || '';
                    }
                }
                return true;
            }
