<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="courseshow.aspx.cs" Inherits="Teacher_courseshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .course-show-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #1d4ed8 0%, #4338ca 52%, #7c3aed 100%);
            --workspace-primary-bg: #4f46e5;
            --workspace-primary-hover: #4338ca;
            --workspace-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
            --workspace-secondary-bg: #eef2ff;
            --workspace-secondary-hover: #e0e7ff;
            --workspace-secondary-border: #c7d2fe;
            --workspace-secondary-fg: #3730a3;
        }

        .course-show-page a {
            text-decoration: none;
        }

        .course-show-shell {
            gap: 1.25rem;
        }

        .course-show-summary {
            display: grid;
            grid-template-columns: minmax(0, 1.3fr) minmax(280px, 0.7fr);
            gap: 1rem;
        }

        .course-show-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            margin-top: 1rem;
        }

        .course-show-meta-chip {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            min-height: 2.5rem;
            padding: 0.55rem 0.9rem;
            border-radius: 9999px;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.16);
            color: rgba(255, 255, 255, 0.96);
            font-size: 0.92rem;
        }

        .course-show-sidecard {
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            gap: 0.9rem;
            padding: 1rem;
            border-radius: 1.25rem;
            background: rgba(15, 23, 42, 0.18);
            border: 1px solid rgba(255, 255, 255, 0.14);
            backdrop-filter: blur(8px);
        }

        .course-show-sidecard-label {
            margin: 0;
            color: rgba(255, 255, 255, 0.72);
            font-size: 0.82rem;
            letter-spacing: 0.08em;
            text-transform: uppercase;
        }

        .course-show-sidecard-value {
            margin: 0;
            font-size: 1rem;
            line-height: 1.7;
            color: #ffffff;
        }

        .course-show-banner-shell {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 10rem;
            border-radius: 1rem;
            overflow: hidden;
            border: 1px dashed #cbd5e1;
            background: linear-gradient(135deg, #f8fafc 0%, #eef2ff 100%);
        }

        .course-show-banner-image {
            display: block;
            width: 100%;
            height: auto;
            max-height: 18rem;
            object-fit: cover;
        }

        .course-show-banner-empty {
            color: #64748b;
            font-size: 0.94rem;
        }

        .course-show-tools-head,
        .course-show-menu-head,
        .course-show-content-head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 1rem;
            align-items: flex-start;
            margin-bottom: 1.25rem;
        }

        .course-show-tool-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 0.9rem;
        }

        .course-show-tool {
            display: flex;
            align-items: center;
            gap: 0.85rem;
            min-height: 4.25rem;
            padding: 0.95rem 1rem;
            border-radius: 1rem;
            border: 1px solid #dbe4ff;
            background: linear-gradient(180deg, #ffffff 0%, #f8faff 100%);
            color: #1e293b;
            box-shadow: 0 12px 24px -24px rgba(30, 41, 59, 0.55);
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
        }

        .course-show-tool:hover {
            transform: translateY(-2px);
            border-color: #a5b4fc;
            box-shadow: 0 18px 30px -22px rgba(79, 70, 229, 0.45);
        }

        .course-show-tool[disabled],
        .course-show-tool.aspNetDisabled {
            opacity: 0.52;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
            border-style: dashed;
            filter: grayscale(0.12);
        }

        .course-show-tool[disabled] .course-show-tool-subtitle,
        .course-show-tool.aspNetDisabled .course-show-tool-subtitle {
            color: #94a3b8;
        }

        .course-show-edit-btn[disabled],
        .course-show-edit-btn.aspNetDisabled {
            opacity: 0.5;
            filter: grayscale(1);
            cursor: not-allowed;
        }

        .course-show-tool-readonly-note {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            margin-top: 0.75rem;
            padding: 0.55rem 0.75rem;
            border-radius: 0.85rem;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.14);
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.84rem;
        }

        .course-show-tool-readonly-note[hidden] {
            display: none;
        }

        .course-show-tool-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 2.9rem;
            height: 2.9rem;
            border-radius: 0.95rem;
            background: #eef2ff;
            color: #4338ca;
            flex-shrink: 0;
        }

        .course-show-tool-icon svg {
            width: 1.35rem;
            height: 1.35rem;
            stroke: currentColor;
            fill: none;
            stroke-width: 1.9;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .course-show-tool-mission .course-show-tool-icon {
            background: #eef2ff;
            color: #4338ca;
        }

        .course-show-tool-topic .course-show-tool-icon {
            background: #ecfeff;
            color: #0f766e;
        }

        .course-show-tool-exam .course-show-tool-icon {
            background: #fef3c7;
            color: #b45309;
        }

        .course-show-tool-form .course-show-tool-icon {
            background: #dcfce7;
            color: #166534;
        }

        .course-show-tool-block .course-show-tool-icon {
            background: #ede9fe;
            color: #6d28d9;
        }

        .course-show-tool-python .course-show-tool-icon {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .course-show-tool-console .course-show-tool-icon {
            background: #e0f2fe;
            color: #0369a1;
        }

        .course-show-tool-graph .course-show-tool-icon {
            background: #fae8ff;
            color: #a21caf;
        }

        .course-show-tool-pixel .course-show-tool-icon {
            background: #fce7f3;
            color: #be185d;
        }

        .course-show-tool-html .course-show-tool-icon {
            background: #fee2e2;
            color: #b91c1c;
        }

        .course-show-tool-mind .course-show-tool-icon {
            background: #ede9fe;
            color: #7c3aed;
        }

        .course-show-tool-sheet .course-show-tool-icon {
            background: #dcfce7;
            color: #15803d;
        }

        .course-show-tool-ware .course-show-tool-icon {
            background: #e0e7ff;
            color: #3730a3;
        }

        .course-show-tool-copy {
            display: flex;
            flex-direction: column;
            gap: 0.18rem;
            text-align: left;
        }

        .course-show-tool-title {
            font-size: 0.96rem;
            font-weight: 700;
            color: #0f172a;
        }

        .course-show-tool-subtitle {
            font-size: 0.82rem;
            color: #64748b;
        }

        .course-show-menu-hint {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.45rem 0.7rem;
            border-radius: 9999px;
            background: #eef2ff;
            color: #4338ca;
            font-size: 0.84rem;
            font-weight: 600;
        }

        .course-show-menu-toolbar {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: flex-end;
            gap: 0.75rem;
        }

        .course-show-save-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.5rem;
            padding: 0.55rem 1rem;
            border-radius: 0.85rem;
            border: 1px solid #4f46e5;
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            color: #ffffff;
            font-size: 0.9rem;
            font-weight: 700;
            box-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
            transition: opacity 0.2s ease, transform 0.2s ease, box-shadow 0.2s ease;
        }

        .course-show-save-btn[disabled] {
            opacity: 0.55;
            cursor: wait;
        }

        .course-show-save-status {
            min-height: 1.4rem;
            color: #4338ca;
            font-size: 0.84rem;
            font-weight: 600;
            transition: opacity 0.25s ease;
        }

        .course-show-save-status.is-fading {
            opacity: 0;
        }

        .course-show-save-status.is-success {
            color: #15803d;
        }

        .course-show-save-status.is-error {
            color: #b91c1c;
        }

        .course-show-grid {
            table-layout: fixed;
        }

        .course-show-grid .course-show-menu-row {
            transition: background 0.2s ease, transform 0.2s ease;
        }

        .course-show-grid .course-show-menu-row.dragging {
            opacity: 0;
        }

        .course-show-grid .course-show-menu-row.drop-target td {
            background: #eef2ff;
            box-shadow: inset 0 0 0 1px #a5b4fc;
        }

        .course-show-drag-proxy {
            position: fixed;
            left: 0;
            top: 0;
            pointer-events: none;
            z-index: 9999;
            opacity: 0.98;
            transform: translate3d(-9999px, -9999px, 0);
            box-shadow: 0 28px 48px -24px rgba(15, 23, 42, 0.35);
            transition: transform 0.03s linear;
        }

        .course-show-drag-proxy table {
            border-collapse: separate;
            border-spacing: 0;
            background: #ffffff;
            border: 1px solid #c7d2fe;
            border-radius: 1rem;
            overflow: hidden;
        }

        .course-show-drag-proxy td {
            padding: 0.95rem 0.9rem;
            border-bottom: 1px solid #eef2f7;
            background: #ffffff;
            color: #0f172a;
        }

        .course-show-placeholder td {
            padding: 0.35rem 0.9rem;
            background: #eef2ff;
            border-bottom: 1px dashed #a5b4fc;
            box-shadow: inset 0 0 0 1px rgba(99, 102, 241, 0.18);
        }

        .course-show-placeholder-bar {
            height: 0.65rem;
            border-radius: 9999px;
            background: linear-gradient(90deg, #6366f1 0%, #8b5cf6 100%);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.12);
        }

        .course-show-grid .course-show-menu-row.is-hidden td {
            background: #f8fafc;
            color: #94a3b8;
        }

        .course-show-grid .course-show-menu-row.is-hidden .course-show-link,
        .course-show-grid .course-show-menu-row.is-hidden .course-show-type-text {
            color: #64748b;
        }

        .course-show-order-cell {
            width: 7rem;
        }

        .course-show-order-wrap {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .course-show-drag {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 2rem;
            height: 2rem;
            border-radius: 0.7rem;
            border: 1px solid #dbe4ff;
            background: #f8faff;
            color: #64748b;
            cursor: move;
            font-size: 1rem;
            user-select: none;
            touch-action: none;
        }

        .course-show-drag:hover {
            border-color: #a5b4fc;
            background: #eef2ff;
            color: #4338ca;
        }

        .course-show-grid.is-sorting,
        .course-show-grid.is-sorting .course-show-drag {
            cursor: grabbing;
        }

        .course-show-order-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 2.1rem;
            height: 2.1rem;
            padding: 0 0.55rem;
            border-radius: 9999px;
            background: #e0e7ff;
            color: #3730a3;
            font-weight: 700;
        }

        .course-show-type-cell {
            width: 14rem;
        }

        .course-show-type-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            max-width: 100%;
            padding: 0.55rem 0.85rem;
            border-radius: 9999px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
        }

        .course-show-type-icon {
            width: 1.75rem;
            height: 1.75rem;
            object-fit: contain;
            flex-shrink: 0;
        }

        .course-show-type-text {
            font-size: 0.88rem;
            font-weight: 600;
            color: #334155;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .course-show-link {
            display: inline-flex;
            align-items: center;
            gap: 0.55rem;
            color: #0f172a;
            font-size: 0.98rem;
            font-weight: 700;
        }

        .course-show-link:before {
            content: "";
            width: 0.55rem;
            height: 0.55rem;
            border-radius: 9999px;
            background: #6366f1;
            box-shadow: 0 0 0 5px rgba(99, 102, 241, 0.12);
            flex-shrink: 0;
        }

        .course-show-action-group {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }

        .course-show-menu-wrap {
            overflow-x: auto;
        }

        .course-show-mini-btn,
        .course-show-state-btn,
        .course-show-danger-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 2.2rem;
            min-height: 2.2rem;
            padding: 0.4rem 0.75rem;
            border-radius: 0.75rem;
            border: 1px solid #dbe4ff;
            background: #ffffff;
            color: #334155;
            font-size: 0.86rem;
            font-weight: 700;
        }

        .course-show-mini-btn {
            min-width: 3.1rem;
            background: #f8faff;
        }

        .course-show-mini-btn:hover,
        .course-show-state-btn:hover,
        .course-show-danger-btn:hover {
            border-color: #a5b4fc;
            background: #f8faff;
        }

        .course-show-state-btn {
            min-width: 4.8rem;
            color: #166534;
            background: #ecfdf5;
            border-color: #bbf7d0;
        }

        .course-show-state-btn.is-off {
            color: #92400e;
            background: #fffbeb;
            border-color: #fde68a;
        }

        .course-show-danger-btn {
            color: #b91c1c;
            background: #fff1f2;
            border-color: #fecdd3;
        }

        .course-show-content {
            line-height: 1.8;
            color: #1e293b;
        }

        .course-show-content img,
        .course-show-content table,
        .course-show-content iframe,
        .course-show-content video {
            max-width: 100%;
        }

        .course-show-hidden {
            display: none;
        }

        @media (max-width: 1200px) {
            .course-show-tool-grid {
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }
        }

        @media (max-width: 980px) {
            .course-show-summary {
                grid-template-columns: 1fr;
            }

            .course-show-tool-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 768px) {
            .course-show-tool-grid {
                grid-template-columns: 1fr;
            }

            .course-show-order-wrap,
            .course-show-action-group {
                flex-wrap: wrap;
            }

            .course-show-menu-toolbar {
                justify-content: flex-start;
            }

            .course-show-grid {
                min-width: 760px;
            }

            .course-show-type-cell {
                width: 10rem;
            }

            .course-show-type-badge {
                gap: 0.55rem;
                padding: 0.5rem 0.7rem;
            }

            .course-show-link {
                font-size: 0.92rem;
            }

            .course-show-mini-btn,
            .course-show-state-btn,
            .course-show-danger-btn {
                min-height: 2rem;
                padding: 0.36rem 0.65rem;
                font-size: 0.82rem;
            }
        }
    </style>

    <div class="course-show-page">
        <div class="course-show-shell">
            <section class="course-show-hero">
                <div class="course-show-hero-content">
                    <div>
                        <span class="course-show-eyebrow">Course Workspace</span>
                        <asp:Label ID="LabelCtitle" runat="server" CssClass="course-show-title"></asp:Label>
                        <div class="course-show-meta">
                            <span class="course-show-meta-chip">日期 <asp:Label ID="LabelCdate" runat="server"></asp:Label></span>
                            <span class="course-show-meta-chip">分类 <asp:Label ID="LabelCclass" runat="server"></asp:Label></span>
                            <span class="course-show-meta-chip">年级 <asp:Label ID="LabelCobj" runat="server"></asp:Label></span>
                            <span class="course-show-meta-chip">学期 第 <asp:Label ID="LabelCterm" runat="server"></asp:Label> 学期</span>
                            <span class="course-show-meta-chip">课节 第 <asp:Label ID="LabelCks" runat="server"></asp:Label> 课</span>
                        </div>
                    </div>
                    <div class="course-show-sidecard">
                        <p class="course-show-sidecard-label">页面操作</p>
                        <p class="course-show-sidecard-value">保留原有学案编辑、返回、栏目管理与发布逻辑，当前页面仅重构为更清晰的教师工作台布局。</p>
                        <span id="ReadonlyNote" class="course-show-tool-readonly-note" runat="server" hidden="hidden">当前为旧版学案视图，部分新增与编辑入口已按原逻辑禁用</span>
                        <div class="course-show-action-group">
                            <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/edit.gif" ToolTip="点击修改" OnClick="BtnEdit_Click" CssClass="course-primary-btn course-show-edit-btn" AlternateText="编辑学案" />
                            <asp:LinkButton ID="LinkBtnReturn" runat="server" OnClick="LinkBtnReturn_Click" CssClass="course-secondary-btn course-show-return-btn" title="返回">返回列表</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </section>

            <div class="course-show-summary">
                <section class="course-show-banner">
                    <div class="course-show-content-head">
                        <div>
                            <h2 class="course-show-section-title">课程横幅</h2>
                            <p class="course-show-section-desc">沿用原有课程横幅数据展示，未配置时显示默认占位。</p>
                        </div>
                    </div>
                    <div class="course-show-banner-shell">
                        <asp:Image ID="Imagebanner" runat="server" CssClass="course-show-banner-image" ToolTip="横幅图片" />
                        <span id="BannerEmpty" class="course-show-banner-empty" runat="server">当前学案未设置横幅图片</span>
                    </div>
                </section>

                <section class="course-show-content-panel">
                    <div class="course-show-content-head">
                        <div>
                            <h2 class="course-show-section-title">学案概览</h2>
                            <p class="course-show-section-desc">正文内容继续使用原有富文本输出，只调整外部容器与阅读节奏。</p>
                        </div>
                    </div>
                    <div id="Ccontent" class="course-show-content" runat="server"></div>
                </section>
            </div>

            <section class="course-show-tools">
                <div class="course-show-tools-head">
                    <div>
                        <h2 class="course-show-section-title">添加课堂内容</h2>
                        <p class="course-show-section-desc">所有入口仍然对应原有新增页面与跳转参数，仅升级为图标化操作卡片。</p>
                    </div>
                </div>

                <div class="course-show-tool-grid">
                    <asp:LinkButton ID="LinkBtnAdd" runat="server" OnClick="LinkBtnAdd_Click" CssClass="course-show-tool course-show-tool-mission" title="学习活动">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 3l7 4v5c0 5-3.5 7.5-7 9-3.5-1.5-7-4-7-9V7l7-4z"></path><path d="M9.5 12l1.8 1.8 3.7-4.3"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">添加活动</span><span class="course-show-tool-subtitle">学习活动 / 任务</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnAddTopic" runat="server" OnClick="LinkBtnAddTopic_Click" CssClass="course-show-tool course-show-tool-topic" title="课堂讨论板">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M4 6.5a3.5 3.5 0 0 1 3.5-3.5h9A3.5 3.5 0 0 1 20 6.5v5A3.5 3.5 0 0 1 16.5 15H10l-4 4v-4.5A3.5 3.5 0 0 1 4 11.5z"></path><path d="M8 8h8"></path><path d="M8 11h5"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">添加讨论</span><span class="course-show-tool-subtitle">讨论区 / 互动</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonAddExam" runat="server" OnClick="LinkBtnAddExam_Click" CssClass="course-show-tool course-show-tool-exam" title="课堂测验">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8 3h8"></path><path d="M9 3v4"></path><path d="M15 3v4"></path><rect x="4" y="7" width="16" height="14" rx="2"></rect><path d="M8 12h8"></path><path d="M8 16h5"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">添加测验</span><span class="course-show-tool-subtitle">课堂测验 / 反馈</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnAddTxtForm" runat="server" OnClick="LinkBtnAddTxtForm_Click" CssClass="course-show-tool course-show-tool-form" title="表格填写">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="4" y="3" width="16" height="18" rx="2"></rect><path d="M8 8h8"></path><path d="M8 12h8"></path><path d="M8 16h5"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">添加填表</span><span class="course-show-tool-subtitle">表单 / 采集</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnProgram" runat="server" OnClick="LinkBtnProgram_Click" CssClass="course-show-tool course-show-tool-block" title="Scratch积木编程">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8 4h4a2 2 0 0 1 2 2v1h2a2 2 0 0 1 2 2v3h-3a2 2 0 1 0 0 4h3v3a2 2 0 0 1-2 2h-4v-3H8a2 2 0 0 1-2-2v-4h3a2 2 0 1 0 0-4H6V6a2 2 0 0 1 2-2z"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">积木编程</span><span class="course-show-tool-subtitle">Scratch / Block</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnPython" runat="server" OnClick="LinkBtnPython_Click" CssClass="course-show-tool course-show-tool-python" title="在线Python编程">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M9 4h4a3 3 0 0 1 3 3v2H9a2 2 0 0 0-2 2v2"></path><path d="M15 20h-4a3 3 0 0 1-3-3v-2h7a2 2 0 0 0 2-2v-2"></path><path d="M9 6h.01"></path><path d="M15 18h.01"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">Python编程</span><span class="course-show-tool-subtitle">代码 / 编写</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnConsole" runat="server" OnClick="LinkBtnConsole_Click" CssClass="course-show-tool course-show-tool-console" title="在线Python测评">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="3" y="4" width="18" height="14" rx="2"></rect><path d="M7 8l3 3-3 3"></path><path d="M13 14h4"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">Python测评</span><span class="course-show-tool-subtitle">自动评测</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonGraph" runat="server" OnClick="LinkBtnGraph_Click" CssClass="course-show-tool course-show-tool-graph" title="在线流程图">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="4" y="4" width="6" height="4" rx="1"></rect><rect x="14" y="10" width="6" height="4" rx="1"></rect><rect x="4" y="16" width="6" height="4" rx="1"></rect><path d="M10 6h4"></path><path d="M17 10V8H7v8"></path><path d="M10 18h4"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">流程图</span><span class="course-show-tool-subtitle">图形化表达</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonPixel" runat="server" OnClick="LinkButtonPixel_Click" CssClass="course-show-tool course-show-tool-pixel" title="在线应用">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M7 4h3v3H7z"></path><path d="M11 4h3v3h-3z"></path><path d="M15 4h3v3h-3z"></path><path d="M7 8h3v3H7z"></path><path d="M11 8h3v3h-3z"></path><path d="M15 8h3v3h-3z"></path><path d="M7 12h3v3H7z"></path><path d="M11 12h3v3h-3z"></path><path d="M15 12h3v3h-3z"></path><path d="M11 16h3v3h-3z"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">主题应用</span><span class="course-show-tool-subtitle">主题实验 / 创作</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonHtml" runat="server" OnClick="LinkButtonHtml_Click" CssClass="course-show-tool course-show-tool-html" title="单网页设计">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8 9l-3 3 3 3"></path><path d="M16 9l3 3-3 3"></path><path d="M14 5l-4 14"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">Html网页</span><span class="course-show-tool-subtitle">网页设计</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonKm" runat="server" OnClick="LinkButtonKm_Click" CssClass="course-show-tool course-show-tool-mind" title="在线思维导图">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="12" r="2.5"></circle><path d="M12 4v3"></path><path d="M12 17v3"></path><path d="M4 12h3"></path><path d="M17 12h3"></path><path d="M6.8 6.8l2.1 2.1"></path><path d="M15.1 15.1l2.1 2.1"></path><path d="M17.2 6.8l-2.1 2.1"></path><path d="M8.9 15.1l-2.1 2.1"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">思维导图</span><span class="course-show-tool-subtitle">脑图 / 梳理</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonExcel" runat="server" OnClick="LinkButtonExcel_Click" CssClass="course-show-tool course-show-tool-sheet" title="在线表格">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="4" y="4" width="16" height="16" rx="2"></rect><path d="M9 4v16"></path><path d="M15 4v16"></path><path d="M4 9h16"></path><path d="M4 15h16"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">在线表格</span><span class="course-show-tool-subtitle">数据 / 表格</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonware" runat="server" OnClick="LinkButtonware_Click" CssClass="course-show-tool course-show-tool-ware" title="嵌入网页小课件">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="3" y="5" width="18" height="12" rx="2"></rect><path d="M8 21h8"></path><path d="M12 17v4"></path><path d="M7 9h10"></path><path d="M7 13h6"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">网页课件</span><span class="course-show-tool-subtitle">嵌入课件</span></span>
                    </asp:LinkButton>
                </div>
            </section>

            <section class="course-show-menu-panel">
                <div class="course-show-menu-head">
                    <div>
                        <h2 class="course-show-section-title">导航栏目</h2>
                        <p class="course-show-section-desc">保留原有跳转、上移、下移、发布与删除逻辑，并新增拖拽排序能力。</p>
                    </div>
                    <div class="course-show-menu-toolbar">
                        <span class="course-show-menu-hint">可拖动左侧手柄调整顺序</span>
                        <button id="MenuSortSaveButton" type="button" class="course-show-save-btn" style="display:none;">保存排序</button>
                    </div>
                </div>

                <asp:HiddenField ID="HiddenSortOrder" runat="server" />
                <asp:HiddenField ID="HiddenCourseId" runat="server" />
                <asp:Button ID="BtnApplySort" runat="server" Text="apply sort" CssClass="course-show-hidden" OnClick="BtnApplySort_Click" />
                <div id="MenuSortStatus" class="course-show-save-status"></div>

                <div class="course-show-menu-wrap">
                    <asp:GridView ID="GVlistmenu" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" OnRowCommand="GVlistmenu_RowCommand" OnRowDataBound="GVlistmenu_RowDataBound" CssClass="course-show-grid" GridLines="None">
                        <Columns>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="LabelLid" runat="server" Text='<%# Bind("Lid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="LabelLxid" runat="server" Text='<%# Bind("Lxid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="LabelLtype" runat="server" Text='<%# Bind("Ltype") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="顺序" ItemStyle-CssClass="course-show-order-cell">
                                <ItemTemplate>
                                    <div class="course-show-order-wrap">
                                        <span class="course-show-drag" title="拖动排序">::</span>
                                        <span class="course-show-order-badge"><asp:Label ID="LabelLsort" runat="server" Text='<%# Bind("Lsort") %>'></asp:Label></span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="类型" ItemStyle-CssClass="course-show-type-cell">
                                <ItemTemplate>
                                    <span class="course-show-type-badge">
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/new_none.gif" CssClass="course-show-type-icon" />
                                        <asp:Label ID="Label4" runat="server" CssClass="course-show-type-text"></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="导航栏目">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HlLtitle" runat="server" NavigateUrl="" Text='<%# Eval("Ltitle") %>' CssClass="course-show-link"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="位置">
                                <ItemTemplate>
                                    <div class="course-show-action-group">
                                        <asp:LinkButton ID="ImageBtnTop" runat="server" CausesValidation="False" CommandName="Top" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' Text="上" ToolTip="向上移" Font-Underline="False" CssClass="course-show-mini-btn"></asp:LinkButton>
                                        <asp:LinkButton ID="ImageBtnBottom" runat="server" CausesValidation="False" CommandName="Bottom" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' Text="下" ToolTip="向下移" Font-Underline="False" CssClass="course-show-mini-btn"></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="发布">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkBtnShow" runat="server" CausesValidation="false" CommandName="P" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' Text='<%# Eval("lshow") %>' ToolTip="True显示，False隐藏" CssClass="course-show-state-btn"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkBtnDel" runat="server" CausesValidation="false" CommandName="D" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' Text="删除" ToolTip="请认真确定是否删除，不可恢复！" CssClass="course-show-danger-btn"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </section>
        </div>
    </div>

    <script type="text/javascript">
        (function () {
            function initDragSort() {
                var table = document.getElementById('<%= GVlistmenu.ClientID %>');
                if (!table || !table.tBodies || !table.tBodies.length) {
                    return;
                }

                var tbody = table.tBodies[0];
                var activeRow = null;
                var dragProxy = null;
                var placeholder = null;
                var dragOffsetY = 0;
                var startOrder = '';
                var lastClientY = 0;
                var rafId = 0;
                var moveHandler = null;
                var endHandler = null;
                var currentOrderValue = '';
                var isDirty = false;
                var isSaving = false;
                var saveButton = document.getElementById('MenuSortSaveButton');
                var statusNode = document.getElementById('MenuSortStatus');
                var hiddenOrder = document.getElementById('<%= HiddenSortOrder.ClientID %>');
                var courseIdField = document.getElementById('<%= HiddenCourseId.ClientID %>');
                var saveButtonDefaultText = saveButton ? (saveButton.innerHTML || '保存排序') : '保存排序';
                var statusTimer = 0;

                function getRows() {
                    return Array.prototype.slice.call(tbody.rows || []).filter(function (row) {
                        return row.getAttribute('data-lid');
                    });
                }

                function getOrder() {
                    var rows = getRows();
                    var order = [];
                    for (var i = 0; i < rows.length; i++) {
                        var lid = rows[i].getAttribute('data-lid');
                        if (lid) {
                            order.push(lid);
                        }
                    }
                    return order;
                }

                function setStatus(message, statusClass) {
                    if (!statusNode) {
                        return;
                    }

                    if (statusTimer) {
                        window.clearTimeout(statusTimer);
                        statusTimer = 0;
                    }

                    statusNode.className = 'course-show-save-status' + (statusClass ? ' ' + statusClass : '');
                    statusNode.innerHTML = message || '';

                    if (statusClass === 'is-success' && message) {
                        statusTimer = window.setTimeout(function () {
                            statusNode.className = 'course-show-save-status is-success is-fading';
                            window.setTimeout(function () {
                                if (!isDirty) {
                                    statusNode.className = 'course-show-save-status';
                                    statusNode.innerHTML = '';
                                }
                            }, 280);
                        }, 1600);
                    }
                }

                function setSaveButtonState(saving) {
                    if (!saveButton) {
                        return;
                    }

                    saveButton.disabled = saving;
                    saveButton.innerHTML = saving ? '保存中...' : saveButtonDefaultText;
                }

                function setDirtyState(dirty) {
                    isDirty = dirty;
                    currentOrderValue = getOrder().join(',');
                    if (hiddenOrder) {
                        hiddenOrder.value = currentOrderValue;
                    }

                    if (saveButton) {
                        saveButton.style.display = dirty ? 'inline-flex' : 'none';
                        setSaveButtonState(false);
                    }

                    if (!dirty) {
                        setStatus('', '');
                    } else {
                        setStatus('顺序已调整，点击保存后生效', '');
                    }
                }

                function updateSortBadges() {
                    var rows = getRows();
                    for (var i = 0; i < rows.length; i++) {
                        var label = rows[i].querySelector ? rows[i].querySelector('[id$="LabelLsort"]') : null;
                        if (label) {
                            if (typeof label.textContent !== 'undefined') {
                                label.textContent = String(i + 1);
                            } else {
                                label.innerText = String(i + 1);
                            }
                        }
                    }
                }

                function getScrollHost() {
                    var node = table;
                    while (node && node !== document.body) {
                        if (node.className && String(node.className).indexOf('custom-scrollbar') > -1) {
                            return node;
                        }
                        node = node.parentNode;
                    }
                    return null;
                }

                function clearDropTargets() {
                    getRows().forEach(function (row) {
                        row.className = row.className.replace(/\s?drop-target/g, '');
                    });
                }

                function removeProxy() {
                    if (dragProxy && dragProxy.parentNode) {
                        dragProxy.parentNode.removeChild(dragProxy);
                    }
                    dragProxy = null;
                }

                function removePlaceholder() {
                    if (placeholder && placeholder.parentNode) {
                        placeholder.parentNode.removeChild(placeholder);
                    }
                    placeholder = null;
                }

                function syncColumnWidths(sourceRow, targetRow) {
                    var sourceCells = sourceRow.cells || [];
                    var targetCells = targetRow.cells || [];
                    var count = Math.min(sourceCells.length, targetCells.length);
                    for (var i = 0; i < count; i++) {
                        targetCells[i].style.width = sourceCells[i].offsetWidth + 'px';
                    }
                }

                function createProxy(row) {
                    removeProxy();
                    var wrapper = document.createElement('div');
                    wrapper.className = 'course-show-drag-proxy';
                    var rowRect = row.getBoundingClientRect();
                    wrapper.style.width = rowRect.width + 'px';

                    var proxyTable = document.createElement('table');
                    proxyTable.className = table.className.replace(/\s?is-sorting/g, '');
                    proxyTable.style.width = rowRect.width + 'px';
                    proxyTable.style.maxWidth = rowRect.width + 'px';
                    proxyTable.style.tableLayout = 'fixed';

                    var proxyBody = document.createElement('tbody');
                    var cloneRow = row.cloneNode(true);
                    cloneRow.className = cloneRow.className.replace(/\s?dragging/g, '');
                    syncColumnWidths(row, cloneRow);
                    proxyBody.appendChild(cloneRow);
                    proxyTable.appendChild(proxyBody);
                    wrapper.appendChild(proxyTable);
                    document.body.appendChild(wrapper);
                    dragProxy = wrapper;
                }

                function createPlaceholder(row) {
                    removePlaceholder();
                    var holder = document.createElement('tr');
                    holder.className = 'course-show-placeholder';
                    var cell = document.createElement('td');
                    cell.colSpan = row.cells.length;
                    cell.style.height = row.offsetHeight + 'px';
                    var bar = document.createElement('div');
                    bar.className = 'course-show-placeholder-bar';
                    cell.appendChild(bar);
                    holder.appendChild(cell);
                    placeholder = holder;
                }

                function moveProxy(clientY) {
                    if (!dragProxy || !activeRow) {
                        return;
                    }
                    var rect = activeRow.getBoundingClientRect();
                    dragProxy.style.transform = 'translate3d(' + rect.left + 'px,' + (clientY - dragOffsetY) + 'px,0)';
                }

                function movePlaceholder(clientY) {
                    if (!placeholder || !activeRow) {
                        return;
                    }

                    var rows = getRows().filter(function (row) {
                        return row !== activeRow;
                    });

                    for (var i = 0; i < rows.length; i++) {
                        var rect = rows[i].getBoundingClientRect();
                        if (clientY < rect.top + rect.height / 2) {
                            tbody.insertBefore(placeholder, rows[i]);
                            return;
                        }
                    }

                    tbody.appendChild(placeholder);
                }

                function updateDropTargets() {
                    clearDropTargets();
                    if (!placeholder) {
                        return;
                    }

                    var nextRow = placeholder.nextSibling;
                    var prevRow = placeholder.previousSibling;
                    var targetRow = nextRow && nextRow.getAttribute && nextRow.getAttribute('data-lid') ? nextRow : prevRow;
                    if (targetRow && targetRow.getAttribute && targetRow.getAttribute('data-lid')) {
                        targetRow.className += ' drop-target';
                    }
                }

                function applyRowMove() {
                    if (!activeRow || !placeholder || !placeholder.parentNode) {
                        return;
                    }
                    tbody.insertBefore(activeRow, placeholder);
                    updateSortBadges();
                }

                function autoScroll(clientY) {
                    var host = getScrollHost();
                    var edge = 72;
                    var step = 18;

                    if (host) {
                        var hostRect = host.getBoundingClientRect();
                        if (clientY < hostRect.top + edge) {
                            host.scrollTop -= step;
                        } else if (clientY > hostRect.bottom - edge) {
                            host.scrollTop += step;
                        }
                    } else {
                        if (clientY < edge) {
                            window.scrollBy(0, -step);
                        } else if (clientY > window.innerHeight - edge) {
                            window.scrollBy(0, step);
                        }
                    }
                }

                function bindActiveEvents() {
                    if (!moveHandler) {
                        moveHandler = function (ev) {
                            if (!activeRow) {
                                return;
                            }

                            ev = ev || window.event;
                            if (ev.preventDefault && ev.touches) {
                                ev.preventDefault();
                            }
                            handlePointerMove(getClientY(ev));
                        };
                    }

                    if (!endHandler) {
                        endHandler = function () {
                            finishDrag();
                        };
                    }

                    if (document.addEventListener) {
                        document.addEventListener('mousemove', moveHandler, false);
                        document.addEventListener('mouseup', endHandler, false);
                        document.addEventListener('touchmove', moveHandler, false);
                        document.addEventListener('touchend', endHandler, false);
                        document.addEventListener('touchcancel', endHandler, false);
                    } else if (document.attachEvent) {
                        document.attachEvent('onmousemove', moveHandler);
                        document.attachEvent('onmouseup', endHandler);
                    }
                }

                function unbindActiveEvents() {
                    if (document.removeEventListener) {
                        if (moveHandler) {
                            document.removeEventListener('mousemove', moveHandler, false);
                            document.removeEventListener('touchmove', moveHandler, false);
                        }
                        if (endHandler) {
                            document.removeEventListener('mouseup', endHandler, false);
                            document.removeEventListener('touchend', endHandler, false);
                            document.removeEventListener('touchcancel', endHandler, false);
                        }
                    } else if (document.detachEvent) {
                        if (moveHandler) {
                            document.detachEvent('onmousemove', moveHandler);
                        }
                        if (endHandler) {
                            document.detachEvent('onmouseup', endHandler);
                        }
                    }
                }

                function handlePointerMove(clientY) {
                    lastClientY = clientY;
                    if (rafId) {
                        return;
                    }

                    rafId = window.requestAnimationFrame(function () {
                        rafId = 0;
                        moveProxy(lastClientY);
                        movePlaceholder(lastClientY);
                        updateDropTargets();
                        applyRowMove();
                        autoScroll(lastClientY);
                    });
                }

                function saveSort() {
                    if (!isDirty || isSaving) {
                        return;
                    }

                    var cid = courseIdField ? courseIdField.value : '';
                    var orderValue = currentOrderValue || getOrder().join(',');
                    if (!cid || !orderValue) {
                        setStatus('保存失败，缺少排序数据', 'is-error');
                        return;
                    }

                    isSaving = true;
                    setSaveButtonState(true);
                    setStatus('正在保存排序...', '');

                    if (!window.jQuery || !jQuery.ajax) {
                        isSaving = false;
                        setSaveButtonState(false);
                        setStatus('保存失败，页面缺少 AJAX 支持', 'is-error');
                        return;
                    }

                    jQuery.ajax({
                        type: 'POST',
                        url: 'courseshow.aspx/SaveSort',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: JSON.stringify({ cid: cid, order: orderValue }),
                        success: function (response) {
                            isSaving = false;
                            var ok = response && response.d === true;
                            setSaveButtonState(false);

                            if (ok) {
                                setDirtyState(false);
                                setStatus('排序已保存', 'is-success');
                            } else {
                                setStatus('保存失败，请重试', 'is-error');
                            }
                        },
                        error: function () {
                            isSaving = false;
                            setSaveButtonState(false);
                            setStatus('保存失败，请检查网络后重试', 'is-error');
                        }
                    });
                }

                function startDrag(row, clientY) {
                    activeRow = row;
                    startOrder = getOrder().join(',');
                    dragOffsetY = Math.max(16, clientY - row.getBoundingClientRect().top);
                    table.className += ' is-sorting';
                    row.className += ' dragging';
                    createProxy(row);
                    createPlaceholder(row);
                    tbody.insertBefore(placeholder, row.nextSibling);
                    moveProxy(clientY);
                    bindActiveEvents();
                }

                function finishDrag() {
                    if (!activeRow) {
                        return;
                    }

                    if (rafId) {
                        window.cancelAnimationFrame(rafId);
                        rafId = 0;
                    }

                    activeRow.className = activeRow.className.replace(/\s?dragging/g, '');
                    clearDropTargets();
                    table.className = table.className.replace(/\s?is-sorting/g, '');
                    removeProxy();
                    removePlaceholder();
                    unbindActiveEvents();

                    var currentOrder = getOrder().join(',');
                    if (startOrder && currentOrder && startOrder !== currentOrder) {
                        updateSortBadges();
                        setDirtyState(true);
                    }

                    activeRow = null;
                    startOrder = '';
                }

                function getClientY(ev) {
                    if (typeof ev.clientY === 'number') {
                        return ev.clientY;
                    }
                    if (ev.touches && ev.touches.length) {
                        return ev.touches[0].clientY;
                    }
                    if (ev.changedTouches && ev.changedTouches.length) {
                        return ev.changedTouches[0].clientY;
                    }
                    return 0;
                }

                function bindRow(row) {
                    if (!row || !row.getAttribute('data-lid')) {
                        return;
                    }

                    var handle = row.querySelector ? row.querySelector('.course-show-drag') : null;
                    if (!handle) {
                        return;
                    }

                    handle.onmousedown = function (ev) {
                        ev = ev || window.event;
                        if (ev.preventDefault) {
                            ev.preventDefault();
                        }
                        startDrag(row, getClientY(ev));
                        return false;
                    };

                    handle.ontouchstart = function (ev) {
                        ev = ev || window.event;
                        if (ev.preventDefault) {
                            ev.preventDefault();
                        }
                        startDrag(row, getClientY(ev));
                        return false;
                    };
                }

                getRows().forEach(bindRow);
                updateSortBadges();
                currentOrderValue = getOrder().join(',');
                if (hiddenOrder) {
                    hiddenOrder.value = currentOrderValue;
                }

                if (saveButton) {
                    saveButton.onclick = function () {
                        saveSort();
                        return false;
                    };
                }

                if (window.addEventListener) {
                    window.addEventListener('beforeunload', function (ev) {
                        if (!isDirty) {
                            return;
                        }

                        var message = '当前排序尚未保存，离开页面将丢失本次调整。';
                        if (ev) {
                            ev.returnValue = message;
                        }
                        return message;
                    }, false);
                } else if (window.attachEvent) {
                    window.attachEvent('onbeforeunload', function () {
                        if (!isDirty) {
                            return;
                        }
                        return '当前排序尚未保存，离开页面将丢失本次调整。';
                    });
                }
            }

            if (window.addEventListener) {
                window.addEventListener('load', initDragSort, false);
            } else if (window.attachEvent) {
                window.attachEvent('onload', initDragSort);
            }
        })();
    </script>
</asp:Content>
