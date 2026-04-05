<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="pythonedit.aspx.cs"  inherits="Teacher_pythonedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    <style type="text/css">
        .python-edit-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #eff6ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #1d4ed8 0%, #2563eb 55%, #60a5fa 100%);
            --content-add-hero-shadow: 0 22px 45px -28px rgba(37, 99, 235, 0.72);
            --content-add-primary-bg: #2563eb;
            --content-add-primary-hover: #1d4ed8;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(37, 99, 235, 0.85);
            --content-add-secondary-bg: #eff6ff;
            --content-add-secondary-fg: #1d4ed8;
            --content-add-secondary-border: #bfdbfe;
            --content-add-secondary-hover: #dbeafe;
            --content-add-focus: #2563eb;
            --content-add-focus-ring: rgba(37, 99, 235, 0.14);
        }

        .python-edit-example {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.95rem;
            padding: 0 0.95rem;
            border-radius: 0.375rem;
            border: 1px solid #bfdbfe;
            background: #eff6ff;
            color: #1d4ed8;
            text-decoration: none;
            font-weight: 700;
        }

        .python-edit-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            padding: 0.5rem 0.8rem;
            border-radius: 9999px;
            background: #dbeafe;
            color: #1d4ed8;
            font-size: 0.84rem;
            font-weight: 700;
        }

        .python-edit-badge img {
            width: 18px;
            height: 18px;
        }

        .python-edit-editor-stage textarea {
            width: 830px;
            height: 450px;
        }

        .python-edit-editor-wrap {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 1rem;
            align-items: center;
            margin-bottom: 1rem;
        }

        .python-edit-editor-select {
            min-height: 38px;
            padding: 0 32px 0 12px;
            border: 1px solid #bfdbfe;
            border-radius: .75rem;
            background: #eff6ff;
            color: #1e3a8a;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            appearance: none;
            -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%2364738b' stroke-width='2.5' stroke-linecap='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
        }

        .python-edit-editor-stage #wangeditor-wrap,
        .python-edit-editor-stage #vditor-wrap,
        .python-edit-editor-stage textarea,
        .python-edit-editor-stage .ke-container {
            width: 100% !important;
            max-width: 100%;
        }
    </style>

    <div class="content-add-page python-edit-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Edit Python Exercise</span>
                    <h1 class="content-add-title">修改 Python 编程主题</h1>
                    <p class="content-add-subtitle">保留分步、绘图、拼图、积木与示例文件逻辑，只优化 Python 主题编辑页的布局和交互层次。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">当前类型、示例文件、量规设置与隐藏字段 `LabelLtype` 继续沿用原逻辑。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">Python 主题</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="200px" CssClass="content-add-input"></asp:TextBox>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= DDLMgid.ClientID %>">评价标准</label>
                        <asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt" Width="160px" Font-Names="Arial" CssClass="content-add-select"></asp:DropDownList>
                    </div>

                    <div class="content-add-field">
                        <span class="content-add-label">练习标识</span>
                        <div class="content-add-static">
                            <span class="python-edit-badge"><img src="../images/python.png" alt="python" /> Python 练习</span>
                        </div>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <span class="content-add-label">运行模式</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="发布" Checked="True" />
                            <asp:CheckBox ID="CheckBack" runat="server" Text="分步" ToolTip="命令行和编辑器模式切换" />
                            <asp:CheckBox ID="Checkhelp" runat="server" Text="绘图" ToolTip="编程与绘图帮助切换、显示与隐藏效果图" />
                            <asp:CheckBox ID="Checkblock" runat="server" Text="拼图" ToolTip="拼图编程模式" />
                            <asp:CheckBox ID="Checkblockpy" runat="server" Text="积木" ToolTip="积木编程模式（优先）" />
                        </div>
                    </div>

                    <div class="content-add-field">
                        <span class="content-add-label">当前示例</span>
                        <asp:HyperLink ID="HlExample" runat="server" Target="_blank" CssClass="python-edit-example">练习</asp:HyperLink>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= Fupload.ClientID %>">替换示例文件</label>
                        <div class="ls-upload" data-accept=".py" data-label="点击或拖拽上传示例文件" data-hint="支持 py 格式">
                            <asp:FileUpload ID="Fupload" runat="server" />
                        </div>
                    </div>
                </div>
                <asp:Label ID="LabelLtype" runat="server" Text="8" Visible="false"></asp:Label>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">编程说明</h2>
                <div class="python-edit-editor-wrap">
                    <p class="content-add-section-desc" style="margin:0;">支持 KindEditor、WangEditor 和 Vditor 三种编辑方式切换。</p>
                    <div>
                        <label class="content-add-label" for="editorSelector">编辑器选择</label><br />
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="python-edit-editor-select">
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
                        editor = K.create('textarea[name="ctl00$Content$mcontent"]', {
                            resizeType: 1,
                            newlineTag: "br",
                            uploadJson: upjs,
                            fileManagerJson: fmjs,
                            allowFileManager: true,
                            filterMode: false,
                            afterCreate: function () {
                                this.loadPlugin('autoheight');
                            }
                        });
                    });

                    function initWangEditor() {
                        if (wangEditorObj) return;
                        const { createEditor, createToolbar } = window.wangEditor;
                        const mcontent = document.getElementById('<%= mcontent.ClientID %>');
                        wangEditorObj = createEditor({
                            selector: '#wangeditor-text',
                            html: editor ? editor.html() : mcontent.value,
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
                        const mcontent = document.getElementById('<%= mcontent.ClientID %>');
                        let initialContent = editor ? editor.html() : mcontent.value;
                        vditorObj = new Vditor('vditor-container', {
                            height: 400,
                            mode: 'ir',
                            upload: {
                                handler: function (files) {
                                    LearnSiteEditorUploadHelper.handleVditorUpload(vditorObj, upjs, files);
                                }
                            },
                            preview: { mode: 'both' },
                            cache: { enable: false },
                            after: () => {
                                vditorReady = true;
                                let contentToSet = pendingVditorHtml !== null ? pendingVditorHtml : initialContent;
                                if (contentToSet) vditorObj.setValue(safeHtml2Md(contentToSet));
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
                            try { currentHtml = vditorObj.getHTML(); } catch (e) { try { currentHtml = vditorObj.getValue(); } catch (e2) { currentHtml = ''; } }
                        }

                        if (kindContainer) kindContainer.style.display = 'none';
                        if (wangContainer) wangContainer.style.display = 'none';
                        if (vditorContainer) vditorContainer.style.display = 'none';

                        if (type === 'kindeditor') {
                            if (kindContainer) kindContainer.style.display = 'block';
                            if (editor && currentHtml) editor.html(currentHtml);
                        } else if (type === 'wangeditor') {
                            if (wangContainer) wangContainer.style.display = 'block';
                            if (!wangEditorObj) initWangEditor();
                            if (wangEditorObj && currentHtml) wangEditorObj.setHtml(currentHtml);
                        } else if (type === 'vditor') {
                            if (vditorContainer) vditorContainer.style.display = 'block';
                            if (!vditorObj) {
                                pendingVditorHtml = currentHtml;
                                initVditor();
                            } else if (vditorReady) {
                                vditorObj.setValue(safeHtml2Md(currentHtml));
                            } else {
                                pendingVditorHtml = currentHtml;
                            }
                        }
                    }

                    function syncContent() {
                        if (editor) editor.sync();
                        var mcontent = document.getElementById('<%= mcontent.ClientID %>');
                        if (!mcontent) return true;
                        if (currentEditor === 'wangeditor' && wangEditorObj) mcontent.value = wangEditorObj.getHtml();
                        else if (currentEditor === 'vditor' && vditorObj) {
                            try { mcontent.value = vditorObj.getHTML(); } catch (e) { try { mcontent.value = vditorObj.getValue(); } catch (e2) {} }
                        }
                        return true;
                    }
                </script>
                <div class="content-add-editor-stage python-edit-editor-stage custom-scrollbar">
                    <div id="wangeditor-wrap" style="display:none; width:100%; position:relative; border:1px solid #ccc; z-index:100;">
                        <div id="wangeditor-toolbar" style="border-bottom:1px solid #ccc;"></div>
                        <div id="wangeditor-text" style="height:350px;"></div>
                    </div>
                    <div id="vditor-wrap" style="display:none; width:100%; position:relative; margin-bottom:10px;">
                        <div id="vditor-container"></div>
                    </div>
                    <textarea id="mcontent" runat="server"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">标题、内容或编号异常时，提示信息仍由原逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnedit" runat="server" Text="修改主题" OnClick="Btnedit_Click" OnClientClick="return syncContent();" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="返回学案" OnClick="BtnCourse_Click" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
    <script src="../js/fileupload.js"></script>
</asp:Content>
