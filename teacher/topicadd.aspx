<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher" Validaterequest="false"  AutoEventWireup="true" CodeFile="topicadd.aspx.cs" Inherits="Teacher_topicadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .topic-add-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #4338ca 0%, #4f46e5 55%, #818cf8 100%);
            --content-add-primary-bg: #4f46e5;
            --content-add-primary-hover: #4338ca;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
        }

        .topic-add-editor-stage textarea {
            width: 800px;
            height: 500px;
        }

        .topic-add-page .content-add-actions {
            display: flex;
            gap: 12px;
            align-items: center;
            flex-wrap: wrap;
        }

        .topic-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 44px;
            padding: 0 24px;
            border: none;
            border-radius: 0.375rem;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s;
            text-decoration: none;
            text-align: center;
            line-height: 1;
        }

        .topic-btn--primary {
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            color: #ffffff;
            box-shadow: 0 8px 16px rgba(79, 70, 229, 0.25);
        }

        .topic-btn--primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 24px rgba(79, 70, 229, 0.35);
        }

        .topic-btn--primary:active {
            transform: translateY(0);
        }

        .topic-btn--secondary {
            background: #ffffff;
            color: #475569;
            border: 1px solid #e2e8f0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .topic-btn--secondary:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
            color: #0f172a;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
        }

        .topic-btn svg {
            width: 18px;
            height: 18px;
            flex-shrink: 0;
        }

        .topic-add-editor-wrap {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 1rem;
            align-items: center;
            margin-bottom: 1rem;
        }

        .topic-add-editor-select {
            min-height: 38px;
            padding: 0 32px 0 12px;
            border: 1px solid #c7d2fe;
            border-radius: .75rem;
            background: #eef2ff;
            color: #312e81;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            appearance: none;
            -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%2364738b' stroke-width='2.5' stroke-linecap='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
        }

        .topic-add-editor-stage #wangeditor-wrap,
        .topic-add-editor-stage #vditor-wrap,
        .topic-add-editor-stage textarea,
        .topic-add-editor-stage .ke-container {
            width: 100% !important;
            max-width: 100%;
        }
    </style>

    <div class="content-add-page topic-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add Discussion Topic</span>
                    <h1 class="content-add-title">添加讨论主题</h1>
                    <p class="content-add-subtitle">保留现有标题、暂停状态和富文本内容提交逻辑，仅优化讨论主题创建页的布局、层次和输入体验。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">讨论主题标题和暂停状态沿用当前后台逻辑，创建后仍会回到学案展示页。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">讨论主题</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="400px" CssClass="content-add-input"></asp:TextBox>
                    </div>
                    <div class="content-add-field content-add-field-wide">
                        <span class="content-add-label">状态设置</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否暂停" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">讨论说明</h2>
                <div class="topic-add-editor-wrap">
                    <p class="content-add-section-desc" style="margin:0;">支持 KindEditor、WangEditor 和 Vditor 三种编辑方式切换。</p>
                    <div>
                        <label class="content-add-label" for="editorSelector">编辑器选择</label><br />
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="topic-add-editor-select">
                            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                            <option value="wangeditor">WangEditor</option>
                            <option value="vditor">Vditor</option>
                        </select>
                    </div>
                </div>
                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/vditor/dist/index.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@wangeditor/editor@5.1.23/dist/index.js"></script>
                <script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
                <script>
                    var editor;
                    var wangEditorObj;
                    var vditorObj;
                    var currentEditor = 'kindeditor';
                    var vditorReady = false;
                    var pendingVditorHtml = null;
                    var cid = <%=myCid() %>;
                    var ty = "Course";
                    var upjs = '../kindeditor/aspnet/upload_json.aspx?cid=' + cid + '&ty=' + ty;
                    var fmjs = '../kindeditor/aspnet/file_manager_json.aspx?cid=' + cid + '&ty=' + ty;
                    KindEditor.ready(function (K) {
                        editor = K.create('textarea[name="textareaItem"]', {
                            resizeType: 1,
                            newlineTag: "br",
                            uploadJson: upjs,
                            fileManagerJson: fmjs,
                            allowFileManager: true,
                            filterMode: false
                        });
                    });

                    function initWangEditor() {
                        if (wangEditorObj) return;
                        const { createEditor, createToolbar } = window.wangEditor;
                        const ta = document.getElementsByName('textareaItem')[0];
                        wangEditorObj = createEditor({ selector: '#wangeditor-text', html: editor ? editor.html() : (ta ? ta.value : ''), config: { placeholder: '请输入内容...', MENU_CONF: { uploadImage: { server: upjs, customInsert(res, insertFn) { if (res.error === 0) insertFn(res.url); else alert(res.message || '图片上传失败'); } }, uploadAttachment: { server: upjs, customInsert(res) { if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res); else alert(res.message || '附件上传失败'); } }, uploadFile: { server: upjs, customInsert(res) { if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res); else alert(res.message || '文件上传失败'); } } } } });
                        createToolbar({ editor: wangEditorObj, selector: '#wangeditor-toolbar', config: {} });
                    }

                    function safeHtml2Md(html) {
                        try {
                            if (vditorObj && vditorObj.vditor && vditorObj.vditor.lute) return vditorObj.vditor.lute.HTML2Md(html);
                            var l = Lute.New();
                            return l.HTML2Md(html);
                        } catch (e) { return html; }
                    }

                    function initVditor() {
                        if (vditorObj) return;
                        const ta = document.getElementsByName('textareaItem')[0];
                        let initialContent = editor ? editor.html() : (ta ? ta.value : '');
                        vditorObj = new Vditor('vditor-container', { height: 420, mode: 'ir', upload: { handler: function (files) { LearnSiteEditorUploadHelper.handleVditorUpload(vditorObj, upjs, files); } }, preview: { mode: 'both' }, cache: { enable: false }, after: () => { vditorReady = true; let contentToSet = pendingVditorHtml !== null ? pendingVditorHtml : initialContent; if (contentToSet) vditorObj.setValue(safeHtml2Md(contentToSet)); pendingVditorHtml = null; } });
                    }

                    function syncContent() {
                        var ta = document.getElementsByName('textareaItem')[0];
                        if (!ta) return true;
                        if (currentEditor === 'kindeditor' && editor) ta.value = editor.html();
                        else if (currentEditor === 'wangeditor' && wangEditorObj) ta.value = wangEditorObj.getHtml();
                        else if (currentEditor === 'vditor' && vditorObj) {
                            try { ta.value = vditorObj.getHTML(); } catch (e) { try { ta.value = vditorObj.getValue(); } catch (e2) {} }
                        }
                        return true;
                    }

                    function switchEditor(type) {
                        currentEditor = type;
                        var kindContainer = document.querySelector('.ke-container');
                        var wangContainer = document.getElementById('wangeditor-wrap');
                        var vditorContainer = document.getElementById('vditor-wrap');
                        var currentHtml = '';
                        if (kindContainer && kindContainer.style.display !== 'none' && editor) currentHtml = editor.html();
                        else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) currentHtml = wangEditorObj.getHtml();
                        else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj && vditorReady) { try { currentHtml = vditorObj.getHTML(); } catch (e) { try { currentHtml = vditorObj.getValue(); } catch (e2) { currentHtml = ''; } } }
                        if (kindContainer) kindContainer.style.display = 'none';
                        if (wangContainer) wangContainer.style.display = 'none';
                        if (vditorContainer) vditorContainer.style.display = 'none';
                        if (type === 'kindeditor') { if (kindContainer) kindContainer.style.display = 'block'; if (editor && currentHtml) editor.html(currentHtml); }
                        else if (type === 'wangeditor') { if (wangContainer) wangContainer.style.display = 'block'; if (!wangEditorObj) initWangEditor(); if (wangEditorObj && currentHtml) wangEditorObj.setHtml(currentHtml); }
                        else if (type === 'vditor') { if (vditorContainer) vditorContainer.style.display = 'block'; if (!vditorObj) { pendingVditorHtml = currentHtml; initVditor(); } else if (vditorReady) vditorObj.setValue(safeHtml2Md(currentHtml)); else pendingVditorHtml = currentHtml; }
                    }
                </script>
                <div class="content-add-editor-stage topic-add-editor-stage custom-scrollbar">
                    <div id="wangeditor-wrap" style="display:none; width:100%; position:relative; border:1px solid #ccc; z-index:100;">
                        <div id="wangeditor-toolbar" style="border-bottom:1px solid #ccc;"></div>
                        <div id="wangeditor-text" style="height:380px;"></div>
                    </div>
                    <div id="vditor-wrap" style="display:none; width:100%; position:relative; margin-bottom:10px;">
                        <div id="vditor-container"></div>
                    </div>
                    <textarea name="textareaItem"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">标题或内容为空时，错误提示仍由原页面逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加主题" OnClick="Btnadd_Click" OnClientClick="return syncContent();" CssClass="topic-btn topic-btn--primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" CssClass="topic-btn topic-btn--secondary" />
            </section>
        </div>
    </div>
</asp:Content>
