<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true"  StylesheetTheme="Student"  CodeFile="showmission.aspx.cs" Inherits="Student_showmission" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<link rel="stylesheet" href="../js/vendors/vditor/index.css" />
<link rel="stylesheet" href="../js/vendors/reveal/dist/reveal.css" />
<link rel="stylesheet" href="../js/vendors/reveal/dist/theme/white.css" />
<link rel="stylesheet" href="../js/vendors/highlight/github.min.css" />
<script src="../markdown/lib/marked.min.js"></script>
<script src="../webform/highlight.min.js"></script>
<style>
    .prog-wrap * { box-sizing: border-box; }
    .prog-grid { display: grid; grid-template-columns: 1fr 300px; gap: 20px; align-items: start; width: 100%; }
    @media (max-width: 1024px) { .prog-grid { grid-template-columns: 1fr; } .prog-sidebar { position: static !important; } }
    .prog-card { border: 1px solid #dbe6f5; border-radius: 0.75rem; background: rgba(255,255,255,0.97); box-shadow: 0 12px 30px rgba(15,23,42,0.05); min-width: 0; }
    .prog-sidebar { position: sticky; top: 116px; }
    .prog-sidebar-card { background: linear-gradient(160deg, #ffffff 0%, #eef2ff 100%); }
    .prog-card__head { display: flex; align-items: center; gap: 10px; padding: 16px 20px 0; }
    .prog-card__title { margin: 0; font-size: 15px; font-weight: 800; color: #0f172a; flex: 1; }
    .prog-sidebar-icon { display: inline-flex; align-items: center; justify-content: center; width: 30px; height: 30px; border-radius: 0.5rem; background: #e0e7ff; color: #4338ca; flex-shrink: 0; }
    .prog-sidebar-icon svg { width: 15px; height: 15px; }
    .prog-card__body { padding: 14px 20px 18px; }
    .prog-divider { border: none; border-top: 1px solid #e2e8f0; margin: 12px 0; }
    .prog-btn-stack { display: flex; flex-direction: column; gap: 8px; }
    .prog-btn-secondary { display: inline-flex; align-items: center; justify-content: center; width: 100%; min-height: 38px; padding: 0 14px; border-radius: 0.375rem; font-size: 13px; font-weight: 700; cursor: pointer; background: #eff6ff; color: #1d4ed8; border: 1px solid #bfdbfe; transition: transform 0.18s; }
    .prog-btn-secondary:hover { transform: translateY(-1px); background: #dbeafe; }
    .prog-btn-outline { display: inline-flex; align-items: center; justify-content: center; width: 100%; min-height: 38px; padding: 0 14px; border-radius: 0.375rem; font-size: 13px; font-weight: 700; text-decoration: none; cursor: pointer; background: #f0fdf4; color: #14532d; border: 1px solid #bbf7d0; transition: transform 0.18s; }
    .prog-btn-outline:hover { transform: translateY(-1px); background: #dcfce7; }
    /* skin overrides */
    .prog-card__body .prog-btn-stack a.prog-btn-outline { width: 100% !important; min-height: 38px !important; height: auto !important; font-size: 13px !important; font-weight: 700 !important; background: #f0fdf4 !important; color: #14532d !important; border: 1px solid #bbf7d0 !important; box-sizing: border-box !important; display: inline-flex !important; align-items: center !important; justify-content: center !important; }
    /* sub-panels */
    .prog-subpanel { background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 0.5rem; padding: 12px 14px; margin-top: 10px; }
    .prog-subpanel-title { font-size: 12px; font-weight: 700; color: #475569; margin-bottom: 10px; display: flex; align-items: center; gap: 6px; }
    .prog-subpanel-title svg { width: 13px; height: 13px; }
    .upload-btn { display: inline-flex; align-items: center; justify-content: center; padding: 6px 16px; background: #2563eb; color: #fff; border: none; border-radius: 0.375rem; font-size: 13px; font-weight: 700; cursor: pointer; transition: background 0.18s; }
    .upload-btn:hover { background: #1d4ed8; }
    .prog-filetype { font-size: 11px; color: #64748b; text-align: center; margin-top: 6px; }
    .prog-errmsg { font-size: 12px; font-weight: 700; color: #b91c1c; text-align: center; margin-top: 4px; }
    .prog-toggle-card { margin-bottom: 12px; }
    .prog-toggle-row { display: flex; align-items: center; justify-content: space-between; gap: 12px; }
    .prog-toggle-copy { min-width: 0; }
    .prog-toggle-title { font-size: 13px; font-weight: 800; color: #0f172a; }
    .prog-toggle-desc { margin-top: 4px; font-size: 12px; line-height: 1.5; color: #64748b; }
    .prog-toggle-switch {
        position: relative;
        display: inline-flex;
        align-items: center;
        width: 52px;
        height: 30px;
        border: none;
        border-radius: 999px;
        background: #cbd5e1;
        cursor: pointer;
        transition: background 0.2s ease;
        flex-shrink: 0;
        padding: 3px;
        box-sizing: border-box;
    }
    .prog-toggle-knob {
        display: block;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        background: #ffffff;
        box-shadow: 0 2px 6px rgba(15, 23, 42, 0.18);
        transition: transform 0.2s ease;
        transform: translateX(0);
        pointer-events: none;
    }
    .prog-toggle-switch.is-on { background: #4f46e5; }
    .prog-toggle-switch.is-on .prog-toggle-knob { transform: translateX(22px); }
    .prog-toggle-status { margin-top: 8px; font-size: 12px; color: #475569; }
    .mission-markdown { color: #334155; line-height: 1.85; font-size: 1.05rem; word-wrap: break-word; word-break: break-word; }
    .mission-markdown .vditor-reset { padding: 0; font-size: inherit; line-height: inherit; color: inherit; }
    .mission-markdown .vditor-reset blockquote { margin-left: 0; margin-right: 0; }
    .mission-markdown .vditor-reset pre { position: relative; padding-left: 56px; overflow: auto; }
    .mission-markdown .vditor-reset pre code { display: block; }
    .mission-markdown .code-block-wrap { position: relative; margin: 1rem 0; }
    .mission-markdown .code-line-numbers {
        position: absolute;
        top: 0;
        left: 0;
        width: 44px;
        padding: 16px 8px 16px 0;
        border-right: 1px solid rgba(148, 163, 184, 0.35);
        color: #94a3b8;
        background: rgba(15, 23, 42, 0.04);
        text-align: right;
        font-size: 12px;
        line-height: 1.5;
        user-select: none;
        white-space: pre;
        box-sizing: border-box;
    }
    .mission-markdown .code-block-wrap pre { margin: 0; }
    .mission-markdown .mermaid-host,
    .mission-markdown .reveal-host {
        margin: 1rem 0;
        border: 1px solid #dbeafe;
        border-radius: 0.75rem;
        background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
        overflow: hidden;
    }
    .mission-markdown .reveal-host { padding: 0; }
    .mission-markdown .reveal-toolbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 12px;
        padding: 10px 14px;
        background: #eff6ff;
        border-bottom: 1px solid #dbeafe;
    }
    .mission-markdown .reveal-toolbar-title {
        font-size: 12px;
        font-weight: 700;
        color: #1e3a8a;
    }
    .mission-markdown .reveal-theme-select {
        min-height: 32px;
        padding: 0 10px;
        border: 1px solid #bfdbfe;
        border-radius: 999px;
        background: #ffffff;
        color: #1d4ed8;
        font-size: 12px;
        font-weight: 700;
        outline: none;
    }
    .mission-markdown .reveal-fullscreen-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 32px;
        padding: 0 12px;
        border: 1px solid #bfdbfe;
        border-radius: 999px;
        background: #ffffff;
        color: #1d4ed8;
        font-size: 12px;
        font-weight: 700;
        cursor: pointer;
    }
    .mission-markdown .reveal-toolbar-actions {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        margin-left: auto;
        flex-wrap: wrap;
    }
    .mission-markdown .reveal-nav-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 36px;
        min-height: 32px;
        padding: 0 10px;
        border: 1px solid #bfdbfe;
        border-radius: 999px;
        background: #ffffff;
        color: #1d4ed8;
        font-size: 12px;
        font-weight: 700;
        cursor: pointer;
    }
    .mission-markdown .reveal-page-indicator {
        min-width: 56px;
        font-size: 12px;
        color: #475569;
        text-align: center;
        font-variant-numeric: tabular-nums;
    }
    .mission-markdown .reveal-stage {
        position: relative;
        width: 100%;
        max-width: min(100%, 1280px);
        margin: 0 auto;
        aspect-ratio: 16 / 9;
        min-height: 360px;
        max-height: 78vh;
        background: #0f172a;
    }
    .mission-markdown .reveal {
        position: absolute;
        inset: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background: var(--mission-reveal-bg, #0f172a);
        color: var(--mission-reveal-fg, #e2e8f0);
        line-height: 1.2;
        --r-main-font: "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
        --r-heading-font: "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
        --r-code-font: "Cascadia Mono", "Consolas", monospace;
        --r-main-font-size: 32px;
        --mission-reveal-link: #60a5fa;
        --mission-reveal-accent: #38bdf8;
        --mission-reveal-code-bg: rgba(15, 23, 42, 0.35);
        --mission-reveal-code-fg: inherit;
        --mission-reveal-quote-bg: rgba(148, 163, 184, 0.16);
    }
    .mission-markdown .reveal.reveal-theme-default {
        --mission-reveal-bg: #0f172a;
        --mission-reveal-fg: #e2e8f0;
        --mission-reveal-link: #7dd3fc;
        --mission-reveal-accent: #38bdf8;
        --mission-reveal-code-bg: rgba(15, 23, 42, 0.4);
        --mission-reveal-quote-bg: rgba(148, 163, 184, 0.16);
    }
    .mission-markdown .reveal.reveal-theme-white {
        --mission-reveal-bg: #ffffff;
        --mission-reveal-fg: #1e293b;
        --mission-reveal-link: #2563eb;
        --mission-reveal-accent: #3b82f6;
        --mission-reveal-code-bg: #f8fafc;
        --mission-reveal-quote-bg: #eff6ff;
    }
    .mission-markdown .reveal.reveal-theme-sky {
        --mission-reveal-bg: linear-gradient(180deg, #e0f2fe 0%, #f8fbff 100%);
        --mission-reveal-fg: #0f172a;
        --mission-reveal-link: #0369a1;
        --mission-reveal-accent: #0ea5e9;
        --mission-reveal-code-bg: rgba(186, 230, 253, 0.42);
        --mission-reveal-quote-bg: rgba(125, 211, 252, 0.22);
    }
    .mission-markdown .reveal.reveal-theme-beige {
        --mission-reveal-bg: linear-gradient(180deg, #f7f1e3 0%, #fffaf0 100%);
        --mission-reveal-fg: #3f3a2f;
        --mission-reveal-link: #b45309;
        --mission-reveal-accent: #d97706;
        --mission-reveal-code-bg: rgba(245, 158, 11, 0.12);
        --mission-reveal-quote-bg: rgba(217, 119, 6, 0.1);
    }
    .mission-markdown .reveal.reveal-theme-simple {
        --mission-reveal-bg: #f8fafc;
        --mission-reveal-fg: #111827;
        --mission-reveal-link: #2563eb;
        --mission-reveal-accent: #4f46e5;
        --mission-reveal-code-bg: #eef2ff;
        --mission-reveal-quote-bg: #e2e8f0;
    }
    .mission-markdown .reveal.reveal-theme-serif {
        --mission-reveal-bg: linear-gradient(180deg, #fffdf8 0%, #f8f2e8 100%);
        --mission-reveal-fg: #3c2f2f;
        --mission-reveal-link: #92400e;
        --mission-reveal-accent: #c2410c;
        --mission-reveal-code-bg: rgba(194, 65, 12, 0.1);
        --mission-reveal-quote-bg: rgba(146, 64, 14, 0.1);
        --r-main-font: Georgia, "Times New Roman", "Noto Serif SC", serif;
        --r-heading-font: Georgia, "Times New Roman", "Noto Serif SC", serif;
    }
    .mission-markdown .reveal.reveal-theme-moon {
        --mission-reveal-bg: linear-gradient(180deg, #111827 0%, #1f2937 100%);
        --mission-reveal-fg: #e5e7eb;
        --mission-reveal-link: #93c5fd;
        --mission-reveal-accent: #60a5fa;
        --mission-reveal-code-bg: rgba(15, 23, 42, 0.36);
        --mission-reveal-quote-bg: rgba(148, 163, 184, 0.14);
    }
    .mission-markdown .reveal.reveal-theme-night {
        --mission-reveal-bg: linear-gradient(180deg, #020617 0%, #111827 100%);
        --mission-reveal-fg: #f8fafc;
        --mission-reveal-link: #67e8f9;
        --mission-reveal-accent: #22d3ee;
        --mission-reveal-code-bg: rgba(15, 23, 42, 0.5);
        --mission-reveal-quote-bg: rgba(103, 232, 249, 0.1);
    }
    .mission-markdown .reveal.reveal-theme-solarized {
        --mission-reveal-bg: #fdf6e3;
        --mission-reveal-fg: #586e75;
        --mission-reveal-link: #268bd2;
        --mission-reveal-accent: #2aa198;
        --mission-reveal-code-bg: rgba(147, 161, 161, 0.15);
        --mission-reveal-quote-bg: rgba(42, 161, 152, 0.1);
    }
    .mission-markdown .reveal .slides section {
        box-sizing: border-box;
        padding: 28px 40px;
    }
    .mission-markdown .reveal .slides section[data-autofit-scale] {
        font-size: var(--slide-autofit-scale, 1em);
    }
    .mission-markdown .reveal .slides {
        text-align: left;
    }
    .mission-markdown .reveal .slides section > * {
        max-width: 100%;
    }
    .mission-markdown .reveal h1,
    .mission-markdown .reveal h2,
    .mission-markdown .reveal h3,
    .mission-markdown .reveal h4,
    .mission-markdown .reveal h5,
    .mission-markdown .reveal h6,
    .mission-markdown .reveal p,
    .mission-markdown .reveal li,
    .mission-markdown .reveal blockquote,
    .mission-markdown .reveal pre {
        max-width: 100%;
        word-break: break-word;
        overflow-wrap: anywhere;
    }
    .mission-markdown .reveal h1 { font-size: 1.9em; }
    .mission-markdown .reveal h2 { font-size: 1.5em; }
    .mission-markdown .reveal h3 { font-size: 1.2em; }
    .mission-markdown .reveal a {
        color: var(--mission-reveal-link, #60a5fa);
    }
    .mission-markdown .reveal ul,
    .mission-markdown .reveal ol {
        margin-left: 1.1em;
    }
    .mission-markdown .reveal blockquote {
        margin: 0.8em 0;
        padding: 0.7em 1em;
        border-left: 4px solid var(--mission-reveal-accent, #38bdf8);
        background: var(--mission-reveal-quote-bg, rgba(148, 163, 184, 0.16));
        border-radius: 0.4em;
    }
    .mission-markdown .reveal pre {
        font-size: 0.72em;
        padding: 0.7em 0.9em;
        border-radius: 0.4em;
        background: var(--mission-reveal-code-bg, rgba(15, 23, 42, 0.35));
        color: var(--mission-reveal-code-fg, inherit);
    }
    .mission-markdown .reveal .reveal-scroll-code {
        max-height: min(34vh, 320px);
        overflow: auto;
        padding-right: 8px;
    }
    .mission-markdown .reveal .reveal-scroll-code code {
        white-space: pre;
    }
    .mission-markdown .reveal .mermaid-host {
        margin: 0.5em 0;
        border: none;
        background: transparent;
    }
    .mission-markdown .reveal .mermaid {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 120px;
    }
    .mission-markdown .reveal .mermaid svg {
        max-width: 100%;
        height: auto;
    }
    .mission-markdown .render-note {
        margin-top: 0.75rem;
        font-size: 12px;
        color: #64748b;
    }
</style>
<div class="prog-wrap">
<div id="showcontent" class="prog-grid">

    <!-- Main Mission Content -->
    <div class="prog-card" style="background:linear-gradient(160deg,#fff 0%,#f0f7ff 100%);">
        <div class="prog-card__body">
            <div class="course-node-head" style="text-align:center;padding:20px 20px 24px;border-bottom:1px solid #e2e8f0;margin:-14px -20px 16px; border-radius:0.75rem 0.75rem 0 0;">
                <asp:Label ID="LabelMtitle" runat="server" CssClass="course-node-title" style="font-size:clamp(18px,2.5vw,24px);font-weight:800;color:#0f172a;letter-spacing:-0.02em;"></asp:Label>
            </div>
            <div class="hidden" style="display:none;">
                <asp:Label ID="LabelSnum" runat="server" Visible="False"></asp:Label>
                <asp:CheckBox ID="CkMupload" runat="server" Enabled="false" Visible="False" />
                <asp:CheckBox ID="CkMgroup" runat="server" Enabled="false" Visible="False" />
                <asp:Label ID="LabelMid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelUploadType" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMcid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMsort" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelLid" runat="server" Visible="False"></asp:Label>
                <asp:HiddenField ID="HiddenMissionRaw" runat="server" />
            </div>
            <div id="Mcontent" style="color:#334155;line-height:1.85;font-size:1.05rem;word-wrap:break-word;word-break:break-word;" runat="server"></div>
        </div>
    </div>

    <!-- Right Sidebar -->
    <div class="prog-sidebar">
        <div class="prog-card prog-sidebar-card">
            <div class="prog-card__head">
                <div class="prog-sidebar-icon">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"></path></svg>
                </div>
                <h3 class="prog-card__title">操作面板</h3>
            </div>
            <div class="prog-card__body">
                <link href="../kindeditor/themes/me/me.css" rel="stylesheet" type="text/css" />
                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>

                <div class="prog-btn-stack">
                    <div class="prog-subpanel prog-toggle-card">
                        <div class="prog-toggle-row">
                            <div class="prog-toggle-copy">
                                <div class="prog-toggle-title">Markdown 渲染</div>
                                <div class="prog-toggle-desc">打开后，自动解析 Markdown、Mermaid、Reveal.js 和代码高亮。</div>
                            </div>
                            <button type="button" id="markdownToggle" runat="server" class="prog-toggle-switch" aria-pressed="false" title="切换 Markdown 渲染" onclick="toggleMissionMarkdown()"><span class="prog-toggle-knob"></span></button>
                        </div>
                        <div id="markdownToggleStatus" runat="server" class="prog-toggle-status">当前：开启</div>
                    </div>
                    <input type="button" class="prog-btn-secondary" id="share" value="我的网盘" onclick="showShare()" />
                    <asp:HyperLink ID="VoteLink" runat="server" Target="_blank"
                        CssClass="prog-btn-outline" SkinID="HyperLinkPink">作品互评</asp:HyperLink>
                </div>

                <asp:Panel ID="Panelworks" runat="server">
                    <hr class="prog-divider" />
                    <div class="prog-subpanel">
                        <div class="prog-subpanel-title">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"></path></svg>
                            作品提交区
                        </div>
                        <div style="display:flex;flex-direction:column;align-items:center;gap:8px;">
                            <asp:Image runat="server" ID="upFileType" Visible="False" style="width:28px;height:28px;object-fit:contain;" />
                            <asp:HyperLink ID="upFileUrl" runat="server" Visible="False" Target="_blank"
                                style="width:100%;padding:6px 10px;background:#f1f5f9;color:#2563eb;font-size:12px;font-weight:600;border-radius:0.375rem;border:1px solid #e2e8f0;text-align:center;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">[upFileUrl]</asp:HyperLink>
                            <asp:Panel ID="Panelswfupload" runat="server" style="width:100%;">
                                <div id="swfu_container" style="display:flex;justify-content:center;">
                                    <script type="text/javascript">
                                        var lid = "<%=LabelLid.Text %>";
                                        var urlstr = "uploadworkm.aspx?lid=" + lid;
                                        KindEditor.ready(function (K) {
                                            var uploadbutton = K.uploadbutton({
                                                button: K('#uploadButton')[0],
                                                fieldName: 'imgFile',
                                                url: urlstr,
                                                afterUpload: function (data) {
                                                    if (data.error === 0) {
                                                        if (window.LearnStatus && typeof window.LearnStatus.submitted === "function") {
                                                            window.LearnStatus.submitted();
                                                        }
                                                        alert("作品已经提交成功！");
                                                        location.reload();
                                                    }
                                                    else { alert(data.message); }
                                                },
                                                afterError: function (str) { alert('出错信息: ' + str); }
                                            });
                                            uploadbutton.fileBox.change(function (e) { uploadbutton.submit(); });
                                        });
                                    </script>
                                    <input type="button" id="uploadButton" value="作品提交" class="upload-btn" />
                                </div>
                                <div class="prog-filetype">
                                    <asp:Image ID="ImageType" runat="server" style="width:14px;height:14px;display:inline-block;vertical-align:middle;" />
                                    限制格式 <asp:Label ID="LabelMfiletype" runat="server" style="font-weight:700;color:#334155;"></asp:Label>
                                </div>
                                <div class="prog-errmsg"><asp:Label ID="Labelmsg" runat="server" SkinID="LabelMsgRed"></asp:Label></div>
                            </asp:Panel>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="Panelgroup" runat="server">
                    <hr class="prog-divider" />
                    <div class="prog-subpanel">
                        <div class="prog-subpanel-title">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                            小组合作区
                        </div>
                        <div style="overflow-x:auto;">
                            <asp:GridView ID="GVgwork" runat="server"
                                AutoGenerateColumns="False" CellPadding="3" DataKeyNames="wid"
                                EnableModelValidation="True"
                                OnRowCommand="GVgwork_RowCommand"
                                onrowdatabound="GVgwork_RowDataBound" PageSize="15" SkinID="GridViewInfo"
                                Width="100%" CssClass="w-full text-xs text-slate-600 min-w-min">
                                <Columns>
                                    <asp:TemplateField HeaderText="组员">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLinkWurl" runat="server" Target="_blank" Text='<%# Eval("Sname") %>'
                                                ToolTip='<%# Eval("Wurl") %>' CssClass="font-bold text-blue-600 hover:text-blue-800 transition"></asp:HyperLink>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="px-2 py-1 bg-slate-50 border-b border-slate-200 text-left" />
                                        <ItemStyle CssClass="px-2 py-1 border-b border-slate-100 whitespace-nowrap" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Wlscore") %>' CssClass="text-orange-500 font-medium"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="px-1 py-1 border-b border-slate-100" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonA" runat="server" CausesValidation="false"
                                                CommandArgument='<%# Bind("wid") %>' CommandName="A" Text="A" CssClass="px-1.5 py-0.5 bg-green-100 text-green-700 rounded hover:bg-green-200 transition"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" CssClass="px-1 py-1 border-b border-slate-100" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonP" runat="server" CausesValidation="false"
                                                CommandArgument='<%# Bind("wid") %>' CommandName="P" Text="P" CssClass="px-1.5 py-0.5 bg-blue-100 text-blue-700 rounded hover:bg-blue-200 transition"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" CssClass="px-1 py-1 border-b border-slate-100" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonE" runat="server" CausesValidation="false"
                                                CommandArgument='<%# Bind("wid") %>' CommandName="E" Text="E" CssClass="px-1.5 py-0.5 bg-red-100 text-red-700 rounded hover:bg-red-200 transition"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" CssClass="px-1 py-1 border-b border-slate-100" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div style="display:flex;flex-direction:column;align-items:center;gap:8px;margin-top:10px;padding-top:10px;border-top:1px solid #e2e8f0;">
                            <asp:Image ID="upFileTypeGroup" runat="server" Visible="False" style="width:28px;height:28px;object-fit:contain;" />
                            <asp:HyperLink ID="upFileUrlGroup" runat="server" Target="_blank" Visible="False"
                                style="width:100%;padding:6px 10px;background:#f1f5f9;color:#2563eb;font-size:12px;font-weight:600;border-radius:0.375rem;border:1px solid #e2e8f0;text-align:center;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">[upFileUrlGroup]</asp:HyperLink>
                            <asp:Panel ID="PanelGroupUp" runat="server" style="width:100%;">
                                <div id="swfu_containerTwo" style="display:flex;justify-content:center;">
                                    <script type="text/javascript">
                                        var lid = "<%=LabelLid.Text %>";
                                        var gurlstr = "uploadgroupm.aspx?lid=" + lid;
                                        KindEditor.ready(function (K) {
                                            var uploadgroupbutton = K.uploadbutton({
                                                button: K('#uploadgroupButton')[0],
                                                fieldName: 'imgFilegroup',
                                                url: gurlstr,
                                                afterUpload: function (data) {
                                                    if (data.error === 0) {
                                                        if (window.LearnStatus && typeof window.LearnStatus.submitted === "function") {
                                                            window.LearnStatus.submitted();
                                                        }
                                                        alert("小组作品已经提交成功！");
                                                        location.reload(true);
                                                    }
                                                    else { alert(data.message); }
                                                },
                                                afterError: function (str) { alert('出错信息: ' + str); }
                                            });
                                            uploadgroupbutton.fileBox.change(function (e) { uploadgroupbutton.submit(); });
                                        });
                                    </script>
                                    <input type="button" id="uploadgroupButton" value="小组合作" class="upload-btn" />
                                </div>
                            </asp:Panel>
                            <div class="prog-errmsg"><asp:Label ID="Labelgroupmsg" runat="server" SkinID="LabelMsgRed"></asp:Label></div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

</div>
</div>
<script type="text/javascript">
    (function () {
        var markdownStorageKey = 'showmission-markdown-enabled';
        var revealThemeOptions = [
            { value: 'default', label: '默认主题' },
            { value: 'white', label: 'White' },
            { value: 'sky', label: 'Sky' },
            { value: 'beige', label: 'Beige' },
            { value: 'simple', label: 'Simple' },
            { value: 'serif', label: 'Serif' },
            { value: 'moon', label: 'Moon' },
            { value: 'night', label: 'Night' },
            { value: 'solarized', label: 'Solarized' }
        ];
        var revealDarkThemes = {
            default: true,
            moon: true,
            night: true
        };

        function getRevealThemeOptionsHtml() {
            return revealThemeOptions.map(function (theme) {
                return '<option value="' + escapeHtml(theme.value) + '">' + escapeHtml(theme.label) + '</option>';
            }).join('');
        }

        function normalizeRevealTheme(theme) {
            for (var i = 0; i < revealThemeOptions.length; i++) {
                if (revealThemeOptions[i].value === theme) {
                    return theme;
                }
            }
            return 'default';
        }

        function isDarkRevealTheme(theme) {
            return !!revealDarkThemes[normalizeRevealTheme(theme)];
        }

        function getContentElement() {
            return document.getElementById('<%= Mcontent.ClientID %>');
        }

        function getToggleElement() {
            return document.getElementById('<%= markdownToggle.ClientID %>');
        }

        function getToggleStatusElement() {
            return document.getElementById('<%= markdownToggleStatus.ClientID %>');
        }

        function stripHtmlToText(html) {
            var holder = document.createElement('div');
            holder.innerHTML = html || '';

            var lines = [];

            function walk(node) {
                if (!node) {
                    return;
                }

                if (node.nodeType === 3) {
                    lines.push(node.nodeValue);
                    return;
                }

                if (node.nodeType !== 1) {
                    return;
                }

                var tag = node.tagName.toLowerCase();
                if (tag === 'br') {
                    lines.push('\n');
                    return;
                }

                if (tag === 'pre') {
                    lines.push(node.textContent || '');
                    lines.push('\n');
                    return;
                }

                var children = node.childNodes;
                for (var i = 0; i < children.length; i++) {
                    walk(children[i]);
                }

                if (/^(p|div|section|article|li|ul|ol|blockquote|h1|h2|h3|h4|h5|h6)$/i.test(tag)) {
                    lines.push('\n');
                }
            }

            var nodes = holder.childNodes;
            for (var j = 0; j < nodes.length; j++) {
                walk(nodes[j]);
            }

            return lines.join('').replace(/\r/g, '').replace(/\n{3,}/g, '\n\n').trim();
        }

        function getMarkdownSource(rawText) {
            var text = (rawText || '').replace(/\r/g, '').trim();
            if (!text) {
                return '';
            }

            if (!/<[a-z][\s\S]*>/i.test(text)) {
                return text;
            }

            var plainText = stripHtmlToText(text);
            if (looksLikeMarkdown(plainText)) {
                return plainText;
            }

            return text;
        }

        function getMissionSource(content, hidden) {
            var hiddenValue = hidden ? (hidden.value || '') : '';
            var contentHtml = content ? (content.innerHTML || '') : '';
            var contentText = content ? (content.textContent || '') : '';

            if (looksLikeMarkdown(hiddenValue)) {
                return hiddenValue;
            }

            var hiddenMarkdown = getMarkdownSource(hiddenValue);
            if (looksLikeMarkdown(hiddenMarkdown)) {
                return hiddenMarkdown;
            }

            var htmlMarkdown = getMarkdownSource(contentHtml);
            if (looksLikeMarkdown(htmlMarkdown)) {
                return htmlMarkdown;
            }

            if (looksLikeMarkdown(contentText)) {
                return contentText;
            }

            return hiddenValue || contentHtml || contentText || '';
        }

        function looksLikeMarkdown(text) {
            if (!text) {
                return false;
            }

            var normalized = (text || '').replace(/\r/g, '').trim();
            if (!normalized) {
                return false;
            }

            if (/^\s*<[^>]+>/m.test(normalized) && !/^\s*<(pre|code)\b/i.test(normalized)) {
                return false;
            }

            return /(^|\n)\s{0,3}(#{1,6}\s+.+|[-*+]\s+.+|\d+\.\s+.+|>\s+.+|```[\s\S]*?```|~~~[\s\S]*?~~~|\|.+\|\s*$|!\[[^\]]*\]\([^\)]+\)|\[[^\]]+\]\([^\)]+\)|-{3,}|\*{3,}|`[^`]+`)/m.test(normalized);
        }

        function isRevealMarkdownDocument(text) {
            if (!looksLikeMarkdown(text)) {
                return false;
            }

            var normalized = (text || '').replace(/\r/g, '').trim();
            if (!normalized) {
                return false;
            }

            if (/^```(?:reveal|revealjs)\b/m.test(normalized)) {
                return true;
            }

            if (/^\s*--\s*$/m.test(normalized)) {
                return true;
            }

            if (/^\s*(?:note|notes)\s*:/mi.test(normalized)) {
                return true;
            }

            if (/^\s*\.element\s*:/mi.test(normalized)) {
                return true;
            }

            if (/^\s*<!--\s*\.slide\s*:/mi.test(normalized) || /^\s*<!--\s*\.element\s*:/mi.test(normalized)) {
                return true;
            }

            var parts = normalized.split(/^---$/m).map(function (section) {
                return section.trim();
            }).filter(function (section) {
                return !!section;
            });

            if (parts.length < 2) {
                return false;
            }

            var contentfulParts = 0;
            for (var i = 0; i < parts.length; i++) {
                if (/^(#{1,6}\s+|>|[-*+]\s+|\d+\.\s+|```|~~~|\w)/m.test(parts[i])) {
                    contentfulParts++;
                }
            }

            return contentfulParts >= 2;
        }

        function escapeHtml(value) {
            return (value || '')
                .replace(/&/g, '&amp;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;')
                .replace(/"/g, '&quot;')
                .replace(/'/g, '&#39;');
        }

        function parseRevealMarkdown(blockText) {
            var cleaned = blockText
                .replace(/^```(?:reveal|revealjs)?\s*/i, '')
                .replace(/```\s*$/, '')
                .trim();
            var presentationAttrs = { startH: 0, startV: 0 };

            function splitSlides(input, separator) {
                return input.split(separator).map(function (section) {
                    return section.trim();
                }).filter(function (section) {
                    return !!section;
                });
            }

            function escapeAttr(value) {
                return (value || '')
                    .replace(/&/g, '&amp;')
                    .replace(/"/g, '&quot;')
                    .replace(/</g, '&lt;')
                    .replace(/>/g, '&gt;');
            }

            function parseDirectiveAttributes(raw) {
                var attrs = {};
                var regex = /([\w:-]+)\s*=\s*"([^"]*)"/g;
                var match;
                while ((match = regex.exec(raw || '')) !== null) {
                    attrs[match[1]] = match[2];
                }
                return attrs;
            }

            function attrsToString(attrs) {
                var parts = [];
                for (var key in attrs) {
                    if (Object.prototype.hasOwnProperty.call(attrs, key) && attrs[key] !== '') {
                        parts.push(key + '="' + escapeAttr(attrs[key]) + '"');
                    }
                }
                return parts.length ? ' ' + parts.join(' ') : '';
            }

            function applyElementDirective(html, attrs) {
                return html.replace(/<(p|li|h1|h2|h3|h4|h5|h6|blockquote|pre|table)([^>]*)>([\s\S]*?)<\/\1>(?![\s\S]*<(p|li|h1|h2|h3|h4|h5|h6|blockquote|pre|table))/i, function (_, tag, currentAttrs, inner) {
                    var nextAttrs = currentAttrs;

                    for (var key in attrs) {
                        if (!Object.prototype.hasOwnProperty.call(attrs, key)) {
                            continue;
                        }

                        if (key === 'class') {
                            var classMatch = nextAttrs.match(/class="([^"]*)"/i);
                            if (classMatch) {
                                nextAttrs = nextAttrs.replace(/class="([^"]*)"/i, 'class="$1 ' + escapeAttr(attrs[key]) + '"');
                            } else {
                                nextAttrs += ' class="' + escapeAttr(attrs[key]) + '"';
                            }
                        } else if (new RegExp(key + '="[^"]*"', 'i').test(nextAttrs)) {
                            nextAttrs = nextAttrs.replace(new RegExp(key + '="[^"]*"', 'i'), key + '="' + escapeAttr(attrs[key]) + '"');
                        } else {
                            nextAttrs += ' ' + key + '="' + escapeAttr(attrs[key]) + '"';
                        }
                    }

                    return '<' + tag + nextAttrs + '>' + inner + '</' + tag + '>';
                });
            }

            cleaned = cleaned.replace(/^\s*<!--\s*\.presentation\s*:\s*(.*?)\s*-->\s*$/gmi, function (_, raw) {
                var presentationDirectiveAttrs = parseDirectiveAttributes(raw);
                if (presentationDirectiveAttrs['data-start-h'] !== undefined) {
                    presentationAttrs.startH = parseInt(presentationDirectiveAttrs['data-start-h'], 10) || 0;
                }
                if (presentationDirectiveAttrs['data-start-v'] !== undefined) {
                    presentationAttrs.startV = parseInt(presentationDirectiveAttrs['data-start-v'], 10) || 0;
                }
                return '';
            }).trim();

            function renderSlideMarkdown(sectionText) {
                var notes = [];
                var elementDirectives = [];
                var slideAttrs = {};
                var lines = sectionText.split('\n');
                var markdownLines = [];

                for (var i = 0; i < lines.length; i++) {
                    var line = lines[i];
                    var noteMatch = line.match(/^\s*(?:note|notes)\s*:\s*(.*)$/i);
                    if (noteMatch) {
                        notes.push(noteMatch[1] || '');
                        continue;
                    }

                    var commentSlideMatch = line.match(/^\s*<!--\s*\.slide\s*:\s*(.*?)\s*-->\s*$/i);
                    if (commentSlideMatch) {
                        var slideDirectiveAttrs = parseDirectiveAttributes(commentSlideMatch[1]);
                        for (var slideKey in slideDirectiveAttrs) {
                            if (Object.prototype.hasOwnProperty.call(slideDirectiveAttrs, slideKey)) {
                                slideAttrs[slideKey] = slideDirectiveAttrs[slideKey];
                            }
                        }
                        continue;
                    }

                    var commentElementMatch = line.match(/^\s*<!--\s*\.element\s*:\s*(.*?)\s*-->\s*$/i);
                    if (commentElementMatch) {
                        elementDirectives.push(parseDirectiveAttributes(commentElementMatch[1]));
                        continue;
                    }

                    var elementMatch = line.match(/^\s*\.element\s*:\s*class\s*=\s*"([^"]+)"\s*$/i);
                    if (elementMatch) {
                        elementDirectives.push({ class: elementMatch[1] });
                        continue;
                    }

                    markdownLines.push(line);
                }

                var html = marked.parse(markdownLines.join('\n').trim());

                if (elementDirectives.length) {
                    for (var j = 0; j < elementDirectives.length; j++) {
                        html = applyElementDirective(html, elementDirectives[j]);
                    }
                }

                if (notes.length) {
                    html += '<aside class="notes">' + marked.parse(notes.join('\n')) + '</aside>';
                }

                return {
                    html: html,
                    attrs: slideAttrs
                };
            }

            var horizontalSlides = splitSlides(cleaned, /^---$/m);
            if (!horizontalSlides.length) {
                return '<div class="render-note">未检测到可展示的幻灯片内容。</div>';
            }

            var slidesHtml = horizontalSlides.map(function (section) {
                var verticalSlides = splitSlides(section, /^--$/m);
                if (verticalSlides.length > 1) {
                    return '<section>' + verticalSlides.map(function (verticalSection) {
                        var verticalSlide = renderSlideMarkdown(verticalSection);
                        return '<section' + attrsToString(verticalSlide.attrs) + '>' + verticalSlide.html + '</section>';
                    }).join('') + '</section>';
                }

                var slide = renderSlideMarkdown(section);
                return '<section' + attrsToString(slide.attrs) + '>' + slide.html + '</section>';
            }).join('');

            return '<div class="reveal-toolbar"><span class="reveal-toolbar-title">Reveal.js 幻灯片</span><div class="reveal-toolbar-actions"><select class="reveal-theme-select">' + getRevealThemeOptionsHtml() + '</select><button type="button" class="reveal-nav-btn reveal-prev-btn">上一页</button><span class="reveal-page-indicator">1 / 1</span><button type="button" class="reveal-nav-btn reveal-next-btn">下一页</button><button type="button" class="reveal-fullscreen-btn">放映</button></div></div><div class="reveal-stage"><div class="reveal reveal-theme-default" data-theme="default" data-start-h="' + escapeAttr(String(presentationAttrs.startH || 0)) + '" data-start-v="' + escapeAttr(String(presentationAttrs.startV || 0)) + '"><div class="slides">' + slidesHtml + '</div></div></div>';
        }

        function wrapSpecialBlocks(root) {
            var codeBlocks = root.querySelectorAll('pre code');
            Array.prototype.forEach.call(codeBlocks, function (code) {
                var pre = code.parentNode;
                var className = code.className || '';
                var rawCode = code.textContent || '';
                var langMatch = className.match(/language-([\w-]+)/i);
                var lang = langMatch ? langMatch[1].toLowerCase() : '';

                if ((lang === 'mermaid' || lang === 'mmd') && !pre.parentNode.classList.contains('mermaid-host')) {
                    var mermaidHost = document.createElement('div');
                    var mermaidNode = document.createElement('div');
                    mermaidHost.className = 'mermaid-host';
                    mermaidNode.className = 'mermaid';
                    mermaidNode.setAttribute('data-mermaid-source', rawCode);
                    mermaidNode.textContent = rawCode;
                    mermaidHost.appendChild(mermaidNode);
                    pre.parentNode.replaceChild(mermaidHost, pre);
                    return;
                }

                if ((lang === 'reveal' || lang === 'revealjs') && !pre.parentNode.classList.contains('reveal-host')) {
                    var revealHost = document.createElement('div');
                    revealHost.className = 'reveal-host';
                    revealHost.innerHTML = parseRevealMarkdown('```' + lang + '\n' + rawCode + '\n```') + '<div class="render-note">支持 `---` 横向分隔、`--` 纵向分隔、`Note:` 备注、`.element: class="fragment ..."`、`<!-- .slide: ... -->`、`<!-- .element: ... -->`，以及 `<!-- .presentation: data-start-h="1" data-start-v="0" -->` 指定起始页。</div>';
                    pre.parentNode.replaceChild(revealHost, pre);
                }
            });
        }

        function applyCodeHighlight(root) {
            if (!window.hljs) {
                return;
            }

            var blocks = root.querySelectorAll('pre code');
            Array.prototype.forEach.call(blocks, function (block) {
                hljs.highlightElement(block);
            });
        }

        function applyCodeLineNumbers(root) {
            var blocks = root.querySelectorAll('pre code');
            Array.prototype.forEach.call(blocks, function (block) {
                var pre = block.parentNode;
                if (!pre || pre.parentNode.classList.contains('code-block-wrap')) {
                    return;
                }

                var lineCount = block.textContent.replace(/\n$/, '').split('\n').length;
                if (!lineCount || lineCount < 1) {
                    return;
                }

                var wrap = document.createElement('div');
                wrap.className = 'code-block-wrap';

                var lineNumbers = document.createElement('div');
                lineNumbers.className = 'code-line-numbers';

                var nums = [];
                for (var i = 1; i <= lineCount; i++) {
                    nums.push(i);
                }
                lineNumbers.textContent = nums.join('\n');

                pre.parentNode.insertBefore(wrap, pre);
                wrap.appendChild(lineNumbers);
                wrap.appendChild(pre);
            });
        }

        function loadScript(src, callback) {
            var existing = document.querySelector('script[data-src="' + src + '"]');
            if (existing) {
                if (callback) {
                    if (existing.getAttribute('data-loaded') === '1') {
                        callback();
                    } else {
                        existing.addEventListener('load', callback, { once: true });
                    }
                }
                return;
            }

            var script = document.createElement('script');
            script.src = src;
            script.setAttribute('data-src', src);
            script.onload = function () {
                script.setAttribute('data-loaded', '1');
                if (callback) {
                    callback();
                }
            };
            document.head.appendChild(script);
        }

        function renderMermaid(root) {
            var mermaidNodes = root.querySelectorAll('.mermaid');
            if (!mermaidNodes.length) {
                return;
            }

            function getActiveRevealSlides(revealNode) {
                if (!revealNode) {
                    return [];
                }

                var current = revealNode.querySelector('.slides section.present');
                if (!current) {
                    return [];
                }

                var nested = current.querySelector('section.present');
                return nested ? [nested] : [current];
            }

            function renderMermaidSvg(instance, renderId, source, callback) {
                var result;

                if (!instance || typeof instance.render !== 'function') {
                    callback(new Error('Mermaid unavailable'));
                    return;
                }

                if (instance.render.length >= 3) {
                    instance.render(renderId, source, function (svg) {
                        callback(null, { svg: svg });
                    });
                    return;
                }

                result = instance.render(renderId, source);
                if (result && typeof result.then === 'function') {
                    result.then(function (renderResult) {
                        callback(null, renderResult);
                    }).catch(function (error) {
                        callback(error);
                    });
                    return;
                }

                callback(null, result);
            }

            function doRender() {
                if (!window.mermaid) {
                    return;
                }
                var revealNode = root && root.classList && root.classList.contains('reveal')
                    ? root
                    : (root.querySelector ? root.querySelector('.reveal') : null);
                var activeSlides = getActiveRevealSlides(revealNode);
                var targetNodes = mermaidNodes;
                var mermaidTheme = revealNode && isDarkRevealTheme(revealNode.getAttribute('data-theme')) ? 'dark' : 'default';
                var pendingCount = 0;

                if (activeSlides.length) {
                    targetNodes = [];
                    Array.prototype.forEach.call(mermaidNodes, function (node) {
                        var isInActiveSlide = activeSlides.some(function (slide) {
                            return slide.contains(node);
                        });

                        if (isInActiveSlide) {
                            targetNodes.push(node);
                        }
                    });
                }

                if (!targetNodes.length) {
                    return;
                }

                window.mermaid.initialize({ startOnLoad: false, securityLevel: 'loose', theme: mermaidTheme });

                Array.prototype.forEach.call(targetNodes, function (node, index) {
                    var source = node.getAttribute('data-mermaid-source') || node.textContent || '';
                    var renderId;

                    if (!source.trim()) {
                        return;
                    }

                    node.setAttribute('data-mermaid-source', source);
                    node.removeAttribute('data-processed');
                    node.removeAttribute('data-mermaid-rendered');
                    renderId = 'mission-mermaid-' + Date.now() + '-' + index;

                    pendingCount++;
                    renderMermaidSvg(window.mermaid, renderId, source, function (error, result) {
                        if (!error && result && result.svg) {
                            node.innerHTML = result.svg;
                            if (typeof result.bindFunctions === 'function') {
                                result.bindFunctions(node);
                            }
                            node.setAttribute('data-mermaid-rendered', '1');
                        } else {
                            node.textContent = source;
                        }

                        pendingCount--;
                        if (!pendingCount) {
                            var revealDeck = revealNode && revealNode.__missionRevealDeck;
                            if (revealDeck) {
                                revealDeck.layout();
                            }
                        }
                    });
                });

                if (!pendingCount) {
                    return;
                }
            }

            if (window.mermaid) {
                doRender();
                return;
            }

            loadScript('../js/vendors/mermaid/mermaid.min.js', doRender);
        }

        function convertRevealMermaidBlocks(root) {
            var codeBlocks = root.querySelectorAll('.reveal pre code');
            Array.prototype.forEach.call(codeBlocks, function (code) {
                var pre = code.parentNode;
                if (!pre) {
                    return;
                }

                var className = code.className || '';
                var langMatch = className.match(/language-([\w-]+)/i);
                var lang = langMatch ? langMatch[1].toLowerCase() : '';
                if (lang !== 'mermaid' && lang !== 'mmd') {
                    return;
                }

                if (pre.parentNode && pre.parentNode.classList.contains('mermaid-host')) {
                    return;
                }

                var mermaidHost = document.createElement('div');
                var mermaidNode = document.createElement('div');
                mermaidHost.className = 'mermaid-host';
                mermaidNode.className = 'mermaid';
                mermaidNode.setAttribute('data-mermaid-source', code.textContent || '');
                mermaidNode.textContent = code.textContent || '';
                mermaidHost.appendChild(mermaidNode);
                pre.parentNode.replaceChild(mermaidHost, pre);
            });
        }

        function limitRevealCodeBlocks(root) {
            var pres = root.querySelectorAll('.reveal pre');
            Array.prototype.forEach.call(pres, function (pre) {
                pre.classList.remove('reveal-scroll-code');
                if (pre.scrollHeight > Math.min(window.innerHeight * 0.34, 320)) {
                    pre.classList.add('reveal-scroll-code');
                }
            });
        }

        function renderReveal(root) {
            var revealHosts = root.querySelectorAll('.reveal-host');
            if (!revealHosts.length) {
                return;
            }

            function doRender() {
                if (!window.Reveal) {
                    return;
                }

                Array.prototype.forEach.call(revealHosts, function (host) {
                    var node = host.querySelector('.reveal');
                    var fullscreenBtn = host.querySelector('.reveal-fullscreen-btn');
                    var themeSelect = host.querySelector('.reveal-theme-select');
                    var prevBtn = host.querySelector('.reveal-prev-btn');
                    var nextBtn = host.querySelector('.reveal-next-btn');
                    var pageIndicator = host.querySelector('.reveal-page-indicator');
                    if (!node) {
                        return;
                    }

                    if (node.getAttribute('data-reveal-ready')) {
                        return;
                    }

                    convertRevealMermaidBlocks(host);
                    limitRevealCodeBlocks(host);

                    function getDeckSize() {
                        var stage = host.querySelector('.reveal-stage');
                        var stageWidth = stage ? stage.clientWidth : 960;
                        var width = Math.max(640, Math.min(1280, stageWidth));
                        return {
                            width: width,
                            height: Math.round(width * 9 / 16)
                        };
                    }

                    function autofitSlide(section) {
                        if (!section) {
                            return;
                        }

                        var codeBlocks = section.querySelectorAll('pre');
                        Array.prototype.forEach.call(codeBlocks, function (pre) {
                            pre.classList.remove('reveal-scroll-code');
                            if (pre.scrollHeight > Math.min(window.innerHeight * 0.34, 320)) {
                                pre.classList.add('reveal-scroll-code');
                            }
                        });

                        section.style.removeProperty('--slide-autofit-scale');
                        section.removeAttribute('data-autofit-scale');

                        var scale = 1;
                        var minScale = 0.62;
                        var attempts = 0;

                        while (attempts < 12) {
                            var fitsHeight = section.scrollHeight <= section.clientHeight + 2;
                            var fitsWidth = section.scrollWidth <= section.clientWidth + 2;
                            if (fitsHeight && fitsWidth) {
                                break;
                            }

                            scale -= 0.04;
                            if (scale < minScale) {
                                scale = minScale;
                            }

                            section.style.setProperty('--slide-autofit-scale', scale.toFixed(2) + 'em');
                            section.setAttribute('data-autofit-scale', '1');
                            attempts++;

                            if (scale === minScale) {
                                break;
                            }
                        }
                    }

                    function autofitAllSlides() {
                        var sections = node.querySelectorAll('.slides section:not(section section)');
                        Array.prototype.forEach.call(sections, function (section) {
                            autofitSlide(section);

                            var childNodes = section.children || [];
                            Array.prototype.forEach.call(childNodes, function (child) {
                                if (child.tagName && child.tagName.toLowerCase() === 'section') {
                                    autofitSlide(child);
                                }
                            });
                        });
                    }

                    function updateIndicator(deck) {
                        if (!pageIndicator) {
                            return;
                        }

                        var indices = deck.getIndices();
                        var total = Math.max(1, deck.getTotalSlides());
                        pageIndicator.innerText = (indices.h + 1) + ' / ' + total;
                    }

                    function renderCurrentSlideMermaid() {
                        convertRevealMermaidBlocks(host);
                        renderMermaid(node);
                    }

                    function applyRevealTheme(theme) {
                        var nextTheme = normalizeRevealTheme(theme);

                        for (var i = 0; i < revealThemeOptions.length; i++) {
                            node.classList.remove('reveal-theme-' + revealThemeOptions[i].value);
                        }

                        node.classList.add('reveal-theme-' + nextTheme);
                        node.setAttribute('data-theme', nextTheme);

                        if (themeSelect) {
                            themeSelect.value = nextTheme;
                        }
                    }

                    var deckSize = getDeckSize();
                    var deck = new window.Reveal(node, {
                        embedded: true,
                        hash: false,
                        controls: true,
                        progress: true,
                        center: false,
                        transition: 'slide',
                        width: deckSize.width,
                        height: deckSize.height,
                        margin: 0.04,
                        minScale: 0.2,
                        maxScale: 1.2
                    });
                    node.__missionRevealDeck = deck;

                    deck.initialize().then(function () {
                        var startH = parseInt(node.getAttribute('data-start-h') || '0', 10) || 0;
                        var startV = parseInt(node.getAttribute('data-start-v') || '0', 10) || 0;
                        applyRevealTheme(node.getAttribute('data-theme') || 'default');
                        deck.slide(startH, startV);
                        convertRevealMermaidBlocks(host);
                        limitRevealCodeBlocks(host);
                        renderCurrentSlideMermaid();
                        deck.layout();
                        autofitAllSlides();
                        deck.layout();
                        updateIndicator(deck);
                        node.setAttribute('data-reveal-ready', '1');
                    });

                    deck.on('slidechanged', function () {
                        limitRevealCodeBlocks(host);
                        renderCurrentSlideMermaid();
                        autofitAllSlides();
                        deck.layout();
                        updateIndicator(deck);
                    });

                    deck.on('ready', function () {
                        limitRevealCodeBlocks(host);
                        renderCurrentSlideMermaid();
                        autofitAllSlides();
                        deck.layout();
                        updateIndicator(deck);
                    });

                    window.addEventListener('resize', function () {
                        var nextSize = getDeckSize();
                        deck.configure({
                            width: nextSize.width,
                            height: nextSize.height
                        });
                        limitRevealCodeBlocks(host);
                        autofitAllSlides();
                        deck.layout();
                    });

                    if (prevBtn && !prevBtn.getAttribute('data-bound')) {
                        prevBtn.setAttribute('data-bound', '1');
                        prevBtn.addEventListener('click', function () {
                            deck.prev();
                            updateIndicator(deck);
                        });
                    }

                    if (nextBtn && !nextBtn.getAttribute('data-bound')) {
                        nextBtn.setAttribute('data-bound', '1');
                        nextBtn.addEventListener('click', function () {
                            deck.next();
                            updateIndicator(deck);
                        });
                    }

                    if (themeSelect && !themeSelect.getAttribute('data-bound')) {
                        themeSelect.setAttribute('data-bound', '1');
                        themeSelect.addEventListener('change', function () {
                            applyRevealTheme(themeSelect.value);
                            limitRevealCodeBlocks(host);
                            renderCurrentSlideMermaid();
                            autofitAllSlides();
                            deck.layout();
                        });
                    }

                    if (fullscreenBtn && !fullscreenBtn.getAttribute('data-bound')) {
                        fullscreenBtn.setAttribute('data-bound', '1');
                        fullscreenBtn.addEventListener('click', function () {
                            if (!node) {
                                return;
                            }

                            if (node.requestFullscreen) {
                                node.requestFullscreen();
                            } else if (node.webkitRequestFullscreen) {
                                node.webkitRequestFullscreen();
                            }

                            setTimeout(function () {
                                limitRevealCodeBlocks(host);
                                renderCurrentSlideMermaid();
                                autofitAllSlides();
                                deck.layout();
                            }, 200);
                        });
                    }
                });
            }

            if (window.Reveal) {
                doRender();
                return;
            }

            loadScript('../js/vendors/reveal/dist/reveal.js', doRender);
        }

        function getMarkdownEnabled() {
            try {
                var stored = localStorage.getItem(markdownStorageKey);
                return stored === null ? true : stored === '1';
            } catch (e) {
                return true;
            }
        }

        function setMarkdownEnabled(enabled) {
            try {
                localStorage.setItem(markdownStorageKey, enabled ? '1' : '0');
            } catch (e) {
            }
        }

        function updateToggleUI(enabled) {
            var toggle = getToggleElement();
            var status = getToggleStatusElement();
            if (!toggle || !status) {
                return;
            }

            toggle.className = enabled ? 'prog-toggle-switch is-on' : 'prog-toggle-switch';
            toggle.setAttribute('aria-pressed', enabled ? 'true' : 'false');
            status.innerText = enabled ? '当前：开启' : '当前：关闭';
        }

        function setToggleStatusText(text) {
            var status = getToggleStatusElement();
            if (status) {
                status.innerText = text;
            }
        }

        function restoreMissionHtml(content, originalHtml) {
            content.className = '';
            content.style.color = '#334155';
            content.style.lineHeight = '1.85';
            content.style.fontSize = '1.05rem';
            content.style.wordWrap = 'break-word';
            content.style.wordBreak = 'break-word';
            content.innerHTML = originalHtml;
        }

        function renderMissionMarkdown(forceEnabled) {
            var content = getContentElement();
            var hidden = document.getElementById('<%= HiddenMissionRaw.ClientID %>');

            if (!content || !hidden) {
                return;
            }

            if (!content.getAttribute('data-original-html')) {
                content.setAttribute('data-original-html', content.innerHTML || '');
            }

            var enabled = typeof forceEnabled === 'boolean' ? forceEnabled : getMarkdownEnabled();
            updateToggleUI(enabled);

            if (!enabled) {
                restoreMissionHtml(content, content.getAttribute('data-original-html') || '');
                setToggleStatusText('当前：关闭');
                return;
            }

            if (!window.marked) {
                restoreMissionHtml(content, content.getAttribute('data-original-html') || '');
                setToggleStatusText('当前：开启，未加载解析器');
                return;
            }

            var markdownSource = getMissionSource(content, hidden);
            if (!looksLikeMarkdown(markdownSource)) {
                restoreMissionHtml(content, content.getAttribute('data-original-html') || '');
                setToggleStatusText('当前：开启，未检测到 Markdown');
                return;
            }

            try {
                marked.setOptions({
                    breaks: true,
                    gfm: true
                });

                content.className = 'mission-markdown';
                if (isRevealMarkdownDocument(markdownSource)) {
                    content.innerHTML = '<div class="vditor-reset"><div class="reveal-host">' + parseRevealMarkdown(markdownSource) + '<div class="render-note">检测到 `---` 或 `--` 分隔符，已按 Reveal.js 演示文稿模式渲染。</div></div></div>';
                    applyCodeHighlight(content);
                    renderMermaid(content);
                    renderReveal(content);
                } else {
                    content.innerHTML = '<div class="vditor-reset">' + marked.parse(markdownSource) + '</div>';
                    wrapSpecialBlocks(content);
                    applyCodeHighlight(content);
                    applyCodeLineNumbers(content);
                    renderMermaid(content);
                    renderReveal(content);
                }

                setToggleStatusText('当前：开启');
            } catch (e) {
                restoreMissionHtml(content, content.getAttribute('data-original-html') || '');
                setToggleStatusText('当前：开启，渲染失败');
            }
        }

        window.toggleMissionMarkdown = function () {
            var nextEnabled = !getMarkdownEnabled();
            setMarkdownEnabled(nextEnabled);
            renderMissionMarkdown(nextEnabled);
        };

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', function () {
                updateToggleUI(getMarkdownEnabled());
                renderMissionMarkdown(getMarkdownEnabled());
            });
        } else {
            updateToggleUI(getMarkdownEnabled());
            renderMissionMarkdown(getMarkdownEnabled());
        }
    })();

    function jsCopy(contentid) {
        var e = document.getElementById(contentid);
        e.select();
        document.execCommand("Copy");
    }
</script>
</asp:Content>
