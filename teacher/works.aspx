<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="works.aspx.cs" Inherits="Teacher_works" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6 p-4">
        <!-- Top Action Bar (Header) -->
        <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center justify-between gap-4 relative overflow-hidden">
            <div class="absolute -right-20 -top-20 w-64 h-64 bg-indigo-50 rounded-full blur-3xl opacity-50 pointer-events-none"></div>

            <div class="flex items-center gap-3 text-sm text-slate-700 relative z-10">
                <div class="p-2 bg-indigo-50 rounded-lg text-indigo-600">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                </div>
                <span class="font-bold text-slate-800 text-base ml-1">作品评价</span>

                <div class="h-6 w-px bg-slate-200 mx-2"></div>

                <div class="flex items-center gap-2 bg-slate-50 px-3 py-1.5 rounded-lg border border-slate-200">
                    <span class="text-slate-500 font-medium">作品选择:</span>
                    <asp:DropDownList ID="DDLgrade" runat="server"
                        CssClass="bg-white border border-slate-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-indigo-500 outline-none"
                        EnableTheming="True" AutoPostBack="True"
                        onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="text-slate-500 font-medium">年级</span>
                </div>

                <asp:Label ID="Labelmsg" runat="server" CssClass="text-emerald-500 font-medium ml-2"></asp:Label>
            </div>

            <div class="flex items-center gap-3 relative z-10">
                <span id="pg" onclick="package()" class="flex items-center gap-1 bg-white text-indigo-600 border border-indigo-200 hover:bg-indigo-50 font-medium py-2 px-4 rounded-xl transition-all cursor-pointer text-sm shadow-sm active:scale-95">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path></svg>
                    作品打包
                </span>

                <asp:Button ID="Btnterm" runat="server" Text="学期总评" onclick="Btnterm_Click"
                    ToolTip="跳转到学期总评页面"
                    CssClass="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-5 rounded-xl transition-all cursor-pointer text-sm shadow-md shadow-indigo-200 active:scale-95 flex items-center gap-1" />
            </div>
        </div>

        <link href="../js/tinybox.css" rel="stylesheet" type="text/css" />
        <script src="../js/tinybox.js" type="text/javascript"></script>
        <script type ="text/javascript" >
            function package() {
                var urlpg = "../teacher/workpackage.aspx" ;
                TINY.box.show({ iframe: urlpg, boxid: 'frameless', width: 360, height: 240, fixed: false, maskopacity: 40, closejs: function () { closeJS() } })
            }
        </script>

        <!-- Works List DataGrid -->
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 overflow-hidden">
            <div class="overflow-x-auto">
                <asp:GridView ID="GVCourse" runat="server" AllowPaging="True"
                    AutoGenerateColumns="False" CellPadding="0" DataKeyNames="Cid"
                    PageSize="20" Width="100%"
                    onpageindexchanging="GVCourse_PageIndexChanging"
                    onrowdatabound="GVCourse_RowDataBound" EnableModelValidation="True" GridLines="None">
                    <AlternatingRowStyle BackColor="#f8fafc" />
                    <Columns>
                        <asp:BoundField DataField="Cid" HeaderText="序号" InsertVisible="False" ReadOnly="True" SortExpression="Cid" >
                            <HeaderStyle HorizontalAlign="Left" CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle Width="50px" HorizontalAlign="Left" CssClass="py-4 px-4 font-medium text-slate-400" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataTextField="Ctitle" HeaderText="学案" >
                            <HeaderStyle HorizontalAlign="Left" CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Left" CssClass="py-4 px-4 font-bold text-indigo-600 hover:text-indigo-800 transition-colors" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="Cclass" HeaderText="类型" SortExpression="Cclass" >
                            <HeaderStyle HorizontalAlign="Left" CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Left" Width="80px" CssClass="py-4 px-4 text-slate-500 text-sm font-medium" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="未评数">
                            <ItemTemplate>
                                <div class="bg-amber-50 text-amber-600 px-2.5 py-1 rounded-md text-xs font-bold inline-block border border-amber-200/60">
                                    <asp:HyperLink ID="HlNoCheck" runat="server" CssClass="hover:text-amber-800 transition-colors"></asp:HyperLink>
                                </div>
                            </ItemTemplate>
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle Width="80px" HorizontalAlign="Center" CssClass="py-4" />
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="Cid,Cobj"
                            DataNavigateUrlFormatString="workcheck.aspx?cid={0}&amp;grade={1}"
                            Text="批改" HeaderText="评价" Target="_blank">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle Width="80px" HorizontalAlign="Center" CssClass="text-emerald-600 hover:text-emerald-800 font-semibold text-sm transition-colors py-4" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="Cdate" HeaderText="日期" SortExpression="Cdate" >
                            <HeaderStyle HorizontalAlign="Left" CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Left" Width="160px" CssClass="text-slate-400 text-xs font-medium py-4 px-4" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="#f8fafc" CssClass="border-b border-slate-200" />
                    <RowStyle BackColor="#FFFFFF" CssClass="border-b border-slate-100 hover:bg-slate-50/80 transition-colors" />
                    <PagerStyle BackColor="#f8fafc" ForeColor="#475569" HorizontalAlign="Center" CssClass="border-t border-slate-200" />
                    <pagertemplate>
                        <div class="w-full flex justify-between items-center px-6 py-3">
                            <span class="text-sm text-slate-500 font-medium">
                                第 <asp:Label ID="lblPageIndex" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" CssClass="font-bold text-slate-700" /> 页
                                共 <asp:Label ID="lblPageCount" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" CssClass="font-bold text-slate-700" /> 页
                            </span>
                            <div class="flex gap-2">
                                <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" commandargument="First" commandname="Page" text="首页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm" />
                                <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" commandargument="Prev" commandname="Page" text="上一页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm" />
                                <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" commandargument="Next" commandname="Page" text="下一页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm" />
                                <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" commandargument="Last" commandname="Page" text="尾页" CssClass="px-3 py-1.5 text-xs font-medium rounded-lg border border-slate-200 text-slate-600 bg-white hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm" />
                            </div>
                        </div>
                    </pagertemplate>
                    <SelectedRowStyle BackColor="#e0e7ff" Font-Bold="True" ForeColor="#3730a3" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

