<%@ Page Title="" Language="C#" StylesheetTheme="Student" AutoEventWireup="true"
    CodeFile="mynum.aspx.cs" Inherits="Student_mynum" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>学号查询</title>
    <link href="../App_Themes/Student/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../js/tooltip.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <link href="../js/css/tailwind-utilities.css" rel="stylesheet">
    <style>
        body { 
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Noto Sans SC", sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e0e7ff 100%);
            -webkit-font-smoothing: antialiased;
            margin: 0; min-height: 100vh;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="studmasterhead">
        <div class="banner"></div>
        <div class="w-full max-w-5xl mx-auto px-4 sm:px-6 py-8 space-y-6">
            <!-- Search Card -->
            <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6">
                <h2 class="text-xl font-extrabold text-slate-800 mb-4 flex items-center gap-2">
                    <svg class="w-5 h-5 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                    学号查询
                </h2>
                <div class="flex flex-wrap items-center gap-4">
                    <div class="flex items-center gap-2">
                        <span class="text-sm font-medium text-slate-500">年级：</span>
                        <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DDLgrade_SelectedIndexChanged"
                            CssClass="border border-slate-300 rounded-lg px-3 py-1.5 text-sm bg-white focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition">
                        </asp:DropDownList>
                    </div>
                    <div class="flex items-center gap-2">
                        <span class="text-sm font-medium text-slate-500">班级：</span>
                        <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DDLclass_SelectedIndexChanged"
                            CssClass="border border-slate-300 rounded-lg px-3 py-1.5 text-sm bg-white focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition">
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="BtnSearch" runat="server" OnClick="BtnSearch_Click" Text="查询" BorderStyle="None"
                        CssClass="px-5 py-2 bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-bold rounded-xl hover:from-blue-600 hover:to-indigo-700 transition duration-300 shadow-md border-0 cursor-pointer" />
                    <div class="flex items-center gap-2 ml-auto">
                        <span class="text-sm font-medium text-slate-500">密码：</span>
                        <asp:TextBox ID="TextBoxPwd" runat="server" ReadOnly="True" 
                            CssClass="border-2 border-dashed border-indigo-300 rounded-lg px-3 py-1.5 text-center font-bold text-xl text-pink-500 bg-indigo-50 w-24 cursor-pointer hover:bg-indigo-100 transition"
                            onClick="copy()">123</asp:TextBox>
                    </div>
                </div>
            </div>
            
            <!-- Student Grid -->
            <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6 overflow-x-auto">
                <asp:DataList ID="DataListsnum" runat="server" RepeatDirection="Horizontal" RepeatColumns="10"
                    CellPadding="8" OnItemDataBound="DataListsnum_ItemDataBound" 
                    HorizontalAlign="Center" CellSpacing="2">
                    <ItemTemplate>
                        <div class="stunum">
                            <asp:Image ID="ImageStu" class="stuimg" runat="server" Visible="True" /><br />
                            <asp:HyperLink ID="HLSnum" runat="server" Text='<%# Eval("Sname") %>' ToolTip='<%# Eval("Snum") %>' CssClass="stulink"></asp:HyperLink>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
    <script src="../js/ToolTip.js" type="text/javascript"></script>
    <script type="text/javascript">
        var msg = document.getElementById("TextBoxPwd");  
        msg.title ='点击复制';
        function copy() {          
            // 使用示例
            copyTextToClipboard(msg.value);
            msg.title ='已复制';
        }
        async function copyTextToClipboard(text) {
            try {
                await navigator.clipboard.writeText(text);
                console.log('已复制');
            } catch (err) {
                console.error('Failed to copy: ', err);
            }
        }
    </script>
    </form>
</body>
</html>
