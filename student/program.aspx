<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true" StylesheetTheme="Student"  CodeFile="program.aspx.cs" Inherits="Student_program" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<style type="text/css">
    /* ── Design tokens (mirrors start.aspx lesson-start vars) ── */
    .prog-wrap {
        --p-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
        --p-card: rgba(255,255,255,0.97);
        --p-border: #dbe6f5;
        --p-border-strong: #bfdbfe;
        --p-text: #0f172a;
        --p-muted: #64748b;
        --p-primary: #2563eb;
        --p-primary-soft: #dbeafe;
        --p-success: #16a34a;
        --p-danger: #dc2626;
    }

    .prog-wrap * { box-sizing: border-box; }

    /* ── Two-column grid ── */
    .prog-grid {
        display: grid;
        grid-template-columns: 1fr 300px;
        gap: 20px;
        align-items: start;
        width: 100%;
    }

    @media (max-width: 1024px) {
        .prog-grid { grid-template-columns: 1fr; }
        .prog-sidebar { position: static !important; }
    }

    /* ── Shared card shell (same as lesson-card in start.aspx) ── */
    .prog-card {
        border: 1px solid var(--p-border);
        border-radius: 0.75rem;
        background: var(--p-card);
        box-shadow: 0 12px 30px rgba(15,23,42,0.05);
        min-width: 0;
    }

    .prog-card__head {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        gap: 12px;
        padding: 20px 24px 0;
    }

    .prog-card__title {
        margin: 0;
        font-size: 18px;
        font-weight: 800;
        line-height: 1.2;
        letter-spacing: -0.02em;
        color: var(--p-text);
    }

    .prog-card__body {
        padding: 18px 24px 22px;
    }

    /* ── Main content card theme (blue, mirrors lesson-theme--blue) ── */
    .prog-main-card {
        background: linear-gradient(160deg, #ffffff 0%, #f0f7ff 100%);
    }

    .prog-main-title {
        font-size: clamp(20px, 2.5vw, 26px);
        font-weight: 800;
        color: var(--p-text);
        letter-spacing: -0.03em;
        padding-bottom: 14px;
        border-bottom: 1px solid #e2e8f0;
        margin-bottom: 20px;
        text-align: center;
    }

    .prog-content-area {
        color: #334155;
        line-height: 1.9;
        font-size: 16px;
        word-wrap: break-word;
        word-break: break-word;
    }

    /* ── Sidebar card theme (indigo, mirrors lesson-theme--indigo) ── */
    .prog-sidebar {
        position: sticky;
        top: 116px;   /* topbar 56px + lessonav 52px + 8px gap */
    }

    .prog-sidebar-card {
        background: linear-gradient(160deg, #ffffff 0%, #eef2ff 100%);
    }

    .prog-sidebar-card .prog-card__head {
        align-items: center;
    }

    .prog-sidebar-icon {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
        border-radius: 0.5rem;
        background: #e0e7ff;
        color: #4338ca;
        flex-shrink: 0;
    }

    .prog-sidebar-icon svg {
        width: 16px;
        height: 16px;
    }

    /* ── Dividers inside sidebar ── */
    .prog-divider {
        border: none;
        border-top: 1px solid #e2e8f0;
        margin: 14px 0;
    }

    /* ── Buttons — exact same spec as lesson-btn in start.aspx ── */
    .prog-btn,
    .prog-btn-secondary,
    .prog-btn-danger,
    .prog-btn-outline {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        min-height: 40px;
        padding: 0 16px;
        border-radius: 0.375rem;
        border: 1px solid transparent;
        font-size: 14px;
        font-weight: 700;
        text-decoration: none;
        cursor: pointer;
        transition: transform 0.18s ease, box-shadow 0.18s ease,
                    background-color 0.18s ease, border-color 0.18s ease;
        text-align: center;
    }

    /* Primary — matches lesson-btn */
    .prog-btn {
        background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
        color: #ffffff;
        border: 0;
        box-shadow: 0 6px 16px rgba(37,99,235,0.22);
    }
    .prog-btn:hover { transform: translateY(-1px); box-shadow: 0 8px 20px rgba(37,99,235,0.30); }

    /* Secondary — matches lesson-btn--secondary */
    .prog-btn-secondary {
        background: #eff6ff;
        color: #1d4ed8;
        border-color: #bfdbfe;
    }
    .prog-btn-secondary:hover { transform: translateY(-1px); background: #dbeafe; }

    /* Danger outline */
    .prog-btn-danger {
        background: #fff1f2;
        color: #b91c1c;
        border-color: #fecaca;
    }
    .prog-btn-danger:hover { transform: translateY(-1px); background: #fee2e2; }

    /* Green link — matches lesson-link */
    .prog-btn-outline {
        background: #f0fdf4;
        color: #14532d;
        border-color: #bbf7d0;
    }
    .prog-btn-outline:hover { transform: translateY(-1px); background: #dcfce7; }

    .prog-btn[disabled],
    .prog-btn-secondary[disabled],
    .prog-btn-danger[disabled],
    .prog-btn-outline[disabled] {
        opacity: 0.55;
        cursor: not-allowed;
        transform: none;
        box-shadow: none;
    }

    /* ── Thumbnail / work preview area ── */
    .prog-preview {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 10px;
        padding: 14px;
        border-radius: 0.5rem;
        border: 1px solid #e2e8f0;
        background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
    }

    .prog-preview__img {
        max-width: 160px;
        max-height: 200px;
        border-radius: 0.5rem;
        border: 1px solid #dbe4f0;
        box-shadow: 0 4px 12px rgba(15,23,42,0.07);
        display: block;
    }

    .prog-preview__label {
        font-size: 13px;
        font-weight: 600;
        color: var(--p-muted);
        text-align: center;
    }

    .prog-preview__pass {
        width: 80px;
        height: auto;
        opacity: 0.85;
        margin-top: 4px;
    }

    /* ── Info label ── */
    .prog-info-label {
        display: block;
        font-size: 13px;
        color: var(--p-muted);
        line-height: 1.7;
        text-align: center;
    }

    /* ── Button group spacing ── */
    .prog-btn-stack {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    /* ── Override ASP.NET SkinID="buttonSkinPink" inline styles ──
       The skin injects inline style attrs (background-color, height, width,
       font-size, border-*) that defeat class-based CSS. We use !important
       with high specificity to win over those inline declarations.         */
    .prog-wrap .prog-btn-stack .prog-btn,
    .prog-wrap .prog-btn-stack .prog-btn-secondary,
    .prog-wrap .prog-btn-stack .prog-btn-danger,
    .prog-wrap .prog-btn-stack .prog-btn-outline,
    .prog-wrap .prog-btn-stack input.prog-btn,
    .prog-wrap .prog-btn-stack input.prog-btn-secondary,
    .prog-wrap .prog-btn-stack input.prog-btn-danger,
    .prog-wrap .prog-btn-stack a.prog-btn-outline {
        width: 100% !important;
        min-height: 40px !important;
        height: auto !important;
        font-size: 14px !important;
        font-family: inherit !important;
        font-weight: 700 !important;
        padding: 0 16px !important;
        border-radius: 0.375rem !important;
        box-sizing: border-box !important;
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        text-decoration: none !important;
        cursor: pointer !important;
        transition: transform 0.18s ease, box-shadow 0.18s ease,
                    background-color 0.18s ease, border-color 0.18s ease !important;
    }

    /* Per-variant color overrides (must beat inline style) */
    .prog-wrap .prog-btn-stack input.prog-btn,
    .prog-wrap .prog-btn-stack .prog-btn {
        background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%) !important;
        color: #ffffff !important;
        border: none !important;
        box-shadow: 0 6px 16px rgba(37,99,235,0.22) !important;
    }
    .prog-wrap .prog-btn-stack input.prog-btn-secondary,
    .prog-wrap .prog-btn-stack .prog-btn-secondary {
        background: #eff6ff !important;
        color: #1d4ed8 !important;
        border: 1px solid #bfdbfe !important;
        box-shadow: none !important;
    }
    .prog-wrap .prog-btn-stack input.prog-btn-danger,
    .prog-wrap .prog-btn-stack .prog-btn-danger {
        background: #fff1f2 !important;
        color: #b91c1c !important;
        border: 1px solid #fecaca !important;
        box-shadow: none !important;
    }
    .prog-wrap .prog-btn-stack a.prog-btn-outline {
        background: #f0fdf4 !important;
        color: #14532d !important;
        border: 1px solid #bbf7d0 !important;
        box-shadow: none !important;
    }
</style>

<div class="prog-wrap">
    <link href="../kindeditor/themes/me/me.css" rel="stylesheet" type="text/css" />
    <script charset="utf-8" src="../kindeditor/kindeditor-min.js" type="text/javascript"></script>
    <script charset="utf-8" src="../kindeditor/lang/zh_CN.js" type="text/javascript"></script>

    <div class="prog-grid">

        <!-- ══ Main Content ══ -->
        <div class="prog-card prog-main-card">
            <div class="prog-card__body">
                <!-- Hidden state labels -->
                <div class="hidden" style="display:none;">
                    <asp:Label ID="LabelSnum" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LabelMid" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LabelUploadType" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LabelMcid" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LabelMsort" runat="server" Visible="False"></asp:Label>
                    <asp:CheckBox ID="CheckBack" runat="server" Visible="False" />
                    <asp:CheckBox ID="CheckBlock" runat="server" Visible="False" />
                    <asp:CheckBox ID="CheckBlockpy" runat="server" Visible="False" />
                    <asp:Label ID="LabelLid" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LabelLtype" runat="server" Visible="False"></asp:Label>
                </div>

                <div class="prog-main-title course-node-head">
                    <asp:Label ID="LabelMtitle" runat="server" CssClass="course-node-title"></asp:Label>
                </div>

                <div id="Mcontent" class="prog-content-area" style="word-wrap:break-word; word-break:break-word;" runat="server">
                </div>
            </div>
        </div>

        <!-- ══ Right Sidebar ══ -->
        <div class="prog-sidebar">
            <div class="prog-card prog-sidebar-card">
                <div class="prog-card__head">
                    <div class="prog-sidebar-icon">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"></path>
                        </svg>
                    </div>
                    <h3 class="prog-card__title" style="flex:1; padding-left:10px;">操作面板</h3>
                </div>

                <div class="prog-card__body">
                    <!-- Quick actions -->
                    <div class="prog-btn-stack">
                        <input type="button"
                            class="prog-btn-secondary"
                            id="share" value="我的网盘"
                            onclick="showShare()" />
                        <asp:HyperLink ID="VoteLink" runat="server" Target="_blank"
                            CssClass="prog-btn-outline"
                            SkinID="HyperLinkPink">作品互评</asp:HyperLink>
                    </div>

                    <hr class="prog-divider" />

                    <!-- Work preview -->
                    <div class="prog-preview">
                        <asp:Image ID="Thumbnail" runat="server"
                            CssClass="prog-preview__img" />
                        <div id="pixelsmall" runat="server"></div>
                        <asp:Label ID="Wtitle" runat="server"
                            CssClass="prog-preview__label"></asp:Label>
                    </div>

                    <hr class="prog-divider" />

                    <!-- Action buttons -->
                    <div class="prog-btn-stack">
                        <asp:Button ID="BtnScratch" runat="server"
                            Font-Bold="True"
                            onclick="BtnScratch_Click"
                            SkinID="buttonSkinPink"
                            Text="开始创作"
                            CssClass="prog-btn" />

                        <asp:Label ID="Labelscratch" runat="server"
                            CssClass="prog-info-label"></asp:Label>

                        <asp:Button ID="BtnBegin" runat="server"
                            Font-Bold="True"
                            onclick="BtnBegin_Click"
                            SkinID="buttonSkinPink"
                            Text="开关指令"
                            Visible="False"
                            CssClass="prog-btn-secondary" />

                        <asp:Button ID="ButtonClear" runat="server"
                            Font-Bold="True"
                            SkinID="buttonSkinPink"
                            Text="清除提交"
                            ToolTip="清除模拟学生提交的本项作品"
                            onclick="ButtonClear_Click"
                            Visible="False"
                            CssClass="prog-btn-danger" />

                        <asp:Label ID="Labelmsg" runat="server"
                            SkinID="LabelMsgRed"
                            CssClass="prog-info-label"
                            style="color:#b91c1c; font-weight:700;"></asp:Label>

                        <asp:Image ID="ImagePass" runat="server"
                            ImageUrl="~/images/sucessed.png"
                            Visible="False"
                            CssClass="prog-preview__pass" />
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
/* Adjust sidebar sticky top dynamically:
   if the lessonav is hidden (no cid/lid), drop to topbar-only offset */
(function () {
    var nav = document.getElementById("scm-lessonav");
    var sidebar = document.querySelector(".prog-sidebar");
    if (!sidebar) return;
    if (nav && nav.getAttribute("data-empty") === "1") {
        sidebar.style.top = "64px"; /* topbar 56px + 8px gap */
    }
})();
</script>
</asp:Content>
