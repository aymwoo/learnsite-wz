<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="start.aspx.cs" Inherits="Teacher_start" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6">
    <!-- Top Action Bar (Dashboard Header) -->
    <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 p-5 flex flex-wrap items-center justify-between gap-6 relative overflow-hidden">
        <!-- Background decorative blob -->
        <div class="absolute -right-20 -top-20 w-64 h-64 bg-indigo-50 rounded-full blur-3xl opacity-50 pointer-events-none"></div>

        <div class="flex items-center gap-4 text-sm text-slate-700 relative z-10">
            <div class="flex items-center gap-2 bg-slate-50 px-4 py-2 rounded-xl border border-slate-200 shadow-sm">
                <svg class="w-5 h-5 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                <span class="font-semibold text-slate-800">上课选择</span>
                <asp:DropDownList ID="DDLgrade"
                    runat="server" CssClass="bg-white border border-slate-300 rounded-lg px-3 py-1.5 text-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all shadow-sm"
                    EnableTheming="True" AutoPostBack="True"
                    onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                </asp:DropDownList>
                <span class="text-slate-500">年级</span>
                <asp:DropDownList ID="DDLclass" runat="server" CssClass="bg-white border border-slate-300 rounded-lg px-3 py-1.5 text-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all shadow-sm"
                    AutoPostBack="True" onselectedindexchanged="DDLclass_SelectedIndexChanged">
                </asp:DropDownList>
                <span class="text-slate-500">班</span>
                <asp:DropDownList ID="DDLCid" runat="server" CssClass="bg-white border border-slate-300 rounded-lg px-3 py-1.5 text-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all shadow-sm max-w-[200px]"
                    AutoPostBack="True" onselectedindexchanged="DDLCid_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="flex items-center gap-3">
                <asp:Button ID="Btnset" runat="server" Text="开始上课"
                    CssClass="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-5 rounded-xl text-sm transition-all shadow-md shadow-indigo-200 cursor-pointer active:scale-95"
                    onclick="Btnset_Click" ToolTip="设置上课班级登录密码" />

                <asp:Button ID="Btnstudent" runat="server" Text="模拟学生"
                    CssClass="bg-emerald-500 hover:bg-emerald-600 text-white font-medium py-2 px-5 rounded-xl text-sm transition-all shadow-md shadow-emerald-200 disabled:opacity-50 disabled:cursor-not-allowed cursor-pointer active:scale-95"
                    ToolTip="模拟本班级学生角色登录学生平台"
                    onclick="Btnstudent_Click" Enabled="False" />
            </div>
        </div>

        <div class="flex items-center gap-5 relative z-10">
            <div class="flex flex-col items-end">
                <span class="text-[10px] text-slate-400 uppercase tracking-wider mb-0.5 font-semibold">班级密码</span>
                <asp:TextBox ID="TBpwd" runat="server" ReadOnly="True"
                    CssClass="bg-emerald-50 border border-emerald-200 text-emerald-700 font-mono font-bold px-3 py-1 rounded-lg text-center w-20 shadow-sm"
                    ToolTip="班级密码"></asp:TextBox>
            </div>

            <div class="h-10 w-px bg-slate-200"></div>

            <div class="flex gap-4 text-sm font-medium">
                <asp:HyperLink ID="HLrate" runat="server" CssClass="flex flex-col items-center text-slate-500 hover:text-indigo-600 transition-colors group" Target="_blank">
                    <div class="p-2 bg-slate-50 group-hover:bg-indigo-50 rounded-lg transition-colors mb-1">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path></svg>
                    </div>
                    <span class="text-[11px]">进度</span>
                </asp:HyperLink>
                <asp:HyperLink ID="HLworkshow" runat="server" CssClass="flex flex-col items-center text-slate-500 hover:text-indigo-600 transition-colors group" Target="_blank">
                    <div class="p-2 bg-slate-50 group-hover:bg-indigo-50 rounded-lg transition-colors mb-1">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                    </div>
                    <span class="text-[11px]">展示</span>
                </asp:HyperLink>
                <asp:HyperLink ID="HLtotal" runat="server" CssClass="flex flex-col items-center text-slate-500 hover:text-indigo-600 transition-colors group" Target="_blank">
                    <div class="p-2 bg-slate-50 group-hover:bg-indigo-50 rounded-lg transition-colors mb-1">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                    </div>
                    <span class="text-[11px]">汇总</span>
                </asp:HyperLink>
            </div>
        </div>
    </div>     

    <!-- Menu DataList (Apps) -->
    <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap gap-4 items-center justify-center">
        <asp:DataList ID="DataListMenu" runat="server" RepeatLayout="Flow" 
            RepeatDirection="Horizontal" onitemdatabound="DataListMenu_ItemDataBound"
            DataKeyField="Lid" onitemcommand="DataListMenu_ItemCommand" CssClass="flex flex-wrap gap-3">
            <ItemTemplate>
                <div class="flex flex-col items-center gap-2 p-3 hover:bg-slate-50 hover:shadow-sm rounded-xl cursor-pointer transition-all border border-transparent hover:border-slate-200">
                    <div class="p-2 bg-white rounded-lg shadow-sm border border-slate-100">
                        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl='<%# Eval("Limgurl") %>' CommandArgument="Lid" CommandName="P" CssClass="w-10 h-10 object-contain hover:scale-105 transition-transform" />
                    </div>
                    <asp:Label ID="lableTitle" runat="server" Text='<%# Eval("Ltitle") %>' CssClass="text-xs font-medium text-slate-600"></asp:Label>
                    <asp:CheckBox ID="CheckBoxShow" Checked='<%# Eval("Lshow") %>' runat="server" Visible="false" />
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>   

    <!-- Online Students Dashboard -->
    <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 flex flex-col overflow-hidden">

        <!-- Dashboard Header & Legend -->
        <div class="flex flex-wrap items-center justify-between text-sm text-slate-600 bg-slate-50/80 px-6 py-4 border-b border-slate-100">
            <div class="flex items-center gap-6">
                <div class="flex items-center gap-1 font-semibold text-slate-800">
                    <svg class="w-5 h-5 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                    在线监控
                </div>
                <div class="h-5 w-px bg-slate-300"></div>
                <div class="flex items-center gap-3 text-xs font-medium">
                    <div class="flex items-center gap-1.5" title="没有作品"><asp:Label ID="Labelnocolor" runat="server" CssClass="w-2.5 h-2.5 rounded-full ring-2 ring-white shadow-sm inline-block" BackColor="#e2e8f0" EnableViewState="False"></asp:Label><span class="text-slate-500">无</span></div>
                    <div class="flex items-center gap-1.5" title="单个作品"><asp:Label ID="Labelone" runat="server" CssClass="w-2.5 h-2.5 rounded-full ring-2 ring-white shadow-sm inline-block" BackColor="#93c5fd" EnableViewState="False"></asp:Label><span class="text-slate-500">单</span></div>
                    <div class="flex items-center gap-1.5" title="两个作品"><asp:Label ID="Labeltwo" runat="server" CssClass="w-2.5 h-2.5 rounded-full ring-2 ring-white shadow-sm inline-block" BackColor="#3b82f6" EnableViewState="False"></asp:Label><span class="text-slate-500">双</span></div>
                    <div class="flex items-center gap-1.5" title="三个作品"><asp:Label ID="Labelthree" runat="server" CssClass="w-2.5 h-2.5 rounded-full ring-2 ring-white shadow-sm inline-block" BackColor="#86efac" EnableViewState="False"></asp:Label><span class="text-slate-500">三</span></div>
                    <div class="flex items-center gap-1.5" title="四个作品"><asp:Label ID="Labelfour" runat="server" CssClass="w-2.5 h-2.5 rounded-full ring-2 ring-white shadow-sm inline-block" BackColor="#22c55e" EnableViewState="False"></asp:Label><span class="text-slate-500">四</span></div>
                    <div class="flex items-center gap-1.5" title="多个作品"><asp:Label ID="Labelmore" runat="server" CssClass="w-2.5 h-2.5 rounded-full ring-2 ring-white shadow-sm inline-block" BackColor="#a855f7" EnableViewState="False"></asp:Label><span class="text-slate-500">多</span></div>
                </div>
            </div>
            <div class="flex items-center gap-5">
                <asp:Label ID="Labelcount" runat="server" EnableViewState="False" CssClass="font-semibold text-slate-700 bg-white px-3 py-1 rounded-full border border-slate-200 shadow-sm text-xs"></asp:Label>
                <div class="text-indigo-600 font-bold bg-indigo-50 px-3 py-1 rounded-full border border-indigo-100 shadow-sm text-xs flex items-center gap-1">
                    <span class="relative flex h-2 w-2 mr-1"><span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-indigo-400 opacity-75"></span><span class="relative inline-flex rounded-full h-2 w-2 bg-indigo-500"></span></span>
                    今天已签到：<asp:Label ID="Labelsigin" runat="server"></asp:Label> 位
                </div>
            </div>
        </div>

        <!-- Student Cards Grid -->
        <div class="p-6 flex justify-center bg-slate-50/30 min-h-[300px]">
            <asp:DataList ID="DLonline" runat="server" RepeatColumns="8" onitemdatabound="DLonline_ItemDataBound"
                DataKeyField="Qid" onitemcommand="DLonline_ItemCommand" RepeatDirection="Horizontal" CssClass="mx-auto" CellSpacing="8">
                <ItemTemplate>
                    <div class="group flex flex-col items-center justify-center p-3 border border-slate-200 rounded-xl bg-white hover:shadow-lg hover:border-indigo-300 transition-all m-1 w-28 relative">
                        <!-- Number Badge -->
                        <div class="absolute -top-2 -left-2 w-6 h-6 bg-slate-100 border border-slate-200 rounded-full flex items-center justify-center text-[10px] font-bold text-slate-500 shadow-sm"><asp:Label ID="Labelqnum" runat="server" Text='<%# Eval("Qnum") %>'></asp:Label></div>

                        <!-- Name Area -->
                        <div class="w-full text-center mt-2 mb-2">
                            <asp:Label ID="HyperSname" runat="server" Text='<%# Eval("Qname") %>' CssClass="inline-block w-full py-1.5 bg-slate-50 group-hover:bg-indigo-50 rounded-lg text-[13px] text-slate-800 font-bold truncate transition-colors"></asp:Label>
                        </div>

                        <div class="text-xs text-slate-400"><asp:Label ID="LabelQmachine" runat="server" Text='<%# Eval("QmachineShort") %>' Visible="false"></asp:Label></div>

                        <!-- Actions & Status -->
                        <div class="flex items-center justify-between w-full mt-1 pt-2 border-t border-slate-100">
                            <asp:HyperLink ID="Groupflag" runat="server" CssClass="text-xs font-bold text-indigo-400 hover:text-indigo-600 bg-indigo-50 px-1.5 rounded">G</asp:HyperLink>
                            <div class="flex items-center gap-1">
                                <asp:Label ID="Labelcolor" runat="server" Text='<%# Eval("Qgscore") %>' ToolTip='<%# "组评语："+Eval("Qgroup") %>' CssClass="text-xs font-bold text-emerald-600 w-4 text-center"></asp:Label>
                                <asp:LinkButton ID="Lunlock" runat="server" CommandArgument="Qid" CommandName="UnLock" ToolTip="强制登出" CssClass="w-5 h-5 bg-rose-50 hover:bg-rose-100 rounded flex items-center justify-center text-rose-500 hover:text-rose-700 transition-colors">
                                    <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
                                </asp:LinkButton>
                            </div>
                        </div>

                        <!-- Hidden Data -->
                        <div class="hidden">
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

        <!-- Controls Footer -->
        <div class="bg-slate-50 border-t border-slate-200 px-6 py-4 flex flex-wrap gap-5 items-center justify-between text-sm">
            <div class="bg-white px-3 py-1.5 rounded-xl shadow-sm border border-slate-200">
                <anthem:RadioButtonList ID="RBsort" runat="server" AutoPostBack="True"
                    onselectedindexchanged="RBsort_SelectedIndexChanged"
                    RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="flex gap-4 [&>span]:flex [&>span]:items-center [&>span]:gap-1.5 font-medium text-slate-600 [&>span>input]:text-indigo-600 [&>span>input]:focus:ring-indigo-500">
                    <Items>
                        <asp:ListItem Value="3">机房视图</asp:ListItem>
                        <asp:ListItem Value="0">主机排序</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">学号排序</asp:ListItem>
                        <asp:ListItem Value="2">小组排序</asp:ListItem>
                    </Items>
                </anthem:RadioButtonList>
            </div>
            <div class="flex flex-wrap gap-2 text-[13px]">
                <anthem:CheckBox ID="CheckBoxScratch" runat="server" Text="编程" AutoPostBack="True" ToolTip="编程开关控制，选中表示可以进入编程页面" oncheckedchanged="CheckBoxScratch_CheckedChanged" CssClass="flex items-center gap-1.5 bg-white border border-slate-200 px-3 py-1.5 rounded-xl shadow-sm hover:border-indigo-300 transition-colors text-slate-600 font-medium" />
                <anthem:CheckBox ID="CheckBoxRgauge" runat="server" Text="互评" AutoPostBack="True" oncheckedchanged="CheckBoxRgauge_CheckedChanged" ToolTip="作品互评控制，选中表示开启" CssClass="flex items-center gap-1.5 bg-white border border-slate-200 px-3 py-1.5 rounded-xl shadow-sm hover:border-indigo-300 transition-colors text-slate-600 font-medium" />
                <anthem:CheckBox ID="CheckBoxip" runat="server" Text="IP锁定" AutoPostBack="True" oncheckedchanged="CheckBoxip_CheckedChanged" ToolTip="根据上次登录的IP进行锁定登录" CssClass="flex items-center gap-1.5 bg-white border border-slate-200 px-3 py-1.5 rounded-xl shadow-sm hover:border-indigo-300 transition-colors text-slate-600 font-medium" />
                <anthem:CheckBox ID="CheckBoxPass" runat="server" Text="闯关" AutoPostBack="True" oncheckedchanged="CheckBoxPass_CheckedChanged" ToolTip="当前学案活动依次完成后解锁下一个活动！" CssClass="flex items-center gap-1.5 bg-white border border-slate-200 px-3 py-1.5 rounded-xl shadow-sm hover:border-indigo-300 transition-colors text-slate-600 font-medium" />
                <anthem:CheckBox ID="CheckBoxOpen" runat="server" Text="快速" AutoPostBack="True" oncheckedchanged="CheckBoxOpen_CheckedChanged" ToolTip="本班学生登录后，直接进入当前学案导航！" CssClass="flex items-center gap-1.5 bg-white border border-slate-200 px-3 py-1.5 rounded-xl shadow-sm hover:border-indigo-300 transition-colors text-slate-600 font-medium" />
                <anthem:CheckBox ID="CheckBoxPwd" runat="server" Text="密码可见" AutoPostBack="True" oncheckedchanged="CheckBoxPwd_CheckedChanged" ToolTip="选中表示公开显示班级密码，未选表示隐藏！" CssClass="flex items-center gap-1.5 bg-white border border-slate-200 px-3 py-1.5 rounded-xl shadow-sm hover:border-indigo-300 transition-colors text-slate-600 font-medium" />
                <anthem:CheckBox ID="CheckBoxLogin" runat="server" Text="个人模式" AutoPostBack="True" ToolTip="选中表示允许本班单独个人模式登录" oncheckedchanged="CheckBoxLogin_CheckedChanged" CssClass="flex items-center gap-1.5 bg-white border border-slate-200 px-3 py-1.5 rounded-xl shadow-sm hover:border-indigo-300 transition-colors text-slate-600 font-medium" />
            </div>
        </div>
    </div>

    <!-- Offline Students Area -->
    <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 flex flex-col gap-4 overflow-hidden">
        <div class="flex items-center justify-between text-sm bg-rose-50/50 px-6 py-4 border-b border-rose-100/50">
            <div class="flex items-center gap-2 text-rose-600 font-semibold">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                今天未签到情况
            </div>
            <asp:Label ID="Label2" runat="server" CssClass="hidden"></asp:Label>
            <div class="text-rose-600 font-bold bg-white px-3 py-1 rounded-full border border-rose-200 shadow-sm text-xs">
                <asp:Label ID="Labelsigno" runat="server" CssClass="px-1"></asp:Label> 位
            </div>
        </div>

        <div class="p-6 flex justify-center bg-slate-50/20">
            <asp:DataList ID="DLnotline" runat="server" RepeatColumns="8" RepeatDirection="Horizontal" onitemdatabound="DLnotline_ItemDataBound" HorizontalAlign="Center" CellSpacing="8" CssClass="mx-auto">
                <ItemTemplate>
                    <div class="flex flex-col items-center justify-center p-3 border border-dashed border-slate-300 rounded-xl bg-slate-50 m-1 w-28 opacity-80 hover:opacity-100 transition-opacity">
                        <div class="text-[10px] text-slate-400 font-bold mb-1"><asp:Label ID="LabelNnum" runat="server" Text='<%# Eval("Snum") %>'></asp:Label></div>
                        <div class="mb-1 w-full text-center">
                            <asp:Label ID="lbQname" runat="server" Text='<%# Eval("Sname") %>' CssClass="inline-block w-full py-1 bg-slate-200/50 rounded-lg text-sm text-slate-500 font-medium truncate"></asp:Label>
                        </div>
                        <div class="text-[11px] text-slate-400 font-medium">
                            学分: <asp:Label ID="LabelSscore" runat="server" Text='<%# Eval("Sscore") %>' ToolTip="总学分" CssClass="text-slate-600"></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <!-- Course & Footer Area -->
    <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 overflow-hidden">
        <div class="bg-slate-50/80 border-b border-slate-200 px-6 py-4 flex flex-wrap items-center gap-5 justify-between">
            <div class="flex items-center gap-4">
                <div class="flex items-center gap-2 bg-white px-3 py-1.5 rounded-lg border border-slate-200 shadow-sm">
                    <svg class="w-4 h-4 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                    <asp:DropDownList ID="DDLhouse" runat="server" CssClass="bg-transparent border-none text-sm font-medium text-slate-700 focus:ring-0 outline-none" AutoPostBack="True" onselectedindexchanged="DDLhouse_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <asp:HyperLink ID="HyperLinkSeat" runat="server" Target="_blank" CssClass="text-sm font-medium text-indigo-600 hover:text-indigo-800 transition-colors flex items-center gap-1">
                    座位表
                    <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>
                </asp:HyperLink>
                <div class="h-4 w-px bg-slate-300"></div>
                <asp:ImageButton ID="Btnrefresh" runat="server" onclick="Btnrefresh_Click" Enabled="False" ImageUrl="~/images/refresh.gif" CssClass="hover:opacity-80 transition-opacity" ToolTip="刷新数据" />
                <asp:Label ID="Labelfresh" runat="server" CssClass="text-[11px] text-slate-400 font-medium"></asp:Label>
            </div>

            <div class="flex items-center gap-4 text-sm font-medium text-slate-600">
                <anthem:CheckBox ID="CheckBoxShare" runat="server" Text="网盘开关" AutoPostBack="True" oncheckedchanged="CheckBoxShare_CheckedChanged" ToolTip="网盘启用/禁用" CssClass="flex items-center gap-1.5" />
                <anthem:CheckBox ID="CheckBoxGroupShare" runat="server" Text="小组网盘" AutoPostBack="True" oncheckedchanged="CheckBoxGroupShare_CheckedChanged" ToolTip="小组网盘启用/禁用" CssClass="flex items-center gap-1.5" />
                <div class="flex items-center gap-2 pl-2 border-l border-slate-200">
                    <asp:HyperLink ID="HylkDiskstu" runat="server" ImageUrl="~/images/disksmallstu.gif" Target="_blank" ToolTip="查看学生网盘存档" CssClass="hover:opacity-80 transition-opacity"></asp:HyperLink>
                    <asp:HyperLink ID="HylkDiskGroup" runat="server" ImageUrl="~/images/disksmall.gif" Target="_blank" ToolTip="查看小组网盘存档" CssClass="hover:opacity-80 transition-opacity"></asp:HyperLink>
                </div>
            </div>
        </div>

        <div class="p-6 flex flex-col md:flex-row gap-8">
            <div class="flex-1 bg-emerald-50/50 p-4 rounded-xl border border-emerald-100">
                <div class="flex items-center gap-2 mb-4 text-emerald-800 font-semibold border-b border-emerald-200/60 pb-2">
                    <svg class="w-5 h-5 text-emerald-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    已学学案
                </div>
                <asp:DataList ID="DLdonekc" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" DataKeyField="Cid" onitemdatabound="DLdonekc_ItemDataBound" CssClass="flex flex-wrap gap-2">
                    <ItemTemplate>
                        <div class="flex flex-col items-center p-2.5 bg-white shadow-sm border border-emerald-200 rounded-lg min-w-[3.5rem] hover:border-emerald-400 hover:shadow-md transition-all">
                            <asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="font-bold text-emerald-600 hover:text-emerald-800 text-lg"></asp:HyperLink>
                            <asp:Label ID="wk" runat="server" ToolTip="作品总数" CssClass="text-[10px] text-slate-400 font-medium mt-1 bg-slate-50 px-1.5 rounded-sm"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div class="flex-1 bg-amber-50/50 p-4 rounded-xl border border-amber-100">
                <div class="flex items-center gap-2 mb-4 text-amber-800 font-semibold border-b border-amber-200/60 pb-2">
                    <svg class="w-5 h-5 text-amber-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                    未学学案
                </div>
                <asp:DataList ID="DLnewkc" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" onitemdatabound="DLnewkc_ItemDataBound" onitemcommand="DLnewkc_ItemCommand" DataKeyField="Cid" CssClass="flex flex-wrap gap-2">
                    <ItemTemplate>
                        <div class="flex flex-col items-center p-2.5 bg-white shadow-sm border border-amber-200 rounded-lg min-w-[3.5rem] hover:border-amber-400 hover:shadow-md transition-all">
                            <asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="font-bold text-amber-600 hover:text-amber-800 text-lg"></asp:HyperLink>
                            <div class="mt-1 flex items-center justify-center gap-2 bg-slate-50 px-2 py-0.5 rounded-md border border-slate-100">
                                <asp:CheckBox ID="Ck" runat="server" Checked='<%# Eval("Cpublish") %>' Enabled="False" CssClass="scale-90" />
                                <asp:ImageButton runat="server" ID="PubSet" CommandArgument="Cid" CommandName="P" ImageUrl="~/images/cardsmall.gif" CssClass="w-3.5 h-3.5 hover:scale-110 transition-transform" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>       

        <div class="bg-slate-50 flex flex-col items-center py-5 border-t border-slate-200 text-center gap-3">
            <asp:Button ID="BtnaAllQuit" runat="server" Text="强制全班下线" onclick="BtnaAllQuit_Click" Visible="False" EnableViewState="False" CssClass="bg-rose-500 hover:bg-rose-600 text-white font-medium py-1.5 px-6 rounded-lg text-sm shadow-sm shadow-rose-200 transition-colors cursor-pointer" />
            <div class="flex items-center gap-1.5 text-[11px] text-slate-400 bg-white px-3 py-1 rounded-full border border-slate-200 shadow-sm" ToolTip="服务器日期校准：作品、签到日期以此为准">
                <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <asp:Label ID="LabelToday" runat="server"></asp:Label>
            </div>
        </div>
    </div>
        <script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <link href="../js/tooltip.css" rel="stylesheet" type="text/css" />
        <script src="../js/spanToolTip.js" type="text/javascript"></script>
        <link href="../js/tinybox.css" rel="stylesheet" type="text/css" />
        <script src="../js/tinybox.js" type="text/javascript"></script>
        <script type ="text/javascript" >
            function myrefresh() {
                document.getElementById("<%= Btnrefresh.ClientID %>").click();
            }
            setTimeout("myrefresh()", 120000); //指定120秒刷新一次            

             function notsg(n, g, m) {
                var urlsg ="../teacher/notsign.aspx?nnum=" +n + "&ngrade=" +g + "&qname=" + m;
                TINY.box.show({ iframe: urlsg, boxid: 'frameless', width: 360, height: 260, fixed: false, maskopacity: 60, close: true })
            }
            function attitude(q, m, a,c) {
                var urlat = "../teacher/attitude.aspx?qid=" + q + "&qname=" + m + "&qattitude=" + a + "&qcid=" + c;
                TINY.box.show({ iframe: urlat, boxid: 'frameless', width: 360, height: 320, fixed: false, maskopacity: 60, close: true })
            }
            function attitudegroup(g, m, q, c) {
                var urlat = "../teacher/attitudegroup.aspx?sg=" + g + "&ld=" + m + "&qd=" + q + "&qcid=" + c;
                TINY.box.show({ iframe: urlat, boxid: 'frameless', width: 360, height: 200, fixed: false, maskopacity: 60, close:true })
            }
        </script>
</div>
</asp:Content>

