<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="pythonadd.aspx.cs"  inherits="Teacher_pythonadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    <style type="text/css">
        .python-add-page {
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

        .python-add-editor-stage textarea {
            width: 830px;
            height: 450px;
        }

        .python-add-badge {
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

        .python-add-badge img {
            width: 18px;
            height: 18px;
        }
    </style>

    <div class="content-add-page python-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add Python Exercise</span>
                    <h1 class="content-add-title">添加 Python 编程主题</h1>
                    <p class="content-add-subtitle">保留原有 Python 练习主题、发布模式、拼图/积木选项、绘图帮助和示例文件上传逻辑，只重构页面布局与交互层次。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">以下字段仍按当前后台逻辑处理，创建后继续返回学案展示页。</p>
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
                            <span class="python-add-badge"><img src="../images/python.png" alt="python" /> Python 练习</span>
                        </div>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <span class="content-add-label">运行模式</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="发布" Checked="True" />
                            <asp:CheckBox ID="CheckBack" runat="server" Text="分步" ToolTip="命令行和编辑器模式切换" />
                            <asp:CheckBox ID="Checkhelp" runat="server" Text="绘图" ToolTip="编程和绘图语句帮助切换" />
                            <asp:CheckBox ID="Checkblock" runat="server" Text="拼图" ToolTip="拼图编程模式" />
                            <asp:CheckBox ID="Checkblockpy" runat="server" Text="积木" ToolTip="积木编程模式（优先）" />
                        </div>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Fupload.ClientID %>">Python 示例文件</label>
                        <div class="ls-upload" data-accept=".py" data-label="点击或拖拽上传示例文件" data-hint="支持 py 格式">
                            <asp:FileUpload ID="Fupload" runat="server" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">编程说明</h2>
                <p class="content-add-section-desc">正文继续使用 KindEditor，保留原有上传接口与自动高度行为。</p>
                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script>
                    var editor;
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
                            filterMode: false,
                            afterCreate: function () {
                                this.loadPlugin('autoheight');
                            }
                        });
                    });
                </script>
                <div class="content-add-editor-stage python-add-editor-stage custom-scrollbar">
                    <textarea name="textareaItem"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">主题为空或内容不完整时，提示信息仍由原后台逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加主题" OnClick="Btnadd_Click" SkinID="BtnNormal" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" SkinID="BtnNormal" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
    <script src="../js/fileupload.js"></script>
</asp:Content>
