<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"   StylesheetTheme="Teacher" AutoEventWireup="true"  CodeFile="course.aspx.cs" Inherits="Teacher_course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6 p-4">
        <!-- Top Action Bar (Header) -->
        <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-200/60 flex flex-wrap items-center justify-between gap-4">
            <div class="flex items-center gap-3 text-sm text-slate-700">
                <div class="p-2 bg-indigo-50 rounded-lg text-indigo-600">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                </div>
                <span class="font-bold text-slate-800 text-base ml-1">学案管理</span>

                <div class="h-6 w-px bg-slate-200 mx-2"></div>

                <div class="flex items-center gap-2 bg-slate-50 px-3 py-1.5 rounded-lg border border-slate-200">
                    <asp:DropDownList ID="DDLgrade" runat="server"
                        CssClass="bg-white border border-slate-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-indigo-500 outline-none"
                        EnableTheming="True" AutoPostBack="True"
                        onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="text-slate-500 font-medium">年级</span>
                </div>

                <asp:Label ID="Labelmsg" runat="server" CssClass="text-rose-500 font-semibold mx-2"></asp:Label>

                <div class="flex items-center gap-2 bg-slate-50 px-3 py-1.5 rounded-lg border border-slate-200">
                    <asp:DropDownList ID="DDLterm" runat="server"
                        CssClass="bg-white border border-slate-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-indigo-500 outline-none"
                        EnableTheming="True" AutoPostBack="True"
                        onselectedindexchanged="DDLterm_SelectedIndexChanged"
                        ToolTip="选择要显示学案的学期，不改变后台默认学期设置">
                        <asp:ListItem Value="1">第一学期</asp:ListItem>
                        <asp:ListItem Value="2">第二学期</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Label ID="Labelspace" runat="server" CssClass="hidden"></asp:Label>
            </div>

            <div class="flex gap-3">
                <asp:Button ID="Btnadd" runat="server" Text="添加学案" onclick="Btnadd_Click"
                    CssClass="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-5 rounded-xl transition-all cursor-pointer text-sm shadow-md shadow-indigo-200 active:scale-95" />
            </div>
        </div>

        <!-- Course List DataGrid -->
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 overflow-hidden">
            <div class="overflow-x-auto">
                    <asp:GridView ID="GVCourse" runat="server" AllowPaging="True"
                            AutoGenerateColumns="False"  DataKeyNames="Cid"  
                            PageSize="20" Width="100%"
                            onpageindexchanging="GVCourse_PageIndexChanging" 
                            onrowdatabound="GVCourse_RowDataBound" CellPadding="0"
                            EnableModelValidation="True" 
                            onrowcommand="GVCourse_RowCommand" ForeColor="#111111" GridLines="None" >
                            <AlternatingRowStyle BackColor="#f8fafc" />
                            <Columns>                                
                                <asp:BoundField DataField="Cks" HeaderText="课节">
                                    <ItemStyle HorizontalAlign="Center" CssClass="font-bold text-slate-700 w-16 py-4" />
                                    <HeaderStyle CssClass="py-3 px-4 font-semibold text-slate-500" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Cid" 
                                    DataNavigateUrlFormatString="~/teacher/courseshow.aspx?cid={0}" 
                                    DataTextField="Ctitle" HeaderText="学案" >
                                    <HeaderStyle HorizontalAlign="Left" CssClass="py-3 font-semibold text-slate-500" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="text-indigo-600 hover:text-indigo-800 font-bold py-4 px-2" />
                                </asp:HyperLinkField>
                                <asp:BoundField DataField="Cclass" HeaderText="类型" SortExpression="Cclass" >
                                    <HeaderStyle HorizontalAlign="Left" CssClass="py-3 font-semibold text-slate-500" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="text-slate-500 text-sm font-medium py-4 px-2" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Cid"                                     
                                    DataNavigateUrlFormatString="~/teacher/package.aspx?cid={0}" HeaderText="打包" 
                                    Text="下载" >
                                    <HeaderStyle CssClass="py-3 font-semibold text-slate-500" />
                                    <ItemStyle CssClass="text-slate-500 hover:text-slate-800 text-sm font-medium transition-colors" HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="发布" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LbtnCpublish" runat="server" CausesValidation="false" 
                                           CommandArgument='<%# Bind("Cid") %>'  CommandName="Cp" Text='<%# Eval("Cpublish") %>' CssClass="text-xs font-bold px-2.5 py-1 rounded-md bg-slate-100 text-slate-600 hover:bg-indigo-50 hover:text-indigo-600 transition-colors"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" CssClass="py-4" />
                                </asp:TemplateField>
                                <asp:HyperLinkField DataNavigateUrlFields="Cid" 
                                    DataNavigateUrlFormatString="~/teacher/courseanalyse.aspx?cid={0}" 
                                    Text="分析" HeaderText="作品" >
                                    <HeaderStyle CssClass="py-3 font-semibold text-slate-500" />
                                    <ItemStyle CssClass="text-emerald-600 hover:text-emerald-800 font-medium text-sm transition-colors" HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="探讨">
                                    <ItemTemplate>                                    
                                        <asp:HyperLink ID="Hl" runat="server" Text="反思" CssClass="text-purple-600 hover:text-purple-800 font-medium text-sm transition-colors"></asp:HyperLink>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="py-3 font-semibold text-slate-500" />
                                    <ItemStyle HorizontalAlign="Center" CssClass="py-4" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="推荐" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LbtnCgood" runat="server" CausesValidation="false" 
                                           CommandArgument='<%# Bind("Cid") %>'  CommandName="Cg" ToolTip="默认为True，学生平台作品收藏学案列表中显示；False则不显示!" Text='<%# Eval("Cgood") %>' CssClass="text-xs font-bold px-2.5 py-1 rounded-md bg-slate-100 text-slate-600 hover:bg-amber-50 hover:text-amber-600 transition-colors"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" CssClass="py-4" />
                                </asp:TemplateField>
                                <asp:HyperLinkField DataNavigateUrlFields="Cid" 
                                    DataNavigateUrlFormatString="~/teacher/courseedit.aspx?cid={0}" Text="编辑" 
                                    HeaderText="操作">
                                    <HeaderStyle CssClass="py-3 font-semibold text-slate-500" />
                                    <ItemStyle CssClass="text-slate-400 hover:text-indigo-600 font-medium text-sm transition-colors w-16" HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="日期" SortExpression="Cdate">
                                    <ItemTemplate>
                                        <div class="flex items-center justify-center gap-1.5 text-xs font-medium text-slate-400">
                                            <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                            <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Cdate","{0:d}")%>'></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="py-3 font-semibold text-slate-500" />
                                    <ItemStyle HorizontalAlign="Center" CssClass="w-32 py-4" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="管理" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LbtnCold" runat="server" CausesValidation="false" 
                                          CommandArgument='<%# Bind("Cid") %>'  ToolTip="转移到学案仓库中保留" CommandName="Cu" Text="入库" CssClass="text-xs font-semibold text-orange-600 hover:text-orange-700 bg-orange-50 px-2.5 py-1 rounded-md border border-orange-200 transition-colors hover:shadow-sm"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" CssClass="w-20 py-4" />
                                </asp:TemplateField>
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

        <!-- Footer Action Bar -->
        <div class="flex justify-end items-center gap-3 py-2">
            <asp:Button ID="Btnimport" runat="server" Text="导入学案" onclick="Btnimport_Click"
                CssClass="bg-white border border-slate-300 text-slate-700 hover:bg-slate-50 hover:text-indigo-600 font-medium py-2 px-5 rounded-xl transition-all cursor-pointer text-sm shadow-sm active:scale-95" />
            <asp:Button ID="Btnold" runat="server" Text="学案仓库" onclick="Btnold_Click"
                CssClass="bg-slate-100 border border-slate-300 text-slate-700 hover:bg-slate-200 hover:text-indigo-600 font-medium py-2 px-5 rounded-xl transition-all cursor-pointer text-sm shadow-sm active:scale-95" />
        </div>

        <link href="../js/tinybox.css" rel="stylesheet" type="text/css" />
        <script src="../js/tinybox.js" type="text/javascript"></script>
        <script type ="text/javascript" >
            function tshow(c) {
                var urlat = "../lessons/thinkshow.aspx?cid=" + c;
                TINY.box.show({ iframe: urlat, boxid: 'frameless', width: 800, height: 500, fixed: false, maskopacity: 40, closejs: function () { closeJS() } })
            }
        </script>               
    </div>
</asp:Content>

