<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="pythonedit.aspx.cs"  inherits="Teacher_pythonedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
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

        .python-edit-upload input[type="file"] {
            width: 100%;
        }

        .python-edit-example {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.95rem;
            padding: 0 0.95rem;
            border-radius: 0.9rem;
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
                        <div class="content-add-static python-edit-upload">
                            <asp:FileUpload ID="Fupload" runat="server" Font-Size="10pt" />
                        </div>
                    </div>
                </div>
                <asp:Label ID="LabelLtype" runat="server" Text="8" Visible="false"></asp:Label>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">编程说明</h2>
                <p class="content-add-section-desc">正文继续使用 KindEditor，并保持现有 `mcontent` 字段提交方式。</p>
                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script>
                    var editor;
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
                </script>
                <div class="content-add-editor-stage python-edit-editor-stage custom-scrollbar">
                    <textarea id="mcontent" runat="server"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">标题、内容或编号异常时，提示信息仍由原逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnedit" runat="server" Text="修改主题" OnClick="Btnedit_Click" SkinID="BtnNormal" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" SkinID="BtnNormal" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
</asp:Content>
