<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="Teacher_signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6 p-4">

        <!-- Header & Action Bar -->
        <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center justify-between gap-4 relative overflow-hidden">
            <div class="absolute -right-20 -top-20 w-64 h-64 bg-indigo-50 rounded-full blur-3xl opacity-50 pointer-events-none"></div>

            <div class="flex items-center gap-3 text-sm text-slate-700 relative z-10">
                <div class="p-2 bg-indigo-50 rounded-lg text-indigo-600">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                </div>
                <span class="font-bold text-slate-800 text-base ml-1">签到管理</span>

                <div class="h-6 w-px bg-slate-200 mx-2"></div>

                <div class="flex items-center gap-2 bg-slate-50 px-3 py-1.5 rounded-lg border border-slate-200 shadow-sm">
                    <asp:DropDownList ID="DDLgrade" runat="server"
                        CssClass="bg-white border border-slate-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-indigo-500 outline-none"
                        EnableTheming="True" AutoPostBack="True"
                        onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="text-slate-500 font-medium">年级</span>
                </div>

                <div class="flex items-center gap-2 bg-slate-50 px-3 py-1.5 rounded-lg border border-slate-200 shadow-sm">
                    <asp:DropDownList ID="DDLclass" runat="server"
                        CssClass="bg-white border border-slate-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-indigo-500 outline-none"
                        EnableTheming="True" AutoPostBack="True"
                        onselectedindexchanged="DDLclass_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="text-slate-500 font-medium">班级</span>
                </div>
            </div>

            <div class="flex items-center gap-3 relative z-10">
                <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click"
                    Text="导出签到 Excel" ToolTip="将本学期本班签到以Excel表格导出"
                    CssClass="bg-emerald-50 border border-emerald-200 text-emerald-600 hover:bg-emerald-100 hover:text-emerald-700 font-medium py-2 px-4 rounded-xl transition-all cursor-pointer text-sm shadow-sm active:scale-95 flex items-center gap-1" />

                <asp:Button ID="BtnExcelNoSign" runat="server" OnClick="BtnExcelNoSign_Click"
                    Text="导出缺席 Excel" ToolTip="将本学期本班缺席以Excel表格导出"
                    CssClass="bg-rose-50 border border-rose-200 text-rose-600 hover:bg-rose-100 hover:text-rose-700 font-medium py-2 px-4 rounded-xl transition-all cursor-pointer text-sm shadow-sm active:scale-95 flex items-center gap-1" />
            </div>
        </div>

        <!-- Data Grid -->
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 overflow-hidden">
            <div class="overflow-x-auto">
                <asp:GridView ID="GVSignin" runat="server" AllowPaging="True"
                    AutoGenerateColumns="False" PageSize="20" Width="100%"
                    onpageindexchanging="GVSignin_PageIndexChanging"
                    onrowdatabound="GVSignin_RowDataBound" CellPadding="0" GridLines="None">
                    <AlternatingRowStyle BackColor="#f8fafc" />
                    <Columns>
                        <asp:BoundField HeaderText="序号">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" Width="80px" />
                            <ItemStyle HorizontalAlign="Center" CssClass="font-medium text-slate-400 py-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sgrade" HeaderText="年级">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-600 font-medium text-sm py-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sclass" HeaderText="班级">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-600 font-medium text-sm py-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Qyear" HeaderText="年份">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-500 text-sm py-3 bg-slate-50/50" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Qmonth" HeaderText="月份">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-500 text-sm py-3 font-semibold text-indigo-500 bg-indigo-50/20" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Qday" HeaderText="日份">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-500 text-sm py-3 bg-slate-50/50" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="Sgrade,Sclass,Qyear,Qmonth,Qday"
                            DataNavigateUrlFormatString="signshow.aspx?sgrade={0}&amp;&amp;sclass={1}&amp;&amp;qyear={2}&amp;&amp;qmonth={3}&amp;&amp;qday={4}"
                            Text="查看详情" HeaderText="操作">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-indigo-600 hover:text-indigo-800 font-semibold py-3 transition-colors text-sm" />
                        </asp:HyperLinkField>
                    </Columns>
                    <HeaderStyle BackColor="#f8fafc" CssClass="border-b border-slate-200" />
                    <RowStyle BackColor="#FFFFFF" CssClass="border-b border-slate-100 hover:bg-slate-50/80 transition-colors" />
                    <PagerStyle BackColor="#f8fafc" ForeColor="#475569" HorizontalAlign="Center" CssClass="border-t border-slate-200" />
                    <PagerTemplate>
                        <div class="w-full flex justify-between items-center px-6 py-3">
                            <span class="text-sm text-slate-500 font-medium">
                                第 <asp:Label ID="lblPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" CssClass="font-bold text-slate-700"></asp:Label> 页
                                共 <asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" CssClass="font-bold text-slate-700"></asp:Label> 页
                            </span>
                            <div class="flex gap-2">
                                <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First" CommandName="Page" Text="首页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm"></asp:LinkButton>
                                <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev" CommandName="Page" Text="上一页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm"></asp:LinkButton>
                                <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next" CommandName="Page" Text="下一页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm"></asp:LinkButton>
                                <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last" CommandName="Page" Text="尾页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm"></asp:LinkButton>
                            </div>
                        </div>
                    </PagerTemplate>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>

