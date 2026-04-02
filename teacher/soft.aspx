<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="soft.aspx.cs" Inherits="Teacher_soft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6 p-4">

        <!-- Header & Action Bar -->
        <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center justify-between gap-4 relative overflow-hidden">
            <div class="absolute -right-20 -top-20 w-64 h-64 bg-indigo-50 rounded-full blur-3xl opacity-50 pointer-events-none"></div>

            <div class="flex items-center gap-3 text-sm text-slate-700 relative z-10">
                <div class="p-2 bg-indigo-50 rounded-lg text-indigo-600">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path></svg>
                </div>
                <span class="font-bold text-slate-800 text-base ml-1">资源管理</span>

                <div class="h-6 w-px bg-slate-200 mx-2"></div>

                <div class="flex items-center gap-2 bg-slate-50 px-3 py-1.5 rounded-lg border border-slate-200 shadow-sm">
                    <span class="text-slate-500 font-medium">分类</span>
                    <asp:DropDownList ID="ddlcategory" runat="server" AutoPostBack="True"
                            onselectedindexchanged="ddlcategory_SelectedIndexChanged"
                            CssClass="bg-white border border-slate-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-indigo-500 outline-none ml-1">
                    </asp:DropDownList>
                </div>

                <asp:Label ID="Label1" runat="server" CssClass="hidden"></asp:Label>
            </div>

            <div class="flex items-center gap-3 relative z-10">
                <asp:HyperLink ID="Hlkadd" runat="server" NavigateUrl="~/teacher/softadd.aspx" Target="_self"
                    CssClass="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-4 rounded-xl transition-all cursor-pointer text-sm shadow-md shadow-indigo-200 active:scale-95 flex items-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
                    资源添加
                </asp:HyperLink>
                <div class="h-6 w-px bg-slate-200 mx-1"></div>
                <asp:HyperLink ID="Hlkcategory" runat="server" NavigateUrl="~/teacher/softcategory.aspx" Target="_self"
                    CssClass="bg-slate-50 border border-slate-200 text-slate-600 hover:bg-slate-100 hover:text-indigo-600 font-medium py-2 px-4 rounded-xl transition-all cursor-pointer text-sm shadow-sm active:scale-95 flex items-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"></path></svg>
                    分类设置
                </asp:HyperLink>
                <asp:HyperLink ID="Hlkcgscore" runat="server" NavigateUrl="~/teacher/softnomic.aspx" Target="_blank"
                    CssClass="bg-emerald-50 border border-emerald-200 text-emerald-600 hover:bg-emerald-100 hover:text-emerald-700 font-medium py-2 px-4 rounded-xl transition-all cursor-pointer text-sm shadow-sm active:scale-95 flex items-center gap-1">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    自学评价
                </asp:HyperLink>
            </div>
        </div>

        <!-- Data Grid -->
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 overflow-hidden">
            <div class="overflow-x-auto w-full">
                <asp:GridView ID="GVSource" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" PageSize="20" Width="100%"
                    onpageindexchanging="GVSource_PageIndexChanging" 
                    onrowdatabound="GVSource_RowDataBound" EnableModelValidation="True" 
                    onrowcommand="GVSource_RowCommand" CellPadding="0" GridLines="None">
                    <AlternatingRowStyle BackColor="#f8fafc" />
                    <Columns>
                        <asp:BoundField HeaderText="序号">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" Width="60px" />
                            <ItemStyle HorizontalAlign="Center" CssClass="font-medium text-slate-400 py-4" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fclass" HeaderText="属性">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-600 font-medium text-sm py-4" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="Fid" 
                            DataNavigateUrlFormatString="~/teacher/softview.aspx?fid={0}" 
                            DataTextField="Ftitle" HeaderText="标题">
                            <HeaderStyle HorizontalAlign="Left" CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Left" CssClass="text-indigo-600 hover:text-indigo-800 font-bold py-4 px-4 transition-colors" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="Ffiletype" HeaderText="格式">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-500 text-xs font-mono bg-slate-100 px-2 py-1 rounded inline-block m-2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fhit" HeaderText="下载">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-600 text-sm py-4" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fopen" HeaderText="学分">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-emerald-600 font-bold text-sm py-4" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="Furl" HeaderText="下载" Text="获取" Target="_blank">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-indigo-500 hover:text-indigo-700 font-medium py-4 transition-colors text-sm" />
                        </asp:HyperLinkField>
                        <asp:CheckBoxField DataField="Fhide" HeaderText="隐藏" ReadOnly="True">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="py-4 opacity-75" />
                        </asp:CheckBoxField>
                        <asp:TemplateField ShowHeader="False" HeaderText="状态">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False"
                                    CommandArgument='<%# Eval("Fid") %>' CommandName="Change"
                                    ImageUrl="~/images/refresh.gif" ToolTip="发布：无或隐藏：√" CssClass="w-4 h-4 hover:rotate-180 transition-transform opacity-75 hover:opacity-100" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="py-4" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Fdate" HeaderText="修改日期">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-slate-400 text-xs py-4" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="Fid,Furl" 
                            DataNavigateUrlFormatString="~/teacher/softdel.aspx?fid={0}&amp;&amp;furl={1}" 
                            Text="删除" HeaderText="管理">
                            <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500 text-sm" />
                            <ItemStyle HorizontalAlign="Center" CssClass="text-rose-500 hover:text-rose-700 font-medium py-4 transition-colors text-sm" />
                        </asp:HyperLinkField>
                    </Columns>
                    <HeaderStyle BackColor="#f8fafc" CssClass="border-b border-slate-200" />
                    <RowStyle BackColor="#FFFFFF" CssClass="border-b border-slate-100 hover:bg-slate-50/80 transition-colors" />
                    <PagerStyle BackColor="#f8fafc" ForeColor="#475569" HorizontalAlign="Center" CssClass="border-t border-slate-200" />
                    <PagerTemplate>
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
                    </PagerTemplate>
                    <SelectedRowStyle BackColor="#e0e7ff" Font-Bold="True" ForeColor="#3730a3" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

