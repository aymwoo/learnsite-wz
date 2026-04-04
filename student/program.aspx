<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true" StylesheetTheme="Student"  CodeFile="program.aspx.cs" Inherits="Student_program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<div class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
    <!-- Main Content -->
    <div class="lg:col-span-3 space-y-6">
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6 sm:p-10">
            <div class="text-center pb-6 border-b border-slate-100">
                <asp:Label ID="LabelMtitle" runat="server" CssClass="text-2xl sm:text-3xl font-extrabold text-slate-800 tracking-tight"></asp:Label>
            </div>
            <div class="hidden">
                <asp:Label ID="LabelSnum" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMid" runat="server" Visible="False"></asp:Label>            
                <asp:Label ID="LabelUploadType" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMcid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMsort" runat="server" Visible="False"></asp:Label>
                <asp:CheckBox ID="CheckBack" runat="server" Visible="False" />
                <asp:CheckBox ID="CheckBlock" runat="server" Visible="False" />
                <asp:CheckBox ID="CheckBlockpy" runat="server" Visible="False" />
                <asp:Label ID="LabelLid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelLtype" runat="server" Visible="False"></asp:Label>
            </div>
            <div id="Mcontent" class="mt-8 text-slate-700 leading-loose text-lg" style="word-wrap:break-word; word-break:break-word;" runat="server">	
            </div>
        </div>
    </div>

    <!-- Right Sidebar -->
    <div class="lg:col-span-1 flex flex-col gap-6">
        <div class="bg-slate-50/80 rounded-2xl border border-slate-200/60 p-5 shadow-sm sticky top-24">
            <link href="../kindeditor/themes/me/me.css" rel="stylesheet" type="text/css" />
            <script charset="utf-8" src="../kindeditor/kindeditor-min.js" type="text/javascript"></script>
            <script charset="utf-8" src="../kindeditor/lang/zh_CN.js" type="text/javascript"></script>
            
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-slate-800 flex items-center gap-2 border-b border-slate-200/60 pb-3">
                    <svg class="w-5 h-5 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"></path></svg>
                    操作面板
                </h3>
                
                <div class="flex flex-col gap-3 w-full">
                    <input type="button" class="w-full py-2.5 px-4 border border-indigo-200 rounded-xl text-sm font-semibold text-indigo-700 bg-indigo-50 hover:bg-indigo-100 transition-all duration-300 shadow-sm cursor-pointer" id="share" value="我的网盘" onclick="showShare()" />
                    <asp:HyperLink ID="VoteLink" runat="server" Target="_blank" 
                        CssClass="w-full flex justify-center py-2.5 px-4 rounded-xl text-sm font-semibold text-white bg-green-500 hover:bg-green-600 transition-all duration-300 shadow-md border-0 text-center" SkinID="HyperLinkPink">作品互评</asp:HyperLink>
                </div>
                
                <div class="flex flex-col items-center gap-3 mt-4 pt-4 border-t border-slate-200/60">
                    <asp:Image ID="Thumbnail" runat="server" CssClass="max-w-[160px] max-h-[240px] rounded-xl shadow-sm border border-slate-200" />
                    <div id="pixelsmall" runat="server" ></div>
                    <asp:Label ID="Wtitle" runat="server" CssClass="text-sm font-medium text-slate-600"></asp:Label>
                    
                    <asp:Button ID="BtnScratch" runat="server" Font-Bold="True" 
                        onclick="BtnScratch_Click" SkinID="buttonSkinPink" Text="开始创作"
                        CssClass="w-full py-2.5 bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-bold rounded-xl hover:from-blue-600 hover:to-indigo-700 transition duration-300 shadow-md border-0 cursor-pointer" />
                    
                    <asp:Label ID="Labelscratch" runat="server" CssClass="text-sm text-blue-600 font-medium"></asp:Label>
                    
                    <asp:Button ID="BtnBegin" runat="server" Font-Bold="True" 
                        onclick="BtnBegin_Click" SkinID="buttonSkinPink" Text="开关指令"
                        CssClass="w-full py-2 bg-white border-2 border-indigo-400 text-indigo-600 font-bold rounded-xl hover:bg-indigo-500 hover:text-white transition duration-300 shadow-sm cursor-pointer" />
                    
                    <asp:Button ID="ButtonClear" runat="server" Font-Bold="True" 
                        SkinID="buttonSkinPink" Text="清除提交" ToolTip="清除模拟学生提交的本项作品" 
                        onclick="ButtonClear_Click"
                        CssClass="w-full py-2 bg-white border-2 border-red-400 text-red-500 font-bold rounded-xl hover:bg-red-500 hover:text-white transition duration-300 shadow-sm cursor-pointer" />
                    
                    <asp:Label ID="Labelmsg" runat="server" SkinID="LabelMsgRed" CssClass="text-red-500 font-bold text-sm"></asp:Label>
                    <asp:Image ID="ImagePass" runat="server" ImageUrl="~/images/sucessed.png" 
                        Visible="False" CssClass="w-24 h-auto opacity-80 mt-2" />
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
