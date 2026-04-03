<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" enableViewStateMac="false" CodeFile="systeminfo.aspx.cs" Inherits="Teacher_systeminfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .sys-info {
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
            min-height: calc(100vh - 8rem);
            font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        .sys-info * {
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
            border-radius: 1rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(59, 130, 246, 0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #4338ca 52%, #6366f1 100%);
            color: #eff6ff;
            box-shadow: 0 20px 40px rgba(79, 70, 229, 0.15);
        }

        .lesson-hero__content {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .lesson-hero__title {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.02em;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .lesson-hero__subtitle {
            margin: 6px 0 0;
            font-size: 14px;
            color: rgba(239, 246, 255, 0.88);
        }

        .lesson-grid {
            display: grid;
            gap: 20px;
            grid-template-columns: repeat(12, minmax(0, 1fr));
        }

        .lesson-card {
            min-width: 0;
            border: 1px solid var(--ls-border);
            border-radius: 1rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
            display: flex;
            flex-direction: column;
        }

        .lesson-card--span-12 { grid-column: span 12; }
        .lesson-card--span-8 { grid-column: span 8; }
        .lesson-card--span-4 { grid-column: span 4; }

        .lesson-theme--blue { background: linear-gradient(160deg, #ffffff 0%, #f0f7ff 100%); }
        .lesson-theme--teal { background: linear-gradient(160deg, #ffffff 0%, #f0fdfa 100%); }

        .lesson-card__head {
            padding: 20px 24px 16px;
            border-bottom: 1px solid rgba(15, 23, 42, 0.06);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .lesson-card__title {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            color: var(--ls-text);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .lesson-card__body {
            padding: 24px;
            flex: 1;
        }

        .sys-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .sys-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 12px;
            border-bottom: 1px dashed rgba(15, 23, 42, 0.08);
        }

        .sys-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .sys-label {
            font-size: 14px;
            color: var(--ls-muted);
            font-weight: 500;
        }

        .sys-value {
            font-size: 14px;
            font-weight: 700;
            color: var(--ls-text);
            text-align: right;
            word-break: break-all;
        }

        .sys-value--highlight {
            color: var(--ls-primary);
            background: var(--ls-primary-soft);
            padding: 2px 8px;
            border-radius: 6px;
            font-family: monospace;
        }

        .sys-value--success {
            color: #16a34a;
            background: #dcfce7;
            padding: 2px 8px;
            border-radius: 6px;
        }

        .sys-value--warning {
            color: #d97706;
            background: #fef3c7;
            padding: 2px 8px;
            border-radius: 6px;
        }

        .sys-value--danger {
            color: #dc2626;
            background: #fee2e2;
            padding: 2px 8px;
            border-radius: 6px;
            font-family: monospace;
        }

        .sys-grid-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0 40px;
        }

        .action-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 12px 16px;
            margin-top: 12px;
            border-radius: 1rem;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.2s;
        }

        .action-btn--primary {
            background: #eff6ff;
            color: #2563eb;
            border: 1px solid #bfdbfe;
        }

        .action-btn--primary:hover {
            background: #2563eb;
            color: #ffffff;
            border-color: #2563eb;
        }

        .action-btn--success {
            background: #f0fdf4;
            color: #16a34a;
            border: 1px solid #bbf7d0;
        }

        .action-btn--success:hover {
            background: #16a34a;
            color: #ffffff;
            border-color: #16a34a;
        }

        .action-btn--danger {
            display: inline-flex;
            width: auto;
            margin: 0;
            padding: 6px 12px;
            font-size: 12px;
            background: #fee2e2;
            color: #dc2626;
            border: none;
            border-radius: 8px;
        }

        .action-btn--danger:hover {
            background: #dc2626;
            color: #ffffff;
        }

        @media (max-width: 1024px) {
            .lesson-card--span-8,
            .lesson-card--span-4 {
                grid-column: span 12;
            }
            .sys-grid-2 {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 640px) {
            .sys-info {
                padding: 16px;
            }
            .lesson-hero {
                padding: 20px;
            }
            .lesson-hero__title {
                font-size: 20px;
            }
        }
    </style>

    <div class="sys-info">
        <div class="lesson-shell">
            <!-- Dashboard Header -->
            <div class="lesson-hero">
                <div class="lesson-hero__content">
                    <div>
                        <h1 class="lesson-hero__title">
                            <i class="bi bi-server" style="color: #a5b4fc;"></i> 系统信息与统计
                        </h1>
                        <p class="lesson-hero__subtitle">查看服务器实时状态、资源统计及异常日志记录</p>
                    </div>
                </div>
            </div>

            <div class="lesson-grid">
                <!-- 网站分析统计 (Left Column) -->
                <section class="lesson-card lesson-card--span-4 lesson-theme--blue">
                    <div class="lesson-card__head">
                        <h2 class="lesson-card__title">
                            <i class="bi bi-bar-chart-line-fill" style="color: #3b82f6;"></i> 网站分析统计
                        </h2>
                    </div>
                    <div class="lesson-card__body" style="display: flex; flex-direction: column;">
                        <div class="sys-list" style="flex: 1;">
                            <div class="sys-item">
                                <span class="sys-label">学案总数：</span>
                                <span class="sys-value"><asp:Label ID="Label15" runat="server"></asp:Label></span>
                            </div>
                            <div class="sys-item">
                                <span class="sys-label">作品总数：</span>
                                <span class="sys-value"><asp:Label ID="Label16" runat="server"></asp:Label></span>
                            </div>
                            <div class="sys-item">
                                <span class="sys-label">学生总数：</span>
                                <span class="sys-value"><asp:Label ID="Label17" runat="server"></asp:Label></span>
                            </div>
                            <div class="sys-item">
                                <span class="sys-label">签到次数：</span>
                                <span class="sys-value"><asp:Label ID="Label18" runat="server"></asp:Label></span>
                            </div>
                            <div class="sys-item">
                                <span class="sys-label">打字次数：</span>
                                <span class="sys-value"><asp:Label ID="Label19" runat="server"></asp:Label></span>
                            </div>
                            <div class="sys-item">
                                <span class="sys-label">资源总数：</span>
                                <span class="sys-value"><asp:Label ID="Label20" runat="server"></asp:Label></span>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div style="margin-top: 24px;">
                            <asp:HyperLink ID="HLcomputer" runat="server" 
                                NavigateUrl="~/teacher/computers.aspx" CssClass="action-btn action-btn--primary" 
                                EnableTheming="False" EnableViewState="False">机器名 IP 对应表</asp:HyperLink>
                            
                            <asp:HyperLink ID="HLmythware" runat="server" 
                                NavigateUrl="~/teacher/mythware.aspx" CssClass="action-btn action-btn--success" 
                                EnableTheming="False" EnableViewState="False">极域班级模型</asp:HyperLink>
                        </div>
                    </div>
                </section>

                <!-- 服务器状态 (Right Column) -->
                <section class="lesson-card lesson-card--span-8 lesson-theme--teal">
                    <div class="lesson-card__head">
                        <h2 class="lesson-card__title">
                            <i class="bi bi-activity" style="color: #10b981;"></i> 
                            <span><asp:Label ID="Labelcomputer" runat="server"></asp:Label> 服务器状态</span>
                        </h2>
                        <!-- Status indicator dot -->
                        <div style="width: 12px; height: 12px; position: relative;">
                            <div style="position: absolute; width: 100%; height: 100%; border-radius: 50%; background-color: #34d399; opacity: 0.75; animation: ping 1s cubic-bezier(0, 0, 0.2, 1) infinite;"></div>
                            <div style="position: relative; width: 12px; height: 12px; border-radius: 50%; background-color: #10b981;"></div>
                            <style>@keyframes ping { 75%, 100% { transform: scale(2); opacity: 0; } }</style>
                        </div>
                    </div>
                    
                    <div class="lesson-card__body">
                        <div class="sys-grid-2">
                            <!-- Left Details -->
                            <div class="sys-list">
                                <div class="sys-item">
                                    <span class="sys-label">服务器IP：</span>
                                    <div class="sys-value" style="display: flex; align-items: center; gap: 6px; justify-content: flex-end;">
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                        <asp:Image ID="ImageLogin" runat="server" ImageUrl="~/images/green.gif" style="display: none;" />
                                    </div>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">服务器名称：</span>
                                    <span class="sys-value"><asp:Label ID="Label2" runat="server"></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">操作系统：</span>
                                    <span class="sys-value"><asp:Label ID="Label3" runat="server"></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">CPU数：</span>
                                    <span class="sys-value sys-value--highlight"><asp:Label ID="Label4" runat="server"></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">CPU类型：</span>
                                    <span class="sys-value" style="max-width: 180px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><asp:Label ID="Label5" runat="server"></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">信息服务软件：</span>
                                    <span class="sys-value"><asp:Label ID="Label7" runat="server"></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">网站平台版本：</span>
                                    <span class="sys-value sys-value--success"><asp:Label ID="Label6" runat="server"></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">全局变量数：</span>
                                    <span class="sys-value" style="font-family: monospace;"><asp:Label ID="Label23" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            
                            <!-- Right Details -->
                            <div class="sys-list">
                                <div class="sys-item">
                                    <span class="sys-label">.NET引擎版本：</span>
                                    <span class="sys-value sys-value--warning"><asp:Label ID="Label8" runat="server" ></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">脚本超时时间：</span>
                                    <span class="sys-value"><asp:Label ID="Label9" runat="server" ></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">开机运行时长：</span>
                                    <span class="sys-value"><asp:Label ID="Label10" runat="server" ></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">进程开始时间：</span>
                                    <span class="sys-value"><asp:Label ID="Label11" runat="server" ></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">内存占用：</span>
                                    <span class="sys-value sys-value--danger"><asp:Label ID="Label12" runat="server" ></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">CPU时间：</span>
                                    <span class="sys-value" style="font-family: monospace;"><asp:Label ID="Label13" runat="server" ></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">当前线程数：</span>
                                    <span class="sys-value" style="font-family: monospace;"><asp:Label ID="Label14" runat="server" ></asp:Label></span>
                                </div>
                                <div class="sys-item">
                                    <span class="sys-label">Session总数：</span>
                                    <span class="sys-value sys-value--highlight"><asp:Label ID="Label22" runat="server" ></asp:Label></span>
                                </div>
                                <div class="sys-item" style="border-bottom: none; padding-bottom: 0;">
                                    <span class="sys-label">网站异常记录：</span>
                                    <asp:HyperLink ID="HLsitelog" runat="server" 
                                        NavigateUrl="~/teacher/sitelog.aspx" BorderStyle="None" EnableTheming="False" 
                                        EnableViewState="False" Font-Underline="False" Target="_blank" ToolTip="发现异常请及时向温州水乡反溃！" 
                                        CssClass="action-btn--danger">在线日志查询 &rarr;</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>

