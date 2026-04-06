<%@ Page Title="" Language="C#" StylesheetTheme="Student" AutoEventWireup="true" CodeFile="myrule.aspx.cs" Inherits="Student_myrule" %>
    
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>课堂守则</title>   
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
        <div class="flex flex-col items-center justify-center p-4 sm:p-8">
            <div class="w-full max-w-2xl bg-white rounded-2xl shadow-lg border border-slate-200 overflow-hidden mb-6">
                <div class="bg-gradient-to-r from-blue-500 to-indigo-600 text-white text-xl font-extrabold py-4 px-6 text-center tracking-tight">
                    课堂守则
                </div>
                <div class="p-6 space-y-4">
                    <div class="flex items-start pb-3 border-b border-slate-100 hover:bg-slate-50 rounded-lg px-3 py-2 transition">
                        <span class="text-indigo-500 font-bold mr-3 text-lg">1.</span>
                        <span class="text-slate-700">无请假缺席：每人扣1分</span>
                    </div>
                    <div class="flex items-start pb-3 border-b border-slate-100 hover:bg-slate-50 rounded-lg px-3 py-2 transition">
                        <span class="text-indigo-500 font-bold mr-3 text-lg">2.</span>
                        <span class="text-slate-700">迟到：每人扣0.1分</span>
                    </div>
                    <div class="flex items-start pb-3 border-b border-slate-100 hover:bg-slate-50 rounded-lg px-3 py-2 transition">
                        <span class="text-indigo-500 font-bold mr-3 text-lg">3.</span>
                        <span class="text-slate-700">吃零食带饮料：每人扣0.1分</span>
                    </div>
                    <div class="flex items-start pb-3 border-b border-slate-100 hover:bg-slate-50 rounded-lg px-3 py-2 transition">
                        <span class="text-indigo-500 font-bold mr-3 text-lg">4.</span>
                        <span class="text-slate-700">乱丢垃圾：每人扣0.1分且负责拖地一次</span>
                    </div>
                    <div class="flex items-start pb-3 border-b border-slate-100 hover:bg-slate-50 rounded-lg px-3 py-2 transition">
                        <span class="text-indigo-500 font-bold mr-3 text-lg">5.</span>
                        <span class="text-slate-700">未经老师允许玩游戏：每人扣0.1分</span>
                    </div>
                    <div class="flex items-start pb-3 border-b border-slate-100 hover:bg-slate-50 rounded-lg px-3 py-2 transition">
                        <span class="text-indigo-500 font-bold mr-3 text-lg">6.</span>
                        <span class="text-slate-700">带存储设备（mp3、U盘）并使用：每人扣0.1分</span>
                    </div>
                    <div class="flex items-start pb-3 border-b border-slate-100 hover:bg-slate-50 rounded-lg px-3 py-2 transition">
                        <span class="text-indigo-500 font-bold mr-3 text-lg">7.</span>
                        <span class="text-slate-700">故意搞乱电脑硬件，扣1分</span>
                    </div>
                    <div class="flex items-start hover:bg-slate-50 rounded-lg px-3 py-2 transition">
                        <span class="text-indigo-500 font-bold mr-3 text-lg">8.</span>
                        <span class="text-slate-700">未经老师允许，私自下座位或换座位，扣1分。</span>
                    </div>
                </div>
            </div>
            <asp:Button ID="Btnreturn" runat="server" Text="关闭" BorderStyle="None" 
                CssClass="px-8 py-2.5 bg-slate-100 text-slate-600 font-semibold rounded-xl hover:bg-slate-200 transition duration-300 border border-slate-300 cursor-pointer" />
        </div>
    </div>
    </form>
</body>
</html>