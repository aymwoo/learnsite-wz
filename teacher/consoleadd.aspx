<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="consoleadd.aspx.cs" Inherits="Teacher_consoleadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../App_Themes/Teacher/course-content-add.css" rel="stylesheet" />
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
                        <p class="content-add-section-desc">使用 KindEditor 编写测评说明、测试代码及评分标准。</p>
                    </div>
                </div>

                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script type="text/javascript">
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
                            filterMode: false
                        });
                    });
                    function syncContent() {
                        if (editor) {
                            editor.sync();
                        }
                        return true;
                    }
                </script>

                <div class="content-add-editor-stage console-add-editor-stage">
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
                    SkinID="BtnNormal" onclick="Btnadd_Click"
                    OnClientClick="return syncContent();"
                    CssClass="content-add-btn-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="返回"
                    SkinID="BtnNormal" onclick="BtnCourse_Click"
                    CssClass="content-add-btn-secondary" />
            </div>

        </div>
    </div>
</asp:Content>
