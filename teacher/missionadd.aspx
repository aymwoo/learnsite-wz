<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="missionadd.aspx.cs" Inherits="Teacher_missionadd" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .mission-add-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #312e81 0%, #4338ca 55%, #6366f1 100%);
            --content-add-primary-bg: #4f46e5;
            --content-add-primary-hover: #4338ca;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
        }

        .mission-add-page .content-add-panel {
            position: relative;
            overflow: hidden;
        }

        .mission-add-page .content-add-panel:after {
            content: "";
            position: absolute;
            inset: 0 auto auto 0;
            width: 100%;
            height: 1px;
            background: linear-gradient(90deg, rgba(99, 102, 241, 0.24) 0%, rgba(99, 102, 241, 0.06) 55%, rgba(99, 102, 241, 0) 100%);
            pointer-events: none;
        }

        .mission-add-page .content-add-grid {
            align-items: end;
            row-gap: 1.25rem;
        }

        .mission-add-page .content-add-input,
        .mission-add-page .content-add-select {
            width: 100%;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, transform 0.2s ease;
        }

        .mission-add-page .content-add-input:hover,
        .mission-add-page .content-add-select:hover {
            border-color: #a5b4fc;
        }

        .mission-add-page .content-add-input:focus,
        .mission-add-page .content-add-select:focus {
            transform: translateY(-1px);
        }

        .mission-add-page .content-add-field-title {
            grid-column: span 6;
        }

        .mission-add-page .content-add-field-type,
        .mission-add-page .content-add-field-rubric {
            grid-column: span 3;
        }

        .mission-add-page .content-add-field-options {
            grid-column: span 12;
        }

        .mission-add-page .content-add-select-worktype {
            min-width: 8.5rem;
        }

        .mission-add-page .content-add-checks {
            gap: 1rem 1.4rem;
            border-color: #dbe4f0;
            background: linear-gradient(180deg, #f8fbff 0%, #f8fafc 100%);
        }

        @media (max-width: 900px) {
            .mission-add-page .content-add-field-title,
            .mission-add-page .content-add-field-type,
            .mission-add-page .content-add-field-rubric,
            .mission-add-page .content-add-field-options {
                grid-column: span 12;
            }
        }

        .mission-add-editor-stage textarea {
            width: 100%;
            height: 550px;
        }
        
        .editor-ai-layout {
            display: flex;
            gap: 1.5rem;
            align-items: flex-start;
        }
        
        .editor-container {
            flex: 1;
            min-width: 0;
        }
        
        .ai-assistant-panel {
            width: 350px;
            flex-shrink: 0;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
            display: flex;
            flex-direction: column;
            overflow: hidden;
            position: sticky;
            top: 20px;
        }
        
        .ai-panel-header {
            background: linear-gradient(135deg, #4f46e5 0%, #6366f1 100%);
            color: #ffffff;
            padding: 1rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .ai-panel-body {
            padding: 1rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        
        .ai-prompt-input {
            width: 100%;
            height: 80px;
            padding: 0.75rem;
            border: 1px solid #cbd5e1;
            border-radius: 0.5rem;
            resize: none;
            font-family: inherit;
            font-size: 0.9rem;
        }
        
        .ai-prompt-input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }
        
        .ai-generate-btn {
            background: #4f46e5;
            color: #ffffff;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .ai-generate-btn:hover {
            background: #4338ca;
        }
        
        .ai-generate-btn:disabled {
            background: #94a3b8;
            cursor: not-allowed;
        }
        
        .ai-result-area {
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            padding: 0.75rem;
            background: #f8fafc;
            min-height: 200px;
            max-height: 350px;
            overflow-y: auto;
            font-size: 0.9rem;
            line-height: 1.5;
            color: #334155;
            white-space: pre-wrap;
        }

        .ai-progress-wrap {
            display: none;
            padding: 0.75rem;
            border: 1px solid #dbeafe;
            border-radius: 0.5rem;
            background: #f8fbff;
        }

        .ai-progress-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 0.5rem;
            font-size: 0.85rem;
        }

        .ai-progress-text {
            color: #1e40af;
            font-weight: 600;
        }

        .ai-progress-percent {
            color: #475569;
            font-variant-numeric: tabular-nums;
        }

        .ai-progress-track {
            width: 100%;
            height: 8px;
            border-radius: 999px;
            background: #dbeafe;
            overflow: hidden;
        }

        .ai-progress-bar {
            width: 0;
            height: 100%;
            border-radius: 999px;
            background: linear-gradient(90deg, #4f46e5 0%, #3b82f6 100%);
            transition: width 0.25s ease;
        }

        .ai-progress-note {
            margin-top: 0.5rem;
            font-size: 0.8rem;
            color: #64748b;
            line-height: 1.5;
        }
        
        .ai-panel-footer {
            padding: 1rem;
            border-top: 1px solid #e2e8f0;
            display: flex;
            gap: 0.5rem;
        }
        
        .ai-action-btn {
            flex: 1;
            padding: 0.5rem;
            border-radius: 0.375rem;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            text-align: center;
            border: 1px solid #cbd5e1;
            background: #ffffff;
            color: #475569;
            transition: all 0.2s;
        }
        
        .ai-action-btn:hover {
            background: #f1f5f9;
            color: #0f172a;
        }
        
        .ai-action-btn.primary {
            background: #ecfdf5;
            border-color: #34d399;
            color: #059669;
        }
        
        .ai-action-btn.primary:hover {
            background: #d1fae5;
        }
        
        .ai-loading-spinner {
            display: none;
            width: 1rem;
            height: 1rem;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .mission-toast {
            position: fixed;
            right: 1.5rem;
            bottom: 1.5rem;
            z-index: 3000;
            display: flex;
            align-items: flex-start;
            gap: 0.75rem;
            min-width: 14rem;
            max-width: min(24rem, calc(100vw - 2rem));
            padding: 0.9rem 1rem;
            border-radius: 0.95rem;
            background: rgba(15, 23, 42, 0.92);
            color: #f8fafc;
            box-shadow: 0 18px 40px -24px rgba(15, 23, 42, 0.75);
            opacity: 0;
            transform: translateY(12px);
            pointer-events: none;
            transition: opacity 0.22s ease, transform 0.22s ease;
        }

        .mission-toast:before {
            content: "";
            position: absolute;
            inset: 0 auto 0 0;
            width: 4px;
            border-radius: 0.95rem 0 0 0.95rem;
            background: rgba(255, 255, 255, 0.28);
        }

        .mission-toast.is-visible {
            opacity: 1;
            transform: translateY(0);
        }

        .mission-toast-icon {
            flex: 0 0 auto;
            width: 1.25rem;
            height: 1.25rem;
            margin-top: 0.08rem;
        }

        .mission-toast-message {
            flex: 1;
            min-width: 0;
            line-height: 1.55;
            font-size: 0.92rem;
        }

        .mission-toast.is-success {
            background: rgba(5, 150, 105, 0.96);
        }

        .mission-toast.is-error {
            background: rgba(220, 38, 38, 0.96);
        }

        .mission-toast.is-info {
            background: rgba(37, 99, 235, 0.96);
        }
    </style>

    <div class="content-add-page mission-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add Learning Activity</span>
                    <h1 class="content-add-title">添加学习活动</h1>
                    <p class="content-add-subtitle">保留活动标题、作品类型、提交方式、分组协作、远程图片和评价量规等原有业务逻辑，只重构页面布局与编辑体验。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">活动设置</h2>
                <p class="content-add-section-desc">以下字段仍沿用当前后台逻辑与提交方式，创建成功后继续返回当前学案页面。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-title">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">活动名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" CssClass="content-add-input"></asp:TextBox>
                    </div>

                    <div class="content-add-field content-add-field-type">
                        <label class="content-add-label" for="<%= DDLmfiletype.ClientID %>">作品类型</label>
                        <asp:DropDownList ID="DDLmfiletype" runat="server" Font-Names="Arial" CssClass="content-add-select content-add-select-worktype"></asp:DropDownList>
                    </div>

                    <div class="content-add-field content-add-field-rubric">
                        <label class="content-add-label" for="<%= DDLMgid.ClientID %>">评价标准</label>
                        <asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt" Font-Names="Arial" CssClass="content-add-select"></asp:DropDownList>
                    </div>

                    <div class="content-add-field content-add-field-options">
                        <span class="content-add-label">活动选项</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckUpload" runat="server" Text="是否提交" Checked="True" />
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                            <asp:CheckBox ID="CheckGroup" runat="server" Text="小组合作" />
                            <asp:CheckBox ID="CheckRemote" runat="server" Text="远程图片" ToolTip="自动下载远程图片，有时失效！" />
                            <asp:CheckBox ID="CheckMicoWorld" runat="server" Text="上次作品" Checked="False" ToolTip="显示上一节课作品，适合项目学习" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <link href="../js/vendors/wangeditor/style.css" rel="stylesheet">
                <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
                <script src="../js/vendors/vditor/index.min.js"></script>
                <script src="../js/vendors/wangeditor/index.js"></script>

                <div class="content-add-editor-toolbar">
                    <div>
                        <h2 class="content-add-section-title">活动说明</h2>
                        <p class="content-add-section-desc">支持 KindEditor、WangEditor 和 Vditor 三种编辑方式切换，仍通过原有 `textareaItem` 完成内容提交。</p>
                    </div>
                    <div>
                        <label class="content-add-label" for="editorSelector">编辑器选择</label><br />
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="content-add-editor-select">
                            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                            <option value="wangeditor">富文本编辑器 (WangEditor)</option>
                            <option value="vditor">Markdown编辑器 (Vditor)</option>
                        </select>
                    </div>
                </div>

                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
                <script>
                    var missionToastTimer = null;
                    var missionToastIcons = {
                        success: '<svg viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="2"><path d="M16.5 5.5 8 14 3.5 9.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
                        error: '<svg viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="2"><path d="M10 6v4" stroke-linecap="round"></path><circle cx="10" cy="13.5" r="0.8" fill="currentColor" stroke="none"></circle><path d="M8.7 3.8 2.9 14a1.5 1.5 0 0 0 1.3 2.2h11.6a1.5 1.5 0 0 0 1.3-2.2L11.3 3.8a1.5 1.5 0 0 0-2.6 0Z" stroke-linejoin="round"></path></svg>',
                        info: '<svg viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="2"><path d="M10 8.2v4.3" stroke-linecap="round"></path><circle cx="10" cy="5.6" r="0.9" fill="currentColor" stroke="none"></circle><circle cx="10" cy="10" r="7" stroke-linecap="round"></circle></svg>'
                    };

                    function showToast(message, type) {
                        var toast = document.getElementById('mission-toast');
                        var toastIcon = document.getElementById('mission-toast-icon');
                        var toastMessage = document.getElementById('mission-toast-message');
                        var toastType = type === 'success' ? 'success' : (type === 'info' ? 'info' : 'error');
                        var duration = toastType === 'success' ? 2200 : (toastType === 'info' ? 2400 : 3400);

                        if (!toast || !message) {
                            return;
                        }

                        toast.className = 'mission-toast';
                        toast.classList.add('is-visible');
                        toast.classList.add('is-' + toastType);

                        if (toastIcon) {
                            toastIcon.innerHTML = missionToastIcons[toastType];
                        }

                        if (toastMessage) {
                            toastMessage.textContent = message;
                        }

                        if (missionToastTimer) {
                            clearTimeout(missionToastTimer);
                        }

                        missionToastTimer = setTimeout(function () {
                            toast.className = 'mission-toast';
                        }, duration);
                    }

                    var kindEditorObj;
                    var wangEditorObj;
                    var vditorObj;
                    var currentEditor = 'kindeditor';
                    var lastVditorMarkdown = null;
                    var lastVditorHtml = '';

                    var cid = <%=myCid() %>;
                    var ty = "Course";
                    var upjs = '../kindeditor/aspnet/upload_json.aspx?cid=' + cid + '&Ty=' + ty;
                    var fmjs = '../kindeditor/aspnet/file_manager_json.aspx?cid=' + cid + '&Ty=' + ty;

                    KindEditor.ready(function (K) {
                        kindEditorObj = K.create('textarea[name="textareaItem"]', {
                            resizeType: 1,
                            newlineTag: "br",
                            uploadJson: upjs,
                            fileManagerJson: fmjs,
                            allowFileManager: true,
                            filterMode: false,
                            afterCreate: function () {
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
                        var ta = document.getElementsByName('textareaItem')[0];
                        if (!selector || !ta) return;
                        if (isLikelyMarkdown(ta.value)) {
                            selector.value = 'vditor';
                            switchEditor('vditor');
                        }
                    }

                    function initWangEditor() {
                        if (wangEditorObj) return;
                        const { createEditor, createToolbar } = window.wangEditor;
                        const ta = document.getElementsByName('textareaItem')[0];

                        wangEditorObj = createEditor({
                            selector: '#wangeditor-text',
                            html: kindEditorObj ? kindEditorObj.html() : (ta ? ta.value : ''),
                            config: {
                                placeholder: '请输入内容...',
                                MENU_CONF: {
                                    uploadImage: {
                                        server: upjs,
                                        customInsert(res, insertFn) {
                                            if (res.error === 0) {
                                                insertFn(res.url);
                                            } else {
                                                showToast(res.message || '图片上传失败', 'error');
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
                                                showToast(res.message || '附件上传失败', 'error');
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
                                                showToast(res.message || '文件上传失败', 'error');
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
                        } catch (e) {
                            return html;
                        }
                    }

                    function initVditor() {
                        if (vditorObj) return;
                        const ta = document.getElementsByName('textareaItem')[0];
                        let initialContent = getPreferredVditorValue(lastVditorMarkdown !== null ? lastVditorMarkdown : (ta ? ta.value : ''));

                        vditorObj = new Vditor('vditor-container', {
                            height: 400,
                            width: '830px',
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
                        var ta = document.getElementsByName('textareaItem')[0];
                        if (currentEditor === 'kindeditor') {
                            if (kindEditorObj) {
                                ta.value = kindEditorObj.html();
                            }
                        } else if (currentEditor === 'wangeditor') {
                            if (wangEditorObj) {
                                ta.value = wangEditorObj.getHtml();
                            }
                        } else if (currentEditor === 'vditor') {
                            if (vditorObj) {
                                rememberVditorState();
                                ta.value = lastVditorMarkdown || '';
                            }
                        }
                        return true;
                    }
                </script>

                <div class="editor-ai-layout">
                    <div class="editor-container">
                        <div class="content-add-editor-stage mission-add-editor-stage custom-scrollbar" style="width: 100%; max-width: 830px;">
                            <div id="wangeditor-wrap" style="display:none; width: 100%; position:relative; border: 1px solid #ccc; z-index: 100;">
                                <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
                                <div id="wangeditor-text" style="height: 350px;"></div>
                            </div>

                            <div id="vditor-wrap" style="display:none; width: 100%; position:relative; margin-bottom: 10px;">
                                <div id="vditor-container"></div>
                            </div>

                            <textarea name="textareaItem"></textarea>
                        </div>
                    </div>
                    
                    <div class="ai-assistant-panel">
                        <div class="ai-panel-header">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2a2 2 0 0 1 2 2c-.11.89-.34 2.08-1.52 3.16C11.3 8.24 10.38 9 8 9a2 2 0 0 1-2-2c.11-.89.34-2.08 1.52-3.16C8.7 2.76 9.62 2 12 2Z"></path><path d="M12 10v12"></path><path d="M12 10a2 2 0 0 0-2 2c.11.89.34 2.08 1.52 3.16.89.8 1.81 1.56 4.19 1.56a2 2 0 0 0 2-2c-.11-.89-.34-2.08-1.52-3.16C15.3 10.76 14.38 10 12 10Z"></path></svg>
                            AI 教学助手
                        </div>
                        <div class="ai-panel-body">
                            <div>
                                <label style="font-size: 0.85rem; color: #64748b; margin-bottom: 0.5rem; display: block;">描述您需要的教学内容：</label>
                                <textarea id="ai-prompt" class="ai-prompt-input" placeholder="例如：帮我生成一份关于《Python条件判断》的学案，包含学习目标、示例代码和练习题。"></textarea>
                            </div>
                            <button type="button" id="ai-generate-btn" class="ai-generate-btn" onclick="generateAIContent()">
                                <div id="ai-loading" class="ai-loading-spinner"></div>
                                <span id="ai-btn-text">生成内容</span>
                            </button>
                            <div id="ai-progress-wrap" class="ai-progress-wrap">
                                <div class="ai-progress-header">
                                    <span id="ai-progress-text" class="ai-progress-text">准备生成</span>
                                    <span id="ai-progress-percent" class="ai-progress-percent">0%</span>
                                </div>
                                <div class="ai-progress-track">
                                    <div id="ai-progress-bar" class="ai-progress-bar"></div>
                                </div>
                                <div id="ai-progress-note" class="ai-progress-note">输入提示词后，系统会调用当前默认 AI Provider 生成教学内容。</div>
                            </div>
                            <div>
                                <label style="font-size: 0.85rem; color: #64748b; margin-bottom: 0.5rem; display: block;">生成结果：</label>
                                <div id="ai-result" class="ai-result-area"></div>
                            </div>
                        </div>
                        <div class="ai-panel-footer">
                            <button type="button" class="ai-action-btn" onclick="copyAIContent()">复制结果</button>
                            <button type="button" class="ai-action-btn primary" onclick="insertAIContent()">一键插入编辑器</button>
                        </div>
                    </div>
                </div>
                
                <script>
                    function setAIProgress(percent, text, note) {
                        var progressWrap = document.getElementById('ai-progress-wrap');
                        var progressBar = document.getElementById('ai-progress-bar');
                        var progressText = document.getElementById('ai-progress-text');
                        var progressPercent = document.getElementById('ai-progress-percent');
                        var progressNote = document.getElementById('ai-progress-note');

                        progressWrap.style.display = 'block';
                        progressBar.style.width = percent + '%';
                        progressText.innerText = text;
                        progressPercent.innerText = percent + '%';
                        progressNote.innerText = note || '';
                    }

                    function resetAIProgress() {
                        var progressWrap = document.getElementById('ai-progress-wrap');
                        var progressBar = document.getElementById('ai-progress-bar');
                        var progressText = document.getElementById('ai-progress-text');
                        var progressPercent = document.getElementById('ai-progress-percent');
                        var progressNote = document.getElementById('ai-progress-note');

                        progressWrap.style.display = 'none';
                        progressBar.style.width = '0%';
                        progressText.innerText = '准备生成';
                        progressPercent.innerText = '0%';
                        progressNote.innerText = '输入提示词后，系统会调用当前默认 AI Provider 生成教学内容。';
                    }

                    function generateAIContent() {
                        var prompt = document.getElementById('ai-prompt').value.trim();
                        if (!prompt) {
                            showToast('请输入提示词', 'info');
                            return;
                        }
                        
                        var btn = document.getElementById('ai-generate-btn');
                        var btnText = document.getElementById('ai-btn-text');
                        var loading = document.getElementById('ai-loading');
                        var resultArea = document.getElementById('ai-result');
                        
                        btn.disabled = true;
                        btnText.innerText = '正在生成...';
                        loading.style.display = 'block';
                        resultArea.innerHTML = '<span style="color:#64748b;">生成中，结果完成后会显示在这里。</span>';
                        setAIProgress(10, '正在提交请求', '已将教学内容需求发送到 AI 服务，请稍候。');
                        
                        var xhr = new XMLHttpRequest();
                        xhr.timeout = 125000;
                        xhr.open("POST", "aiprovider_api.ashx", true);
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        xhr.onreadystatechange = function() {
                            if (xhr.readyState === 2) {
                                setAIProgress(45, '服务端处理中', '请求已送达，AI 正在分析提示词并生成内容。');
                                return;
                            }

                            if (xhr.readyState === 3) {
                                setAIProgress(75, '正在整理结果', '已收到返回数据，正在整理生成结果。');
                                return;
                            }

                            if (xhr.readyState === 4) {
                                btn.disabled = false;
                                btnText.innerText = '生成内容';
                                loading.style.display = 'none';
                                
                                if (xhr.status === 200) {
                                    try {
                                        var res = JSON.parse(xhr.responseText);
                                        if (res.success) {
                                            var text = res.data;
                                            resultArea.innerText = text;
                                            setAIProgress(100, '生成完成', 'AI 教学助手已返回内容，可复制或一键插入编辑器。');
                                            showToast('AI 内容生成完成', 'success');
                                        } else {
                                            resultArea.innerHTML = '';
                                            setAIProgress(100, '生成失败', 'AI Provider 已返回错误，请检查默认模型配置或稍后重试。');
                                            showToast(res.msg || '生成失败', 'error');
                                        }
                                    } catch (e) {
                                            resultArea.innerHTML = '';
                                            setAIProgress(100, '解析失败', '已收到响应，但结果格式不符合预期。');
                                        showToast('解析响应失败', 'error');
                                    }
                                } else {
                                    resultArea.innerHTML = '';
                                    setAIProgress(100, '请求失败', '接口请求未成功完成，请检查网络或服务端状态。');
                                    showToast('请求失败，状态码：' + xhr.status, 'error');
                                }
                            }
                        };
                        xhr.onerror = function() {
                            btn.disabled = false;
                            btnText.innerText = '生成内容';
                            loading.style.display = 'none';
                            resultArea.innerHTML = '';
                            setAIProgress(100, '网络异常', '未能连接到 AI Provider 接口，请检查网络或服务器配置。');
                            showToast('网络异常，无法连接 AI 接口', 'error');
                        };
                        xhr.ontimeout = function() {
                            btn.disabled = false;
                            btnText.innerText = '生成内容';
                            loading.style.display = 'none';
                            resultArea.innerHTML = '';
                            setAIProgress(100, '请求超时', 'AI 生成超过 125 秒未返回，可能是模型响应较慢、提示词较长或服务端繁忙。');
                            showToast('请求超时，请稍后重试', 'error');
                        };
                        xhr.send("action=chat&prompt=" + encodeURIComponent(prompt));
                    }
                    
                    function copyAIContent() {
                        var resultArea = document.getElementById('ai-result');
                        var text = resultArea.innerText;
                        if (!text || text.indexOf('生成中，结果完成后会显示在这里。') !== -1 || text.indexOf('错误：') === 0 || text.indexOf('请求失败') === 0 || text.indexOf('网络异常') === 0 || text.indexOf('请求超时') === 0 || text.indexOf('解析响应失败') === 0) {
                            showToast('没有可复制的内容', 'info');
                            return;
                        }
                        
                        navigator.clipboard.writeText(text).then(function() {
                            showToast('已复制到剪贴板', 'success');
                        }, function(err) {
                            showToast('复制失败: ' + err, 'error');
                        });
                    }
                    
                    function formatTextToHtml(text) {
                        return text.replace(/\n/g, '<br/>');
                    }
                    
                    function insertAIContent() {
                        var resultArea = document.getElementById('ai-result');
                        var text = resultArea.innerText;
                        if (!text || text.indexOf('生成中，结果完成后会显示在这里。') !== -1 || text.indexOf('错误：') === 0 || text.indexOf('请求失败') === 0 || text.indexOf('网络异常') === 0 || text.indexOf('请求超时') === 0 || text.indexOf('解析响应失败') === 0) {
                            showToast('没有可插入的内容', 'info');
                            return;
                        }
                        
                        if (currentEditor === 'kindeditor') {
                            if (kindEditorObj) {
                                kindEditorObj.insertHtml(formatTextToHtml(text));
                            }
                        } else if (currentEditor === 'wangeditor') {
                            if (wangEditorObj) {
                                // WangEditor V5
                                wangEditorObj.dangerouslyInsertHtml(formatTextToHtml(text));
                            }
                        } else if (currentEditor === 'vditor') {
                            if (vditorObj) {
                                vditorObj.insertValue(text);
                            }
                        }
                        showToast('已成功插入到编辑器', 'success');
                    }
                </script>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加活动" OnClick="Btnadd_Click" OnClientClick="return syncContent();" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="返回学案" OnClick="BtnCourse_Click" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
    <div id="mission-toast" class="mission-toast" aria-live="polite">
        <span id="mission-toast-icon" class="mission-toast-icon"></span>
        <span id="mission-toast-message" class="mission-toast-message"></span>
    </div>
</asp:Content>
