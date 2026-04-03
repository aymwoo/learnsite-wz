<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="Teacher_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<div class="w-full mx-auto p-4 sm:p-6 space-y-6 font-sans text-slate-800">
    <!-- Header Controls -->
    <div class="bg-white rounded-2xl shadow-[0_4px_20px_rgba(0,0,0,0.03)] border border-slate-200 overflow-hidden border-t-4 border-t-blue-500">
        <div class="px-6 py-5 bg-gradient-to-r from-slate-50 to-white flex flex-col lg:flex-row items-center justify-between gap-6">
            <div class="flex flex-col sm:flex-row items-center gap-4">
                <h1 class="text-[16px] font-extrabold text-slate-800 flex items-center gap-2 whitespace-nowrap">
                    <i class="bi bi-people-fill text-blue-600"></i> 学生管理
                </h1>
                
                <div class="flex items-center gap-3 bg-white px-4 py-2 border border-slate-200 shadow-sm rounded-xl">
                    <div class="flex items-center gap-1">
                        <span class="text-xs font-bold text-slate-500">年级</span>
                        <asp:DropDownList ID="DDLgrade" runat="server" CssClass="border-0 bg-transparent text-sm font-bold text-indigo-600 focus:ring-0 cursor-pointer" EnableTheming="True" AutoPostBack="True" onselectedindexchanged="DDLgrade_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="w-px h-4 bg-slate-200"></div>
                    <div class="flex items-center gap-1">
                        <span class="text-xs font-bold text-slate-500">班级</span>
                        <asp:DropDownList ID="DDLclass" runat="server" CssClass="border-0 bg-transparent text-sm font-bold text-indigo-600 focus:ring-0 cursor-pointer" EnableTheming="True" AutoPostBack="True" onselectedindexchanged="DDLclass_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>
                <asp:Label ID="Label1" runat="server" CssClass="text-sm text-emerald-600 font-bold ml-2"></asp:Label>
            </div>
            
            <div class="flex items-center">
                <asp:HyperLink ID="HkaddStu" runat="server" CssClass="px-6 py-2.5 bg-gradient-to-br from-indigo-600 to-indigo-700 text-white font-bold text-[13px] rounded-xl hover:-translate-y-0.5 hover:shadow-lg transition-all duration-300 shadow-sm border-0 flex items-center gap-1.5 cursor-pointer">
                    <i class="bi bi-person-plus-fill"></i> 添加学生
                </asp:HyperLink>
            </div>
        </div>
    </div>

        <!-- Data Grid -->
        <div class="bg-white rounded-2xl shadow-[0_4px_20px_rgba(0,0,0,0.03)] border border-slate-200 overflow-x-auto w-full">
            <asp:GridView ID="GVStudent" runat="server" AutoGenerateColumns="False" Width="100%" 
                            CellPadding="3" PageSize="15" CssClass="w-full text-sm text-center text-slate-600 whitespace-nowrap"
             OnRowDataBound="GVStudent_RowDataBound" EnableModelValidation="True" DataKeyNames="Sid" onrowcommand="GVStudent_RowCommand"
              GridLines="None" AllowPaging="True" onpageindexchanging="GVStudent_PageIndexChanging" >
            <HeaderStyle CssClass="bg-slate-50 font-bold text-slate-700 border-b border-slate-200" />
            <RowStyle CssClass="border-b border-slate-100 hover:bg-slate-50 transition-colors" />
            <Columns>
                <asp:BoundField HeaderText="序号">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3 font-mono text-slate-400" />
                </asp:BoundField>
                <asp:BoundField DataField="Snum" HeaderText="学号">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3 font-mono text-indigo-600 font-bold" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="密码">
                    <ItemTemplate>
                        <asp:Label ID="Labelpwd" runat="server" Text='******' ToolTip='<%# Bind("Spwd") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3 text-slate-500" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                            CommandArgument='<%# Eval("Sid") %>' CommandName="ChangePwd" 
                            ImageUrl="~/images/refresh.gif" Text="更新" ToolTip="自动更新密码" CssClass="opacity-70 hover:opacity-100 transition" />
                    </ItemTemplate>
                    <ItemStyle CssClass="py-3 px-2" />
                </asp:TemplateField>
                <asp:BoundField DataField="Sgrade" HeaderText="年级">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3" />
                </asp:BoundField>
                <asp:BoundField DataField="Sclass" HeaderText="班级">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3 font-semibold text-slate-700" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="姓名">
                    <ItemTemplate>
                        <asp:HyperLink ID="Hlname" runat="server"  
                            Text='<%# Eval("Sname") %>' ToolTip='<%# Eval("Sid") %>' CssClass="font-bold text-slate-800 hover:text-indigo-600 transition-colors"></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-4 px-3 text-left" />
                    <ItemStyle HorizontalAlign="Left" CssClass="py-3 px-3" />
                </asp:TemplateField>
                <asp:BoundField DataField="Sex" HeaderText="性别">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False" HeaderText="小组">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageBtnGroup" runat="server" CausesValidation="False" 
                            CommandArgument='<%# Eval("Sid") %>' CommandName="ChangeGroup" 
                            ImageUrl="~/images/gcard.gif" CssClass="opacity-80 hover:opacity-100 transition" />
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="组号" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkBtnQuit" runat="server" CausesValidation="false" 
                            CommandArgument='<%# Eval("Sid") %>'  CommandName="QuitGroup" Text='<%# Eval("Sgroup") %>' CssClass="w-6 h-6 inline-flex items-center justify-center rounded-xl bg-slate-100 text-slate-600 hover:bg-slate-200 hover:text-slate-800 text-xs font-bold transition-colors"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-4 px-2" />
                    <ItemStyle CssClass="py-3 px-2 text-center" />
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="Snum" 
                    DataNavigateUrlFormatString="studentwork.aspx?snum={0}" DataTextField="Sscore" 
                    HeaderText="成绩" Target="_blank">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3 font-bold text-emerald-600 hover:text-emerald-800 transition" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="Snum" 
                    DataNavigateUrlFormatString="studentworks.aspx?snum={0}"  Text="浏览"
                    HeaderText="作品" Target="_blank">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3 font-bold text-blue-600 hover:text-blue-800 transition" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="Sattitude" HeaderText="表现">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3 text-rose-500 font-bold" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="Sid,Sgrade,Sclass" DataNavigateUrlFormatString="studentdel.aspx?sid={0}&amp;sgrade={1}&amp;sclass={2}"
                    Text="删除">
                    <HeaderStyle CssClass="py-4 px-3" />
                    <ItemStyle CssClass="py-3 px-3 text-rose-500 font-medium hover:text-rose-700 transition" />
                </asp:HyperLinkField>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="LabelSleader" runat="server" Text='<%# Bind("Sleader") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerTemplate>
                <div class="flex items-center justify-end gap-2 p-4 bg-slate-50 border-t border-slate-200 text-xs font-bold text-slate-500">
                    <span class="mr-4">第 <asp:Label ID="lblPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>" CssClass="text-indigo-600"></asp:Label> / <asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label> 页</span>
                    
                    <asp:LinkButton ID="btnFirst" runat="server" CommandArgument="First" CommandName="Page" 
                        CssClass="px-3 py-1.5 bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl transition">首页</asp:LinkButton>
                    <asp:LinkButton ID="btnPrev" runat="server" CommandArgument="Prev" CommandName="Page" 
                        CssClass="px-3 py-1.5 bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl transition">上一页</asp:LinkButton>
                    <asp:LinkButton ID="btnNext" runat="server" CommandArgument="Next" CommandName="Page" 
                        CssClass="px-3 py-1.5 bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl transition">下一页</asp:LinkButton>
                    <asp:LinkButton ID="btnLast" runat="server" CommandArgument="Last" CommandName="Page" 
                        CssClass="px-3 py-1.5 bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl transition">尾页</asp:LinkButton>
                </div>
            </PagerTemplate>           
        </asp:GridView>
        </div>
        
        <!-- Management Toolbars -->
        <div class="flex flex-col gap-4">
            <!-- Quick Actions Bar -->
            <div class="bg-white p-5 rounded-2xl shadow-[0_4px_20px_rgba(0,0,0,0.03)] border border-slate-200 flex flex-wrap items-center justify-between gap-4">
                <div class="flex flex-wrap items-center gap-3">
                    <div class="flex items-center gap-2 bg-slate-50 border border-slate-200 rounded-xl p-1 h-10 shadow-sm">
                        <asp:TextBox ID="TextBoxPwd" runat="server"
                            CssClass="h-full bg-white border border-slate-300 text-slate-800 font-mono font-bold px-2 rounded-xl text-center w-16 text-sm focus:outline-none focus:border-indigo-500 transition">12345</asp:TextBox>
                        <asp:Button ID="BtnSpwdInit" runat="server" OnClick="BtnSpwdInit_Click"
                            Text="初始化本班密码" ToolTip="将本班所有学生的密码初始为左侧自定义密码"
                            CssClass="h-full bg-amber-500 text-white font-bold text-xs px-3 rounded-xl hover:bg-amber-600 transition-colors cursor-pointer border-0" />
                    </div>
                    
                    <asp:Button ID="BtnSpell" runat="server" OnClick="BtnSpell_Click"
                        Text="转拼音缩写" ToolTip="将当前为原初始化密码的学生密码转换为其姓名拼音缩写"
                        CssClass="px-4 h-10 bg-slate-100 text-slate-700 font-bold rounded-xl hover:bg-slate-200 hover:text-indigo-600 transition shadow-sm text-sm border-0 cursor-pointer" />
                </div>
                
                <div class="flex flex-wrap items-center gap-3">
                    <div class="flex items-center gap-2 bg-slate-50 px-3 h-10 rounded-xl border border-slate-200 shadow-sm">
                        <span class="text-xs font-bold text-slate-500">小组上限</span>
                        <asp:DropDownList ID="DDLgroupMax" runat="server" CssClass="bg-white border border-slate-300 rounded-xl text-xs px-1.5 py-1 outline-none font-bold text-indigo-700 cursor-pointer" EnableTheming="True" AutoPostBack="True" onselectedindexchanged="DDLgroupMax_SelectedIndexChanged">
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
                        CssClass="px-4 h-10 bg-indigo-50 text-indigo-700 font-bold text-sm rounded-xl hover:bg-indigo-100 transition shadow-sm cursor-pointer border-0" />
                    
                    <asp:Button ID="BtnNoGroup" runat="server" OnClick="BtnNoGroup_Click"
                        Text="解除分组" ToolTip="一键将本班所有学生解除分组"
                        CssClass="px-4 h-10 bg-rose-50 text-rose-600 font-bold rounded-xl hover:bg-rose-100 transition shadow-sm text-sm cursor-pointer border-0" />
                        
                    <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click"
                        Text="导出学生" ToolTip="将所有学生的基本信息导出Excel"
                        CssClass="px-4 h-10 bg-emerald-50 text-emerald-600 font-bold rounded-xl hover:bg-emerald-100 transition shadow-sm text-sm cursor-pointer border-0" />
                        
                    <asp:Button ID="BtnRevive" runat="server" Text="恢复学生" onclick="BtnRevive_Click"
                        CssClass="px-4 h-10 bg-blue-600 text-white font-bold text-sm rounded-xl hover:bg-blue-700 transition shadow-sm cursor-pointer border-0" />
                </div>
            </div>

            <!-- Permission Settings Bar -->
            <div class="bg-white rounded-2xl p-5 flex flex-wrap items-center gap-6 border border-slate-200 shadow-[0_4px_20px_rgba(0,0,0,0.03)] mt-2">
                <div class="flex items-center gap-3 pr-6 border-r border-slate-200">
                    <span class="text-sm font-bold text-slate-800"><i class="bi bi-shield-lock-fill text-slate-400 mr-1"></i>权限限制</span>
                    <label class="flex items-center gap-2 text-sm text-indigo-700 font-bold cursor-pointer hover:text-indigo-800 transition">
                        <asp:CheckBox ID="Ckreg" runat="server" oncheckedchanged="Ckreg_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600 w-4 h-4 cursor-pointer" />
                        允许在线注册
                    </label>
                </div>
                
                <div class="flex flex-wrap items-center gap-5">
                    <span class="text-sm font-bold text-slate-800">个人资料修改开关</span>
                    
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-900 transition">
                        <asp:CheckBox ID="Ckclass" runat="server" ToolTip="允许学生修改个人资料中的班级" oncheckedchanged="Ckclass_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600 cursor-pointer" />
                        改班级
                    </label>
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-900 transition">
                        <asp:CheckBox ID="Ckphoto" runat="server" ToolTip="允许学生修改个人资料中的相片" oncheckedchanged="Ckphoto_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600 cursor-pointer" />
                        改相片
                    </label>
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-900 transition">
                        <asp:CheckBox ID="Cksex" runat="server" ToolTip="允许学生修改个人资料中的性别" oncheckedchanged="Cksex_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600 cursor-pointer" />
                        改性别
                    </label>
                    <label class="flex items-center gap-2 text-sm text-slate-600 font-medium cursor-pointer hover:text-slate-900 transition">
                        <asp:CheckBox ID="Ckname" runat="server" ToolTip="允许学生修改个人资料中的姓名" oncheckedchanged="Ckname_CheckedChanged" AutoPostBack="True" CssClass="accent-indigo-600 cursor-pointer" />
                        改姓名
                    </label>
                </div>
            </div>
            
            <asp:Label ID="Labelmsg" runat="server" CssClass="text-emerald-600 font-bold text-sm mt-2 block text-center"></asp:Label>
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