<%@ Page Validaterequest="false" Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher"  AutoEventWireup="true" CodeFile="courseedit.aspx.cs" Inherits="Teacher_courseedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .course-edit-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #312e81 0%, #4338ca 55%, #6366f1 100%);
            --workspace-primary-bg: #4f46e5;
            --workspace-primary-hover: #4338ca;
            --workspace-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
        }

        .course-edit-grid {
            display: grid;
            grid-template-columns: repeat(12, minmax(0, 1fr));
            gap: 1rem;
        }

        .course-edit-field { grid-column: span 4; }

        .course-edit-field-wide {
            grid-column: span 12;
        }

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
            border-radius: 0.9rem;
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

        @media (max-width: 768px) {
            .course-edit-field,
            .course-edit-field-wide {
                grid-column: span 12;
            }
        }
    </style>

    <div class="course-edit-page">
        <div class="course-edit-shell">
            <section class="course-edit-hero">
                <div class="course-edit-hero-content">
                    <span class="course-edit-eyebrow">Edit Course Plan</span>
                    <h1 class="course-edit-title">学案编辑</h1>
                    <p class="course-edit-subtitle">保留原有学案编辑、图片上传、富文本切换与提交逻辑，仅对信息架构、布局和编辑区域的视觉层次进行重构。</p>
                </div>
            </section>

            <section class="course-edit-panel">
                <h2 class="course-edit-section-title">基础设置</h2>
                <p class="course-edit-section-desc">标题、分类、年级、学期、课节、发布状态和横幅上传都沿用当前后台处理逻辑。</p>

                <div class="course-edit-grid">
                    <div class="course-edit-field course-edit-field-wide">
                        <label class="course-edit-label" for="<%= Texttitle.ClientID %>">学案名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" Width="436px" SkinID="TextBoxNormal" CssClass="course-edit-input"></asp:TextBox>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLclass.ClientID %>">学案分类</label>
                        <asp:DropDownList ID="DDLclass" runat="server" Width="100px" Font-Size="9pt" CssClass="course-edit-select"></asp:DropDownList>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLcobj.ClientID %>">授课年级</label>
                        <asp:DropDownList ID="DDLcobj" runat="server" Font-Size="9pt" Width="40px" CssClass="course-edit-select"></asp:DropDownList>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLCterm.ClientID %>">学期设置</label>
                        <div class="course-edit-static">
                            第&nbsp;<asp:DropDownList ID="DDLCterm" runat="server" Font-Names="Arial" Font-Size="8pt" Width="40px" CssClass="course-edit-select" style="height: 2.25rem; min-height: 2.25rem; width: 4.5rem; padding: 0 0.6rem; margin-right: 0.4rem;">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem Selected="True">2</asp:ListItem>
                            </asp:DropDownList>
                            学期
                        </div>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLCks.ClientID %>">课节</label>
                        <div class="course-edit-static">
                            第&nbsp;<asp:DropDownList ID="DDLCks" runat="server" Font-Size="8pt" Width="40px" Font-Names="Arial" CssClass="course-edit-select" style="height: 2.25rem; min-height: 2.25rem; width: 4.5rem; padding: 0 0.6rem; margin-right: 0.4rem;"></asp:DropDownList>
                            课节
                        </div>
                    </div>

                    <div class="course-edit-field">
                        <span class="course-edit-label">发布设置</span>
                        <label class="course-edit-publish" for="<%= CheckPublish.ClientID %>">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                        </label>
                    </div>

                    <div class="course-edit-field course-edit-field-wide">
                        <span class="course-edit-label">横幅设置</span>
                        <div class="course-edit-banner-row">
                            <asp:HyperLink ID="HLbanner" runat="server" Target="_blank" CssClass="course-edit-banner-link">学案横幅</asp:HyperLink>
                            <div class="course-edit-file">
                                <asp:FileUpload ID="Fupload" runat="server" Font-Size="10pt" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="course-edit-editor-panel">
                <link href="https://cdn.jsdelivr.net/npm/@wangeditor/editor@5.1.23/dist/css/style.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vditor/dist/index.css" />
                <script src="https://cdn.jsdelivr.net/npm/vditor/dist/index.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@wangeditor/editor@5.1.23/dist/index.js"></script>

                <div class="course-edit-editor-toolbar">
                    <div>
                        <h2 class="course-edit-section-title">内容编辑</h2>
                        <p class="course-edit-section-desc">支持原生 KindEditor、WangEditor 和 Vditor 三种模式切换，提交前继续通过原有 `syncContent()` 同步内容。</p>
                    </div>
                    <div>
                        <label class="course-edit-label" for="editorSelector">编辑器选择</label><br />
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="course-edit-editor-select">
                            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                            <option value="wangeditor">富文本编辑器 (WangEditor)</option>
                            <option value="vditor">Markdown编辑器 (Vditor)</option>
                        </select>
                    </div>
                </div>

                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
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
                                        server: '../kindeditor/aspnet/upload_json.aspx?dir=image',
                                        customInsert(res, insertFn) {
                                            if (res.error === 0) {
                                                insertFn(res.url);
                                            } else {
                                                alert(res.message);
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
                            width: '780px',
                            mode: 'ir',
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
                        } else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj) {
                            currentHtml = vditorObj.getHTML();
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
                            if (vditorObj) {
                                mcontent.value = vditorObj.getHTML();
                            }
                        }
                        return true;
                    }
                </script>

                <div class="course-edit-editor-stage custom-scrollbar">
                    <div id="wangeditor-wrap" style="display:none; width: 780px; left:10px; position:relative; border: 1px solid #ccc; z-index: 100;">
                        <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
                        <div id="wangeditor-text" style="height: 350px;"></div>
                    </div>

                    <div id="vditor-wrap" style="display:none; width: 780px; left:10px; position:relative; margin-bottom: 10px;">
                        <div id="vditor-container"></div>
                    </div>

                    <textarea id="mcontent" runat="server" style="width: 780px; height:400px; left:10px;"></textarea>
                </div>
            </section>

            <section class="course-edit-feedback">
                <h2 class="course-edit-section-title">处理反馈</h2>
                <p class="course-edit-section-desc">提交结果和后台提示信息仍由原页面逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="course-edit-actions">
                <asp:Button ID="Btnedit" runat="server" Text="确定" onclick="Btnedit_Click" OnClientClick="return syncContent();" SkinID="BtnNormal" CssClass="course-edit-primary-btn" />
                <asp:Button ID="Btnreturn" runat="server" Text="返回" onclick="Btnreturn_Click" SkinID="BtnNormal" CssClass="course-edit-secondary-btn" />
            </section>
        </div>
    </div>
</asp:Content>
