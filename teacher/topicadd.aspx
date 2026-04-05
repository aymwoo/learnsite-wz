<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher" Validaterequest="false"  AutoEventWireup="true" CodeFile="topicadd.aspx.cs" Inherits="Teacher_topicadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .topic-add-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #4338ca 0%, #4f46e5 55%, #818cf8 100%);
            --content-add-primary-bg: #4f46e5;
            --content-add-primary-hover: #4338ca;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
        }

        .topic-add-editor-stage textarea {
            width: 800px;
            height: 500px;
        }

        .topic-add-page .content-add-actions {
            display: flex;
            gap: 12px;
            align-items: center;
            flex-wrap: wrap;
        }

        .topic-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 44px;
            padding: 0 24px;
            border: none;
            border-radius: 0.375rem;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s;
            text-decoration: none;
        }

        .topic-btn--primary {
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            color: #ffffff;
            box-shadow: 0 8px 16px rgba(79, 70, 229, 0.25);
        }

        .topic-btn--primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 24px rgba(79, 70, 229, 0.35);
        }

        .topic-btn--primary:active {
            transform: translateY(0);
        }

        .topic-btn--secondary {
            background: #ffffff;
            color: #475569;
            border: 1px solid #e2e8f0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .topic-btn--secondary:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
            color: #0f172a;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
        }

        .topic-btn svg {
            width: 18px;
            height: 18px;
            flex-shrink: 0;
        }
    </style>

    <div class="content-add-page topic-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add Discussion Topic</span>
                    <h1 class="content-add-title">添加讨论主题</h1>
                    <p class="content-add-subtitle">保留现有标题、暂停状态和富文本内容提交逻辑，仅优化讨论主题创建页的布局、层次和输入体验。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">讨论主题标题和暂停状态沿用当前后台逻辑，创建后仍会回到学案展示页。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">讨论主题</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="400px" CssClass="content-add-input"></asp:TextBox>
                    </div>
                    <div class="content-add-field content-add-field-wide">
                        <span class="content-add-label">状态设置</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否暂停" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">讨论说明</h2>
                <p class="content-add-section-desc">正文继续使用 KindEditor 编辑，并保持原有图片上传和文件管理接口。</p>
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
                            filterMode: false
                        });
                    });
                </script>
                <div class="content-add-editor-stage topic-add-editor-stage custom-scrollbar">
                    <textarea name="textareaItem"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">标题或内容为空时，错误提示仍由原页面逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加主题" OnClick="Btnadd_Click" SkinID="BtnNormal" CssClass="topic-btn topic-btn--primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" SkinID="BtnNormal" CssClass="topic-btn topic-btn--secondary" />
            </section>
        </div>
    </div>
</asp:Content>
