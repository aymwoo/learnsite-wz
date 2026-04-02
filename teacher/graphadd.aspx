<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="graphadd.aspx.cs"  inherits="Teacher_graphadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .graph-add-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #ecfeff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #0f766e 0%, #0891b2 55%, #38bdf8 100%);
            --content-add-hero-shadow: 0 22px 45px -28px rgba(8, 145, 178, 0.7);
            --content-add-primary-bg: #0891b2;
            --content-add-primary-hover: #0e7490;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(8, 145, 178, 0.72);
            --content-add-secondary-bg: #ecfeff;
            --content-add-secondary-fg: #0f766e;
            --content-add-secondary-border: #a5f3fc;
            --content-add-secondary-hover: #cffafe;
            --content-add-focus: #0891b2;
            --content-add-focus-ring: rgba(8, 145, 178, 0.14);
        }

        .graph-add-upload input[type="file"] {
            width: 100%;
        }

        .graph-add-editor-stage textarea {
            width: 830px;
            height: 450px;
        }
    </style>

    <div class="content-add-page graph-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add Flowchart Task</span>
                    <h1 class="content-add-title">添加流程图主题</h1>
                    <p class="content-add-subtitle">保留流程图主题、发布状态、实例文件上传和评价量规逻辑，仅优化输入布局、信息层次与编辑区域样式。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">流程图实例文件与正文说明仍按当前后台处理方式保存。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">流程图主题</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="300px" CssClass="content-add-input"></asp:TextBox>
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
                        <label class="content-add-label" for="<%= Fupload.ClientID %>">流程图实例文件</label>
                        <div class="content-add-static graph-add-upload">
                            <asp:FileUpload ID="Fupload" runat="server" Font-Size="10pt" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">流程说明</h2>
                <p class="content-add-section-desc">正文继续使用 KindEditor，保持现有图片上传和自动高度行为。</p>
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
                <div class="content-add-editor-stage graph-add-editor-stage custom-scrollbar">
                    <textarea name="textareaItem"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">主题为空或内容不完整时，错误提示仍由原页面逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加主题" OnClick="Btnadd_Click" SkinID="BtnNormal" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" SkinID="BtnNormal" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
</asp:Content>
