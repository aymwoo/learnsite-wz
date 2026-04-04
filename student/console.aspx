<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true" CodeFile="console.aspx.cs" Inherits="Student_console" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
			<asp:Label ID="LabelCid" runat="server" Visible="False"></asp:Label>
			<asp:Label ID="LabelLid" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="LabelNid" runat="server" Visible="False"></asp:Label> 
<div class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
    <!-- Main Content -->
    <div class="lg:col-span-3 space-y-6">
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6 sm:p-10">
            <div class="text-center pb-6 border-b border-slate-100">
                <asp:Label ID="LabelMtitle" runat="server" CssClass="text-2xl sm:text-3xl font-extrabold text-slate-800 tracking-tight"></asp:Label>
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
                    <svg class="w-5 h-5 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path></svg>
                    测评面板
                </h3>
                
                <div class="overflow-x-auto rounded-xl border border-slate-200">
                    <asp:GridView ID="GVSolve" runat="server" EnableModelValidation="True" 
                        AutoGenerateColumns="False" onrowdatabound="GVSolve_RowDataBound"
                        Width="100%" CssClass="w-full text-sm text-slate-600 bg-white">
                        <Columns>
                            <asp:BoundField HeaderText="题目">
                                <HeaderStyle CssClass="bg-slate-50 font-semibold px-3 py-2 text-left" />
                                <ItemStyle CssClass="px-3 py-2 border-b border-slate-100" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="得分">
                                <ItemTemplate>
                                    <asp:Label ID="Labelscore" runat="server" Text='<%# Bind("Vscore") %>' CssClass="font-bold text-emerald-600"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="bg-slate-50 font-semibold px-3 py-2" />
                                <ItemStyle HorizontalAlign="Center" CssClass="px-3 py-2 border-b border-slate-100" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Labelflag" runat="server" ></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="px-3 py-2 border-b border-slate-100" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
                <div class="flex flex-col items-center gap-3 pt-2">
                    <asp:Button ID="BtnIdle" runat="server" Font-Bold="True" 
                        SkinID="buttonSkinPink" Text="开始测评" onclick="BtnIdle_Click"
                        CssClass="w-full py-2.5 bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-bold rounded-xl hover:from-blue-600 hover:to-indigo-700 transition duration-300 shadow-md border-0 cursor-pointer" />
                    
                    <asp:ImageButton ID="Btnclock" runat="server" ImageUrl="~/images/clock.gif" 
                        onclick="Btnclock_Click" CssClass="w-8 h-8 opacity-70 hover:opacity-100 transition" />
                    
                    <asp:Image ID="Imagepass" runat="server" ImageUrl="~/images/pass.png" CssClass="w-20 h-auto opacity-80" />
                    
                    <asp:HyperLink ID="Hlsolve" runat="server" Target="_blank"
                        CssClass="w-full flex justify-center py-2.5 text-sm bg-white border-2 border-emerald-500 text-emerald-600 font-bold rounded-xl hover:bg-emerald-500 hover:text-white transition duration-300 shadow-sm">班级测评报告</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
