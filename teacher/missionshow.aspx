<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false"  AutoEventWireup="true" CodeFile="missionshow.aspx.cs" Inherits="Teacher_missionshow" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../App_Themes/Teacher/admin-form.css" rel="stylesheet" />
    <link href="../App_Themes/Teacher/course-content-add.css" rel="stylesheet" />
    <link href="../kindeditor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../js/vendors/reveal/dist/reveal.css" />
    <link rel="stylesheet" href="../js/vendors/reveal/dist/theme/white.css" />
    <link rel="stylesheet" href="../js/vendors/highlight/github.min.css" />
    <script src="../kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script src="../markdown/lib/marked.min.js"></script>
    <script src="../webform/highlight.min.js"></script>
    <style type="text/css">
        .mission-show-page {
            --admin-form-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --admin-form-hero-bg: linear-gradient(135deg, #0f766e 0%, #0f9b8e 55%, #22c55e 100%);
            --admin-form-hero-shadow: 0 22px 45px -28px rgba(15, 118, 110, 0.72);
            --admin-form-primary-bg: #0f766e;
            --admin-form-primary-hover: #0d675f;
            --admin-form-primary-shadow: 0 14px 24px -18px rgba(15, 118, 110, 0.85);
            --admin-form-secondary-border: #99f6e4;
            --admin-form-secondary-bg: #ecfeff;
            --admin-form-secondary-hover: #cffafe;
            --admin-form-secondary-fg: #115e59;
        }

        .mission-show-content {
            line-height: 1.8;
            word-break: break-word;
        }

        .mission-show-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            align-items: center;
        }

        .mission-show-toggle-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 0.9rem;
            margin-bottom: 1rem;
        }

        .mission-show-toggle-card {
            border: 1px solid #dbe4f0;
            border-radius: 1rem;
            background: linear-gradient(180deg, #f8fbff 0%, #ffffff 100%);
            padding: 1rem 1.1rem;
        }

        .mission-show-toggle-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 0.75rem;
        }

        .mission-show-toggle-copy {
            min-width: 0;
        }

        .mission-show-toggle-title {
            font-size: 0.92rem;
            font-weight: 800;
            color: #0f172a;
        }

        .mission-show-toggle-desc,
        .mission-show-toggle-status {
            font-size: 0.82rem;
            color: #64748b;
        }

        .mission-show-toggle-desc {
            margin-top: 0.3rem;
            line-height: 1.55;
        }

        .mission-show-toggle-status {
            margin-top: 0.5rem;
        }

        .mission-show-toggle-switch {
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

        .mission-show-toggle-switch.is-on {
            background: #0f766e;
        }

        .mission-show-toggle-knob {
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

        .mission-show-toggle-switch.is-on .mission-show-toggle-knob {
            transform: translateX(22px);
        }

        .mission-markdown {
            color: #334155;
            line-height: 1.85;
            font-size: 1.05rem;
            word-wrap: break-word;
            word-break: break-word;
        }

        .mission-markdown .vditor-reset {
            padding: 0;
            font-size: inherit;
            line-height: inherit;
            color: inherit;
        }

        .mission-markdown .vditor-reset pre {
            position: relative;
            padding-left: 56px;
            overflow: auto;
        }

        .mission-markdown .code-block-wrap {
            position: relative;
            margin: 1rem 0;
        }

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

        .mission-markdown .mermaid-host,
        .mission-markdown .reveal-host {
            margin: 1rem 0;
            border: 1px solid #dbeafe;
            border-radius: 0.75rem;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
            overflow: hidden;
        }

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

        .mission-markdown .reveal-toolbar-title,
        .mission-markdown .reveal-page-indicator {
            font-size: 12px;
            color: #1e3a8a;
        }

        .mission-markdown .reveal-toolbar-title {
            font-weight: 700;
        }

        .mission-markdown .reveal-toolbar-actions {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-left: auto;
            flex-wrap: wrap;
        }

        .mission-markdown .reveal-theme-select,
        .mission-markdown .reveal-fullscreen-btn,
        .mission-markdown .reveal-nav-btn {
            min-height: 32px;
            padding: 0 12px;
            border: 1px solid #bfdbfe;
            border-radius: 999px;
            background: #ffffff;
            color: #1d4ed8;
            font-size: 12px;
            font-weight: 700;
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
            background: #0f172a;
            color: #e2e8f0;
            --r-main-font: "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
            --r-heading-font: "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
            --r-code-font: "Cascadia Mono", "Consolas", monospace;
            --r-main-font-size: 32px;
        }

        .mission-markdown .reveal .slides {
            text-align: left;
        }

        .mission-markdown .reveal .slides section {
            box-sizing: border-box;
            padding: 28px 40px;
        }

        .mission-markdown .reveal pre {
            font-size: 0.72em;
            padding: 0.7em 0.9em;
            border-radius: 0.4em;
            background: rgba(15, 23, 42, 0.35);
            color: inherit;
        }

        .mission-markdown .render-note {
            margin-top: 0.75rem;
            font-size: 12px;
            color: #64748b;
        }
    </style>

    <div class="admin-form-page mission-show-page">
        <div class="admin-form-shell">
            <section class="admin-form-hero">
                <div class="admin-form-hero-content">
                    <div class="admin-form-eyebrow">Course Mission</div>
                    <h1 class="admin-form-title"><asp:Label ID="LabelMtitle" runat="server"></asp:Label></h1>
                    <p class="admin-form-subtitle">预览当前学案活动说明、提交状态、合作设置和评价标准。</p>
                </div>
            </section>

            <section class="admin-form-panel">
                <div class="admin-form-toolbar">
                    <div>
                        <h2 class="admin-form-section-title">活动预览</h2>
                        <p class="admin-form-section-desc">这里显示活动提交、上次作品、小组合作和发布状态。</p>
                    </div>
                    <div class="admin-form-action-row">
                        <asp:Button ID="BtnEdit" runat="server" Text="编辑内容" ToolTip="点击修改"
                            OnClick="BtnEdit_Click" CssClass="admin-form-btn admin-form-btn--primary" />
                        <asp:Button ID="BtnReturnSmall" runat="server" Text="返回学案" ToolTip="返回"
                            OnClick="BtnReturnSmall_Click" CssClass="admin-form-btn admin-form-btn--secondary" />
                    </div>
                </div>
                <div class="admin-form-kv">
                    <div class="admin-form-kv-item">
                        <span class="admin-form-kv-label">日期</span>
                        <span class="admin-form-kv-value"><asp:Label ID="LabelMdate" runat="server"></asp:Label></span>
                    </div>
                    <div class="admin-form-kv-item">
                        <span class="admin-form-kv-label">作品类型</span>
                        <span class="admin-form-kv-value"><asp:Image ID="ImageType" runat="server" /> <asp:Label ID="LabelMfiletype" runat="server"></asp:Label></span>
                    </div>
                </div>
                <div class="mission-show-actions" style="margin-top:1rem;">
                    <label class="content-add-checks"><asp:CheckBox ID="CkMupload" runat="server" Text="是否提交" Enabled="false" /></label>
                    <label class="content-add-checks"><asp:CheckBox ID="CheckMicoWorld" runat="server" Text="上次作品" Enabled="False" /></label>
                    <label class="content-add-checks"><asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Enabled="False" /></label>
                    <label class="content-add-checks"><asp:CheckBox ID="CheckGroup" runat="server" Text="小组合作" Enabled="false" /></label>
                    <asp:HyperLink ID="HLMgid" runat="server" CssClass="admin-form-link">评价标准</asp:HyperLink>
                </div>
            </section>

            <section class="admin-form-panel">
                <h2 class="admin-form-section-title">活动内容</h2>
                <p class="admin-form-section-desc">以下为当前学案活动正文内容。</p>
                <div class="mission-show-toggle-grid">
                    <div class="mission-show-toggle-card">
                        <div class="mission-show-toggle-row">
                            <div class="mission-show-toggle-copy">
                                <div class="mission-show-toggle-title">Markdown 渲染</div>
                                <div class="mission-show-toggle-desc">开启后自动解析 Markdown、Mermaid 和代码高亮。</div>
                            </div>
                            <button type="button" id="markdownToggle" runat="server" class="mission-show-toggle-switch" aria-pressed="false" onclick="toggleMissionMarkdown()"><span class="mission-show-toggle-knob"></span></button>
                        </div>
                        <div id="markdownToggleStatus" runat="server" class="mission-show-toggle-status">当前：关闭</div>
                    </div>
                    <div class="mission-show-toggle-card">
                        <div class="mission-show-toggle-row">
                            <div class="mission-show-toggle-copy">
                                <div class="mission-show-toggle-title">Reveal 演示文稿</div>
                                <div class="mission-show-toggle-desc">检测到幻灯片分隔符时，允许按 Reveal.js 方式渲染。</div>
                            </div>
                            <button type="button" id="revealToggle" runat="server" class="mission-show-toggle-switch" aria-pressed="false" onclick="toggleMissionReveal()"><span class="mission-show-toggle-knob"></span></button>
                        </div>
                        <div id="revealToggleStatus" runat="server" class="mission-show-toggle-status">当前：关闭</div>
                    </div>
                </div>
                <asp:HiddenField ID="HiddenMissionRaw" runat="server" />
                <div id="Mcontent" class="mission-show-content" runat="server"></div>
            </section>

            <section class="admin-form-actions">
                <div class="admin-form-action-row">
                    <asp:LinkButton ID="LinkBtn" runat="server" OnClick="LinkBtn_Click" CssClass="admin-form-btn admin-form-btn--secondary">返回学案</asp:LinkButton>
                </div>
            </section>
        </div>
    </div>
    <script type="text/javascript">
        (function () {
            var markdownStorageKey = 'teacher-missionshow-markdown-enabled';
            var revealStorageKey = 'teacher-missionshow-reveal-enabled';
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

            function getContentElement() {
                return document.getElementById('<%= Mcontent.ClientID %>');
            }

            function getHiddenRawElement() {
                return document.getElementById('<%= HiddenMissionRaw.ClientID %>');
            }

            function getMarkdownToggle() {
                return document.getElementById('<%= markdownToggle.ClientID %>');
            }

            function getMarkdownStatus() {
                return document.getElementById('<%= markdownToggleStatus.ClientID %>');
            }

            function getRevealToggle() {
                return document.getElementById('<%= revealToggle.ClientID %>');
            }

            function getRevealStatus() {
                return document.getElementById('<%= revealToggleStatus.ClientID %>');
            }

            function getStoredFlagOrNull(key) {
                try {
                    var stored = localStorage.getItem(key);
                    return stored === null ? null : stored === '1';
                } catch (e) {
                    return null;
                }
            }

            function setStoredFlag(key, enabled) {
                try {
                    localStorage.setItem(key, enabled ? '1' : '0');
                } catch (e) {
                }
            }

            function updateSwitch(toggle, status, enabled) {
                if (toggle) {
                    toggle.className = enabled ? 'mission-show-toggle-switch is-on' : 'mission-show-toggle-switch';
                    toggle.setAttribute('aria-pressed', enabled ? 'true' : 'false');
                }
                if (status) {
                    status.innerText = enabled ? '当前：开启' : '当前：关闭';
                }
            }

            function escapeHtml(value) {
                return (value || '')
                    .replace(/&/g, '&amp;')
                    .replace(/</g, '&lt;')
                    .replace(/>/g, '&gt;')
                    .replace(/"/g, '&quot;')
                    .replace(/'/g, '&#39;');
            }

            function stripHtmlToText(html) {
                var holder = document.createElement('div');
                holder.innerHTML = html || '';
                return (holder.textContent || holder.innerText || '').replace(/\r/g, '').trim();
            }

            function looksLikeMarkdown(text) {
                if (!text) {
                    return false;
                }
                var normalized = text.replace(/\r/g, '').trim();
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
                var normalized = text.replace(/\r/g, '').trim();
                if (!normalized) {
                    return false;
                }
                return /^```(?:reveal|revealjs)\b/m.test(normalized)
                    || /^\s*--\s*$/m.test(normalized)
                    || /^\s*(?:note|notes)\s*:/mi.test(normalized)
                    || /^\s*\.element\s*:/mi.test(normalized)
                    || /^\s*<!--\s*\.slide\s*:/mi.test(normalized)
                    || /^\s*<!--\s*\.element\s*:/mi.test(normalized)
                    || normalized.split(/^---$/m).filter(function (part) { return part.trim(); }).length >= 2;
            }

            function getMissionSource() {
                var content = getContentElement();
                var hidden = getHiddenRawElement();
                var hiddenValue = hidden ? (hidden.value || '') : '';
                var html = content ? (content.innerHTML || '') : '';
                var text = content ? (content.textContent || '') : '';

                if (looksLikeMarkdown(hiddenValue)) {
                    return hiddenValue;
                }
                if (looksLikeMarkdown(text)) {
                    return text;
                }

                var plain = stripHtmlToText(html);
                return looksLikeMarkdown(plain) ? plain : hiddenValue || html || text || '';
            }

            function getRevealThemeOptionsHtml() {
                return revealThemeOptions.map(function (theme) {
                    return '<option value="' + escapeHtml(theme.value) + '">' + escapeHtml(theme.label) + '</option>';
                }).join('');
            }

            function parseRevealMarkdown(blockText) {
                var cleaned = blockText.replace(/^```(?:reveal|revealjs)?\s*/i, '').replace(/```\s*$/, '').trim();
                var slidesHtml = cleaned.split(/^---$/m).map(function (section) {
                    var verticalSlides = section.trim().split(/^--$/m).map(function (item) { return item.trim(); }).filter(Boolean);
                    if (verticalSlides.length > 1) {
                        return '<section>' + verticalSlides.map(function (slide) {
                            return '<section>' + marked.parse(slide) + '</section>';
                        }).join('') + '</section>';
                    }
                    return '<section>' + marked.parse(section.trim()) + '</section>';
                }).filter(Boolean).join('');

                return '<div class="reveal-toolbar"><span class="reveal-toolbar-title">Reveal.js 幻灯片</span><div class="reveal-toolbar-actions"><select class="reveal-theme-select">' + getRevealThemeOptionsHtml() + '</select><button type="button" class="reveal-nav-btn reveal-prev-btn">上一页</button><span class="reveal-page-indicator">1 / 1</span><button type="button" class="reveal-nav-btn reveal-next-btn">下一页</button><button type="button" class="reveal-fullscreen-btn">放映</button></div></div><div class="reveal-stage"><div class="reveal" data-theme="default"><div class="slides">' + slidesHtml + '</div></div></div>';
            }

            function wrapSpecialBlocks(root) {
                var codeBlocks = root.querySelectorAll('pre code');
                Array.prototype.forEach.call(codeBlocks, function (code) {
                    var pre = code.parentNode;
                    if (!pre) {
                        return;
                    }
                    var className = code.className || '';
                    var langMatch = className.match(/language-([\w-]+)/i);
                    var lang = langMatch ? langMatch[1].toLowerCase() : '';
                    var rawCode = code.textContent || '';

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
                        revealHost.innerHTML = parseRevealMarkdown('```' + lang + '\n' + rawCode + '\n```');
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
                    if (lineCount < 1) {
                        return;
                    }
                    var wrap = document.createElement('div');
                    wrap.className = 'code-block-wrap';
                    var lineNumbers = document.createElement('div');
                    lineNumbers.className = 'code-line-numbers';
                    var nums = [];
                    for (var i = 1; i <= lineCount; i++) nums.push(i);
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
                        if (existing.getAttribute('data-loaded') === '1') callback();
                        else existing.addEventListener('load', callback, { once: true });
                    }
                    return;
                }
                var script = document.createElement('script');
                script.src = src;
                script.setAttribute('data-src', src);
                script.onload = function () {
                    script.setAttribute('data-loaded', '1');
                    if (callback) callback();
                };
                document.head.appendChild(script);
            }

            function renderMermaid(root) {
                var mermaidNodes = root.querySelectorAll('.mermaid');
                if (!mermaidNodes.length) {
                    return;
                }

                function doRender() {
                    if (!window.mermaid) {
                        return;
                    }

                    window.mermaid.initialize({ startOnLoad: false, securityLevel: 'loose', theme: 'default' });
                    Array.prototype.forEach.call(mermaidNodes, function (node, index) {
                        var source = node.getAttribute('data-mermaid-source') || node.textContent || '';
                        if (!source.trim()) {
                            return;
                        }
                        try {
                            var renderId = 'teacher-mission-mermaid-' + Date.now() + '-' + index;
                            var result = window.mermaid.render(renderId, source);
                            if (result && typeof result.then === 'function') {
                                result.then(function (rendered) {
                                    if (rendered && rendered.svg) {
                                        node.innerHTML = rendered.svg;
                                    }
                                });
                            } else if (result && result.svg) {
                                node.innerHTML = result.svg;
                            }
                        } catch (e) {
                            node.textContent = source;
                        }
                    });
                }

                if (window.mermaid) {
                    doRender();
                } else {
                    loadScript('../js/vendors/mermaid/mermaid.min.js', doRender);
                }
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
                        var themeSelect = host.querySelector('.reveal-theme-select');
                        var prevBtn = host.querySelector('.reveal-prev-btn');
                        var nextBtn = host.querySelector('.reveal-next-btn');
                        var fullscreenBtn = host.querySelector('.reveal-fullscreen-btn');
                        var pageIndicator = host.querySelector('.reveal-page-indicator');
                        if (!node || node.getAttribute('data-reveal-ready')) {
                            return;
                        }

                        var deck = new window.Reveal(node, {
                            embedded: true,
                            hash: false,
                            controls: true,
                            progress: true,
                            center: false,
                            transition: 'slide',
                            width: 1280,
                            height: 720,
                            margin: 0.04,
                            minScale: 0.2,
                            maxScale: 1.2
                        });

                        function updateIndicator() {
                            if (pageIndicator) {
                                var indices = deck.getIndices();
                                pageIndicator.innerText = (indices.h + 1) + ' / ' + Math.max(1, deck.getTotalSlides());
                            }
                        }

                        deck.initialize().then(function () {
                            updateIndicator();
                            node.setAttribute('data-reveal-ready', '1');
                        });

                        deck.on('slidechanged', updateIndicator);
                        deck.on('ready', updateIndicator);

                        if (prevBtn && !prevBtn.getAttribute('data-bound')) {
                            prevBtn.setAttribute('data-bound', '1');
                            prevBtn.addEventListener('click', function () { deck.prev(); updateIndicator(); });
                        }
                        if (nextBtn && !nextBtn.getAttribute('data-bound')) {
                            nextBtn.setAttribute('data-bound', '1');
                            nextBtn.addEventListener('click', function () { deck.next(); updateIndicator(); });
                        }
                        if (fullscreenBtn && !fullscreenBtn.getAttribute('data-bound')) {
                            fullscreenBtn.setAttribute('data-bound', '1');
                            fullscreenBtn.addEventListener('click', function () {
                                if (node.requestFullscreen) node.requestFullscreen();
                            });
                        }
                        if (themeSelect && !themeSelect.getAttribute('data-bound')) {
                            themeSelect.setAttribute('data-bound', '1');
                            themeSelect.addEventListener('change', function () {
                                node.className = 'reveal reveal-theme-' + themeSelect.value;
                            });
                        }
                    });
                }

                if (window.Reveal) {
                    doRender();
                } else {
                    loadScript('../js/vendors/reveal/dist/reveal.js', doRender);
                }
            }

            function restoreOriginalHtml(content) {
                content.className = 'mission-show-content';
                content.innerHTML = content.getAttribute('data-original-html') || '';
            }

            function renderMissionContent() {
                var content = getContentElement();
                if (!content) {
                    return;
                }

                if (!content.getAttribute('data-original-html')) {
                    content.setAttribute('data-original-html', content.innerHTML || '');
                }

                var markdownSource = getMissionSource();
                var storedMarkdown = getStoredFlagOrNull(markdownStorageKey);
                var storedReveal = getStoredFlagOrNull(revealStorageKey);
                var autoMarkdown = looksLikeMarkdown(markdownSource);
                var autoReveal = autoMarkdown && isRevealMarkdownDocument(markdownSource);
                var markdownEnabled = storedMarkdown === null ? autoMarkdown : storedMarkdown;
                var revealEnabled = storedReveal === null ? autoReveal : storedReveal;

                updateSwitch(getMarkdownToggle(), getMarkdownStatus(), markdownEnabled);
                updateSwitch(getRevealToggle(), getRevealStatus(), revealEnabled);

                if (getMarkdownStatus() && storedMarkdown === null && markdownEnabled) {
                    getMarkdownStatus().innerText = '当前：自动开启';
                }

                if (getRevealStatus() && storedReveal === null && revealEnabled) {
                    getRevealStatus().innerText = '当前：自动开启';
                }

                if (!markdownEnabled || !window.marked) {
                    restoreOriginalHtml(content);
                    return;
                }

                if (!looksLikeMarkdown(markdownSource)) {
                    restoreOriginalHtml(content);
                    if (getMarkdownStatus()) getMarkdownStatus().innerText = '当前：开启，未检测到 Markdown';
                    return;
                }

                marked.setOptions({ breaks: true, gfm: true });
                content.className = 'mission-markdown';

                if (revealEnabled && isRevealMarkdownDocument(markdownSource)) {
                    content.innerHTML = '<div class="vditor-reset"><div class="reveal-host">' + parseRevealMarkdown(markdownSource) + '<div class="render-note">当前已按 Reveal.js 演示文稿模式渲染。</div></div></div>';
                    renderMermaid(content);
                    renderReveal(content);
                } else {
                    content.innerHTML = '<div class="vditor-reset">' + marked.parse(markdownSource) + '</div>';
                    wrapSpecialBlocks(content);
                    applyCodeHighlight(content);
                    applyCodeLineNumbers(content);
                    renderMermaid(content);
                    if (revealEnabled) {
                        renderReveal(content);
                    }
                }
            }

            window.toggleMissionMarkdown = function () {
                var current = getStoredFlagOrNull(markdownStorageKey);
                if (current === null) {
                    current = looksLikeMarkdown(getMissionSource());
                }
                var nextEnabled = !current;
                setStoredFlag(markdownStorageKey, nextEnabled);
                renderMissionContent();
            };

            window.toggleMissionReveal = function () {
                var current = getStoredFlagOrNull(revealStorageKey);
                if (current === null) {
                    current = isRevealMarkdownDocument(getMissionSource());
                }
                var nextEnabled = !current;
                setStoredFlag(revealStorageKey, nextEnabled);
                renderMissionContent();
            };

            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', renderMissionContent);
            } else {
                renderMissionContent();
            }
        })();
    </script>
</asp:Content>
