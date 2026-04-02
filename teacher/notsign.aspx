<%@ Page Title="" Language="C#" StylesheetTheme="Teacher" AutoEventWireup="true"   CodeFile="notsign.aspx.cs" Inherits="Teacher_notsign" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title> 
    <style type="text/css">
    .by{margin:0px}
    .phold{margin: auto; width:360px; text-align: center;font-size: 11pt;font-family: Arial;}
    .hearder{ background-color: #939CA2;height: 18px;text-align: center;line-height: 18px;}
    </style>

    <link href="https://cdn.bootcdn.net/ajax/libs/tailwindcss/2.2.19/utilities.min.css" rel="stylesheet">
</head>
<body class="by">
    <form id="form1" runat="server">
    <div  class="phold" >
    <div  class="hearder"> 
        对<asp:Label ID="Labelname" runat="server" Font-Bold="True"></asp:Label>&nbsp;同学缺席备注
     </div>    
        <br />
        缺席原因：<br />
        <asp:TextBox ID="TextBox1" runat="server" Width="220px" Height="112px" 
        BackColor="#FFE7CE" TextMode="MultiLine" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
        <br />
    <asp:Label ID="Labelmsg" runat="server"></asp:Label>
        <br />
    <asp:Button ID="Btnnotsign" runat="server"  Text="确定"  
        onclick="Btnnotsign_Click"  SkinID="BtnNormal"   CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
</div>
</form>
</body>
</html>

