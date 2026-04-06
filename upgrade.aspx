<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upgrade.aspx.cs" Inherits="UpGrade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <title>LearnSite信息技术学习平台数据库更新页面</title>
        <link rel="stylesheet" type="text/css" href="../App_Themes/Teacher/StyleSheet.css" />
    <style type="text/css">
        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", "Microsoft YaHei", Arial, sans-serif;
            background: linear-gradient(180deg, #eef4ff 0%, #f8fbff 100%);
            color: #0f172a;
        }

        .upgrade-page {
            min-height: 100vh;
            padding: 20px 14px;
        }

        .upgrade-shell {
            max-width: 920px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .upgrade-hero {
            border: 1px solid #1e3a8a;
            border-radius: 20px;
            padding: 22px 24px;
            background:
                radial-gradient(circle at top left, rgba(99, 102, 241, 0.22), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #312e81 52%, #4f46e5 100%);
            color: #eff6ff;
            box-shadow: 0 24px 54px rgba(79, 70, 229, 0.2);
        }

        .upgrade-hero__top {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
        }

        .upgrade-hero__logo {
            padding: 8px 12px;
            border-radius: 12px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.18);
        }

        .upgrade-title {
            margin: 0;
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .upgrade-subtitle {
            margin: 8px 0 0;
            font-size: 13px;
            color: rgba(239, 246, 255, 0.88);
            line-height: 1.6;
        }

        .upgrade-card {
            border: 1px solid #dbe6f5;
            border-radius: 18px;
            background: rgba(255,255,255,0.98);
            box-shadow: 0 14px 34px rgba(15, 23, 42, 0.06);
            overflow: hidden;
        }

        .upgrade-card__head {
            padding: 16px 20px;
            border-bottom: 1px solid #eef2ff;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
        }

        .upgrade-card__title {
            margin: 0;
            font-size: 17px;
            font-weight: 800;
            color: #0f172a;
        }

        .upgrade-card__desc {
            margin: 6px 0 0;
            font-size: 12px;
            color: #64748b;
            line-height: 1.6;
        }

        .upgrade-card__body {
            padding: 18px;
        }

        .upgrade-tips {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 10px;
        }

        .upgrade-tips__summary {
            padding: 10px 12px;
            border-radius: 12px;
            border: 1px solid #dbeafe;
            background: #f8fbff;
            color: #475569;
            font-size: 13px;
            line-height: 1.6;
        }

        .upgrade-tips__more {
            display: none;
            margin-top: 10px;
        }

        .upgrade-tips__more.is-open {
            display: block;
            animation: upgrade-expand-fade 0.18s ease-out;
        }

        .upgrade-tip {
            padding: 12px 14px;
            border-radius: 14px;
            border: 1px solid #dbeafe;
            background: #f8fbff;
        }

        .upgrade-tip--warn {
            border-color: #fde68a;
            background: #fffbeb;
        }

        .upgrade-tip__title {
            display: block;
            font-size: 13px;
            font-weight: 800;
            color: #1e3a8a;
            margin-bottom: 6px;
        }

        .upgrade-tip--warn .upgrade-tip__title {
            color: #92400e;
        }

        .upgrade-tip__text {
            font-size: 12px;
            color: #475569;
            line-height: 1.6;
        }

        .upgrade-version-grid {
            margin-top: 14px;
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 12px;
        }

        .upgrade-version-card {
            padding: 14px 16px;
            border-radius: 14px;
            border: 1px solid #dbeafe;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
        }

        .upgrade-version-card__label {
            display: block;
            font-size: 12px;
            font-weight: 800;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            margin-bottom: 8px;
        }

        .upgrade-version-card__value {
            font-size: 22px;
            font-weight: 800;
            color: #1d4ed8;
            line-height: 1.1;
        }

        .upgrade-version-card__value--compact {
            font-size: 16px;
            line-height: 1.35;
        }

        .upgrade-version-card--combined {
            padding: 16px 18px;
            border-color: #c7d2fe;
            background: linear-gradient(135deg, #eef2ff 0%, #f8fbff 100%);
        }

        .upgrade-version-compare {
            display: grid;
            grid-template-columns: minmax(0, 1fr) auto minmax(0, 1fr);
            align-items: center;
            gap: 10px;
            margin-top: 8px;
        }

        .upgrade-version-compare__item {
            padding: 10px 12px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.78);
            border: 1px solid rgba(199, 210, 254, 0.9);
        }

        .upgrade-version-compare__hint {
            display: block;
            font-size: 12px;
            font-weight: 800;
            color: #64748b;
            letter-spacing: 0.04em;
            margin-bottom: 8px;
        }

        .upgrade-version-compare__value {
            font-size: 22px;
            font-weight: 900;
            color: #312e81;
            line-height: 1.1;
        }

        .upgrade-version-compare__arrow {
            width: 34px;
            height: 34px;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #4f46e5;
            color: #ffffff;
            font-size: 16px;
            font-weight: 800;
            box-shadow: 0 12px 24px rgba(79, 70, 229, 0.22);
        }

        .upgrade-list {
            margin: 0;
            padding-left: 18px;
            color: #334155;
            line-height: 1.7;
            font-size: 13px;
        }

        .upgrade-check-grid {
            margin-top: 14px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 12px;
        }

        .upgrade-check-card {
            padding: 14px 16px;
            border-radius: 14px;
            border: 1px solid #dbeafe;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
        }

        .upgrade-check-card--warn {
            border-color: #fde68a;
            background: linear-gradient(180deg, #fffbeb 0%, #fff7ed 100%);
        }

        .upgrade-check-card--danger {
            border-color: #fecaca;
            background: linear-gradient(180deg, #fff1f2 0%, #fff7f7 100%);
        }

        .upgrade-check-card--success {
            border-color: #bbf7d0;
            background: linear-gradient(180deg, #f0fdf4 0%, #f7fff8 100%);
        }

        .upgrade-check-card__label {
            display: block;
            font-size: 12px;
            font-weight: 800;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            margin-bottom: 8px;
            position: relative;
            z-index: 1;
        }

        .upgrade-check-card__value {
            font-size: 18px;
            font-weight: 800;
            color: #1d4ed8;
            line-height: 1.4;
            position: relative;
            z-index: 1;
        }

        .upgrade-check-card__icon {
            width: 36px;
            height: 36px;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
            font-size: 15px;
            font-weight: 800;
            background: rgba(59, 130, 246, 0.12);
            color: #1d4ed8;
        }

        .upgrade-check-card--warn .upgrade-check-card__icon {
            background: rgba(245, 158, 11, 0.14);
            color: #b45309;
        }

        .upgrade-check-card--danger .upgrade-check-card__icon {
            background: rgba(239, 68, 68, 0.14);
            color: #dc2626;
        }

        .upgrade-check-card--success .upgrade-check-card__icon {
            background: rgba(34, 197, 94, 0.14);
            color: #15803d;
        }

        .upgrade-check-card__meta {
            margin-top: 8px;
            font-size: 12px;
            color: #64748b;
            line-height: 1.6;
        }

        .upgrade-check-card--warn .upgrade-check-card__value {
            color: #b45309;
        }

        .upgrade-check-card--danger .upgrade-check-card__value {
            color: #dc2626;
        }

        .upgrade-check-list,
        .upgrade-risk-list,
        .upgrade-pending-list {
            margin: 0;
            padding-left: 18px;
            color: #334155;
            line-height: 1.7;
            font-size: 13px;
        }

        .upgrade-risk-list li,
        .upgrade-check-list li,
        .upgrade-pending-list li {
            margin-bottom: 4px;
        }

        .upgrade-risk-list li {
            color: #92400e;
            position: relative;
            list-style: none;
            padding-left: 22px;
        }

        .upgrade-risk-list li::before {
            content: "!";
            position: absolute;
            left: 0;
            top: 4px;
            width: 16px;
            height: 16px;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #fee2e2;
            color: #dc2626;
            font-size: 11px;
            font-weight: 800;
        }

        .upgrade-risk-list li strong {
            color: #b91c1c;
        }

        .upgrade-check-card--danger {
            box-shadow: 0 0 0 1px rgba(220, 38, 38, 0.08), 0 10px 24px rgba(220, 38, 38, 0.08);
        }

        .upgrade-btn-disabled,
        .upgrade-btn-disabled:hover {
            background: #cbd5e1 !important;
            border-color: #cbd5e1 !important;
            color: #ffffff !important;
            cursor: not-allowed !important;
            box-shadow: none !important;
        }

        .upgrade-check-empty {
            font-size: 13px;
            color: #94a3b8;
        }

        .upgrade-collapsible__more {
            display: none;
        }

        .upgrade-collapsible__more.is-open {
            display: block;
            animation: upgrade-expand-fade 0.18s ease-out;
        }

        .upgrade-collapse-btn {
            margin-top: 10px;
            border: 1px solid #bfdbfe;
            background: #eff6ff;
            color: #1d4ed8;
            border-radius: 10px;
            padding: 8px 12px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .upgrade-collapse-btn:hover {
            background: #dbeafe;
        }

        .upgrade-collapse-btn__arrow {
            display: inline-block;
            font-size: 12px;
            transition: transform 0.18s ease;
        }

        .upgrade-collapse-btn[data-open="1"] .upgrade-collapse-btn__arrow {
            transform: rotate(90deg);
        }

        @keyframes upgrade-expand-fade {
            from {
                opacity: 0;
                transform: translateY(-4px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .upgrade-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            justify-content: center;
            margin-top: 14px;
        }

        .upgrade-progress-mask {
            position: fixed;
            inset: 0;
            z-index: 9999;
            display: none;
            align-items: center;
            justify-content: center;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(3px);
        }

        .upgrade-progress-mask.is-open {
            display: flex;
        }

        .upgrade-progress-card {
            width: min(92vw, 480px);
            padding: 28px 24px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.98);
            box-shadow: 0 24px 50px rgba(15, 23, 42, 0.22);
            text-align: left;
        }

        .upgrade-progress-title {
            margin: 0;
            font-size: 20px;
            font-weight: 800;
            color: #0f172a;
        }

        .upgrade-progress-desc {
            margin: 10px 0 0;
            font-size: 14px;
            line-height: 1.7;
            color: #64748b;
        }

        .upgrade-progress-bar {
            margin-top: 18px;
            height: 14px;
            border-radius: 999px;
            background: #e2e8f0;
            overflow: hidden;
        }

        .upgrade-progress-bar__fill {
            width: 8%;
            height: 100%;
            border-radius: 999px;
            background: linear-gradient(90deg, #3b82f6, #6366f1);
            transition: width 0.6s ease;
        }

        .upgrade-progress-steps {
            margin: 18px 0 0;
            padding: 0;
            list-style: none;
            display: grid;
            gap: 10px;
        }

        .upgrade-progress-step {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 12px;
            border-radius: 12px;
            background: #f8fafc;
            color: #64748b;
            font-size: 13px;
        }

        .upgrade-progress-step.is-active {
            background: #eff6ff;
            color: #1d4ed8;
            box-shadow: inset 0 0 0 1px #bfdbfe;
        }

        .upgrade-progress-step.is-done {
            background: #ecfdf5;
            color: #047857;
            box-shadow: inset 0 0 0 1px #a7f3d0;
        }

        .upgrade-progress-step__dot {
            width: 22px;
            height: 22px;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #dbeafe;
            color: #1d4ed8;
            font-size: 11px;
            font-weight: 800;
            flex-shrink: 0;
        }

        .upgrade-btn-primary,
        .upgrade-btn-secondary {
            min-width: 140px;
            min-height: 42px;
            border: none;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
        }

        .upgrade-btn-primary {
            color: #fff;
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            box-shadow: 0 10px 22px rgba(79, 70, 229, 0.22);
        }

        .upgrade-btn-secondary {
            color: #1d4ed8;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
        }

        .upgrade-msg {
            margin-top: 18px;
            display: block;
            text-align: center;
            font-size: 14px;
            font-weight: 700;
            color: #dc2626;
            line-height: 1.8;
        }

        .upgrade-form {
            display: grid;
            gap: 14px;
            max-width: 420px;
            margin: 0 auto;
        }

        .upgrade-form__row {
            display: flex;
            flex-direction: column;
            gap: 6px;
            text-align: left;
        }

        .upgrade-form__label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .upgrade-input {
            min-height: 40px;
            padding: 8px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            font-size: 14px;
            color: #0f172a;
        }

        .upgrade-form__hint {
            font-size: 12px;
            color: #64748b;
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .upgrade-page { padding: 16px; }
            .upgrade-hero { padding: 22px 20px; }
            .upgrade-title { font-size: 24px; }
            .upgrade-version-grid {
                grid-template-columns: 1fr;
            }
            .upgrade-version-compare {
                grid-template-columns: 1fr;
            }
            .upgrade-version-compare__arrow {
                margin: 0 auto;
                transform: rotate(90deg);
            }
        }
    </style>

    <link href="js/css/tailwind-utilities-2.2.19.min.css" rel="stylesheet">
    <script type="text/javascript">
        function toggleUpgradeList(button, targetId, remainCount) {
            var target = document.getElementById(targetId);
            if (!button || !target) {
                return false;
            }

            var isOpen = button.getAttribute('data-open') === '1';
            if (isOpen) {
                target.className = 'upgrade-collapsible__more';
                button.setAttribute('data-open', '0');
                button.innerHTML = '<span class="upgrade-collapse-btn__arrow">▶</span><span>展开全部（剩余 ' + remainCount + ' 项）</span>';
            }
            else {
                target.className = 'upgrade-collapsible__more is-open';
                button.setAttribute('data-open', '1');
                button.innerHTML = '<span class="upgrade-collapse-btn__arrow">▶</span><span>收起列表</span>';
            }
            return false;
        }

        function toggleUpgradeTips(button) {
            var target = document.getElementById('upgradeTipsMore');
            if (!button || !target) {
                return false;
            }

            var isOpen = button.getAttribute('data-open') === '1';
            if (isOpen) {
                target.className = 'upgrade-tips__more';
                button.setAttribute('data-open', '0');
                button.innerHTML = '<span class="upgrade-collapse-btn__arrow">▶</span><span>展开升级说明</span>';
            }
            else {
                target.className = 'upgrade-tips__more is-open';
                button.setAttribute('data-open', '1');
                button.innerHTML = '<span class="upgrade-collapse-btn__arrow">▶</span><span>收起升级说明</span>';
            }
            return false;
        }

        var upgradeProgressTimer = null;

        function showUpgradeProgress() {
            var mask = document.getElementById('upgradeProgressMask');
            var button = document.getElementById('<%= Btnupgrade.ClientID %>');
            if (mask) {
                mask.className = 'upgrade-progress-mask is-open';
            }
            window.setTimeout(function () {
                if (button) {
                    button.disabled = true;
                    button.className = 'upgrade-btn-primary upgrade-btn-disabled';
                    button.value = '正在升级...';
                }
            }, 0);

            var fill = document.getElementById('upgradeProgressFill');
            var desc = document.getElementById('upgradeProgressDesc');
            var steps = document.querySelectorAll('#upgradeProgressSteps .upgrade-progress-step');
            var progressPoints = [12, 36, 68, 92];
            var progressTexts = [
                '正在检查旧版本结构并准备升级环境...',
                '正在补齐历史表字段、词库和兼容补丁...',
                '正在执行新版本迁移与初始化数据写入...',
                '正在整理结果并准备跳转，请不要关闭页面...'
            ];
            var current = 0;

            function renderStep(index) {
                if (fill) {
                    fill.style.width = progressPoints[index] + '%';
                }
                if (desc) {
                    desc.innerHTML = progressTexts[index];
                }
                for (var i = 0; i < steps.length; i++) {
                    steps[i].className = 'upgrade-progress-step';
                    if (i < index) {
                        steps[i].className += ' is-done';
                    } else if (i === index) {
                        steps[i].className += ' is-active';
                    }
                }
            }

            renderStep(0);
            if (upgradeProgressTimer) {
                window.clearInterval(upgradeProgressTimer);
            }
            upgradeProgressTimer = window.setInterval(function () {
                if (current < progressPoints.length - 1) {
                    current++;
                    renderStep(current);
                }
            }, 1400);
            return true;
        }
    </script>
</head>
<body>
       <form id="form1" runat="server" > 
        <div class="upgrade-page">
            <div class="upgrade-shell">
                <div class="upgrade-hero">
                    <div class="upgrade-hero__top">
                        <div class="upgrade-hero__logo">
                            <asp:Image ID="Imagelogo" runat="server" ImageUrl="~/images/learnsite.gif" ToolTip="信息技术教学平台 LearnSite&#13;Powered By Asp.net2.0+Sql2005Express&#13;温州水乡设计编写 编程平台：Visual Studio 2008 C#" Height="24px" />
                        </div>
                    </div>
                    <h1 class="upgrade-title">数据库升级中心</h1>
                    <p class="upgrade-subtitle">
                        从旧版 LearnSite 升级到当前版本，系统会自动判断缺失的数据表、字段与索引并执行补齐。<br />
                    </p>
                </div>

                <div class="upgrade-card">
                    <div class="upgrade-card__head">
                        <h2 class="upgrade-card__title">升级说明</h2>
                        <p class="upgrade-card__desc">执行更新前建议先备份数据库。系统会自动判断是否需要升级，不会重复添加已有字段和索引。</p>
                    </div>
                    <div class="upgrade-card__body">
                        <div class="upgrade-tips__summary">
                            本页支持旧版 LearnSite 数据库升级、新版迁移补齐和首次安装初始化。建议先备份数据库，再根据下方预检查结果决定是否执行升级。
                        </div>
                        <div id="upgradeTipsMore" class="upgrade-tips__more">
                            <div class="upgrade-tips">
                                <div class="upgrade-tip upgrade-tip--warn">
                                    <span class="upgrade-tip__title">升级前必读</span>
                                    <div class="upgrade-tip__text">请先备份数据库，以防中断或误操作时可以快速恢复。</div>
                                </div>
                                <div class="upgrade-tip">
                                    <span class="upgrade-tip__title">自动升级内容</span>
                                    <div class="upgrade-tip__text">自动补齐表、字段、索引，并执行必要的初始化数据修复。</div>
                                </div>
                                <div class="upgrade-tip">
                                    <span class="upgrade-tip__title">全新安装说明</span>
                                    <div class="upgrade-tip__text">首次安装也需要执行本页，用于创建基础词典和初始化默认数据。</div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="upgrade-collapse-btn" data-open="0" onclick="return toggleUpgradeTips(this);"><span class="upgrade-collapse-btn__arrow">▶</span><span>展开升级说明</span></button>

                        <div class="upgrade-version-grid">
                            <div class="upgrade-version-card">
                                <span class="upgrade-version-card__label">当前连接数据库</span>
                                <div class="upgrade-version-card__value upgrade-version-card__value--compact"><%= ConnectedDatabaseName %></div>
                            </div>
                            <div class="upgrade-version-card">
                                <span class="upgrade-version-card__label">最近预检查时间</span>
                                <div class="upgrade-version-card__value upgrade-version-card__value--compact"><%= LastAnalyzeTime %></div>
                            </div>
                            <div class="upgrade-version-card upgrade-version-card--combined">
                                <span class="upgrade-version-card__label">数据库迁移版本对比</span>
                                <div class="upgrade-version-compare">
                                    <div class="upgrade-version-compare__item">
                                        <span class="upgrade-version-compare__hint">旧版本</span>
                                        <div class="upgrade-version-compare__value"><%= CurrentDbVersion %></div>
                                    </div>
                                    <div class="upgrade-version-compare__arrow">→</div>
                                    <div class="upgrade-version-compare__item">
                                        <span class="upgrade-version-compare__hint">新版本</span>
                                        <div class="upgrade-version-compare__value"><%= TargetDbVersion %></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="upgrade-check-grid">
                            <div class="upgrade-check-card <%=(UpgradeMode.IndexOf("空库") >= 0 ? "upgrade-check-card--warn" : "") %>">
                                <div class="upgrade-check-card__icon"><%=(UpgradeMode.IndexOf("空库") >= 0 ? "!" : "DB") %></div>
                                <span class="upgrade-check-card__label">数据库识别结果</span>
                                <div class="upgrade-check-card__value"><%= UpgradeMode %></div>
                                <div class="upgrade-check-card__meta">系统会根据基础表、迁移记录和关键字段识别当前数据库所处阶段。</div>
                            </div>
                            <div class="upgrade-check-card <%=(UpgradeDecision == "数据库已是最新" ? "upgrade-check-card--success" : (RiskLevel == "高" ? "upgrade-check-card--danger" : (RiskLevel == "中" ? "upgrade-check-card--warn" : ""))) %>">
                                <div class="upgrade-check-card__icon"><%=(UpgradeDecision == "数据库已是最新" ? "✓" : (RiskLevel == "高" ? "!" : "Go")) %></div>
                                <span class="upgrade-check-card__label">升级结论</span>
                                <div class="upgrade-check-card__value"><%= UpgradeDecision %></div>
                                <div class="upgrade-check-card__meta">先看这个结论，再决定是否执行升级。</div>
                            </div>
                            <div class="upgrade-check-card <%=(RiskLevel == "低" ? "upgrade-check-card--success" : (RiskLevel == "高" ? "upgrade-check-card--danger" : (RiskLevel == "中" ? "upgrade-check-card--warn" : ""))) %>">
                                <div class="upgrade-check-card__icon"><%=(RiskLevel == "低" ? "✓" : (RiskLevel == "高" ? "!" : "~")) %></div>
                                <span class="upgrade-check-card__label">风险等级</span>
                                <div class="upgrade-check-card__value"><%= RiskLevel %></div>
                                <div class="upgrade-check-card__meta">高风险代表当前数据库不适合直接执行覆盖升级。</div>
                            </div>
                        </div>

                        <div style="margin-top:18px; text-align:left; max-width:760px; margin-left:auto; margin-right:auto;">
                            <div class="upgrade-card__title" style="font-size:16px; margin-bottom:10px;">升级前检查结果</div>
                            <%= UpgradeSummaryHtml %>
                        </div>

                        <div style="margin-top:18px; text-align:left; max-width:760px; margin-left:auto; margin-right:auto;">
                            <div class="upgrade-card__title" style="font-size:16px; margin-bottom:10px;">待执行迁移</div>
                            <%= PendingMigrationHtml %>
                        </div>

                        <div style="margin-top:18px; text-align:left; max-width:760px; margin-left:auto; margin-right:auto;">
                            <div class="upgrade-card__title" style="font-size:16px; margin-bottom:10px;">待执行迁移分组</div>
                            <div class="upgrade-check-grid">
                                <div class="upgrade-check-card">
                                    <span class="upgrade-check-card__label">结构变更</span>
                                    <%= PendingStructureHtml %>
                                </div>
                                <div class="upgrade-check-card">
                                    <span class="upgrade-check-card__label">初始化数据</span>
                                    <%= PendingDataHtml %>
                                </div>
                                <div class="upgrade-check-card">
                                    <span class="upgrade-check-card__label">性能优化</span>
                                    <%= PendingPerformanceHtml %>
                                </div>
                            </div>
                        </div>

                        <div style="margin-top:18px; text-align:left; max-width:760px; margin-left:auto; margin-right:auto;">
                            <div class="upgrade-card__title" style="font-size:16px; margin-bottom:10px; color:#b45309;">风险提示</div>
                            <%= UpgradeRiskHtml %>
                        </div>

                        <div style="margin-top:18px; text-align:left; max-width:760px; margin-left:auto; margin-right:auto;">
                            <div class="upgrade-card__title" style="font-size:16px; margin-bottom:10px;">本次重点升级项</div>
                            <ol class="upgrade-list">
                                <li>增加 AI 相关数据表与自定义技能表升级逻辑。</li>
                                <li>为 `MenuWorks` 增加 `Kseconds` 字段，支持学生环节停留秒级统计。</li>
                                <li>自动将已有 `Ktime` 历史数据回填为秒级值。</li>
                                <li>新增 `IX_MenuWorks_Klid_Ksid` 索引，优化 `/teacher/learnrate.aspx` 查询性能。</li>
                            </ol>
                        </div>

                        <div class="upgrade-actions">
                            <asp:Button ID="BtnAnalyze" runat="server" Font-Size="9pt" Text="重新检查数据库"
                                onclick="BtnAnalyze_Click" CssClass="upgrade-btn-secondary" />
                            <asp:Button ID="BtnExportReport" runat="server" Font-Size="9pt" Text="导出检查报告"
                                onclick="BtnExportReport_Click" CssClass="upgrade-btn-secondary" />
                            <asp:Button ID="Btnupgrade" runat="server" Font-Size="9pt" Text="确认后执行升级" OnClientClick="if(!confirm('请确认你已经完成数据库备份，并且当前连接的是需要升级的旧库。是否继续执行升级？')) return false; showUpgradeProgress();"
                                onclick="Btnupgrade_Click" CssClass="upgrade-btn-primary" />
                            <asp:Button ID="BtnCreateTable" runat="server" onclick="BtnCreateTable_Click" 
                                Text="创建数据表" CssClass="upgrade-btn-secondary" />
                        </div>

                        <asp:Label ID="Labelmsg" runat="server" Font-Bold="True" ForeColor="Red" CssClass="upgrade-msg"></asp:Label>
                    </div>
                </div>

                <asp:Panel ID="Panel1" runat="server" Visible="False" CssClass="upgrade-card">
                    <div class="upgrade-card__head">
                        <h2 class="upgrade-card__title">数据库连接配置</h2>
                        <p class="upgrade-card__desc">如果系统还没有正确连接数据库，请先在下面修改数据库服务器和账号信息。</p>
                    </div>
                    <div class="upgrade-card__body">
                        <div class="upgrade-form">
                            <div class="upgrade-form__row">
                                <label class="upgrade-form__label" for="TextBoxSqlServer">数据库服务器名称</label>
                                <asp:TextBox ID="TextBoxSqlServer" runat="server" CssClass="upgrade-input"></asp:TextBox>
                            </div>
                            <div class="upgrade-form__row">
                                <label class="upgrade-form__label" for="TextBoxDbName">数据库名称</label>
                                <asp:TextBox ID="TextBoxDbName" runat="server" CssClass="upgrade-input"></asp:TextBox>
                            </div>
                            <div class="upgrade-form__row">
                                <label class="upgrade-form__label" for="TextBoxDbUser">数据库用户</label>
                                <asp:TextBox ID="TextBoxDbUser" runat="server" ToolTip="默认为sa，以便管理员后台备份数据库，否则备份不了！" CssClass="upgrade-input">sa</asp:TextBox>
                                <div class="upgrade-form__hint">默认建议使用 `sa`，便于后续后台数据库备份功能。</div>
                            </div>
                            <div class="upgrade-form__row">
                                <label class="upgrade-form__label" for="TextBoxDbPwd">数据库密码</label>
                                <asp:TextBox ID="TextBoxDbPwd" runat="server" ToolTip="默认为sa" CssClass="upgrade-input"></asp:TextBox>
                            </div>
                            <div class="upgrade-actions" style="margin-top:8px;">
                                <asp:Button ID="Buttonedit" runat="server" Font-Size="9pt"
                                    onclick="Buttonedit_Click" Text="保存配置" Visible="False" CssClass="upgrade-btn-primary" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div id="upgradeProgressMask" class="upgrade-progress-mask" aria-live="polite" aria-busy="true">
            <div class="upgrade-progress-card">
                <p class="upgrade-progress-title">正在执行数据库升级</p>
                <p id="upgradeProgressDesc" class="upgrade-progress-desc">正在检查旧版本结构并准备升级环境...</p>
                <div class="upgrade-progress-bar">
                    <div id="upgradeProgressFill" class="upgrade-progress-bar__fill"></div>
                </div>
                <ul id="upgradeProgressSteps" class="upgrade-progress-steps">
                    <li class="upgrade-progress-step is-active"><span class="upgrade-progress-step__dot">1</span><span>检查旧版本结构</span></li>
                    <li class="upgrade-progress-step"><span class="upgrade-progress-step__dot">2</span><span>补齐历史字段和兼容补丁</span></li>
                    <li class="upgrade-progress-step"><span class="upgrade-progress-step__dot">3</span><span>执行新版本迁移与初始化</span></li>
                    <li class="upgrade-progress-step"><span class="upgrade-progress-step__dot">4</span><span>整理结果并完成跳转</span></li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
