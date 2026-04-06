<%@ Page Language="C#" AutoEventWireup="true"  StylesheetTheme="Student" CodeFile="register.aspx.cs" Inherits="Student_register" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>新学员注册</title>   
    <link href="../App_Themes/student/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../js/css/tailwind-utilities-2.2.19.min.css" rel="stylesheet">
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
        <div class="min-h-screen flex flex-col items-center justify-center p-4 sm:p-8 -mt-20">
            <!-- Registration Card -->
            <div class="w-full max-w-md bg-white rounded-2xl shadow-lg border border-slate-200 overflow-hidden">
                <div class="bg-gradient-to-r from-blue-500 to-indigo-600 text-white text-center py-5 px-6">
                    <h1 class="text-xl font-extrabold tracking-tight">新学员注册</h1>
                </div>
                <div class="p-6 sm:p-8 space-y-5">
                    <div class="flex items-center gap-3">
                        <label class="text-sm font-semibold text-slate-600 w-20 text-right flex-shrink-0">年级选择</label>
                        <asp:DropDownList ID="DDLgrade" runat="server"
                            CssClass="flex-1 border border-slate-300 rounded-lg px-3 py-2 text-sm bg-white focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition">
                        </asp:DropDownList>
                    </div>
                    <div class="flex items-center gap-3">
                        <label class="text-sm font-semibold text-slate-600 w-20 text-right flex-shrink-0">班级选择</label>
                        <asp:DropDownList ID="DDLclass" runat="server"
                            CssClass="flex-1 border border-slate-300 rounded-lg px-3 py-2 text-sm bg-white focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition">
                        </asp:DropDownList>
                    </div>
                    <div class="flex items-center gap-3">
                        <label class="text-sm font-semibold text-slate-600 w-20 text-right flex-shrink-0">性别选择</label>
                        <asp:DropDownList ID="DDLsex" runat="server"
                            CssClass="flex-1 border border-slate-300 rounded-lg px-3 py-2 text-sm bg-white focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition">
                        </asp:DropDownList>
                    </div>
                    <div class="flex items-center gap-3">
                        <label class="text-sm font-semibold text-slate-600 w-20 text-right flex-shrink-0">姓名</label>
                        <asp:TextBox ID="Tsname" runat="server"
                            CssClass="flex-1 border border-slate-300 rounded-lg px-3 py-2 text-sm bg-white focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition"></asp:TextBox>
                    </div>
                    
                    <asp:Label ID="labelmsg" runat="server" SkinID="LabelMsgRed" CssClass="block text-center text-red-500 font-bold text-sm min-h-[1.25rem]"></asp:Label>
                    
                    <div class="flex items-center justify-center gap-4 pt-2">
                        <asp:Button ID="BtnRegister" runat="server" onclick="BtnRegister_Click" Text="确定" 
                            CssClass="px-8 py-2.5 bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-bold rounded-xl hover:from-blue-600 hover:to-indigo-700 transition duration-300 shadow-md border-0 cursor-pointer" />
                        <asp:Button ID="BtnReturn" runat="server" onclick="BtnReturn_Click" Text="返回" 
                            CssClass="px-8 py-2.5 bg-slate-100 text-slate-600 font-semibold rounded-xl hover:bg-slate-200 transition duration-300 border border-slate-300 cursor-pointer" />
                    </div>
                </div>
            </div>
            
            <!-- Tips -->
            <div class="mt-6 flex items-center gap-2 bg-amber-50 border border-amber-200 rounded-xl px-4 py-3 max-w-md w-full">
                <img src="../images/topicnormal.png" class="w-4 h-4 flex-shrink-0" />
                <span class="text-sm text-amber-800 font-medium">友情提示：请选择老师指定的年级和班级进行注册，以免错班而无法处理！</span>
            </div>
        </div>
    </div>
    </form>
</body>
</html>