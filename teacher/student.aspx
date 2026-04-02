<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="Teacher_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div  class="placehold">
    <div  class="chead">
            学生选择：<asp:DropDownList ID="DDLgrade" runat="server" 
            Width="50px" EnableTheming="True" AutoPostBack="True" 
                onselectedindexchanged="DDLgrade_SelectedIndexChanged">
        </asp:DropDownList>
            年级 
            <asp:DropDownList ID="DDLclass" runat="server" 
            Width="50px" EnableTheming="True" AutoPostBack="True" 
                onselectedindexchanged="DDLclass_SelectedIndexChanged">
        </asp:DropDownList>
            班级
            <asp:Label ID="Label1" runat="server" Width="360px" Height="16px"></asp:Label>
            <asp:HyperLink ID="HkaddStu" runat="server" SkinID="HyperLinkBtn" CssClass="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 transition duration-300 shadow-md text-center inline-block">添加学生</asp:HyperLink>
                &nbsp;
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
                    <br />
            <asp:Button ID="BtnSpwdInit" runat="server"  OnClick="BtnSpwdInit_Click" 
            Text="初始化密码"  SkinID="BtnNormal" ToolTip="将本班所有学生的密码初始为12345(或右侧自定义密码)" 
            Width="90px"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />&nbsp;将学生密码设置为<asp:TextBox 
            ID="TextBoxPwd" runat="server" SkinID="TextBoxNum" 
            BackColor="#FFFFCC" Width="80px" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300">12345</asp:TextBox>
            &nbsp;<asp:Button ID="BtnSpell" runat="server"  OnClick="BtnSpell_Click" 
            Text="转拼音缩写"  SkinID="BtnNormal" ToolTip="将当前为原初始化密码的学生密码转换为其姓名拼音缩写" 
            Width="90px"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
        &nbsp;小组上限：<asp:DropDownList ID="DDLgroupMax" runat="server" 
            Width="40px" EnableTheming="True" AutoPostBack="True" 
                onselectedindexchanged="DDLgroupMax_SelectedIndexChanged">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem Selected="True">6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
            &nbsp;<asp:Button ID="BtnNoGroup" runat="server"  OnClick="BtnNoGroup_Click" 
            Text="解除分组"  SkinID="BtnNormal" ToolTip="一键将本班所有学生解除分组" 
              CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
        &nbsp;
                    <asp:Button ID="Btngroups" runat="server" SkinID="BtnNormal" 
                Text="分组管理"  onclick="Btngroups_Click"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
        &nbsp;
            <asp:Button ID="BtnExcel" runat="server"  OnClick="BtnExcel_Click" 
            Text="导出学生"  SkinID="BtnNormal" ToolTip="将所有学生的基本信息导出Excel" 
              CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
        &nbsp;
                    <asp:Button ID="BtnRevive" runat="server" SkinID="BtnNormal"
                Text="恢复学生"  onclick="BtnRevive_Click"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
        <br />
        <br />
        <div style="margin: auto; width: 920px; background-color: #DDDDDD; text-align: center;">
            <asp:CheckBox ID="Ckreg" runat="server" Text="是否允许在线注册" oncheckedchanged="Ckreg_CheckedChanged" 
                AutoPostBack="True"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 学生个人资料权限：
            <asp:CheckBox ID="Ckclass" runat="server" Text="班级修改" 
                ToolTip="允许学生修改个人资料中的班级" oncheckedchanged="Ckclass_CheckedChanged" 
                AutoPostBack="True" />
            &nbsp;
            <asp:CheckBox ID="Ckphoto" runat="server" Text="相片修改" 
                ToolTip="允许学生修改个人资料中的相片" oncheckedchanged="Ckphoto_CheckedChanged" 
                AutoPostBack="True" />
            &nbsp;
            <asp:CheckBox ID="Cksex" runat="server" Text="性别修改" ToolTip="允许学生修改个人资料中的性别" 
                oncheckedchanged="Cksex_CheckedChanged" AutoPostBack="True" />
            &nbsp;
            <asp:CheckBox ID="Ckname" runat="server" Text="姓名修改" ToolTip="允许学生修改个人资料中的姓名" 
                oncheckedchanged="Ckname_CheckedChanged" AutoPostBack="True" />
        </div>

        <script type ="text/javascript" >
            function stuShow(d, g, c) {
                var urlat = "../teacher/studentshow.aspx?sid=" + d + "&sgrade=" + g + "&sclass=" + c;
                openLessonModal(urlat, "学生详情", 300);
            }
            function stuAdd(g, c) {
                var urlad = "../teacher/studentadd.aspx?sgrade=" + g + "&sclass=" + c;
                openLessonModal(urlad, "添加学生", 320);
            }
        </script>
        <br />
        <br />
    </div>
</asp:Content>
