<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher"  AutoEventWireup="true" CodeFile="gauge.aspx.cs" Inherits="Teacher_gauge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6 p-4 max-w-5xl mx-auto">

        <!-- Header -->
        <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex items-center gap-4 relative overflow-hidden">
            <div class="absolute -right-20 -top-20 w-64 h-64 bg-indigo-50 rounded-full blur-3xl opacity-50 pointer-events-none"></div>
            <div class="p-2 bg-indigo-50 rounded-lg text-indigo-600 relative z-10">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path></svg>
            </div>
            <div class="relative z-10">
                <h1 class="text-lg font-bold text-slate-800">自定义量化评价标准</h1>
                <p class="text-sm text-slate-500 mt-1">管理互评标准模板及量规设置</p>
            </div>
        </div>

        <!-- Add New Gauge -->
        <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center gap-4">
            <div class="flex items-center gap-3">
                <span class="text-sm font-medium text-slate-600">作品类型:</span>
                <asp:DropDownList ID="DDLtype" runat="server" CssClass="bg-slate-50 border border-slate-300 text-slate-700 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-indigo-500 outline-none w-32"></asp:DropDownList>
            </div>

            <div class="h-6 w-px bg-slate-200"></div>

            <div class="flex flex-1 items-center gap-3">
                <span class="text-sm font-medium text-slate-600 whitespace-nowrap">量规标题:</span>
                <asp:TextBox ID="TextBoxGtitle" runat="server" CssClass="flex-1 min-w-[200px] bg-slate-50 border border-slate-300 text-slate-700 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-indigo-500 outline-none" placeholder="输入量规的名称标题..."></asp:TextBox>
            </div>

            <asp:Button ID="Btnadd" runat="server" Text="添加量规" onclick="Btnadd_Click" CssClass="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-6 rounded-xl transition-all cursor-pointer text-sm shadow-md shadow-indigo-200 active:scale-95 whitespace-nowrap" />
        </div>

        <!-- Warning Notices -->
        <div class="bg-amber-50 border border-amber-200/60 rounded-2xl p-4 flex flex-col gap-2">
            <div class="flex items-start gap-2 text-amber-800 text-sm">
                <svg class="w-5 h-5 text-amber-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                <p><strong>注意：</strong>评价标准一旦在活动中使用后，将<strong>无法删除</strong>，请慎重填写并检查内容！</p>
            </div>
            <div class="flex items-start gap-2 text-amber-800 text-sm">
                <svg class="w-5 h-5 text-amber-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <p>当活动中未明确指定互评标准时，系统将自动选取该作品类型中的<strong>第一条</strong>评价标准。</p>
            </div>
        </div>

        <!-- Gauge List DataGrid -->
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 overflow-hidden">
            <div class="overflow-x-auto">
                <asp:GridView ID="GVGauge" runat="server" AutoGenerateColumns="False" DataKeyNames="Gid" Width="100%" CellPadding="0" onrowcommand="GVGauge_RowCommand" EnableModelValidation="True" onrowdatabound="GVGauge_RowDataBound" GridLines="None">
                    <AlternatingRowStyle BackColor="#f8fafc" />
                    <Columns>
                        <asp:BoundField HeaderText="序号">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" Width="60px" />
                            <ItemStyle HorizontalAlign="Center" CssClass="font-medium text-slate-400 py-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Gtype" HeaderText="分类">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-600 font-medium text-sm py-3" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="Gid" DataNavigateUrlFormatString="~/teacher/gaugeitem.aspx?gid={0}" DataTextField="Gtitle" HeaderText="标题" >
                            <HeaderStyle HorizontalAlign="Left" CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Left" CssClass="text-indigo-600 hover:text-indigo-800 font-bold py-4 px-4 transition-colors text-base" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="Gcount" HeaderText="使用次数">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" Width="100px" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-500 font-bold bg-slate-100 rounded-lg px-2 py-1 m-2 inline-block text-sm" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Gdate" HeaderText="修改日期">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" Width="160px" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-400 text-sm py-3" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <asp:LinkButton ID="BtnEdit" runat="server" CausesValidation="false" CommandArgument='<%# Eval("Gid") %>' CommandName="Del" Text="删除" CssClass="text-xs font-semibold text-rose-500 hover:text-rose-700 bg-rose-50 hover:bg-rose-100 px-3 py-1.5 rounded-md transition-colors"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" Width="80px" />
                            <ItemStyle HorizontalAlign="Center" CssClass="py-3" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#f8fafc" CssClass="border-b border-slate-200" />
                    <RowStyle BackColor="#FFFFFF" CssClass="border-b border-slate-100 hover:bg-slate-50/80 transition-colors" />
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>

