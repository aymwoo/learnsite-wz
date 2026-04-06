<%@ Page Validaterequest="false" Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher"  AutoEventWireup="true" CodeFile="courseedit.aspx.cs" Inherits="Teacher_courseedit" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .course-edit-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #312e81 0%, #4338ca 55%, #6366f1 100%);
            --workspace-primary-bg: #4f46e5;
            --workspace-primary-hover: #4338ca;
            padding: 28px;
            background: var(--workspace-page-bg);
            box-sizing: border-box;
        }
        .course-edit-page * { box-sizing: border-box; }

        .course-edit-hero {
            border-radius: 1rem;
            padding: 18px 24px;
            background: var(--workspace-hero-bg);
            color: #eef2ff;
            margin-bottom: 16px;
            position: relative;
            overflow: hidden;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .course-edit-title { margin: 0; font-size: 20px; font-weight: 800; letter-spacing: -.02em; }

        .course-edit-panel, .course-edit-editor-panel, .course-edit-feedback, .course-edit-actions {
            background: #fff;
            border: 1px solid #e8edf5;
            border-radius: .85rem;
            padding: 16px 20px;
            margin-bottom: 12px;
            box-shadow: 0 2px 8px rgba(15,23,42,.03);
        }
        .course-edit-actions { display: flex; align-items: center; gap: 12px; padding: 18px 24px; }
        .course-edit-feedback { background: #f8fafc; border-color: #e2e8f0; }
        .course-edit-feedback:empty { display: none; }
        .course-edit-section-title { margin: 0 0 3px; font-size: 15px; font-weight: 800; color: #0f172a; }
        .course-edit-section-desc  { margin: 0 0 16px; font-size: 13px; color: #64748b; line-height: 1.7; }

        .course-edit-label { display: block; font-size: 12px; font-weight: 700; color: #64748b; margin-bottom: 4px; letter-spacing: 0.01em; text-transform: uppercase; }
        .course-edit-input, .course-edit-select {
            width: 100%; height: 32px; min-height: 32px; padding: 0 10px;
            border: 1px solid #e2e8f0; border-radius: .6rem;
            background: #f8fafc; color: #0f172a; font-size: 13px;
            transition: border-color .2s, box-shadow .2s;
            appearance: none; -webkit-appearance: none;
        }
        .course-edit-field .course-edit-select { width: auto; border-radius: .4rem; }
        select[id$="DDLcobj"] { min-width: 80px; }
        .course-edit-input:focus, .course-edit-select:focus {
            border-color: #818cf8; outline: none; background: #fff;
            box-shadow: 0 0 0 3px rgba(129,140,248,.15);
        }
        .course-edit-select {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%2394a3b8' stroke-width='2.5' stroke-linecap='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat; background-position: right 10px center; padding-right: 28px;
        }
        .course-edit-static { display: flex; align-items: center; gap: 6px; font-size: 13px; color: #334155; min-height: 32px; }
        .course-edit-static .course-edit-select { width: auto; min-width: 64px; flex-shrink: 0; }
        .course-edit-publish { display: inline-flex; align-items: center; gap: 8px; font-size: 13px; font-weight: 600; cursor: pointer; color: #334155; min-height: 32px; }

        .course-edit-primary-btn {
            display: inline-flex; align-items: center; justify-content: center; gap: 6px;
            min-height: 42px; padding: 0 28px; border: none; border-radius: .9rem;
            font-size: 14px; font-weight: 700; color: #fff; cursor: pointer;
            background: linear-gradient(135deg,#4f46e5,#4338ca);
            box-shadow: 0 8px 20px -8px rgba(79,70,229,.55); transition: transform .15s, box-shadow .15s;
        }
        .course-edit-primary-btn:hover { transform: translateY(-1px); box-shadow: 0 12px 24px -8px rgba(79,70,229,.6); }
        .course-edit-secondary-btn {
            display: inline-flex; align-items: center; justify-content: center;
            min-height: 42px; padding: 0 24px; border: 1px solid #e2e8f0; border-radius: .9rem;
            font-size: 14px; font-weight: 700; color: #475569; cursor: pointer;
            background: #fff; transition: background .15s, border-color .15s;
        }
        .course-edit-secondary-btn:hover { background: #f8fafc; border-color: #c7d2fe; color: #3730a3; }

        .course-edit-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 0.65rem;
            align-items: flex-end;
        }
        .course-edit-field { flex: 0 0 auto; min-width: 0; }
        .course-edit-field-wide { flex: 1 1 100%; }

        .course-edit-editor-toolbar {
            display: flex; flex-wrap: wrap; justify-content: space-between;
            gap: 1rem; align-items: flex-end; margin-bottom: 14px;
        }
        .course-edit-editor-select {
            min-height: 38px; padding: 0 32px 0 12px; border: 1px solid #e2e8f0;
            border-radius: .75rem; background: #f8fafc; color: #334155;
            font-size: 13px; font-weight: 600; cursor: pointer;
            appearance: none; -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%2394a3b8' stroke-width='2.5' stroke-linecap='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat; background-position: right 10px center;
            transition: border-color .2s, box-shadow .2s;
        }
        .course-edit-editor-select:focus { border-color: #818cf8; outline: none; box-shadow: 0 0 0 3px rgba(129,140,248,.18); }
        .course-edit-editor-stage {
            border: 1px solid #e8edf5; border-radius: .85rem;
            background: #fafbff; padding: 12px; overflow: hidden;
        }
        .course-edit-editor-stage .ke-container,
        .course-edit-editor-stage #wangeditor-wrap,
        .course-edit-editor-stage #vditor-wrap,
        .course-edit-editor-stage textarea {
            max-width: 100%; width: 100% !important;
        }
        .course-edit-msg { display: block; font-size: 14px; font-weight: 600; color: #0f172a; line-height: 1.7; }
        .course-edit-msg:empty { display: none; }

        .course-edit-banner-row {
            display: grid;
            grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
            gap: 1rem;
        }

        .course-edit-banner-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.95rem;
            padding: 0 0.95rem;
            border-radius: 0.375rem;
            border: 1px solid #bbf7d0;
            background: #ecfdf5;
            color: #166534;
            font-weight: 700;
            text-decoration: none;
        }

        .course-edit-banner-link:hover {
            background: #dcfce7;
            color: #14532d;
        }

        .course-edit-file input[type="file"] {
            width: 100%;
        }

        .course-edit-editor-toolbar {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 1rem;
            align-items: center;
            margin-bottom: 1rem;
        }

        .course-edit-editor-stage {
            border: 1px solid #dbe4f0;
            border-radius: 1rem;
            background: #ffffff;
            padding: 1rem;
            overflow-x: auto;
        }

        .course-edit-editor-stage .ke-container,
        .course-edit-editor-stage #wangeditor-wrap,
        .course-edit-editor-stage #vditor-wrap,
        .course-edit-editor-stage textarea {
            max-width: 100%;
        }

        @media (max-width: 900px) {
            .course-edit-field {
                grid-column: span 6;
            }

            .course-edit-banner-row {
                grid-template-columns: 1fr;
            }
        }

        .course-edit-shell {
            position: relative;
        }

        .course-edit-hero {
            position: relative;
            overflow: hidden;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            transition: background-image 0.3s ease;
        }

        .course-edit-hero.has-banner::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, rgba(15,23,42,0.55) 0%, rgba(49,46,129,0.45) 100%);
            pointer-events: none;
        }

        .course-edit-hero.has-banner .course-edit-hero-content {
            position: relative;
            z-index: 1;
            color: #fff;
        }

        .course-edit-hero.has-banner .course-edit-eyebrow,
        .course-edit-hero.has-banner .course-edit-subtitle {
            color: rgba(255,255,255,0.85);
        }

        .course-edit-banner-trigger {
            position: absolute;
            top: 16px;
            right: 16px;
            z-index: 10;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 14px;
            border-radius: 0.375rem;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(8px);
            color: #fff;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: background .15s;
        }

        .course-edit-banner-trigger:hover { background: rgba(255,255,255,0.25); }
        .course-edit-banner-trigger svg { width: 16px; height: 16px; flex-shrink: 0; }

        /* Banner Modal */
        .ce-banner-modal {
            display: none;
            position: fixed;
            inset: 0;
            z-index: 9999;
            background: rgba(15,23,42,0.55);
            align-items: center;
            justify-content: center;
        }
        .ce-banner-modal.is-open { display: flex; }
        .ce-banner-dialog {
            background: #fff;
            border-radius: 1rem;
            width: 100%;
            max-width: 520px;
            box-shadow: 0 24px 60px rgba(15,23,42,0.2);
            overflow: hidden;
        }
        .ce-banner-head {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            padding: 20px 24px 0;
        }
        .ce-banner-title { margin: 0; font-size: 16px; font-weight: 800; color: #0f172a; }
        .ce-banner-desc  { margin: 4px 0 0; font-size: 13px; color: #64748b; }
        .ce-banner-close {
            display: inline-flex; align-items: center; justify-content: center;
            width: 32px; height: 32px; border-radius: 50%; border: none;
            background: #f1f5f9; cursor: pointer; flex-shrink: 0;
        }
        .ce-banner-close svg { width: 16px; height: 16px; stroke: #64748b; fill: none; stroke-width: 2; stroke-linecap: round; }
        .ce-banner-body { padding: 20px 24px; }
        .ce-banner-dropzone {
            display: flex; flex-direction: column; align-items: center; justify-content: center;
            gap: 10px; padding: 32px 20px;
            border: 2px dashed #cbd5e1; border-radius: 1rem;
            background: #f8fafc; cursor: pointer; transition: all .15s; text-align: center;
            position: relative;
        }
        .ce-banner-dropzone.is-dragover { border-color: #60a5fa; background: #eff6ff; }
        .ce-banner-dropzone svg { width: 36px; height: 36px; stroke: #94a3b8; fill: none; stroke-width: 1.5; stroke-linecap: round; }
        .ce-banner-dropzone input[type=file] { position: absolute; inset: 0; opacity: 0; cursor: pointer; }
        .ce-banner-drop-title { font-size: 14px; font-weight: 700; color: #334155; }
        .ce-banner-drop-desc  { font-size: 12px; color: #64748b; }
        .ce-banner-preview {
            display: none; margin-top: 12px; border-radius: .75rem; overflow: hidden;
            height: 120px; background-size: cover; background-position: center;
            border: 1px solid #e2e8f0;
        }
        .ce-banner-status { margin-top: 10px; font-size: 13px; font-weight: 600; min-height: 20px; }
        .ce-banner-status.is-error { color: #dc2626; }
        .ce-banner-status.is-success { color: #16a34a; }
        .ce-banner-foot {
            display: flex; justify-content: flex-end; gap: 10px;
            padding: 16px 24px; border-top: 1px solid #f1f5f9;
        }
        .ce-banner-btn {
            display: inline-flex; align-items: center; justify-content: center;
            min-height: 40px; padding: 0 20px; border-radius: 0.375rem; border: 1px solid #e2e8f0;
            font-size: 14px; font-weight: 700; cursor: pointer; background: #fff; color: #475569;
            transition: background .15s;
        }
        .ce-banner-btn.primary {
            background: linear-gradient(135deg,#4f46e5,#4338ca); color: #fff; border: none;
            box-shadow: 0 4px 12px rgba(79,70,229,.2);
        }
        .ce-banner-btn:disabled { opacity: .5; cursor: not-allowed; }
    </style>

    <div class="course-edit-page">
        <div class="course-edit-shell">
            <section id="EditHeroSection" class="course-edit-hero">
                <button type="button" class="course-edit-banner-trigger" id="BannerTrigger">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M12 5H7a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-5"></path><path d="M16.5 4.5a2.12 2.12 0 1 1 3 3L12 15l-4 1 1-4 7.5-7.5z"></path></svg>
                    编辑横幅
                </button>
                <div class="course-edit-hero-content">
                    <h1 class="course-edit-title">学案编辑</h1>
                </div>
            </section>

            <section class="course-edit-panel">
                <div class="course-edit-grid">
                    <div class="course-edit-field course-edit-field-wide">
                        <label class="course-edit-label" for="<%= Texttitle.ClientID %>">学案名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" CssClass="course-edit-input"></asp:TextBox>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLclass.ClientID %>">学案分类</label>
                        <asp:DropDownList ID="DDLclass" runat="server" Font-Size="9pt" CssClass="course-edit-select"></asp:DropDownList>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLcobj.ClientID %>">授课年级</label>
                        <asp:DropDownList ID="DDLcobj" runat="server" Font-Size="9pt" CssClass="course-edit-select"></asp:DropDownList>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLCterm.ClientID %>">学期设置</label>
                        <div class="course-edit-static">
                            第&nbsp;<asp:DropDownList ID="DDLCterm" runat="server" Font-Names="Arial" Font-Size="8pt" CssClass="course-edit-select">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem Selected="True">2</asp:ListItem>
                            </asp:DropDownList>
                            学期
                        </div>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLCks.ClientID %>">课节</label>
                        <div class="course-edit-static">
                            第&nbsp;<asp:DropDownList ID="DDLCks" runat="server" Font-Size="8pt" Font-Names="Arial" CssClass="course-edit-select"></asp:DropDownList>
                            课节
                        </div>
                    </div>

                    <div class="course-edit-field">
                        <span class="course-edit-label">发布设置</span>
                        <label class="course-edit-publish" for="<%= CheckPublish.ClientID %>">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                        </label>
                    </div>

                    <div class="course-edit-field course-edit-field-wide" style="display:none;">
                        <span class="course-edit-label">横幅设置</span>
                        <div class="course-edit-banner-row">
                            <asp:HyperLink ID="HLbanner" runat="server" Target="_blank" CssClass="course-edit-banner-link">学案横幅</asp:HyperLink>
                            <div class="course-edit-file">
                                <asp:FileUpload ID="Fupload" runat="server" Font-Size="10pt" />
                            </div>
                        </div>
                    </div>
                    <asp:HiddenField ID="HiddenBannerUrl" runat="server" />
                </div>
            </section>

            <section class="course-edit-editor-panel">
                <link href="../js/vendors/wangeditor/style.css" rel="stylesheet">
                <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
                <script src="../js/vendors/vditor/index.min.js"></script>
                <script src="../js/vendors/wangeditor/index.js"></script>

                <div class="course-edit-editor-toolbar">
                    <div>
                        <h2 class="course-edit-section-title">内容编辑</h2>
                        <p class="course-edit-section-desc">支持 KindEditor、WangEditor 和 Vditor 三种模式切换。</p>
                    </div>
                    <div>
                        <label class="course-edit-label">编辑器</label>
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="course-edit-editor-select">
                            <option value="kindeditor" selected>KindEditor（原生）</option>
                            <option value="wangeditor">WangEditor（富文本）</option>
                            <option value="vditor">Vditor（Markdown）</option>
                        </select>
                    </div>
                </div>

                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
                <script>
                    var kindEditorObj;
                    var wangEditorObj;
                    var vditorObj;
                    var currentEditor = 'kindeditor';

                    var cid = <%=myCid() %>;
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
                            filterMode: false
                        });
                    });

                    function initWangEditor() {
                        if (wangEditorObj) return;
                        const { createEditor, createToolbar } = window.wangEditor;
                        const mcontent = document.getElementById('<%= mcontent.ClientID %>');

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
                        } catch (e) {
                            return html;
                        }
                    }

                    function initVditor() {
                        if (vditorObj) return;
                        const mcontent = document.getElementById('<%= mcontent.ClientID %>');
                        let initialContent = kindEditorObj ? kindEditorObj.html() : mcontent.value;

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
                                let contentToSet = pendingVditorHtml !== null ? pendingVditorHtml : initialContent;
                                if (contentToSet) {
                                    vditorObj.setValue(safeHtml2Md(contentToSet));
                                }
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
                        } else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj && vditorReady) {
                            try {
                                currentHtml = vditorObj.getHTML();
                            } catch (e) {
                                try { currentHtml = vditorObj.getValue(); } catch (e2) { currentHtml = ''; }
                            }
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
                            if (!vditorObj) {
                                pendingVditorHtml = currentHtml;
                                initVditor();
                            } else if (vditorReady) {
                                if (currentHtml) {
                                    vditorObj.setValue(safeHtml2Md(currentHtml));
                                }
                            } else {
                                pendingVditorHtml = currentHtml;
                            }
                        }
                    }

                    function syncContent() {
                        var mcontent = document.getElementById('<%= mcontent.ClientID %>');
                        if (currentEditor === 'kindeditor') {
                            if (kindEditorObj) {
                                mcontent.value = kindEditorObj.html();
                            }
                        } else if (currentEditor === 'wangeditor') {
                            if (wangEditorObj) {
                                mcontent.value = wangEditorObj.getHtml();
                            }
                        } else if (currentEditor === 'vditor') {
                            if (vditorObj && vditorReady) {
                                try {
                                    mcontent.value = vditorObj.getHTML();
                                } catch (e) {
                                    try { mcontent.value = vditorObj.getValue(); } catch (e2) {}
                                }
                            }
                        }
                        return true;
                    }
                </script>

                <div class="course-edit-editor-stage custom-scrollbar">
                    <div id="wangeditor-wrap" style="display:none; width:100%; position:relative; border: 1px solid #ccc; z-index: 100;">
                        <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
                        <div id="wangeditor-text" style="height: 350px;"></div>
                    </div>

                    <div id="vditor-wrap" style="display:none; width:100%; position:relative; margin-bottom: 10px;">
                        <div id="vditor-container"></div>
                    </div>

                    <textarea id="mcontent" runat="server" style="width:100%; height:400px;"></textarea>
                </div>
            </section>

            <section class="course-edit-feedback">
                <asp:Label ID="Labelmsg" runat="server" CssClass="course-edit-msg"></asp:Label>
            </section>

            <section class="course-edit-actions">
                <asp:Button ID="Btnedit" runat="server" Text="保存学案" onclick="Btnedit_Click" OnClientClick="return syncContent();" CssClass="course-edit-primary-btn" />
                <asp:Button ID="Btnreturn" runat="server" Text="返回列表" onclick="Btnreturn_Click" CssClass="course-edit-secondary-btn" />
            </section>
        </div>
    </div>

    <!-- Banner Modal -->
    <div id="CeBannerModal" class="ce-banner-modal" aria-hidden="true">
        <div class="ce-banner-dialog">
            <div class="ce-banner-head">
                <div>
                    <h2 class="ce-banner-title">编辑学案横幅</h2>
                    <p class="ce-banner-desc">上传图片作为学案横幅背景，建议使用横向大图。</p>
                </div>
                <button type="button" class="ce-banner-close" id="CeBannerClose">
                    <svg viewBox="0 0 24 24"><path d="M6 6l12 12"></path><path d="M18 6l-12 12"></path></svg>
                </button>
            </div>
            <div class="ce-banner-body">
                <div class="ce-banner-dropzone" id="CeBannerDropzone">
                    <svg viewBox="0 0 24 24"><path d="M12 16V7"></path><path d="M8.5 10.5L12 7l3.5 3.5"></path><path d="M5 17v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1"></path></svg>
                    <p class="ce-banner-drop-title">点击选择或拖拽图片到此处</p>
                    <p class="ce-banner-drop-desc">支持 png、jpg、gif、webp，建议横向大图</p>
                    <input type="file" id="CeBannerFile" accept="image/png,image/jpeg,image/jpg,image/gif,image/webp" />
                </div>
                <div id="CeBannerPreview" class="ce-banner-preview"></div>
                <div id="CeBannerStatus" class="ce-banner-status"></div>
            </div>
            <div class="ce-banner-foot">
                <button type="button" class="ce-banner-btn" id="CeBannerCancel">取消</button>
                <button type="button" class="ce-banner-btn primary" id="CeBannerSave">保存横幅</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
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
        var hiddenUrl = document.getElementById('<%= HiddenBannerUrl.ClientID %>');
        var hlBanner = document.getElementById('<%= HLbanner.ClientID %>');
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
    </script>
</asp:Content>
