<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="start.aspx.cs" Inherits="Teacher_start" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .lesson-start {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-border-strong: #bfdbfe;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            --ls-primary-soft: #dbeafe;
            --ls-success: #16a34a;
            --ls-danger: #dc2626;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
        }

        .lesson-start * {
            box-sizing: border-box;
        }

        .lesson-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .lesson-hero {
            position: relative;
            overflow: hidden;
            border: 1px solid var(--ls-border);
            border-radius: 28px;
            padding: 28px;
            background:
                radial-gradient(circle at top left, rgba(59, 130, 246, 0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #1d4ed8 52%, #38bdf8 100%);
            color: #eff6ff;
            box-shadow: 0 28px 60px rgba(37, 99, 235, 0.2);
        }

        .lesson-hero__content {
            position: relative;
            z-index: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
            align-items: flex-start;
        }

        .lesson-hero__title {
            margin: 0;
            font-size: 32px;
            line-height: 1.15;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .lesson-hero__subtitle {
            max-width: 760px;
            margin: 12px 0 0;
            font-size: 15px;
            line-height: 1.8;
            color: rgba(239, 246, 255, 0.88);
        }

        .lesson-hero__tips {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 18px;
        }

        .lesson-chip {
            display: inline-flex;
            align-items: center;
            min-height: 34px;
            padding: 0 14px;
            border-radius: 999px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            background: rgba(255, 255, 255, 0.12);
            color: #eff6ff;
            font-size: 13px;
            font-weight: 600;
            backdrop-filter: blur(10px);
        }

        .lesson-hero__panel {
            min-width: 280px;
            max-width: 360px;
            padding: 18px 20px;
            border-radius: 22px;
            background: rgba(255, 255, 255, 0.14);
            border: 1px solid rgba(255, 255, 255, 0.16);
            backdrop-filter: blur(14px);
        }

        .lesson-hero__panel-title {
            margin: 0 0 8px;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: rgba(219, 234, 254, 0.9);
        }

        .lesson-hero__panel-text {
            margin: 0;
            font-size: 14px;
            line-height: 1.8;
            color: rgba(239, 246, 255, 0.9);
        }

        .lesson-grid {
            display: grid;
            gap: 20px;
            grid-template-columns: repeat(12, minmax(0, 1fr));
        }

        .lesson-card {
            min-width: 0;
            border: 1px solid var(--ls-border);
            border-radius: 24px;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
        }

        .lesson-card--span-12 { grid-column: span 12; }
        .lesson-card--span-8 { grid-column: span 8; }
        .lesson-card--span-7 { grid-column: span 7; }
        .lesson-card--span-6 { grid-column: span 6; }
        .lesson-card--span-5 { grid-column: span 5; }
        .lesson-card--span-4 { grid-column: span 4; }

        .lesson-card__head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 12px;
            align-items: flex-start;
            padding: 22px 24px 0;
        }

        .lesson-card__title {
            margin: 0;
            font-size: 20px;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.02em;
            color: var(--ls-text);
        }

        .lesson-card__desc {
            margin: 8px 0 0;
            font-size: 13px;
            line-height: 1.7;
            color: var(--ls-muted);
        }

        .lesson-card__body {
            padding: 22px 24px 24px;
        }

        .lesson-flow {
            display: grid;
            gap: 16px;
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }

        .lesson-flow__step {
            padding: 18px;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
        }

        .lesson-flow__num {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 999px;
            background: #dbeafe;
            color: #1d4ed8;
            font-weight: 800;
            font-size: 13px;
        }

        .lesson-flow__title {
            margin: 12px 0 8px;
            font-size: 16px;
            font-weight: 700;
        }

        .lesson-flow__text {
            margin: 0;
            font-size: 13px;
            line-height: 1.7;
            color: var(--ls-muted);
        }

        .lesson-form-grid {
            display: grid;
            gap: 16px;
            grid-template-columns: 1.1fr 1.1fr 2fr;
        }

        .lesson-field {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .lesson-field--actions {
            grid-column: span 3;
        }

        .lesson-label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .lesson-select,
        .lesson-input {
            width: 100% !important;
            min-height: 48px;
            padding: 0 14px;
            border: 1px solid #cbd5e1;
            border-radius: 16px;
            background: #f8fafc;
            color: #0f172a;
            font-size: 14px;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
        }

        .lesson-select:focus,
        .lesson-input:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(96, 165, 250, 0.18);
        }

        .lesson-input {
            text-align: center;
            font-weight: 700;
            letter-spacing: 0.08em;
            background: #ecfeff;
        }

        .lesson-actions,
        .lesson-links,
        .lesson-room-tools,
        .lesson-toolbar,
        .lesson-toggle-group,
        .lesson-legend,
        .lesson-footer {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: center;
        }

        .lesson-actions {
            margin-top: 6px;
        }

        .lesson-btn,
        .lesson-link,
        .lesson-icon-link,
        .lesson-refresh {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 44px;
            padding: 0 18px;
            border-radius: 14px;
            border: 1px solid transparent;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
            transition: transform 0.18s ease, box-shadow 0.18s ease, background-color 0.18s ease, border-color 0.18s ease;
            cursor: pointer;
        }

        .lesson-btn:hover,
        .lesson-link:hover,
        .lesson-icon-link:hover,
        .lesson-refresh:hover {
            transform: translateY(-1px);
        }

        .lesson-btn {
            border: 0;
            color: #ffffff;
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            box-shadow: 0 10px 24px rgba(37, 99, 235, 0.2);
        }

        .lesson-btn--secondary {
            color: #1d4ed8;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            box-shadow: none;
        }

        .lesson-link {
            color: #14532d;
            background: #f0fdf4;
            border-color: #bbf7d0;
        }

        .lesson-icon-link {
            width: 48px;
            padding: 0;
            background: #eff6ff;
            border-color: #bfdbfe;
        }

        .lesson-refresh {
            width: 48px;
            padding: 0;
            background: #f8fafc;
            border-color: #cbd5e1;
        }

        .lesson-btn[disabled],
        .lesson-refresh[disabled],
        .lesson-select[disabled],
        .lesson-input[disabled] {
            opacity: 0.58;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .lesson-status-grid {
            display: grid;
            gap: 14px;
            grid-template-columns: repeat(4, minmax(0, 1fr));
        }

        .lesson-stat {
            padding: 18px;
            border-radius: 20px;
            border: 1px solid #e2e8f0;
            background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
        }

        .lesson-stat__label {
            margin: 0;
            font-size: 13px;
            color: var(--ls-muted);
        }

        .lesson-stat__value {
            display: block;
            margin-top: 10px;
            font-size: 24px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.2;
        }

        .lesson-stat__sub {
            display: block;
            margin-top: 8px;
            font-size: 12px;
            line-height: 1.6;
            color: var(--ls-muted);
        }

        .lesson-prompt {
            display: block;
            margin-top: 10px;
            padding: 12px 14px;
            border-radius: 14px;
            background: #0f172a;
            color: #f8fafc;
            font-size: 12px;
            line-height: 1.7;
        }

        .lesson-menu-list {
            width: 100%;
        }

        .lesson-menu-item {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            width: 128px;
            margin: 0 12px 12px 0;
            padding: 16px 12px;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
            vertical-align: top;
        }

        .lesson-menu-button {
            width: 54px;
            height: 54px;
            padding: 8px;
            border-radius: 16px;
            border: 1px solid #dbeafe;
            background: #eff6ff;
        }

        .lesson-menu-button img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .lesson-menu-title {
            display: block;
            min-height: 38px;
            font-size: 13px;
            font-weight: 700;
            line-height: 1.45;
            color: #0f172a;
        }

        .lesson-legend {
            row-gap: 10px;
        }

        .lesson-legend__item {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #475569;
            font-size: 12px;
            font-weight: 600;
        }

        .lesson-legend__swatch {
            display: inline-block;
            width: 14px;
            height: 14px;
            border-radius: 999px;
            border: 1px solid rgba(15, 23, 42, 0.08);
            vertical-align: middle;
        }

        .lesson-inline-note {
            font-size: 13px;
            color: var(--ls-muted);
            line-height: 1.8;
        }

        .lesson-online-list,
        .lesson-offline-list,
        .lesson-done-list,
        .lesson-new-list {
            width: 100%;
        }

        .student-card,
        .student-card--offline {
            min-height: 120px;
            margin: 0 10px 12px 0;
            padding: 14px 12px;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
            box-shadow: 0 8px 20px rgba(15, 23, 42, 0.04);
        }

        .student-card__num {
            font-size: 12px;
            font-weight: 700;
            color: #64748b;
        }

        .student-card__machine,
        .student-card__score {
            margin-top: 8px;
            font-size: 12px;
            color: #64748b;
            line-height: 1.6;
        }

        .labelname {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            min-height: 34px;
            margin-top: 10px;
            padding: 0 10px;
            color: #0f172a;
            background-color: #f8fafc;
            border: 1px solid #dbe4f0;
            border-radius: 12px;
            font-size: 13px;
            line-height: 1.4;
            cursor: pointer;
        }

        .lesson-student-actions {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            margin-top: 10px;
        }

        .lesson-group-flag {
            min-width: 32px;
            min-height: 32px;
            padding: 0 8px;
            border-radius: 10px;
            border: 1px solid #bfdbfe;
            background: #eff6ff;
            color: transparent;
            overflow: hidden;
        }

        .lesson-group-flag img {
            width: 18px;
            height: 18px;
            margin-top: 6px;
        }

        .groupscore {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 18px;
            min-height: 18px;
            font-size: 11px;
            font-weight: 800;
            line-height: 1;
        }

        .lockbtn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 10px;
            background: #fee2e2;
            color: #b91c1c;
            font-size: 0;
            text-decoration: none;
            border: 1px solid #fecaca;
        }

        .lockbtn:before {
            content: "退";
            font-size: 12px;
            font-weight: 800;
            line-height: 1;
        }

        .lesson-toggle-group {
            padding: 16px;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            background: #f8fbff;
        }

        .lesson-toggle-group span,
        .lesson-sort span {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-right: 12px;
            font-size: 13px;
            color: #334155;
        }

        .lesson-sort {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            padding: 16px;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            background: #ffffff;
        }

        .lesson-alert {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 12px;
            padding: 14px 16px;
            border-radius: 18px;
            background: linear-gradient(90deg, #0f172a 0%, #1e293b 100%);
            color: #e2e8f0;
        }

        .lesson-alert__title {
            font-size: 13px;
            font-weight: 700;
        }

        .lesson-alert__count {
            font-size: 18px;
            font-weight: 800;
            color: #f8fafc;
        }

        .lesson-room-meta {
            display: grid;
            gap: 16px;
            grid-template-columns: minmax(180px, 240px) 1fr;
            align-items: end;
        }

        .doneksdiv {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 56px;
            min-height: 72px;
            margin: 0 10px 10px 0;
            padding: 10px 6px;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            background: #ffffff;
            float: none;
            vertical-align: top;
        }

        .donekc,
        .newkc {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 36px;
            min-height: 32px;
            padding: 0 8px;
            border-radius: 12px;
            font-weight: 800;
            text-decoration: none;
            border: 1px solid transparent;
        }

        .donekc {
            color: #166534;
            background: #dcfce7;
            border-color: #bbf7d0;
        }

        .newkc {
            color: #9a3412;
            background: #ffedd5;
            border-color: #fed7aa;
        }

        .lesson-course-note {
            margin-top: 6px;
            font-size: 12px;
            color: var(--ls-muted);
        }

        .lesson-publish-toggle img {
            width: 22px;
            height: 22px;
        }

        .lesson-footer {
            justify-content: space-between;
            align-items: center;
            padding-top: 6px;
        }

        .lesson-footer__meta {
            font-size: 13px;
            line-height: 1.8;
            color: var(--ls-muted);
        }

        .lesson-footer__meta span,
        .lesson-footer__meta label {
            color: #334155;
            font-weight: 600;
        }

        @media (max-width: 1200px) {
            .lesson-card--span-8,
            .lesson-card--span-7,
            .lesson-card--span-6,
            .lesson-card--span-5,
            .lesson-card--span-4 {
                grid-column: span 12;
            }

            .lesson-status-grid,
            .lesson-flow,
            .lesson-form-grid,
            .lesson-room-meta {
                grid-template-columns: 1fr;
            }

            .lesson-field--actions {
                grid-column: span 1;
            }
        }

        @media (max-width: 768px) {
            .lesson-start {
                padding: 16px;
            }

            .lesson-hero,
            .lesson-card__head,
            .lesson-card__body {
                padding-left: 18px;
                padding-right: 18px;
            }

            .lesson-hero__title {
                font-size: 26px;
            }

            .lesson-menu-item,
            .student-card,
            .student-card--offline,
            .doneksdiv {
                margin-right: 8px;
            }
        }
    </style>

    <div class="placehold lesson-start">
        <div class="lesson-shell">
            <div class="lesson-hero">
                <div class="lesson-hero__content">
                    <div>
                        <h1 class="lesson-hero__title">课堂启动中心</h1>
                        <p class="lesson-hero__subtitle">
                            将班级选择、课堂启动、学习进度查看、签到巡检和功能开关集中在同一页面，减少来回切换。
                            所有原有业务逻辑保持不变，只优化视觉层级和操作路径。
                        </p>
                        <div class="lesson-hero__tips">
                            <span class="lesson-chip">1. 选择年级、班级与学案</span>
                            <span class="lesson-chip">2. 开始上课并生成密码</span>
                            <span class="lesson-chip">3. 观察在线状态与课堂开关</span>
                        </div>
                    </div>
                    <div class="lesson-hero__panel">
                        <p class="lesson-hero__panel-title">当前操作建议</p>
                        <p class="lesson-hero__panel-text">
                            先确认学案，再点击“开始上课”；开课后可直接查看进度、作品展示和汇总，并在下方控制课堂模式与学生状态。
                        </p>
                    </div>
                </div>
            </div>

            <div class="lesson-grid">
                <section class="lesson-card lesson-card--span-8">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">课堂准备</h2>
                            <p class="lesson-card__desc">把原本横向堆叠的控件改为分组表单，先选班级与学案，再执行开课动作，路径更清晰。</p>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-flow">
                            <div class="lesson-flow__step">
                                <span class="lesson-flow__num">1</span>
                                <h3 class="lesson-flow__title">选择对象</h3>
                                <p class="lesson-flow__text">先确认年级、班级和本节课要使用的学案，后续所有状态统计会同步刷新。</p>
                            </div>
                            <div class="lesson-flow__step">
                                <span class="lesson-flow__num">2</span>
                                <h3 class="lesson-flow__title">启动课堂</h3>
                                <p class="lesson-flow__text">点击开始上课后，页面会锁定关键信息并生成登录密码，避免误改课堂对象。</p>
                            </div>
                            <div class="lesson-flow__step">
                                <span class="lesson-flow__num">3</span>
                                <h3 class="lesson-flow__title">巡检与控制</h3>
                                <p class="lesson-flow__text">开课后重点查看签到、在线学生、作品提交和课堂模式开关，快速处理异常。</p>
                            </div>
                        </div>

                        <div class="lesson-form-grid" style="margin-top: 20px;">
                            <div class="lesson-field">
                                <span class="lesson-label">年级</span>
                                <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLgrade_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field">
                                <span class="lesson-label">班级</span>
                                <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLclass_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field">
                                <span class="lesson-label">当前学案</span>
                                <asp:DropDownList ID="DDLCid" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLCid_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field lesson-field--actions">
                                <div class="lesson-actions">
                                    <asp:Button ID="Btnset" runat="server" Text="开始上课" SkinID="BtnNormal" ToolTip="设置上课班级登录密码" onclick="Btnset_Click" CssClass="lesson-btn" />
                                    <asp:Button ID="Btnstudent" runat="server" Text="模拟学生" SkinID="BtnNormal" ToolTip="模拟本班级学生角色登录学生平台" onclick="Btnstudent_Click" Enabled="False" CssClass="lesson-btn lesson-btn--secondary" />
                                    <div class="lesson-field" style="min-width: 180px; max-width: 220px; margin-bottom: 0;">
                                        <span class="lesson-label">班级口令</span>
                                        <asp:TextBox ID="TBpwd" runat="server" ReadOnly="True" SkinID="TextBoxNum" CssClass="lesson-input"></asp:TextBox>
                                    </div>
                                </div>
                                <span class="lesson-prompt">提示：开课后页面会自动保留当前班级状态，学生端可按当前模式进入对应课堂。</span>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-4">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">课堂速览</h2>
                            <p class="lesson-card__desc">保留原有统计控件，用更清晰的卡片形式展示班级状态和入口。</p>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-status-grid">
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">今日已签到</p>
                                <span class="lesson-stat__value"><asp:Label ID="Labelsigin" runat="server"></asp:Label></span>
                                <span class="lesson-stat__sub">到课学生数</span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">今日未签到</p>
                                <span class="lesson-stat__value"><asp:Label ID="Labelsigno" runat="server"></asp:Label></span>
                                <span class="lesson-stat__sub">待跟进人数</span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">作品提交</p>
                                <span class="lesson-stat__sub" style="margin-top: 12px;"><asp:Label ID="Labelcount" runat="server"></asp:Label></span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">课堂时钟</p>
                                <span class="lesson-stat__sub" style="margin-top: 12px;"><asp:Label ID="Labelfresh" runat="server"></asp:Label></span>
                                <span class="lesson-stat__sub"><asp:Label ID="LabelToday" runat="server" ToolTip="*服务器日期校准：作品、签到日期以此为准*"></asp:Label></span>
                            </div>
                        </div>

                        <div class="lesson-links" style="margin-top: 18px;">
                            <asp:HyperLink ID="HLrate" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">学习进度</asp:HyperLink>
                            <asp:HyperLink ID="HLworkshow" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">作品展示</asp:HyperLink>
                            <asp:HyperLink ID="HLtotal" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">学习汇总</asp:HyperLink>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">学案活动开关</h2>
                            <p class="lesson-card__desc">保留原有发布逻辑，用卡片展示当前学案中的活动入口，便于快速查看哪些内容对学生开放。</p>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <asp:DataList ID="DataListMenu" runat="server" CssClass="lesson-menu-list" RepeatLayout="Flow" RepeatDirection="Horizontal" DataKeyField="Lid" onitemdatabound="DataListMenu_ItemDataBound" onitemcommand="DataListMenu_ItemCommand">
                            <ItemTemplate>
                                <div class="lesson-menu-item">
                                    <asp:ImageButton ID="imgBtn" runat="server" CssClass="lesson-menu-button" ImageUrl='<%# Eval("Limgurl") %>' CommandArgument="Lid" CommandName="P" />
                                    <asp:Label ID="lableTitle" runat="server" CssClass="lesson-menu-title" Text='<%# Eval("Ltitle") %>'></asp:Label>
                                    <asp:CheckBox ID="CheckBoxShow" Checked='<%# Eval("Lshow") %>' runat="server" Visible="false" />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-8">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">在线学生与课堂动态</h2>
                            <p class="lesson-card__desc">把作品颜色说明、签到统计和学生状态整合到同一区域，教师巡课时更容易聚焦异常学生。</p>
                        </div>
                        <div class="lesson-inline-note">点击学生姓名可评价学习表现，点击“退”可让该生重新登录。</div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-legend">
                            <span class="lesson-legend__item"><asp:Label ID="Labelnocolor" runat="server" BackColor="#E8E8E8" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="没有作品"></asp:Label>没有作品</span>
                            <span class="lesson-legend__item"><asp:Label ID="Labelone" runat="server" BackColor="#B1D2FE" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="单个作品"></asp:Label>1 个作品</span>
                            <span class="lesson-legend__item"><asp:Label ID="Labeltwo" runat="server" BackColor="#4F98FB" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="两个作品"></asp:Label>2 个作品</span>
                            <span class="lesson-legend__item"><asp:Label ID="Labelthree" runat="server" BackColor="#CDE7CF" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="三个作品"></asp:Label>3 个作品</span>
                            <span class="lesson-legend__item"><asp:Label ID="Labelfour" runat="server" BackColor="#9BC47D" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="四个作品"></asp:Label>4 个作品</span>
                            <span class="lesson-legend__item"><asp:Label ID="Labelmore" runat="server" BackColor="#BCADE4" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="多个作品"></asp:Label>多个作品</span>
                        </div>

                        <div class="lesson-alert" style="margin-top: 18px;">
                            <span class="lesson-alert__title">巡课提示</span>
                            <span class="lesson-inline-note" style="color: rgba(226,232,240,0.88);">学生卡片会按当前排序方式刷新，颜色表示作品提交数量，点击姓名可直接评价学习表现。</span>
                        </div>

                        <div style="margin-top: 18px; overflow-x: auto;">
                            <asp:DataList ID="DLonline" runat="server" CssClass="lesson-online-list" RepeatColumns="8" RepeatDirection="Vertical" HorizontalAlign="Center" DataKeyField="Qid" onitemdatabound="DLonline_ItemDataBound" onitemcommand="DLonline_ItemCommand">
                                <ItemTemplate>
                                    <div class="divonline student-card">
                                        <div class="student-card__num"><asp:Label ID="Labelqnum" runat="server" Text='<%# Eval("Qnum") %>'></asp:Label></div>
                                        <asp:Label ID="HyperSname" runat="server" Text='<%# Eval("Qname") %>' CssClass="labelname"></asp:Label>
                                        <div class="lesson-student-actions">
                                            <asp:HyperLink ID="Groupflag" runat="server" CssClass="lesson-group-flag">g</asp:HyperLink>
                                            <asp:Label ID="Labelcolor" runat="server" Text='<%# Eval("Qgscore") %>' ToolTip='<%# "组评语："+Eval("Qgroup") %>' CssClass="groupscore"></asp:Label>
                                            <asp:LinkButton ID="Lunlock" runat="server" CommandArgument="Qid" CommandName="UnLock" ToolTip="单击执行：让该学生重新登录！" CssClass="lockbtn"></asp:LinkButton>
                                        </div>
                                        <div class="student-card__machine"><asp:Label ID="LabelQmachine" runat="server" Text='<%# Eval("QmachineShort") %>' Visible="false"></asp:Label></div>
                                        <div style="display: none;">
                                            <asp:Label ID="Labelwork" runat="server" Text='<%# Eval("Qwork") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="Labelattitude" runat="server" Text='<%# Eval("Qattitude") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="Labelnote" runat="server" Text='<%# Eval("Qnote") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="LabelSleader" runat="server" Text='<%# Eval("Sleader") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="LabelSgroup" runat="server" Text='<%# Eval("Sgroup") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="LabelSgtitle" runat="server" Text='<%# Eval("Sgtitle") %>' Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-4">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">课堂控制面板</h2>
                            <p class="lesson-card__desc">排序和模式开关保持原有事件，统一收纳成可扫视的控制区。</p>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-sort">
                            <span class="lesson-label">视图排序</span>
                            <anthem:RadioButtonList ID="RBsort" runat="server" AutoPostBack="True" CssClass="lesson-radio-list" RepeatDirection="Horizontal" RepeatLayout="Flow" onselectedindexchanged="RBsort_SelectedIndexChanged">
                                <Items>
                                    <asp:ListItem Value="3">机房视图</asp:ListItem>
                                    <asp:ListItem Value="0">主机排序</asp:ListItem>
                                    <asp:ListItem Value="1" Selected="True">学号排序</asp:ListItem>
                                    <asp:ListItem Value="2">小组排序</asp:ListItem>
                                </Items>
                            </anthem:RadioButtonList>
                        </div>

                        <div class="lesson-toggle-group" style="margin-top: 16px;">
                            <span><anthem:CheckBox ID="CheckBoxScratch" runat="server" Text="编程控制" AutoPostBack="True" ToolTip="提示：编程开关控制，选中表示可以进入编程页面" oncheckedchanged="CheckBoxScratch_CheckedChanged" /></span>
                            <span><anthem:CheckBox ID="CheckBoxRgauge" runat="server" Text="作品互评" AutoPostBack="True" ToolTip="提示：作品互评控制，选中表示开启" oncheckedchanged="CheckBoxRgauge_CheckedChanged" /></span>
                            <span><anthem:CheckBox ID="CheckBoxip" runat="server" Text="IP锁定登录" AutoPostBack="True" ToolTip="提示：根据上次登录的IP进行锁定登录" oncheckedchanged="CheckBoxip_CheckedChanged" /></span>
                            <span><anthem:CheckBox ID="CheckBoxPass" runat="server" Text="闯关模式" AutoPostBack="True" ToolTip="提示：当前学案活动依次完成后解锁下一个活动！" oncheckedchanged="CheckBoxPass_CheckedChanged" /></span>
                            <span><anthem:CheckBox ID="CheckBoxOpen" runat="server" Text="快速模式" AutoPostBack="True" ToolTip="提示：本班学生登录后，直接进入当前学案学案导航！" oncheckedchanged="CheckBoxOpen_CheckedChanged" /></span>
                            <span><anthem:CheckBox ID="CheckBoxPwd" runat="server" Text="班级密码" AutoPostBack="True" ToolTip="提示：选中表示公开显示班级密码，未选表示隐藏班级密码！" oncheckedchanged="CheckBoxPwd_CheckedChanged" /></span>
                            <span><anthem:CheckBox ID="CheckBoxLogin" runat="server" Text="个人模式" AutoPostBack="True" ToolTip="提示：选中表示允许本班单独个人模式登录，未选表示使用后台统一模式登录！" oncheckedchanged="CheckBoxLogin_CheckedChanged" /></span>
                        </div>

                        <span class="lesson-prompt">建议先开课后再调整课堂模式开关，避免学生在进入课堂时看到不一致的页面状态。</span>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">未签到学生</h2>
                            <p class="lesson-card__desc">将未签到学生单独列出，便于快速记录备注或确认异常原因。</p>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-alert">
                            <span class="lesson-alert__title">备注提醒</span>
                            <span class="lesson-inline-note" style="color: rgba(226,232,240,0.88);">点击未签到学生姓名可以补充未签到备注，便于课后追踪。</span>
                            <asp:Label ID="Label2" runat="server" ForeColor="White"></asp:Label>
                        </div>

                        <div style="margin-top: 18px; overflow-x: auto;">
                            <asp:DataList ID="DLnotline" runat="server" CssClass="lesson-offline-list" RepeatColumns="8" RepeatDirection="Horizontal" HorizontalAlign="Center" onitemdatabound="DLnotline_ItemDataBound">
                                <ItemTemplate>
                                    <div class="divunline student-card student-card--offline">
                                        <div class="student-card__num"><asp:Label ID="LabelNnum" runat="server" Text='<%# Eval("Snum") %>'></asp:Label></div>
                                        <asp:Label ID="lbQname" runat="server" Text='<%# Eval("Sname") %>' CssClass="labelname"></asp:Label>
                                        <div class="student-card__score"><asp:Label ID="LabelSscore" runat="server" Text='<%# Eval("Sscore") %>' ToolTip="总学分"></asp:Label></div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-6">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">机房与资源入口</h2>
                            <p class="lesson-card__desc">把座位表、刷新和网盘开关放在一起，方便课中快速切换资源视角。</p>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-room-meta">
                            <div class="lesson-field">
                                <span class="lesson-label">机房 / 座位配置</span>
                                <asp:DropDownList ID="DDLhouse" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLhouse_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-room-tools">
                                <asp:HyperLink ID="HyperLinkSeat" runat="server" Target="_blank" CssClass="lesson-link">座位表</asp:HyperLink>
                                <asp:ImageButton ID="Btnrefresh" runat="server" onclick="Btnrefresh_Click" Enabled="False" ImageUrl="~/images/refresh.gif" CssClass="lesson-refresh" />
                                <asp:HyperLink ID="HylkDiskstu" runat="server" ImageUrl="~/images/disksmallstu.gif" Target="_blank" ToolTip="查看学生网盘存档情况" CssClass="lesson-icon-link"></asp:HyperLink>
                                <asp:HyperLink ID="HylkDiskGroup" runat="server" ImageUrl="~/images/disksmall.gif" Target="_blank" ToolTip="查看小组网盘存档情况" CssClass="lesson-icon-link"></asp:HyperLink>
                            </div>
                        </div>

                        <div class="lesson-toggle-group" style="margin-top: 16px;">
                            <span><asp:CheckBox ID="CheckBoxShare" runat="server" Text="网盘开关" AutoPostBack="True" ToolTip="提示：选中表示网盘启用，未选表示网盘禁用！" oncheckedchanged="CheckBoxShare_CheckedChanged" /></span>
                            <span><asp:CheckBox ID="CheckBoxGroupShare" runat="server" Text="小组网盘" AutoPostBack="True" ToolTip="提示：选中表示小组网盘启用（前提为前面的网盘开关启用），未选表示小组网盘禁用！" oncheckedchanged="CheckBoxGroupShare_CheckedChanged" /></span>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-6">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">学案进度面板</h2>
                            <p class="lesson-card__desc">已学与未学学案拆分显示，并保留发布控制，减少教师判断成本。</p>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div>
                            <div class="lesson-label">已学学案</div>
                            <div class="lesson-course-note">绿色卡片表示本班已有学习痕迹，可继续查看作品量。</div>
                            <div style="margin-top: 12px;">
                                <asp:DataList ID="DLdonekc" runat="server" CssClass="lesson-done-list" ForeColor="Black" RepeatDirection="Horizontal" RepeatLayout="Flow" CellPadding="0" CellSpacing="0" DataKeyField="Cid" onitemdatabound="DLdonekc_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="doneksdiv">
                                            <div><asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="donekc"></asp:HyperLink></div>
                                            <div class="lesson-course-note"><asp:Label ID="wk" runat="server" ToolTip="作品总数"></asp:Label></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>

                        <div style="margin-top: 22px;">
                            <div class="lesson-label">未学学案</div>
                            <div class="lesson-course-note">橙色卡片表示尚未学习，可通过右侧图标切换发布状态。</div>
                            <div style="margin-top: 12px;">
                                <asp:DataList ID="DLnewkc" runat="server" CssClass="lesson-new-list" ForeColor="Black" RepeatDirection="Horizontal" RepeatLayout="Flow" CellPadding="0" CellSpacing="0" DataKeyField="Cid" onitemdatabound="DLnewkc_ItemDataBound" onitemcommand="DLnewkc_ItemCommand">
                                    <ItemTemplate>
                                        <div class="doneksdiv">
                                            <div><asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="newkc"></asp:HyperLink></div>
                                            <div class="lesson-course-note"><asp:CheckBox ID="Ck" runat="server" Checked='<%# Eval("Cpublish") %>' Enabled="False" /></div>
                                            <div style="margin-top: 6px;"><asp:ImageButton runat="server" ID="PubSet" CssClass="lesson-publish-toggle" CommandArgument="Cid" CommandName="P" ImageUrl="~/images/cardsmall.gif" /></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">课堂收尾与安全操作</h2>
                            <p class="lesson-card__desc">保留全班下线与时间校准信息，放到页面底部作为高风险操作区，避免误触。</p>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-footer">
                            <asp:Button ID="BtnaAllQuit" runat="server" Text="全班下线" SkinID="BtnSmall" Visible="False" EnableViewState="False" onclick="BtnaAllQuit_Click" CssClass="lesson-btn" />
                            <div class="lesson-footer__meta">
                                <div><span>操作说明：</span>该操作会让当前上课班级学生全部退出登录，建议仅在下课或课堂重置时使用。</div>
                                <div><span>状态信息：</span>服务器日期与刷新状态已在上方“课堂速览”区域展示。</div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <link href="../js/tooltip.css" rel="stylesheet" type="text/css" />
        <script src="../js/spanToolTip.js" type="text/javascript"></script>
        <script type="text/javascript">
            function myrefresh() {
                document.getElementById("<%= Btnrefresh.ClientID %>").click();
            }
            setTimeout("myrefresh()", 120000);

            function notsg(n, g, m) {
                var urlsg = "../teacher/notsign.aspx?nnum=" + n + "&ngrade=" + g + "&qname=" + m;
                openLessonModal(urlsg, "未签到备注", 300);
            }
            function attitude(q, m, a, c) {
                var urlat = "../teacher/attitude.aspx?qid=" + q + "&qname=" + m + "&qattitude=" + a + "&qcid=" + c;
                openLessonModal(urlat, "学习表现评价", 360);
            }
            function attitudegroup(g, m, q, c) {
                var urlat = "../teacher/attitudegroup.aspx?sg=" + g + "&ld=" + m + "&qd=" + q + "&qcid=" + c;
                openLessonModal(urlat, "小组学习表现评价", 240);
            }
        </script>
    </div>
</asp:Content>
