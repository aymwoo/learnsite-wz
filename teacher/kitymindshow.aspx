<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="kitymindshow.aspx.cs" Inherits="teacher_kitymindshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .mindmap-show-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #f5f3ff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #5b21b6 0%, #7c3aed 55%, #a78bfa 100%);
            --workspace-hero-shadow: 0 22px 45px -28px rgba(124, 58, 237, 0.72);
        }

        .mindmap-show-meta,
        .mindmap-show-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 0.7rem;
        }

        .mindmap-show-chip {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.45rem 0.8rem;
            border-radius: 9999px;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.14);
            color: rgba(255, 255, 255, 0.94);
            font-size: 0.84rem;
        }

        .mindmap-show-panel,
        .mindmap-show-content-panel,
        .mindmap-show-footer {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(148, 163, 184, 0.18);
            border-radius: 1.25rem;
            box-shadow: 0 12px 28px -24px rgba(15, 23, 42, 0.4);
            backdrop-filter: blur(10px);
            padding: 1.5rem;
        }

        .mindmap-show-action,
        .mindmap-show-edit,
        .mindmap-show-return {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.85rem;
            padding: 0.72rem 1rem;
            border-radius: 0.95rem;
            text-decoration: none;
            transition: all 0.2s ease;
            font-weight: 600;
        }

        .mindmap-show-action {
            border: 1px solid #ddd6fe;
            background: #f5f3ff;
            color: #6d28d9;
        }

        .mindmap-show-action:hover {
            background: #ede9fe;
            color: #5b21b6;
        }

        .mindmap-show-edit,
        .mindmap-show-return {
            width: 2.8rem;
            min-width: 2.8rem;
            padding: 0;
            border: 1px solid #cbd5e1;
            background: #ffffff;
        }

        .mindmap-show-edit:hover,
        .mindmap-show-return:hover {
            background: #f5f3ff;
            border-color: #ddd6fe;
        }

        .mindmap-show-edit img,
        .mindmap-show-return img {
            width: 16px;
            height: 16px;
        }

        .mindmap-show-section-title {
            margin: 0;
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
        }

        .mindmap-show-section-desc {
            margin: 0.35rem 0 1rem;
            color: #64748b;
            font-size: 0.92rem;
        }

        .mindmap-show-content {
            line-height: 1.8;
            color: #0f172a;
            overflow-wrap: anywhere;
        }

        .mindmap-show-content img,
        .mindmap-show-content video,
        .mindmap-show-content iframe,
        .mindmap-show-content table {
            max-width: 100%;
        }
    </style>

    <div class="course-show-page mindmap-show-page">
        <div class="course-show-shell">
            <section class="course-show-hero">
                <div class="course-show-hero-content">
                    <div>
                        <span class="course-show-eyebrow">Mind Map Mission</span>
                        <asp:Label ID="LabelMtitle" runat="server" CssClass="course-show-title"></asp:Label>
                        <div class="mindmap-show-meta">
                            <span class="mindmap-show-chip">日期：<asp:Label ID="LabelMdate" runat="server"></asp:Label></span>
                            <span class="mindmap-show-chip">作品类型：<asp:Image ID="ImageType" runat="server" /><asp:Label ID="LabelMfiletype" runat="server"></asp:Label></span>
                        </div>
                    </div>
                    <div class="mindmap-show-actions">
                        <asp:ImageButton ID="BtnEdit" runat="server" ToolTip="点击修改" ImageUrl="~/images/edit.gif" onclick="BtnEdit_Click" CssClass="mindmap-show-edit" />
                        <asp:ImageButton ID="BtnReturnSmall" runat="server" ToolTip="返回" ImageUrl="~/images/return.gif" onclick="BtnReturnSmall_Click" CssClass="mindmap-show-return" />
                    </div>
                </div>
            </section>

            <section class="mindmap-show-panel">
                <h2 class="mindmap-show-section-title">主题设置</h2>
                <p class="mindmap-show-section-desc">保留发布状态、实例文件入口和评价标准入口。</p>
                <div class="mindmap-show-actions">
                    <label class="content-add-checks"><asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Enabled="False" /></label>
                    <asp:HyperLink ID="Hlexample" runat="server" CssClass="mindmap-show-action">实例文件</asp:HyperLink>
                    <asp:HyperLink ID="HLMgid" runat="server" CssClass="mindmap-show-action">评价标准</asp:HyperLink>
                </div>
            </section>

            <section class="mindmap-show-content-panel">
                <h2 class="mindmap-show-section-title">导图说明</h2>
                <p class="mindmap-show-section-desc">正文内容仍由后台直接渲染，仅优化阅读区版式与响应式表现。</p>
                <div id="Mcontent" class="mindmap-show-content" runat="server"></div>
            </section>

            <section class="mindmap-show-footer">
                <asp:LinkButton ID="LinkBtn" runat="server" OnClick="LinkBtn_Click" SkinID="LinkBtn">返回学案</asp:LinkButton>
            </section>
        </div>
    </div>
</asp:Content>
