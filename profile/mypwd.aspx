<%@ Page Title="" Language="C#" MasterPageFile="~/profile/Pf.master" StylesheetTheme="Student"  AutoEventWireup="true" CodeFile="mypwd.aspx.cs" Inherits="Profile_mypwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cstu" Runat="Server">
        <br />
        <br />
        <br />
        <div  class="pfdiv">
            <div  class="indexhead">
                密码修改</div>
                <br />
                <br />
                
            输入旧密码：<asp:TextBox ID="TextBoxoldpwd" runat="server"  Width="80px" TextMode="Password" 
                TabIndex="1" SkinID="TextBox" ToolTip="旧密码确认框" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
                    <br />
                
            <br />
            输入新密码：<asp:TextBox ID="TextBoxpwd" runat="server"  Width="80px" TextMode="Password" 
                TabIndex="1" SkinID="TextBox" ToolTip="新密码" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
                    <br />
            <br />
            确认新密码：<asp:TextBox ID="TextBoxpwd0" runat="server"  Width="80px" TextMode="Password" 
                TabIndex="1" SkinID="TextBox" ToolTip="新密码" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
            <br />
            <br />
                    <asp:Button ID="Btnedit" runat="server"  OnClick="Btnedit_Click" 
                Text="确定"   TabIndex="2"  SkinID="buttonSkin" Height="20px" Width="80px" 
                Enabled="False"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
            <br />
            <br />
        <asp:Label ID="Labelmsg" runat="server"  SkinID="LabelMsgRed" ></asp:Label>
                    <br />
            <br />
               
        </div>
        <br />
        <br />
        <br />
</asp:Content>

