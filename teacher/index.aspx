<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Teacher_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="flex items-center justify-center min-h-[calc(100vh-16rem)] py-12 px-4 sm:px-6 lg:px-8">
        <div class="bg-white p-8 sm:p-12 rounded-2xl shadow-xl w-full max-w-md ring-1 ring-slate-200/50">
            <div class="text-center mb-8">
                <h2 class="phead text-3xl font-extrabold text-slate-900 tracking-tight bg-transparent h-auto">教师登录</h2>
                <p class="mt-2 text-sm text-slate-600">欢迎来到信息科技教学平台</p>
            </div>
            <div class="space-y-6">
                <div>
                    <label for="Textname" class="block text-sm font-medium text-slate-700 mb-1">账号</label>
                    <asp:TextBox ID="Textname" runat="server" SkinID="TextBoxNormal" CssClass="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-all duration-300 shadow-sm text-slate-900 placeholder-slate-400"></asp:TextBox>
                </div>
                <div>
                    <label for="Textpwd" class="block text-sm font-medium text-slate-700 mb-1">密码</label>
                    <asp:TextBox ID="Textpwd" runat="server" TextMode="Password" SkinID="TextBoxNormal" CssClass="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-all duration-300 shadow-sm text-slate-900 placeholder-slate-400"></asp:TextBox>
                </div>
                <div class="min-h-[24px]">
                    <asp:Label ID="Labelmsg" runat="server" SkinID="LabelMsgRed" CssClass="text-sm text-red-600 font-medium block text-center"></asp:Label>
                </div>
                <div>
                    <asp:Button ID="Btnlogin" runat="server" Text="登录" SkinID="BtnNormal" onclick="Btnlogin_Click" CssClass="w-full flex justify-center py-3 px-4 border border-transparent rounded-xl shadow-md text-sm font-semibold text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-all duration-300 transform hover:-translate-y-0.5" />
                </div>
            </div>
        </div>
<script type="text/javascript">
    function CookieEnable() {
        var result = false;
        if (navigator.cookiesEnabled)
            return true;
        document.cookie = "testcookie=yes;";
        var cookieSet = document.cookie;
        if (cookieSet.indexOf("testcookie=yes") > -1)
            result = true;
        document.cookie = "";
        return result;
    }
    if (!CookieEnable()) {
        alert("对不起，您的浏览器的Cookie功能被禁用，请开启\n\n 开启方法：IE---工具---Internet选项---隐私---中");
    }
</script>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        </center>
</div>
</asp:Content>

