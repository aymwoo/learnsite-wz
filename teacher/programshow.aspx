<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="programshow.aspx.cs" Inherits="Teacher_programshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .mission-show-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #1e293b 0%, #312e81 55%, #4f46e5 100%);
            --workspace-hero-shadow: 0 22px 45px -28px rgba(79, 70, 229, 0.72);
        }

        .mission-show-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 0.7rem;
            margin-top: 0.65rem;
        }

        .mission-show-chip {
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

        .mission-show-meta-tools {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            align-items: center;
            justify-content: flex-end;
        }

        .mission-show-panel,
        .mission-show-content-panel,
        .mission-show-footer {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(148, 163, 184, 0.18);
            border-radius: 1.25rem;
            box-shadow: 0 12px 28px -24px rgba(15, 23, 42, 0.4);
            backdrop-filter: blur(10px);
        }

        .mission-show-panel,
        .mission-show-content-panel,
        .mission-show-footer {
            padding: 1.5rem;
        }

        .mission-show-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
        }

        .mission-show-action,
        .mission-show-edit,
        .mission-show-return {
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

        .mission-show-action {
            border: 1px solid #bbf7d0;
            background: #ecfdf5;
            color: #166534;
        }

        .mission-show-action:hover {
            background: #dcfce7;
            color: #14532d;
        }

        .mission-show-edit,
        .mission-show-return {
            width: 2.8rem;
            min-width: 2.8rem;
            padding: 0;
            border: 1px solid #cbd5e1;
            background: #ffffff;
        }

        .mission-show-edit:hover,
        .mission-show-return:hover {
            background: #eef2ff;
            border-color: #c7d2fe;
        }

        .mission-show-edit img,
        .mission-show-return img {
            width: 16px;
            height: 16px;
        }

        .mission-show-section-title {
            margin: 0;
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
        }

        .mission-show-section-desc {
            margin: 0.35rem 0 1rem;
            color: #64748b;
            font-size: 0.92rem;
        }

        .mission-show-content {
            line-height: 1.8;
            color: #0f172a;
            overflow-wrap: anywhere;
        }

        .mission-show-content img,
        .mission-show-content video,
        .mission-show-content iframe,
        .mission-show-content table {
            max-width: 100%;
        }

        @media (max-width: 768px) {
            .mission-show-meta-tools {
                justify-content: flex-start;
            }

            .mission-show-action {
                width: 100%;
            }
        }
    </style>

    <div class="course-show-page mission-show-page">
        <div class="course-show-shell">
            <section class="course-show-hero">
                <div class="course-show-hero-content">
                    <div>
                        <span class="course-show-eyebrow">Program Mission</span>
                        <asp:Label ID="LabelMtitle" runat="server" CssClass="course-show-title"></asp:Label>
                        <div class="mission-show-meta">
                            <span class="mission-show-chip">日期：<asp:Label ID="LabelMdate" runat="server"></asp:Label></span>
                            <span class="mission-show-chip">作品类型：<asp:Image ID="ImageType" runat="server" /><asp:Label ID="LabelMfiletype" runat="server"></asp:Label></span>
                        </div>
                    </div>
                    <div class="mission-show-meta-tools">
                        <asp:ImageButton ID="BtnEdit" runat="server" ToolTip="点击修改" ImageUrl="~/images/edit.gif" onclick="BtnEdit_Click" CssClass="mission-show-edit" />
                        <asp:ImageButton ID="BtnReturnSmall" runat="server" ToolTip="返回" ImageUrl="~/images/return.gif" onclick="BtnReturnSmall_Click" CssClass="mission-show-return" />
                    </div>
                </div>
            </section>

            <section class="mission-show-panel">
                <h2 class="mission-show-section-title">主题设置</h2>
                <p class="mission-show-section-desc">保留原有发布状态、作品继承、实例下载和评价标准入口。</p>
                <div class="mission-show-actions">
                    <asp:HyperLink ID="Hlexample" runat="server" CssClass="mission-show-action">实例下载</asp:HyperLink>
                    <asp:HyperLink ID="HLMgid" runat="server" CssClass="mission-show-action">评价标准</asp:HyperLink>
                    <label class="content-add-checks"><asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Enabled="False" /></label>
                    <label class="content-add-checks"><asp:CheckBox ID="CheckMicoWorld" runat="server" Text="作品继承" ToolTip="加载上一节的编程作品，适合项目学习" Enabled="False" /></label>
                </div>
            </section>

            <section class="mission-show-content-panel">
                <h2 class="mission-show-section-title">活动说明</h2>
                <p class="mission-show-section-desc">正文内容仍由后台直接渲染，仅优化展示区版式和可读性。</p>
                <div id="Mcontent" class="mission-show-content" runat="server"></div>
            </section>

            <section class="mission-show-footer">
                <asp:LinkButton ID="LinkBtn" runat="server" OnClick="LinkBtn_Click" SkinID="LinkBtn">返回学案</asp:LinkButton>
            </section>
        </div>
    </div>
</asp:Content>
