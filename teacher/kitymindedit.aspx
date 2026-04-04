<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false"  AutoEventWireup="true" CodeFile="kitymindedit.aspx.cs" Inherits="teacher_kitymindedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    <style type="text/css">
        .mindmap-edit-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #f5f3ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #5b21b6 0%, #7c3aed 55%, #a78bfa 100%);
            --content-add-hero-shadow: 0 22px 45px -28px rgba(124, 58, 237, 0.72);
            --content-add-primary-bg: #7c3aed;
            --content-add-primary-hover: #6d28d9;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(124, 58, 237, 0.82);
            --content-add-secondary-bg: #f5f3ff;
            --content-add-secondary-fg: #6d28d9;
            --content-add-secondary-border: #ddd6fe;
            --content-add-secondary-hover: #ede9fe;
            --content-add-focus: #7c3aed;
            --content-add-focus-ring: rgba(124, 58, 237, 0.14);
        }

        .mindmap-edit-example {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.95rem;
            padding: 0 0.95rem;
            border-radius: 0.9rem;
            border: 1px solid #ddd6fe;
            background: #f5f3ff;
            color: #6d28d9;
            text-decoration: none;
            font-weight: 700;
        }

        .mindmap-edit-editor-stage textarea {
            width: 830px;
            height: 450px;
        }
    </style>

    <div class="content-add-page mindmap-edit-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Edit Mind Map</span>
                    <h1 class="content-add-title">修改思维导图主题</h1>
                    <p class="content-add-subtitle">保留主题修改、实例替换、发布设置和评价量规逻辑，仅优化思维导图编辑页的结构与视觉层次。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">当前实例链接、文件上传和量规设置继续沿用现有后台处理逻辑。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">思维导图</label>
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

                    <div class="content-add-field">
                        <span class="content-add-label">当前实例</span>
                        <asp:HyperLink ID="HlExample" runat="server" Target="_blank" CssClass="mindmap-edit-example">[HlExample]</asp:HyperLink>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= Fupload.ClientID %>">替换实例文件</label>
                        <div class="ls-upload" data-accept=".km" data-label="点击或拖拽上传实例文件" data-hint="支持 km 格式">
                            <asp:FileUpload ID="Fupload" runat="server" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">导图说明</h2>
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
                <div class="content-add-editor-stage mindmap-edit-editor-stage custom-scrollbar">
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
    <script src="../js/fileupload.js"></script>
</asp:Content>
