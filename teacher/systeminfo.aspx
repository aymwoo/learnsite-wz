<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" enableViewStateMac="false" CodeFile="systeminfo.aspx.cs" Inherits="Teacher_systeminfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full mx-auto p-4 sm:p-6 space-y-6 font-sans text-slate-800">
        <!-- Dashboard Header -->
        <div class="bg-white rounded-2xl shadow-[0_4px_20px_rgba(0,0,0,0.03)] border border-slate-200 overflow-hidden border-t-4 border-t-indigo-500">
            <div class="px-6 py-5 bg-gradient-to-r from-slate-50 to-white flex flex-col sm:flex-row items-center justify-between gap-4">
                <div>
                    <h1 class="text-[16px] font-extrabold text-slate-800 flex items-center gap-2">
                        <i class="bi bi-server text-indigo-600"></i> 系统信息与统计
                    </h1>
                    <p class="text-[13px] text-slate-500 mt-1.5">查看服务器实时状态、资源统计及异常日志记录</p>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- 网站分析统计 (Left Column) -->
            <div class="col-span-1 flex flex-col gap-6">
                <div class="bg-white rounded-2xl shadow-[0_4px_20px_rgba(0,0,0,0.03)] border border-slate-200 overflow-hidden">
                    <div class="px-5 py-4 border-b border-slate-100 bg-slate-50/50">
                        <h2 class="font-bold text-slate-700 flex items-center gap-2">
                            <i class="bi bi-bar-chart-line-fill text-indigo-500"></i> 网站分析统计
                        </h2>
                    </div>
                    <div class="p-5 flex flex-col gap-4">
                        <div class="flex justify-between items-center pb-2 border-b border-slate-50">
                            <span class="text-slate-500 text-sm">学案总数：</span>
                            <span class="font-semibold text-slate-800"><asp:Label ID="Label15" runat="server"></asp:Label></span>
                        </div>
                        <div class="flex justify-between items-center pb-2 border-b border-slate-50">
                            <span class="text-slate-500 text-sm">作品总数：</span>
                            <span class="font-semibold text-slate-800"><asp:Label ID="Label16" runat="server"></asp:Label></span>
                        </div>
                        <div class="flex justify-between items-center pb-2 border-b border-slate-50">
                            <span class="text-slate-500 text-sm">学生总数：</span>
                            <span class="font-semibold text-slate-800"><asp:Label ID="Label17" runat="server"></asp:Label></span>
                        </div>
                        <div class="flex justify-between items-center pb-2 border-b border-slate-50">
                            <span class="text-slate-500 text-sm">签到次数：</span>
                            <span class="font-semibold text-slate-800"><asp:Label ID="Label18" runat="server"></asp:Label></span>
                        </div>
                        <div class="flex justify-between items-center pb-2 border-b border-slate-50">
                            <span class="text-slate-500 text-sm">打字次数：</span>
                            <span class="font-semibold text-slate-800"><asp:Label ID="Label19" runat="server"></asp:Label></span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-slate-500 text-sm">资源总数：</span>
                            <span class="font-semibold text-slate-800"><asp:Label ID="Label20" runat="server"></asp:Label></span>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="flex flex-col gap-3">
                    <asp:HyperLink ID="HLcomputer" runat="server" 
                        NavigateUrl="~/teacher/computers.aspx" CssClass="w-full px-4 py-3 bg-indigo-50 border border-indigo-100 text-indigo-600 rounded-xl hover:bg-indigo-600 hover:text-white hover:border-indigo-600 transition-all duration-300 shadow-sm text-center font-medium" 
                        EnableTheming="False" EnableViewState="False">机器名 IP 对应表</asp:HyperLink>
                    
                    <asp:HyperLink ID="HLmythware" runat="server" 
                        NavigateUrl="~/teacher/mythware.aspx" CssClass="w-full px-4 py-3 bg-emerald-50 border border-emerald-100 text-emerald-600 rounded-xl hover:bg-emerald-600 hover:text-white hover:border-emerald-600 transition-all duration-300 shadow-sm text-center font-medium" 
                        EnableTheming="False" EnableViewState="False">极域班级模型</asp:HyperLink>
                </div>
            </div>

            <!-- 服务器状态 (Right Column) -->
            <div class="col-span-1 lg:col-span-2">
                <div class="bg-white rounded-2xl shadow-[0_4px_20px_rgba(0,0,0,0.03)] border border-slate-200 overflow-hidden h-full">
                    <div class="px-5 py-4 border-b border-slate-100 bg-slate-50/50 flex items-center justify-between">
                        <h2 class="font-bold text-slate-700 flex items-center gap-2">
                            <i class="bi bi-activity text-emerald-500"></i> <span><asp:Label ID="Labelcomputer" runat="server"></asp:Label> 服务器状态</span>
                        </h2>
                        <span class="flex h-3 w-3 relative">
                            <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                            <span class="relative inline-flex rounded-full h-3 w-3 bg-emerald-500"></span>
                        </span>
                    </div>
                    
                    <div class="p-0 sm:p-2">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-0 sm:gap-x-8 sm:gap-y-1">
                            <!-- Left Details -->
                            <div class="flex flex-col">
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">服务器IP：</span>
                                    <div class="flex items-center gap-1.5 font-medium text-slate-700 text-sm">
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                        <asp:Image ID="ImageLogin" runat="server" ImageUrl="~/images/green.gif" CssClass="hidden" />
                                    </div>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">服务器名称：</span>
                                    <span class="font-medium text-slate-700 text-sm break-all text-right"><asp:Label ID="Label2" runat="server"></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">操作系统：</span>
                                    <span class="font-medium text-slate-700 text-sm text-right"><asp:Label ID="Label3" runat="server"></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">CPU数：</span>
                                    <span class="font-mono text-indigo-600 bg-indigo-50 px-2 py-0.5 rounded text-sm"><asp:Label ID="Label4" runat="server"></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">CPU类型：</span>
                                    <span class="font-medium text-slate-700 text-sm truncate max-w-[150px] text-right"><asp:Label ID="Label5" runat="server"></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">信息服务软件：</span>
                                    <span class="font-medium text-slate-700 text-sm"><asp:Label ID="Label7" runat="server"></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100 sm:border-b-0">
                                    <span class="text-slate-500 text-sm">网站平台版本：</span>
                                    <span class="font-medium text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded text-sm"><asp:Label ID="Label6" runat="server"></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100 sm:border-b-0">
                                    <span class="text-slate-500 text-sm">全局变量数：</span>
                                    <span class="font-mono text-slate-700 text-sm"><asp:Label ID="Label23" runat="server"></asp:Label></span>
                                </div>
                            </div>
                            <!-- Right Details -->
                            <div class="flex flex-col">
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">.NET引擎版本：</span>
                                    <span class="font-medium text-amber-600 bg-amber-50 px-2 py-0.5 rounded text-sm"><asp:Label ID="Label8" runat="server" ></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">脚本超时时间：</span>
                                    <span class="font-medium text-slate-700 text-sm"><asp:Label ID="Label9" runat="server" ></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">开机运行时长：</span>
                                    <span class="font-medium text-slate-700 text-sm"><asp:Label ID="Label10" runat="server" ></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">进程开始时间：</span>
                                    <span class="font-medium text-slate-700 text-sm"><asp:Label ID="Label11" runat="server" ></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">内存占用：</span>
                                    <span class="font-mono text-rose-600 bg-rose-50 px-2 py-0.5 rounded text-sm"><asp:Label ID="Label12" runat="server" ></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">CPU时间：</span>
                                    <span class="font-mono text-slate-700 text-sm"><asp:Label ID="Label13" runat="server" ></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">当前线程数：</span>
                                    <span class="font-mono text-slate-700 text-sm"><asp:Label ID="Label14" runat="server" ></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3 border-b border-slate-100">
                                    <span class="text-slate-500 text-sm">Session总数：</span>
                                    <span class="font-mono text-sky-600 bg-sky-50 px-2 py-0.5 rounded text-sm"><asp:Label ID="Label22" runat="server" ></asp:Label></span>
                                </div>
                                <div class="flex items-center justify-between p-3">
                                    <span class="text-slate-500 text-sm shrink-0">网站异常记录：</span>
                                    <asp:HyperLink ID="HLsitelog" runat="server" 
                                        NavigateUrl="~/teacher/sitelog.aspx" BorderStyle="None" EnableTheming="False" 
                                        EnableViewState="False" Font-Underline="False" Target="_blank" ToolTip="发现异常请及时向温州水乡反溃！" 
                                        CssClass="px-3 py-1 bg-rose-100 text-rose-700 text-xs rounded-lg hover:bg-rose-600 hover:text-white transition-all duration-300">在线日志查询&rarr;</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

