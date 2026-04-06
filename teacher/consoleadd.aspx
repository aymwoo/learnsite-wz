<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="consoleadd.aspx.cs" Inherits="Teacher_consoleadd" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../App_Themes/Teacher/course-content-add.css" rel="stylesheet" />
    <link href="../js/vendors/wangeditor/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
    <style type="text/css">
        .console-add-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #f0f4ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #1e1b4b 0%, #4338ca 55%, #7c3aed 100%);
            --content-add-hero-shadow: 0 22px 45px -28px rgba(109, 40, 217, 0.75);
            --content-add-primary-bg: #7c3aed;
            --content-add-primary-hover: #6d28d9;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(124, 58, 237, 0.85);
        }
        .console-add-editor-stage textarea {
            width: 100%;
            height: 500px;
        }

        .console-add-editor-stage #wangeditor-wrap,
        .console-add-editor-stage #vditor-wrap,
        .console-add-editor-stage textarea,
        .console-add-editor-stage .ke-container {
            width: 100% !important;
            max-width: 100%;
        }
    </style>

    <div class="content-add-page console-add-page">
        <div class="content-add-shell is-medium">

            <!-- Hero Banner -->
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <div class="content-add-eyebrow">
                        &#128187; 交互式 Python 测评
                    </div>
                    <h1 class="content-add-title">测评内容编辑</h1>
                    <p class="content-add-subtitle">编写 Python 交互式测评的标准语句与测试用例，学生提交后将自动评分。</p>
                </div>
            </section>

            <!-- Settings Panel -->
            <section class="content-add-panel">
                <h2 class="content-add-section-title">基本设置</h2>
                <div class="content-add-field-group">
                    <div class="content-add-field">
                        <label class="content-add-label">测评名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="340px"
                            CssClass="content-add-input"></asp:TextBox>
                    </div>
                    <div class="content-add-field">
                        <label class="content-add-label">发布状态</label>
                        <asp:CheckBox ID="Publish" runat="server" Text="立即发布" CssClass="content-add-checkbox" />
                    </div>
                </div>
            </section>

            <!-- Editor Panel -->
            <section class="content-add-editor">
                <div class="content-add-editor-toolbar">
                    <div>
                        <h2 class="content-add-section-title">测评内容</h2>
                        <p class="content-add-section-desc">支持 KindEditor、WangEditor 和 Vditor 三种编辑方式切换。</p>
                    </div>
                    <div>
                        <label class="content-add-label" for="editorSelector">编辑器选择</label><br />
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="content-add-select" style="width:auto;min-width:160px;">
                            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                            <option value="wangeditor">WangEditor</option>
                            <option value="vditor">Vditor</option>
                        </select>
                    </div>
                </div>

                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script src="../js/vendors/vditor/index.min.js"></script>
                <script src="../js/vendors/wangeditor/index.js"></script>
                <script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
                <script type="text/javascript">
                    var editor;
                    var wangEditorObj;
                    var vditorObj;
                    var currentEditor = 'kindeditor';
                    var lastVditorMarkdown = null;
                    var lastVditorHtml = '';
                    var vditorReady = false;
                    var pendingVditorHtml = null;
                    var cid = <%=myCid() %>;
                    var ty = "Course";
                    var upjs = '../kindeditor/aspnet/upload_json.aspx?cid=' + cid + '&ty=' + ty;
                    var fmjs = '../kindeditor/aspnet/file_manager_json.aspx?cid=' + cid + '&ty=' + ty;
                    KindEditor.ready(function (K) {
                        editor = K.create('textarea[name="ctl00$Content$mcontent"]', {
                            resizeType: 1,
                            newlineTag: "br",
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
                        var field = document.getElementById('<%= mcontent.ClientID %>');
                        if (!selector || !field) return;
                        if (isLikelyMarkdown(field.value)) {
                            selector.value = 'vditor';
                            switchEditor('vditor');
                        }
                    }

                    function initWangEditor() {
                        if (wangEditorObj) return;
                        const { createEditor, createToolbar } = window.wangEditor;
                        const field = document.getElementById('<%= mcontent.ClientID %>');
                        wangEditorObj = createEditor({
                            selector: '#wangeditor-text',
                            html: editor ? editor.html() : (field ? field.value : ''),
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
                        const field = document.getElementById('<%= mcontent.ClientID %>');
                        let initialContent = getPreferredVditorValue(lastVditorMarkdown !== null ? lastVditorMarkdown : (editor ? editor.html() : (field ? field.value : '')));
                        vditorObj = new Vditor('vditor-container', {
                            height: 460,
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
                        if (kindContainer && kindContainer.style.display !== 'none' && editor) currentHtml = editor.html();
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
                            if (editor && currentHtml) editor.html(currentHtml);
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
                        var field = document.getElementById('<%= mcontent.ClientID %>');
                        if (!field) return true;
                        if (currentEditor === 'kindeditor') {
                            if (editor) field.value = editor.html();
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
                </script>

                <div class="content-add-editor-stage console-add-editor-stage">
                    <div id="wangeditor-wrap" style="display:none; width:100%; position:relative; border:1px solid #ccc; z-index:100; margin-bottom:10px;">
                        <div id="wangeditor-toolbar" style="border-bottom:1px solid #ccc;"></div>
                        <div id="wangeditor-text" style="height:420px;"></div>
                    </div>
                    <div id="vditor-wrap" style="display:none; width:100%; position:relative; margin-bottom:10px;">
                        <div id="vditor-container"></div>
                    </div>
                    <textarea id="mcontent" runat="server" style="width:100%;height:500px;"></textarea>
                </div>
            </section>

            <!-- Feedback -->
            <section class="content-add-feedback">
                <asp:Label ID="Labelmsg" runat="server" CssClass="content-add-feedback-msg"></asp:Label>
            </section>

            <!-- Actions -->
            <div class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加测评"
                    onclick="Btnadd_Click"
                    OnClientClick="return syncContent();"
                    CssClass="content-add-btn-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="返回学案"
                    onclick="BtnCourse_Click"
                    CssClass="content-add-btn-secondary" />
            </div>

        </div>
    </div>
</asp:Content>
