<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="infomation.aspx.cs" Inherits="Teacher_infomation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col items-center justify-center min-h-[calc(100vh-16rem)] p-4">

        <!-- Welcome Banner -->
        <div class="mb-10 text-center">
            <div class="inline-flex items-center justify-center p-4 bg-indigo-50 rounded-full text-indigo-600 mb-4 shadow-inner">
                <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
            </div>
            <h2 class="text-2xl font-bold text-slate-800 tracking-tight">
                <asp:Label ID="Labelwelcome" runat="server"></asp:Label>
            </h2>
            <p class="text-slate-500 mt-2 font-medium">欢迎回到信息科技教学平台控制台</p>
        </div>

        <!-- Main Info Card -->
        <div class="bg-white rounded-3xl shadow-sm border border-slate-200/60 w-full max-w-2xl overflow-hidden">
            <!-- Card Header -->
            <div class="bg-slate-50/80 px-8 py-5 border-b border-slate-100 flex items-center justify-between">
                <div class="flex items-center gap-3">
                    <div class="p-2 bg-indigo-100 text-indigo-600 rounded-xl">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
                    </div>
                    <h3 class="text-lg font-bold text-slate-800">我的班级列表</h3>
                </div>

                <div class="flex items-center gap-2 bg-white px-3 py-1.5 rounded-lg border border-slate-200 shadow-sm text-sm">
                    <span class="text-slate-500 font-medium">当前学期:</span>
                    <span class="font-bold text-indigo-600"><asp:Label ID="Labelterm" runat="server"></asp:Label></span>
                </div>
            </div>

            <!-- Card Body -->
            <div class="p-8 bg-white/50 relative">
                <!-- Decorative background elements -->
                <div class="absolute -right-20 -top-20 w-64 h-64 bg-indigo-50/50 rounded-full blur-3xl pointer-events-none"></div>
                <div class="absolute -left-20 -bottom-20 w-64 h-64 bg-slate-50/80 rounded-full blur-3xl pointer-events-none"></div>

                <div class="relative z-10 flex justify-center">
                    <asp:DataList ID="DLmyclass" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" onitemdatabound="DLmyclass_ItemDataBound" CssClass="mx-auto" CellSpacing="16">
                        <ItemTemplate>
                            <div class="flex flex-col items-center justify-center p-4 m-2 bg-white border border-slate-200 rounded-2xl hover:border-indigo-400 hover:shadow-md hover:shadow-indigo-100 transition-all cursor-pointer group min-w-[100px]">
                                <div class="w-10 h-10 rounded-full bg-slate-50 group-hover:bg-indigo-50 border border-slate-100 group-hover:border-indigo-100 flex items-center justify-center mb-3 transition-colors">
                                    <svg class="w-5 h-5 text-slate-400 group-hover:text-indigo-500 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                                </div>
                                <asp:HyperLink ID="HyperRgradeclass" runat="server" Text='<%# Eval("Rgradeclass") %>' CssClass="font-bold text-slate-700 group-hover:text-indigo-700 transition-colors text-[15px] tracking-wide"></asp:HyperLink>
                                <div class="hidden">
                                    <asp:Label ID="LabelRset" runat="server" Text='<%# Eval("Rset") %>' Visible="False"></asp:Label>
                                    <asp:Label ID="LabelRreg" runat="server" Text='<%# Eval("Rreg") %>' Visible="False"></asp:Label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>

            <!-- Card Footer -->
            <div class="bg-slate-50/80 px-8 py-5 border-t border-slate-100 flex items-center justify-between">
                <asp:Label ID="Labelmsg" runat="server" CssClass="text-sm font-medium text-amber-600 bg-amber-50 px-3 py-1 rounded-md"></asp:Label>

                <asp:Button ID="Btnlogout" runat="server" Text="系统退出" onclick="Btnlogout_Click"
                    CssClass="ml-auto bg-white border border-rose-200 text-rose-600 hover:bg-rose-50 font-bold py-2 px-6 rounded-xl transition-all cursor-pointer text-sm shadow-sm active:scale-95 flex items-center gap-2" />
            </div>
        </div>
    </div>
</asp:Content>

