<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher"  AutoEventWireup="true" CodeFile="worknoscore.aspx.cs" Inherits="Teacher_worknoscore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div  class="placehold">   
       <div  class="cline"></div>
        <strong>
    <asp:Label  ID="LabeCtitle" runat="server" Font-Bold="True"></asp:Label>
    <asp:DropDownList 
            ID="DDLclass" runat="server" Font-Size="9pt"  Width="50px" AutoPostBack="True" 
                onselectedindexchanged="DDLclass_SelectedIndexChanged" 
            Font-Bold="True" Height="24px">
    </asp:DropDownList>
          班未评作品列表
    <asp:Label  ID="LabelMtitle" runat="server" Font-Bold="True"></asp:Label>
        </strong>
        <br />
<center>
    <div style="font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 9pt">
        <asp:ImageButton ID="ImgBtnLeft" runat="server" ImageUrl="~/images/left.png" 
            onclick="ImgBtnLeft_Click" Width="16px" />
    <asp:DropDownList ID="DDLstore" runat="server" 
            Font-Bold="True" Width="100px" AutoPostBack="True" Font-Size="12pt" 
            onselectedindexchanged="DDLstore_SelectedIndexChanged">
        <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:ImageButton ID="ImgBtnright" runat="server" 
            ImageUrl="~/images/right.png" onclick="ImgBtnright_Click" />
         <asp:Label ID="lbcurindex" runat="server" Text="0" Visible="False"></asp:Label>
            <asp:Label ID="LabelMid" runat="server" Font-Names="Arial" Font-Size="9pt" 
            Visible="False"></asp:Label>
            <asp:Label ID="Labelnum" runat="server" Font-Names="Arial" Font-Size="9pt" 
            Visible="False"></asp:Label>
         <br />
         <div style="margin: 10px; ">
             <asp:Image ID="Image1" runat="server" ImageUrl="~/images/peer_review.png" 
                 ToolTip="少于80个汉字，超过自动裁剪。" />
        教师评语：<asp:TextBox ID="TextBoxWself" runat="server" Width="200px" 
                BorderColor="Silver" BorderStyle="Dashed" BorderWidth="1px" 
                 BackColor="#FFF9E1" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox> 
        &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/images/token.png" />
             加分：<asp:TextBox ID="TextBoxWdsocre" runat="server" MaxLength="2" Width="40px" 
                 BackColor="#FDF5E3" SkinID="TextBoxNum" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300">0</asp:TextBox>
        <asp:RadioButtonList ID="RBLselect" runat="server"   RepeatDirection="Horizontal" Visible="True" 
            Font-Size="16pt" AutoPostBack="True" 
                 onselectedindexchanged="RBLselect_SelectedIndexChanged" RepeatLayout="Flow" 
              CellPadding="0" CellSpacing="18" Width="300px" >
                                    <Items>
                                    <asp:ListItem>G</asp:ListItem>
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem>E</asp:ListItem>
                                    <asp:ListItem>O</asp:ListItem>
                                    </Items>
                                </asp:RadioButtonList>
             &nbsp;
        <asp:ImageButton ID="ImgBtn" runat="server" ImageUrl="~/images/refresh.gif" 
            onclick="ImgBtn_Click" ToolTip="循环展播专用刷新" />
            <asp:Label ID="lbcount" runat="server"></asp:Label>
             <br />
        </div>   
        </div>        
        <div style=" font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 11pt; margin: 2px; " >
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>
        
        <br />
        <asp:HyperLink ID="Hlcode" runat="server" Font-Size="11pt" Target="_blank" 
            Visible="False" CssClass="HyperlinkNormal px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 transition duration-300 shadow-md text-center inline-block" >查看脚本</asp:HyperLink> 
        </div>
        </center>
        <br />
    <asp:Button ID="Btnback" runat="server" BorderWidth="1px" Height="20px" Text="返回"
                Width="60px" OnClick="Btnback_Click" CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />

    </div>
</asp:Content>
