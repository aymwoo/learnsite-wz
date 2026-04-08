<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" enableViewStateMac="false" CodeFile="systeminfo.aspx.cs" Inherits="Teacher_systeminfo" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    

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

