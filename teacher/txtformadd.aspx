<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher" Validaterequest="false"  AutoEventWireup="true" CodeFile="txtformadd.aspx.cs" Inherits="Teacher_txtformadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .txtform-add-page {
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

        .txtform-add-editor-stage textarea {
            width: 780px;
            height: 450px;
        }
    </style>

    <div class="content-add-page txtform-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add Form Task</span>
                    <h1 class="content-add-title">添加表格填写</h1>
                    <p class="content-add-subtitle">保留原有表单标题、发布状态、协同设置和内容提交逻辑，只优化页面结构和编辑区域体验。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">以下字段保持原有后台行为，创建成功后仍返回对应学案页面。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">表格名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="200px" CssClass="content-add-input"></asp:TextBox>
                    </div>
                    <div class="content-add-field content-add-field-wide">
                        <span class="content-add-label">表单设置</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                            <asp:CheckBox ID="CheckCollabo" runat="server" Text="是否协同" Checked="True" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">填写说明</h2>
                <p class="content-add-section-desc">正文继续使用 KindEditor，保留原有上传接口、自动高度和内容提交方式。</p>
                <script type="text/javascript" charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script type="text/javascript" charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
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
                            autoHeightMode: true,
                            afterCreate: function () {
                                this.loadPlugin('autoheight');
                            }
                        });
                    });
                </script>
                <div class="content-add-editor-stage txtform-add-editor-stage custom-scrollbar">
                    <textarea name="textareaItem"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">标题或内容为空时，仍由原页面逻辑输出错误提示。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加表单" OnClick="Btnadd_Click" SkinID="BtnNormal" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" SkinID="BtnNormal" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
</asp:Content>
