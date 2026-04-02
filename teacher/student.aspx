<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="Teacher_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6 p-4">
        <!-- Top Action Bar (Header) -->
        <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center justify-between gap-4 relative overflow-hidden">
            <div class="absolute -right-20 -top-20 w-64 h-64 bg-indigo-50 rounded-full blur-3xl opacity-50 pointer-events-none"></div>

            <div class="flex items-center gap-3 text-sm text-slate-700 relative z-10">
                <div class="p-2 bg-indigo-50 rounded-lg text-indigo-600">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
                </div>
                <span class="font-bold text-slate-800 text-base ml-1">学生管理</span>

                <div class="h-6 w-px bg-slate-200 mx-2"></div>

                <div class="flex items-center gap-2 bg-slate-50 px-3 py-1.5 rounded-lg border border-slate-200">
                    <asp:DropDownList ID="DDLgrade" runat="server"
                        CssClass="bg-white border border-slate-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-indigo-500 outline-none"
                        EnableTheming="True" AutoPostBack="True"
                        onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="text-slate-500 font-medium">年级</span>
                </div>

                <div class="flex items-center gap-2 bg-slate-50 px-3 py-1.5 rounded-lg border border-slate-200">
                    <asp:DropDownList ID="DDLclass" runat="server"
                        CssClass="bg-white border border-slate-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-indigo-500 outline-none"
                        EnableTheming="True" AutoPostBack="True"
                        onselectedindexchanged="DDLclass_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="text-slate-500 font-medium">班级</span>
                </div>

                <asp:Label ID="Label1" runat="server" CssClass="hidden"></asp:Label>
            </div>

            <div class="flex gap-3 relative z-10">
                <asp:HyperLink ID="HkaddStu" runat="server" CssClass="flex items-center gap-1.5 bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-5 rounded-xl transition-all cursor-pointer text-sm shadow-md shadow-indigo-200 active:scale-95">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
                    添加学生
                </asp:HyperLink>
            </div>
        </div>

        <!-- Student DataGrid -->
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 overflow-hidden">
            <div class="overflow-x-auto">
                <asp:GridView ID="GVStudent" runat="server" AutoGenerateColumns="False" Width="100%"
                                CellPadding="0" PageSize="15"
                 OnRowDataBound="GVStudent_RowDataBound" EnableModelValidation="True" DataKeyNames="Sid" onrowcommand="GVStudent_RowCommand"
                  ForeColor="#111111" GridLines="None" AllowPaging="True"
                                onpageindexchanging="GVStudent_PageIndexChanging">
                <AlternatingRowStyle BackColor="#f8fafc" />
                <Columns>
                    <asp:BoundField HeaderText="序号">
                        <ItemStyle HorizontalAlign="Center" CssClass="font-medium text-slate-400 w-12 py-3" />
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Snum" HeaderText="学号">
                        <ItemStyle HorizontalAlign="Center" CssClass="font-bold text-slate-700 w-24 py-3" />
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="密码">
                        <ItemTemplate>
                            <div class="flex items-center gap-2">
                                <asp:Label ID="Labelpwd" runat="server" Text='******' ToolTip='<%# Bind("Spwd") %>' CssClass="font-mono text-slate-400 tracking-widest text-xs bg-slate-100 px-2 py-0.5 rounded"></asp:Label>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False"
                                    CommandArgument='<%# Eval("Sid") %>' CommandName="ChangePwd"
                                    ImageUrl="~/images/refresh.gif" Text="更新" ToolTip="自动更新密码" CssClass="w-3.5 h-3.5 hover:rotate-180 transition-transform opacity-60 hover:opacity-100" />
                            </div>
                        </ItemTemplate>
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" HorizontalAlign="Left" />
                        <ItemStyle CssClass="py-3 px-4" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Sgrade" HeaderText="年级">
                        <ItemStyle HorizontalAlign="Center" CssClass="text-slate-600 text-sm py-3" />
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Sclass" HeaderText="班级">
                        <ItemStyle HorizontalAlign="Center" CssClass="text-slate-600 text-sm py-3" />
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="姓名">
                        <ItemTemplate>
                            <asp:HyperLink ID="Hlname" runat="server"
                                Text='<%# Eval("Sname") %>' ToolTip='<%# Eval("Sid") %>' CssClass="font-bold text-indigo-600 hover:text-indigo-800 transition-colors"></asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                        <ItemStyle HorizontalAlign="Left" CssClass="py-3 px-4" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Sex" HeaderText="性别">
                        <ItemStyle HorizontalAlign="Center" CssClass="text-slate-500 text-sm font-medium py-3" />
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False" HeaderText="小组">
                        <ItemTemplate>
                            <div class="flex items-center justify-center gap-1.5">
                                <asp:ImageButton ID="ImageBtnGroup" runat="server" CausesValidation="False"
                                    CommandArgument='<%# Eval("Sid") %>' CommandName="ChangeGroup"
                                    ImageUrl="~/images/gcard.gif" CssClass="opacity-75 hover:opacity-100 transition-opacity" />
                                <asp:LinkButton ID="LinkBtnQuit" runat="server" CausesValidation="false"
                                    CommandArgument='<%# Eval("Sid") %>' CommandName="QuitGroup" Text='<%# Eval("Sgroup") %>' CssClass="text-xs font-bold text-indigo-500 hover:text-rose-500 transition-colors"></asp:LinkButton>
                            </div>
                        </ItemTemplate>
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                        <ItemStyle HorizontalAlign="Center" CssClass="py-3" />
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="Snum"
                        DataNavigateUrlFormatString="studentwork.aspx?snum={0}" DataTextField="Sscore"
                        HeaderText="成绩" Target="_blank" >
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                        <ItemStyle HorizontalAlign="Center" CssClass="text-emerald-600 hover:text-emerald-800 font-bold py-3 text-sm transition-colors" />
                    </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="Snum"
                        DataNavigateUrlFormatString="studentworks.aspx?snum={0}"  Text="浏览"
                        HeaderText="作品" Target="_blank">
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                        <ItemStyle HorizontalAlign="Center" CssClass="text-slate-500 hover:text-indigo-600 font-medium text-sm transition-colors py-3" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="Sattitude" HeaderText="表现">
                        <ItemStyle HorizontalAlign="Center" CssClass="text-slate-500 text-sm py-3" />
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="Sid,Sgrade,Sclass" DataNavigateUrlFormatString="studentdel.aspx?sid={0}&amp;sgrade={1}&amp;sclass={2}"
                        Text="删除">
                        <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                        <ItemStyle HorizontalAlign="Center" CssClass="text-rose-500 hover:text-rose-700 font-medium text-sm transition-colors py-3" />
                    </asp:HyperLinkField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelSleader" runat="server" Text='<%# Bind("Sleader") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#f8fafc" CssClass="border-b border-slate-200" />
                <RowStyle BackColor="#FFFFFF" CssClass="border-b border-slate-100 hover:bg-slate-50/80 transition-colors" />
                <PagerStyle BackColor="#f8fafc" ForeColor="#475569" HorizontalAlign="Center" CssClass="border-t border-slate-200" />
                <pagertemplate>
                    <div class="w-full flex justify-between items-center px-6 py-3">
                        <span class="text-sm text-slate-500 font-medium">
                            第 <asp:Label ID="lblPageIndex" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" CssClass="font-bold text-slate-700" /> 页
                            共 <asp:Label ID="lblPageCount" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" CssClass="font-bold text-slate-700" /> 页
                        </span>
                        <div class="flex gap-2">
                            <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" commandargument="First" commandname="Page" text="首页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm" />
                            <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" commandargument="Prev" commandname="Page" text="上一页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm" />
                            <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" commandargument="Next" commandname="Page" text="下一页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm" />
                            <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" commandargument="Last" commandname="Page" text="尾页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm" />
                        </div>
                    </div>
                </pagertemplate>
                <SelectedRowStyle BackColor="#e0e7ff" Font-Bold="True" ForeColor="#3730a3" />
            </asp:GridView>
            </div>
        </div>

        <!-- Management Toolbars -->
        <div class="flex flex-col gap-4">

            <!-- Quick Actions Bar -->
            <div class="bg-white p-4 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center justify-between gap-4">
                <div class="flex flex-wrap items-center gap-3">
                    <div class="flex items-center bg-slate-50 border border-slate-200 rounded-xl p-1 shadow-sm">
                        <asp:Button ID="BtnSpwdInit" runat="server" OnClick="BtnSpwdInit_Click"
                            Text="初始化密码" ToolTip="将本班所有学生的密码初始为右侧自定义密码"
                            CssClass="bg-white text-slate-700 hover:text-indigo-600 text-xs font-medium py-1.5 px-3 rounded-lg border border-slate-200 shadow-sm transition-colors cursor-pointer" />
                        <div class="px-2 text-xs text-slate-400">为</div>
                        <asp:TextBox ID="TextBoxPwd" runat="server"
                            CssClass="bg-amber-50 border border-amber-200 text-amber-700 font-mono font-bold px-2 py-1 rounded-lg text-center w-16 text-xs focus:outline-none focus:ring-1 focus:ring-amber-400">12345</asp:TextBox>
                    </div>

                    <asp:Button ID="BtnSpell" runat="server" OnClick="BtnSpell_Click"
                        Text="转拼音缩写" ToolTip="将当前为原初始化密码的学生密码转换为其姓名拼音缩写"
                        CssClass="bg-slate-100 text-slate-700 hover:bg-slate-200 hover:text-indigo-600 text-xs font-medium py-1.5 px-4 rounded-xl border border-slate-200 shadow-sm transition-colors cursor-pointer" />

                    <div class="h-6 w-px bg-slate-200 mx-1"></div>

                    <div class="flex items-center gap-2 bg-slate-50 border border-slate-200 rounded-xl px-3 py-1 shadow-sm">
                        <span class="text-xs font-medium text-slate-600">小组上限</span>
                        <asp:DropDownList ID="DDLgroupMax" runat="server"
                            CssClass="bg-white border border-slate-300 rounded py-0.5 px-1 text-xs focus:ring-1 focus:ring-indigo-500 outline-none"
                            EnableTheming="True" AutoPostBack="True"
                            onselectedindexchanged="DDLgroupMax_SelectedIndexChanged">
                            <asp:ListItem>0</asp:ListItem><asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem Selected="True">6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Button ID="BtnNoGroup" runat="server" OnClick="BtnNoGroup_Click"
                        Text="解除分组" ToolTip="一键将本班所有学生解除分组"
                        CssClass="bg-white text-rose-600 hover:bg-rose-50 border border-rose-200 text-xs font-medium py-1.5 px-4 rounded-xl shadow-sm transition-colors cursor-pointer" />

                    <asp:Button ID="Btngroups" runat="server" Text="分组管理" onclick="Btngroups_Click"
                        CssClass="bg-white text-indigo-600 hover:bg-indigo-50 border border-indigo-200 text-xs font-medium py-1.5 px-4 rounded-xl shadow-sm transition-colors cursor-pointer" />
                </div>

                <div class="flex items-center gap-3">
                    <asp:Button ID="BtnRevive" runat="server" Text="恢复学生" onclick="BtnRevive_Click"
                        CssClass="bg-slate-100 text-slate-600 hover:bg-slate-200 border border-slate-200 text-xs font-medium py-1.5 px-4 rounded-xl shadow-sm transition-colors cursor-pointer" />

                    <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click"
                        Text="导出 Excel" ToolTip="将所有学生的基本信息导出Excel"
                        CssClass="bg-emerald-50 text-emerald-600 hover:bg-emerald-100 border border-emerald-200 text-xs font-medium py-1.5 px-4 rounded-xl shadow-sm transition-colors cursor-pointer flex items-center gap-1" />
                </div>
            </div>

            <!-- Permissions Bar -->
            <div class="bg-indigo-50/50 p-4 rounded-2xl shadow-sm border border-indigo-100/50 flex flex-wrap items-center justify-between gap-4">
                <div class="flex items-center gap-2">
                    <div class="p-1.5 bg-indigo-100 rounded-lg text-indigo-600">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
                    </div>
                    <span class="text-sm font-bold text-indigo-900">权限控制</span>
                </div>

                <div class="flex flex-wrap items-center gap-6 text-sm">
                    <anthem:CheckBox ID="Ckreg" runat="server" Text="允许在线注册" oncheckedchanged="Ckreg_CheckedChanged" AutoPostBack="True" CssClass="flex items-center gap-1.5 font-medium text-slate-700 bg-white px-3 py-1 rounded-lg border border-slate-200 shadow-sm" />

                    <div class="h-5 w-px bg-indigo-200"></div>

                    <div class="flex items-center gap-4 bg-white px-4 py-1.5 rounded-lg border border-slate-200 shadow-sm">
                        <span class="text-xs text-slate-400 font-semibold uppercase tracking-wider mr-2">允许修改个人资料:</span>
                        <anthem:CheckBox ID="Ckclass" runat="server" Text="班级" ToolTip="允许学生修改个人资料中的班级" oncheckedchanged="Ckclass_CheckedChanged" AutoPostBack="True" CssClass="flex items-center gap-1 text-slate-600 text-[13px]" />
                        <anthem:CheckBox ID="Ckphoto" runat="server" Text="相片" ToolTip="允许学生修改个人资料中的相片" oncheckedchanged="Ckphoto_CheckedChanged" AutoPostBack="True" CssClass="flex items-center gap-1 text-slate-600 text-[13px]" />
                        <anthem:CheckBox ID="Cksex" runat="server" Text="性别" ToolTip="允许学生修改个人资料中的性别" oncheckedchanged="Cksex_CheckedChanged" AutoPostBack="True" CssClass="flex items-center gap-1 text-slate-600 text-[13px]" />
                        <anthem:CheckBox ID="Ckname" runat="server" Text="姓名" ToolTip="允许学生修改个人资料中的姓名" oncheckedchanged="Ckname_CheckedChanged" AutoPostBack="True" CssClass="flex items-center gap-1 text-slate-600 text-[13px]" />
                    </div>
                </div>
            </div>

                <asp:Label ID="Labelmsg" runat="server" CssClass="text-sm text-emerald-600 font-medium bg-emerald-50 px-4 py-1 rounded-full"></asp:Label>
            </div>
        </div>

        <link href="../js/tinybox.css" rel="stylesheet" type="text/css" />
        <link href="../js/tinybox.css" rel="stylesheet" type="text/css" />
        <script src="../js/tinybox.js" type="text/javascript"></script>
        <script type ="text/javascript" >
            function stuShow(d, g, c) {
                var urlat = "../teacher/studentshow.aspx?sid=" + d + "&sgrade=" + g + "&sclass=" + c;
                TINY.box.show({ iframe: urlat, boxid: 'frameless', width: 700, height: 240, fixed: false, maskopacity: 40, closejs: function () { closeJS() } })
            }
            function stuAdd(g, c) {
                var urlad = "../teacher/studentadd.aspx?sgrade=" + g + "&sclass=" + c;
                TINY.box.show({ iframe: urlad, boxid: 'frameless', width: 700, height: 240, fixed: false, maskopacity: 40, closejs: function () { closeJS() } })
            }
        </script>
        <br />
        <br />
    </div>
</asp:Content>

