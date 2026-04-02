<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="Teacher_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="p-6 max-w-[1400px] mx-auto w-full flex flex-col gap-6">
        <!-- Header Controls -->
        <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center justify-between gap-4">
            <div class="flex items-center gap-3">
                <div class="p-2 bg-indigo-50 rounded-lg text-indigo-600">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
                </div>
                <span class="font-bold text-slate-800 text-base">学生选择：</span>
                
                <div class="flex items-center gap-2">
                    <asp:DropDownList ID="DDLgrade" runat="server" CssClass="bg-slate-50 border border-slate-300 rounded-lg px-2 py-1.5 text-sm focus:ring-2 focus:ring-indigo-500 outline-none" EnableTheming="True" AutoPostBack="True" onselectedindexchanged="DDLgrade_SelectedIndexChanged"></asp:DropDownList>
                    <span class="text-sm text-slate-600 font-medium">年级</span>
                </div>
                
                <div class="flex items-center gap-2">
                    <asp:DropDownList ID="DDLclass" runat="server" CssClass="bg-slate-50 border border-slate-300 rounded-lg px-2 py-1.5 text-sm focus:ring-2 focus:ring-indigo-500 outline-none" EnableTheming="True" AutoPostBack="True" onselectedindexchanged="DDLclass_SelectedIndexChanged"></asp:DropDownList>
                    <span class="text-sm text-slate-600 font-medium">班级</span>
                </div>
                
                <asp:Label ID="Label1" runat="server" CssClass="text-sm text-emerald-600 font-medium ml-2"></asp:Label>
            </div>
            
            <div class="flex items-center">
                <asp:HyperLink ID="HkaddStu" runat="server" CssClass="px-4 py-2 bg-indigo-600 text-white font-medium text-sm rounded-xl hover:bg-indigo-700 transition shadow-md shadow-indigo-200 active:scale-95 flex items-center gap-1.5">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                    添加学生
                </asp:HyperLink>
            </div>
        </div>
        <!-- Data Grid -->
        <div class="overflow-x-auto w-full custom-scrollbar rounded-2xl border border-slate-200 shadow-sm bg-white">
            <asp:GridView ID="GVStudent" runat="server" AutoGenerateColumns="False" Width="100%" 
                            CellPadding="3" PageSize="15" CssClass="min-w-full text-sm text-left text-slate-600"
             OnRowDataBound="GVStudent_RowDataBound" EnableModelValidation="True" DataKeyNames="Sid" onrowcommand="GVStudent_RowCommand"
              ForeColor="#111111" GridLines="None" AllowPaging="True" 
                            onpageindexchanging="GVStudent_PageIndexChanging" Font-Names="Arial" 
                            Font-Size="11pt" >
            <AlternatingRowStyle BackColor="#f8fafc" />
            <Columns>
                <asp:BoundField HeaderText="序号">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100" />
                </asp:BoundField>
                <asp:BoundField DataField="Snum" HeaderText="学号">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100 font-mono text-indigo-600 font-medium" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="密码">
                    <ItemTemplate>
                        <asp:Label ID="Labelpwd" runat="server" Text='******' ToolTip='<%# Bind("Spwd") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                            CommandArgument='<%# Eval("Sid") %>' CommandName="ChangePwd" 
                            ImageUrl="~/images/refresh.gif" Text="更新" ToolTip="自动更新密码" CssClass="hover:scale-110 transition-transform" />
                    </ItemTemplate>
                    <ItemStyle CssClass="py-3 px-2 border-b border-slate-100" />
                </asp:TemplateField>
                <asp:BoundField DataField="Sgrade" HeaderText="年级">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100" />
                </asp:BoundField>
                <asp:BoundField DataField="Sclass" HeaderText="班级">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="姓名">
                    <ItemTemplate>
                        <asp:HyperLink ID="Hlname" runat="server"  
                            Text='<%# Eval("Sname") %>' ToolTip='<%# Eval("Sid") %>' CssClass="font-medium text-slate-800 hover:text-indigo-600 transition-colors"></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle HorizontalAlign="Left" CssClass="py-3 px-4 border-b border-slate-100" />
                </asp:TemplateField>
                <asp:BoundField DataField="Sex" HeaderText="性别">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False" HeaderText="小组">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageBtnGroup" runat="server" CausesValidation="False" 
                            CommandArgument='<%# Eval("Sid") %>' CommandName="ChangeGroup" 
                            ImageUrl="~/images/gcard.gif" CssClass="hover:scale-110 transition-transform" />
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="组号" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkBtnQuit" runat="server" CausesValidation="false" 
                            CommandArgument='<%# Eval("Sid") %>'  CommandName="QuitGroup" Text='<%# Eval("Sgroup") %>' CssClass="w-6 h-6 inline-flex items-center justify-center rounded-full bg-slate-100 text-slate-600 hover:bg-slate-200 text-xs font-bold transition-colors"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-3 px-2 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-2 border-b border-slate-100 text-center" />
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="Snum" 
                    DataNavigateUrlFormatString="studentwork.aspx?snum={0}" DataTextField="Sscore" 
                    HeaderText="成绩" Target="_blank">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100 font-bold text-emerald-600" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="Snum" 
                    DataNavigateUrlFormatString="studentworks.aspx?snum={0}"  Text="浏览"
                    HeaderText="作品" Target="_blank">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100 font-medium text-blue-500 hover:underline" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="Sattitude" HeaderText="表现">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100 text-rose-500 font-medium" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="Sid,Sgrade,Sclass" DataNavigateUrlFormatString="studentdel.aspx?sid={0}&amp;sgrade={1}&amp;sclass={2}"
                    Text="删除">
                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-700 bg-slate-50 border-b border-slate-200" />
                    <ItemStyle CssClass="py-3 px-4 border-b border-slate-100 text-rose-500 text-sm hover:underline" />
                </asp:HyperLinkField>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="LabelSleader" runat="server" Text='<%# Bind("Sleader") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="bg-slate-50 py-3 text-center" ForeColor="#475569" HorizontalAlign="Center" />
                            <pagertemplate>
                                <div class="flex flex-wrap items-center justify-end gap-2 text-sm text-slate-600 font-medium px-4">
                                    <span>第<asp:Label ID="lblPageIndex" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" />页</span>
                                    <span>共<asp:Label ID="lblPageCount" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" />页</span>
                                    <div class="flex gap-1 ml-2">
                                        <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" commandargument="First" commandname="Page" CssClass="px-2 py-1 rounded bg-white border border-slate-200 hover:bg-slate-100 shadow-sm transition" text="首页" />
                                        <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" commandargument="Prev" commandname="Page" CssClass="px-2 py-1 rounded bg-white border border-slate-200 hover:bg-slate-100 shadow-sm transition" text="上一页" />
                                        <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" commandargument="Next" commandname="Page" CssClass="px-2 py-1 rounded bg-white border border-slate-200 hover:bg-slate-100 shadow-sm transition" text="下一页" />
                                        <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" commandargument="Last" commandname="Page" CssClass="px-2 py-1 rounded bg-white border border-slate-200 hover:bg-slate-100 shadow-sm transition" text="尾页" />
                                    </div>
                                </div>
                            </pagertemplate>
                            <RowStyle BackColor="#ffffff" />
                            <SelectedRowStyle BackColor="#e0e7ff" Font-Bold="True" ForeColor="#3730a3" />            
        </asp:GridView>
        </div>
        <!-- Management Toolbars -->
        <div class="flex flex-col gap-4">
            
            <!-- Quick Actions Bar -->
            <div class="bg-white p-4 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center justify-between gap-4">
                <div class="flex flex-wrap items-center gap-3">
                    <div class="flex items-center gap-2 bg-slate-50 border border-slate-200 rounded-xl p-1 shadow-sm h-10">
                        <asp:Button ID="BtnSpwdInit" runat="server" OnClick="BtnSpwdInit_Click"
                            Text="初始化密码" ToolTip="将本班所有学生的密码初始为右侧自定义密码"
                            CssClass="h-full bg-white text-slate-700 hover:text-indigo-600 text-xs font-medium px-3 rounded-lg border border-slate-200 shadow-sm transition-colors cursor-pointer" />
                        <div class="text-xs text-slate-400">为</div>
                        <asp:TextBox ID="TextBoxPwd" runat="server"
                            CssClass="h-full bg-amber-50 border border-amber-200 text-amber-700 font-mono font-bold px-2 rounded-lg text-center w-16 text-xs focus:outline-none focus:ring-1 focus:ring-amber-400">12345</asp:TextBox>
                    </div>
                    
                    <asp:Button ID="BtnSpell" runat="server" OnClick="BtnSpell_Click"
                        Text="转拼音缩写" ToolTip="将当前为原初始化密码的学生密码转换为其姓名拼音缩写"
                        CssClass="px-3 h-10 bg-white border border-slate-200 text-slate-700 rounded-xl hover:bg-slate-50 transition shadow-sm text-sm font-medium" />
                </div>
                
                <div class="flex flex-wrap items-center gap-3">
                    <div class="flex items-center gap-2 bg-slate-50 px-3 h-10 rounded-xl border border-slate-200">
                        <span class="text-xs font-medium text-slate-500">小组上限</span>
                        <asp:DropDownList ID="DDLgroupMax" runat="server" CssClass="bg-white border border-slate-200 rounded text-xs px-1 py-0.5 outline-none font-medium" EnableTheming="True" AutoPostBack="True" onselectedindexchanged="DDLgroupMax_SelectedIndexChanged">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem Selected="True">6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                
                    <asp:Button ID="Btngroups" runat="server" Text="分组管理" onclick="Btngroups_Click"
                        CssClass="px-4 h-10 bg-indigo-50 text-indigo-700 font-medium text-sm rounded-xl hover:bg-indigo-100 border border-indigo-200 transition shadow-sm" />
                    
                    <asp:Button ID="BtnNoGroup" runat="server" OnClick="BtnNoGroup_Click"
                        Text="解除分组" ToolTip="一键将本班所有学生解除分组"
                        CssClass="px-4 h-10 bg-white border border-rose-200 text-rose-600 rounded-xl hover:bg-rose-50 transition shadow-sm text-sm font-medium" />
                        
                    <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click"
                        Text="导出学生" ToolTip="将所有学生的基本信息导出Excel"
                        CssClass="px-4 h-10 bg-white border border-emerald-200 text-emerald-600 rounded-xl hover:bg-emerald-50 transition shadow-sm text-sm font-medium" />
                        
                    <asp:Button ID="BtnRevive" runat="server" Text="恢复学生" onclick="BtnRevive_Click"
                        CssClass="px-4 h-10 bg-slate-800 text-white font-medium text-sm rounded-xl hover:bg-slate-700 transition shadow-sm" />
                </div>
            </div>

            <!-- Permission Settings Bar -->
            <div class="bg-slate-100 rounded-2xl p-4 flex flex-wrap items-center gap-6 border border-slate-200 shadow-inner mt-2">
                <div class="flex items-center gap-2 pr-6 border-r border-slate-300">
                    <span class="text-sm font-bold text-slate-700">系统权限限制:</span>
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-800 transition">
                        <asp:CheckBox ID="Ckreg" runat="server" oncheckedchanged="Ckreg_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600 w-4 h-4" />
                        允许在线注册 (非导入创建)
                    </label>
                </div>
                
                <div class="flex flex-wrap items-center gap-4">
                    <span class="text-sm font-bold text-slate-700">个人资料修改权限开关:</span>
                    
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-800 transition">
                        <asp:CheckBox ID="Ckclass" runat="server" ToolTip="允许学生修改个人资料中的班级" oncheckedchanged="Ckclass_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600" />
                        允许改班级
                    </label>
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-800 transition">
                        <asp:CheckBox ID="Ckphoto" runat="server" ToolTip="允许学生修改个人资料中的相片" oncheckedchanged="Ckphoto_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600" />
                        允许改相片
                    </label>
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-800 transition">
                        <asp:CheckBox ID="Cksex" runat="server" ToolTip="允许学生修改个人资料中的性别" oncheckedchanged="Cksex_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600" />
                        允许改性别
                    </label>
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-800 transition">
                        <asp:CheckBox ID="Ckname" runat="server" ToolTip="允许学生修改个人资料中的姓名" oncheckedchanged="Ckname_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600" />
                        允许改姓名
                    </label>
                </div>
            </div>
            
            <asp:Label ID="Labelmsg" runat="server" CssClass="text-emerald-500 font-medium text-sm mt-2 block text-center"></asp:Label>
        </div>
        
        <script type="text/javascript">
            function stuShow(d, g, c) {
                var urlat = "../teacher/studentshow.aspx?sid=" + d + "&sgrade=" + g + "&sclass=" + c;
                openLessonModal(urlat, "学生详情", 700);
            }
            function stuAdd(g, c) {
                var urlad = "../teacher/studentadd.aspx?sgrade=" + g + "&sclass=" + c;
                openLessonModal(urlad, "添加学生", 700);
            }
        </script>
    </div>
</asp:Content>

