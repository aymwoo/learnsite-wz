<%@ Page Title="" Language="C#" StylesheetTheme="Student" Validaterequest="false" AutoEventWireup="true" CodeFile="downwork.aspx.cs" Inherits="Student_downwork" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>作品下载</title> 
    
    <link href="https://cdn.bootcdn.net/ajax/libs/tailwindcss/2.2.19/utilities.min.css" rel="stylesheet">
</head>
<body ondragstart="return false" onselectstart ="return false" >
     <form id="form1" runat="server">
    <div  class="studmasterhead"> 
            <center>
                <div class="placeauto">
<div id="student">
<div style="padding-bottom: 10px;"> 
    <br />
    〖<asp:Label ID="Labelmission" runat="server"></asp:Label>〗
        <strong>作品下载</strong>：<asp:Image ID ="ImageType" runat="server" />
<asp:HyperLink ID="HLfile" runat="server"  Visible="False" BorderStyle="None" 
        CssClass="txtszcenter px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 transition duration-300 shadow-md text-center inline-block" Height="18px" Target="_blank" Font-Underline="True">作品</asp:HyperLink>
        <asp:Label ID="Labelsize" runat="server"></asp:Label>
        <asp:Label ID="Labelmsg" runat="server" Font-Bold="False"></asp:Label>
    <asp:Image ID="Imagegood" runat="server"  ImageUrl="~/images/good16.png" Width="16px" />
    <asp:Label ID="Labelgood" runat="server"></asp:Label>
    <asp:Label ID="LabelWdate" runat="server"></asp:Label>
    <br />
    <br />
    作品评分：<asp:Label ID="LbWscore" runat="server"></asp:Label>
       &nbsp;作品加分：<asp:Label ID="LbWdscore" runat="server"></asp:Label>
       &nbsp;互评得分：<asp:Label ID="LbWfscore" runat="server"></asp:Label>&nbsp; 教师评语：<asp:Label ID="LbWself" runat="server" ForeColor="#3399FF"></asp:Label>
    <br />
    </div> 
    </div>
    </div>
    </center>
</div>
    <div>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal> 
    </div>

        <br />        
        <br />
        <asp:Label ID="Labelwid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Labeltype" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Labelwurl" runat="server" Visible="False"></asp:Label>
     </form>
</body>
</html>

