<%@ Page Title="" Language="C#" MasterPageFile="~/profile/Pf.master" StylesheetTheme="Student"  AutoEventWireup="true" CodeFile="myname.aspx.cs" Inherits="Profile_myname" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cstu" Runat="Server">
<br />
        <br />
        <br />
        <div  class="pfdiv">
            <div  class="indexhead">姓名修改</div>
                <br />
                您当前的姓名为：<asp:Label ID="Labelname" runat="server" Width="80px"></asp:Label>
                <br />                
            <br />
            请输入您的姓名：<asp:TextBox ID="TextBoxName" runat="server" Font-Size="9pt" 
                SkinID="TextBox" Width="80px" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
            <br />
                    <br />
            <br />
                    <asp:Button ID="Btnname" runat="server"  OnClick="Btnsex_Click" 
                Text="确定"   TabIndex="2"  SkinID="buttonSkin" Height="20px" Width="80px"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
            <br />
            <br />
        <asp:Label ID="Labelstr" runat="server" SkinID="LabelMsgRed"></asp:Label>
                    <br />                
            <br />                
        </div>
        <br />
        <br />
        <br />

</asp:Content>

