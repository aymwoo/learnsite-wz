<%@ Page Language="C#" AutoEventWireup="true"  StylesheetTheme="Student" CodeFile="register.aspx.cs" Inherits="Student_register" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>新学员注册</title>   
    <link href="../App_Themes/student/StyleSheet.css" rel="stylesheet" type="text/css" />
    
    <link href="https://cdn.bootcdn.net/ajax/libs/tailwindcss/2.2.19/utilities.min.css" rel="stylesheet">
</head>
<body class="ground">
    <form id="form1" runat="server">
    <center>
      <div  class="studmasterhead">
            <div  class="banner" > 
                </div>
                <center>
            <div  class="menu">            
            </div>
            </center>
            <center>
            <div class="placeauto" >
            <div > 
            <div  class="path">&nbsp;
            <div>
            <br /><br /><br /><br /><br />
                <div class="indexdiv">
                   <div class="indexhead" >
                    新学员注册
                    </div>
                    <br />
            年级选择：<asp:DropDownList 
                 ID="DDLgrade" runat="server" Width="60px" >
                    </asp:DropDownList>
                    <br />
                    <br />
            班级选择：<asp:DropDownList ID="DDLclass" runat="server" Width="60px" >
                    </asp:DropDownList>
                    <br />
                    <br />
                    性别选择：<asp:DropDownList ID="DDLsex" runat="server" Font-Size="9pt" Width="60px" 
                        BackColor="Cornsilk">
                    </asp:DropDownList>
                    <br />
                    <br />
                    姓名：<asp:TextBox ID="Tsname" runat="server" 
                        BackColor="Cornsilk" BorderColor="#B1C9FE"
                        BorderStyle="Dashed" BorderWidth="1px" Width="86px" Height="20px" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
                    <br />
                    <asp:Label ID="labelmsg" runat="server" SkinID="LabelMsgRed"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="BtnRegister" runat="server" onclick="BtnRegister_Click" Text="确定" 
                    CssClass="buttonimg px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" Height="24px"  Width="80px" />
                    &nbsp;
                    <asp:Button ID="BtnReturn" runat="server" onclick="BtnReturn_Click" Text="返回" 
                    CssClass="buttonimg px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" Height="24px"  Width="80px" />
                    <br />
                    <br />
                </div>
            </div>
            <div>
                <br />
            <br />
            <br />
            <div style="font-size: 11pt; color: #137DCC;">
                <img src="../images/topicnormal.png" />友情提示：请选择老师指定的年级和班级进行注册，以免错班而无法处理！</div>
            </div>
            </div>
        </div>             
        </div>
         </center> 
         </div> 
        </center>  
    </form>
</body>
</html>