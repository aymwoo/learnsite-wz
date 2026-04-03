<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="Teacher_signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<div class="w-full max-w-6xl mx-auto p-4 sm:p-6 space-y-6 font-sans text-slate-800">
    <!-- Header -->
    <div class="bg-slate-100 rounded-xl shadow-sm border border-slate-200 p-6 flex flex-col lg:flex-row items-center justify-between gap-6 border-l-8 border-l-indigo-600">
        <div class="flex flex-col sm:flex-row items-center gap-4">
            <h1 class="text-2xl font-extrabold text-slate-900 flex items-center gap-2 whitespace-nowrap">
                <i class="bi bi-person-check-fill text-indigo-700"></i> 学生签到记录
            </h1>
            <div class="flex items-center gap-3 bg-white px-4 py-2 border border-slate-200 shadow-sm rounded-xl">
                <div class="flex items-center gap-1">
                    <span class="text-xs font-bold text-slate-500">年级</span>
                    <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DDLgrade_SelectedIndexChanged"
                        CssClass="border-0 bg-transparent text-sm font-bold text-indigo-600 focus:ring-0 cursor-pointer">
                    </asp:DropDownList>
                </div>
                <div class="w-px h-4 bg-slate-200"></div>
                <div class="flex items-center gap-1">
                    <span class="text-xs font-bold text-slate-500">班级</span>
                    <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DDLclass_SelectedIndexChanged"
                        CssClass="border-0 bg-transparent text-sm font-bold text-indigo-600 focus:ring-0 cursor-pointer">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        
        <div class="flex flex-wrap gap-3">
            <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click" 
                Text="导出签到表" ToolTip="将本学期本班签到以Excel表格导出" 
                CssClass="px-5 py-2.5 bg-blue-600 text-white font-bold rounded-xl hover:bg-blue-700 transition duration-200 shadow-sm border-0 cursor-pointer text-sm" />
            
            <asp:Button ID="BtnExcelNoSign" runat="server" OnClick="BtnExcelNoSign_Click" 
                Text="导出缺席表" ToolTip="将本学期本班缺席以Excel表格导出" 
                CssClass="px-5 py-2.5 bg-slate-600 text-white font-bold rounded-xl hover:bg-slate-700 transition duration-200 shadow-sm border-0 cursor-pointer text-sm" />
        </div>
    </div>

    <!-- Data Table -->
    <div class="bg-white shadow-sm border border-slate-200 overflow-hidden rounded-xl">
        <asp:GridView ID="GVSignin" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" PageSize="20" Width="100%" 
            onpageindexchanging="GVSignin_PageIndexChanging" 
            onrowdatabound="GVSignin_RowDataBound" GridLines="None"
            CssClass="w-full text-sm text-slate-600 text-center">
            <HeaderStyle CssClass="bg-slate-50 font-bold text-slate-700 border-b border-slate-200" />
            <RowStyle CssClass="border-b border-slate-100 hover:bg-slate-50 transition-colors" />
            <Columns>
                <asp:BoundField HeaderText="序号">
                    <HeaderStyle CssClass="py-4 px-4 w-20" />
                    <ItemStyle CssClass="py-3 px-4 font-mono text-slate-400" />
                </asp:BoundField>
                <asp:BoundField DataField="Sgrade" HeaderText="年级">
                    <HeaderStyle CssClass="py-4 px-4" />
                    <ItemStyle CssClass="py-3 px-4" />
                </asp:BoundField>
                <asp:BoundField DataField="Sclass" HeaderText="班级">
                    <HeaderStyle CssClass="py-4 px-4" />
                    <ItemStyle CssClass="py-3 px-4 font-semibold text-slate-700" />
                </asp:BoundField>
                <asp:BoundField DataField="Qyear" HeaderText="年份">
                    <HeaderStyle CssClass="py-4 px-4 w-24" />
                    <ItemStyle CssClass="py-3 px-4 font-mono" />
                </asp:BoundField>
                <asp:BoundField DataField="Qmonth" HeaderText="月份">
                    <HeaderStyle CssClass="py-4 px-4 w-20" />
                    <ItemStyle CssClass="py-3 px-4 font-mono" />
                </asp:BoundField>
                <asp:BoundField DataField="Qday" HeaderText="日期">
                    <HeaderStyle CssClass="py-4 px-4 w-20" />
                    <ItemStyle CssClass="py-3 px-4 font-mono" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="Sgrade,Sclass,Qyear,Qmonth,Qday" 
                    DataNavigateUrlFormatString="signshow.aspx?sgrade={0}&amp;&amp;sclass={1}&amp;&amp;qyear={2}&amp;&amp;qmonth={3}&amp;&amp;qday={4}" 
                    Text='<i class="bi bi-eye-fill mr-1"></i>查看详细' HeaderText="操作">
                    <HeaderStyle CssClass="py-4 px-4 w-32" />
                    <ItemStyle CssClass="py-3 px-4 font-bold text-indigo-600 hover:text-indigo-800" />
                </asp:HyperLinkField>
            </Columns>
            <PagerTemplate>
                <div class="flex items-center justify-end gap-2 p-4 bg-slate-50 border-t border-slate-200 text-xs font-bold text-slate-500">
                    <span class="mr-4">第 <asp:Label ID="lblPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>" CssClass="text-indigo-600"></asp:Label> / <asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label> 页</span>
                    
                    <asp:LinkButton ID="btnFirst" runat="server" CommandArgument="First" CommandName="Page" 
                        CssClass="px-3 py-1.5 bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl transition">首页</asp:LinkButton>
                    <asp:LinkButton ID="btnPrev" runat="server" CommandArgument="Prev" CommandName="Page" 
                        CssClass="px-3 py-1.5 bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl transition">上一页</asp:LinkButton>
                    <asp:LinkButton ID="btnNext" runat="server" CommandArgument="Next" CommandName="Page" 
                        CssClass="px-3 py-1.5 bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl transition">下一页</asp:LinkButton>
                    <asp:LinkButton ID="btnLast" runat="server" CommandArgument="Last" CommandName="Page" 
                        CssClass="px-3 py-1.5 bg-white border border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl transition">尾页</asp:LinkButton>
                </div>
            </PagerTemplate>
        </asp:GridView>
    </div>
</div>
</asp:Content>