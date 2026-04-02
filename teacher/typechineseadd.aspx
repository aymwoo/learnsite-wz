<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="typechineseadd.aspx.cs" Inherits="Teacher_typechineseadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div  class="placehold">
<br />
    <div  class="typediv">
        &nbsp; 拼音词语标题：<asp:TextBox ID="Ttitle" runat="server"  Width="220px"  
            SkinID="TextBoxNormal" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
        &nbsp;
        &nbsp;
        <asp:Button ID="BtnNoSet" runat="server" Text="清除格式" OnClick="BtnNoSet_Click"  SkinID="BtnNormal"  ToolTip="系统限制汉字长度为210个"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
                </div>
    <div  class="typediv">
        <asp:TextBox ID="Tcontent" runat="server" Height="500px"  TextMode="MultiLine"
            Width="650px" BorderColor="#DFDFDF" BorderStyle="Solid" BorderWidth="1px" 
            BackColor="White"  CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
        <br />
     <div  class="typedivcenter">
         <br />
              <asp:Button ID="BtnAdd" runat="server"  Text="添加" OnClick="BtnAdd_Click"  SkinID="BtnNormal"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Button ID="Btnreturn" runat="server"  Text="返回" OnClick="Btnreturn_Click"  SkinID="BtnNormal"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" /><br />
               <br />
               <asp:Label ID="Labelmsg" runat="server">文章长度无限制，词语分隔符使用中文逗号、句号或空格！</asp:Label>
         <br />
         </div>
         </div>
         <br />
         <br />           
        </div>

</asp:Content>

