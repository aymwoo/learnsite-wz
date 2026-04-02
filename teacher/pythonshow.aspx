<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="pythonshow.aspx.cs"  inherits="Teacher_pythonshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .python-show-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #eff6ff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #1d4ed8 0%, #2563eb 55%, #60a5fa 100%);
            --workspace-hero-shadow: 0 22px 45px -28px rgba(37, 99, 235, 0.72);
        }

        .python-show-meta,
        .python-show-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 0.7rem;
        }

        .python-show-chip {
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

        .python-show-panel,
        .python-show-content-panel,
        .python-show-footer {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(148, 163, 184, 0.18);
            border-radius: 1.25rem;
            box-shadow: 0 12px 28px -24px rgba(15, 23, 42, 0.4);
            backdrop-filter: blur(10px);
            padding: 1.5rem;
        }

        .python-show-action,
        .python-show-edit,
        .python-show-return {
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

        .python-show-action {
            border: 1px solid #bfdbfe;
            background: #eff6ff;
            color: #1d4ed8;
        }

        .python-show-action:hover {
            background: #dbeafe;
            color: #1e3a8a;
        }

        .python-show-edit,
        .python-show-return {
            width: 2.8rem;
            min-width: 2.8rem;
            padding: 0;
            border: 1px solid #cbd5e1;
            background: #ffffff;
        }

        .python-show-edit:hover,
        .python-show-return:hover {
            background: #eef2ff;
            border-color: #c7d2fe;
        }

        .python-show-edit img,
        .python-show-return img {
            width: 16px;
            height: 16px;
        }

        .python-show-section-title {
            margin: 0;
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
        }

        .python-show-section-desc {
            margin: 0.35rem 0 1rem;
            color: #64748b;
            font-size: 0.92rem;
        }

        .python-show-content {
            line-height: 1.8;
            color: #0f172a;
            overflow-wrap: anywhere;
        }

        .python-show-content img,
        .python-show-content video,
        .python-show-content iframe,
        .python-show-content table {
            max-width: 100%;
        }
    </style>

    <div class="course-show-page python-show-page">
        <div class="course-show-shell">
            <section class="course-show-hero">
                <div class="course-show-hero-content">
                    <div>
                        <span class="course-show-eyebrow">Python Mission</span>
                        <asp:Label ID="LabelMtitle" runat="server" CssClass="course-show-title"></asp:Label>
                        <div class="python-show-meta">
                            <span class="python-show-chip">日期：<asp:Label ID="LabelMdate" runat="server"></asp:Label></span>
                            <span class="python-show-chip">作品类型：<asp:Image ID="ImageType" runat="server" /><asp:Label ID="LabelMfiletype" runat="server"></asp:Label></span>
                        </div>
                    </div>
                    <div class="python-show-actions">
                        <asp:ImageButton ID="BtnEdit" runat="server" ToolTip="点击修改" ImageUrl="~/images/edit.gif" onclick="BtnEdit_Click" CssClass="python-show-edit" />
                        <asp:ImageButton ID="BtnReturnSmall" runat="server" ToolTip="返回" ImageUrl="~/images/return.gif" onclick="BtnReturnSmall_Click" CssClass="python-show-return" />
                    </div>
                </div>
            </section>

            <section class="python-show-panel">
                <h2 class="python-show-section-title">运行设置</h2>
                <p class="python-show-section-desc">保留自动批改入口、发布状态、模式切换和示例文件链接。</p>
                <div class="python-show-actions">
                    <asp:Image ID="Imgauto" runat="server" />
                    <asp:HyperLink ID="HLauto" runat="server" CssClass="python-show-action">自动批改</asp:HyperLink>
                    <asp:HyperLink ID="HlExample" runat="server" Target="_blank" CssClass="python-show-action">编程实例</asp:HyperLink>
                    <asp:HyperLink ID="HLMgid" runat="server" CssClass="python-show-action">评价标准</asp:HyperLink>
                    <label class="content-add-checks"><asp:CheckBox ID="CheckPublish" runat="server" Text="发布" Enabled="False" /></label>
                    <label class="content-add-checks"><asp:CheckBox ID="CheckBack" runat="server" Text="分步" Enabled="False" /></label>
                    <label class="content-add-checks"><asp:CheckBox ID="Checkhelp" runat="server" Text="绘图" Enabled="False" /></label>
                    <label class="content-add-checks"><asp:CheckBox ID="Checkblock" runat="server" Text="拼图" Enabled="False" /></label>
                    <label class="content-add-checks"><asp:CheckBox ID="Checkblockpy" runat="server" Text="积木" Enabled="False" /></label>
                </div>
            </section>

            <section class="python-show-content-panel">
                <h2 class="python-show-section-title">编程说明</h2>
                <p class="python-show-section-desc">正文内容仍由后台直接渲染，仅优化展示区版式和可读性。</p>
                <div id="Mcontent" class="python-show-content" runat="server"></div>
            </section>

            <section class="python-show-footer">
                <asp:LinkButton ID="LinkBtn" runat="server" OnClick="LinkBtn_Click" SkinID="LinkBtn">返回学案</asp:LinkButton>
            </section>
        </div>
    </div>
</asp:Content>
