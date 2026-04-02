<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  Validaterequest="false" AutoEventWireup="true" CodeFile="htmladd.aspx.cs" Inherits="teacher_htmladd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .html-add-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #fff7ed 100%);
            --content-add-hero-bg: linear-gradient(135deg, #9a3412 0%, #ea580c 55%, #fb923c 100%);
            --content-add-hero-shadow: 0 22px 45px -28px rgba(234, 88, 12, 0.7);
            --content-add-primary-bg: #ea580c;
            --content-add-primary-hover: #c2410c;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(234, 88, 12, 0.8);
            --content-add-secondary-bg: #fff7ed;
            --content-add-secondary-fg: #9a3412;
            --content-add-secondary-border: #fdba74;
            --content-add-secondary-hover: #ffedd5;
            --content-add-focus: #ea580c;
            --content-add-focus-ring: rgba(234, 88, 12, 0.14);
        }

        .html-add-editor-stage textarea {
            width: 830px;
            height: 450px;
        }
    </style>

    <div class="content-add-page html-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add HTML Page</span>
                    <h1 class="content-add-title">添加网页主题</h1>
                    <p class="content-add-subtitle">保留网页主题、发布状态、页面文件名与说明内容的原有保存逻辑，只优化界面层次、表单布局和编辑体验。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">网页文件名和评价量规仍按现有后台逻辑写入，创建后继续返回学案页面。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">网页主题</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="220px" CssClass="content-add-input"></asp:TextBox>
                    </div>

                    <div class="content-add-field">
                        <span class="content-add-label">发布设置</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                        </div>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= DDLfilename.ClientID %>">网页文件名</label>
                        <asp:DropDownList ID="DDLfilename" runat="server" CssClass="content-add-select">
                            <asp:ListItem>index.html</asp:ListItem>
                            <asp:ListItem>w1.html</asp:ListItem>
                            <asp:ListItem>w2.html</asp:ListItem>
                            <asp:ListItem>w3.html</asp:ListItem>
                            <asp:ListItem>w4.html</asp:ListItem>
                            <asp:ListItem>w5.html</asp:ListItem>
                            <asp:ListItem>a1.html</asp:ListItem>
                            <asp:ListItem>a2.html</asp:ListItem>
                            <asp:ListItem>a3.html</asp:ListItem>
                            <asp:ListItem>a4.html</asp:ListItem>
                            <asp:ListItem>a5.html</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= DDLMgid.ClientID %>">评价标准</label>
                        <asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt" Width="160px" Font-Names="Arial" CssClass="content-add-select"></asp:DropDownList>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">网页说明</h2>
                <p class="content-add-section-desc">说明内容继续使用 KindEditor，保留原有上传接口与自动高度行为。</p>
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
                <div class="content-add-editor-stage html-add-editor-stage custom-scrollbar">
                    <textarea name="textareaItem"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">主题为空或内容不完整时，提示信息仍由原逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加主题" OnClick="Btnadd_Click" SkinID="BtnNormal" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" SkinID="BtnNormal" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
</asp:Content>
