<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false"  AutoEventWireup="true" CodeFile="programedit.aspx.cs" Inherits="Teacher_programedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    <style type="text/css">
        .program-edit-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #312e81 0%, #4f46e5 55%, #818cf8 100%);
            --content-add-primary-bg: #4f46e5;
            --content-add-primary-hover: #4338ca;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
        }

        .program-edit-example {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.95rem;
            padding: 0 0.95rem;
            border-radius: 0.375rem;
            border: 1px solid #bbf7d0;
            background: #ecfdf5;
            color: #166534;
            text-decoration: none;
            font-weight: 700;
        }

        .program-edit-editor-stage textarea {
            width: 830px;
            height: 450px;
        }
    </style>

    <div class="content-add-page program-edit-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Edit Scratch Program</span>
                    <h1 class="content-add-title">修改积木编程主题</h1>
                    <p class="content-add-subtitle">保留原有主题修改、实例替换、作品继承和评价量规逻辑，仅优化编辑界面的层次和可读性。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">当前实例链接、文件上传和量规设置继续沿用现有后台逻辑。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">编程主题</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="200px" CssClass="content-add-input"></asp:TextBox>
                    </div>

                    <div class="content-add-field">
                        <span class="content-add-label">发布设置</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                        </div>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= DDLMgid.ClientID %>">评价标准</label>
                        <asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt" Width="160px" Font-Names="Arial" CssClass="content-add-select"></asp:DropDownList>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <span class="content-add-label">编程选项</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckMicoWorld" runat="server" Text="作品继承" Checked="False" ToolTip="加载最近的积木编程作品，适合项目学习" />
                        </div>
                    </div>

                    <div class="content-add-field">
                        <span class="content-add-label">当前实例</span>
                        <asp:HyperLink ID="HlExample" runat="server" Target="_blank" CssClass="program-edit-example">[HlExample]</asp:HyperLink>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= Fupload.ClientID %>">替换实例文件</label>
                        <div class="ls-upload" data-accept=".sb3" data-label="点击或拖拽上传实例文件" data-hint="支持 sb3 格式">
                            <asp:FileUpload ID="Fupload" runat="server" />
                        </div>
                    </div>
                </div>
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
                <div class="content-add-editor-stage program-edit-editor-stage custom-scrollbar">
                    <textarea id="mcontent" runat="server"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">内容、标题或编号异常时，提示信息仍由原逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnedit" runat="server" Text="修改主题" OnClick="Btnedit_Click" SkinID="BtnNormal" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" SkinID="BtnNormal" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
    <script src="../js/fileupload.js"></script>
</asp:Content>
