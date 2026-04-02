<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"   StylesheetTheme="Teacher" AutoEventWireup="true"  CodeFile="course.aspx.cs" Inherits="Teacher_course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6">
        <!-- Top Action Bar -->
        <div class="bg-white p-4 rounded-lg shadow-sm border border-gray-100 flex flex-wrap items-center justify-between">
            <div class="flex items-center gap-3 text-sm text-gray-700">
                <span class="font-medium">学案选择：</span>
                <asp:DropDownList ID="DDLgrade" runat="server"
                    CssClass="border border-gray-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                    EnableTheming="True" AutoPostBack="True" 
                    onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                </asp:DropDownList>
                <span>年级</span>

                <asp:Label ID="Labelmsg" runat="server" CssClass="text-red-500 font-semibold mx-2"></asp:Label>

                <asp:DropDownList ID="DDLterm" runat="server"
                    CssClass="border border-gray-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                    EnableTheming="True" AutoPostBack="True"
                    onselectedindexchanged="DDLterm_SelectedIndexChanged"
                    ToolTip="选择要显示学案的学期，不改变后台默认学期设置">
                    <asp:ListItem Value="1">第一学期</asp:ListItem>
                    <asp:ListItem Value="2">第二学期</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Labelspace" runat="server" CssClass="hidden"></asp:Label>
            </div>

            <div>
                <asp:Button ID="Btnadd" runat="server" Text="添加学案" onclick="Btnadd_Click"
                    CssClass="bg-blue-500 hover:bg-blue-600 text-white font-medium py-1.5 px-4 rounded transition-colors cursor-pointer text-sm shadow-sm" />
            </div>
        </div>

        <!-- Course List DataGrid -->
        <div class="bg-white rounded-lg shadow-sm border border-gray-100 overflow-hidden">
            <div class="overflow-x-auto">
                    <asp:GridView ID="GVCourse" runat="server" AllowPaging="True"
                            AutoGenerateColumns="False"  DataKeyNames="Cid"  
                            PageSize="20" Width="100%"
                            onpageindexchanging="GVCourse_PageIndexChanging" 
                            onrowdatabound="GVCourse_RowDataBound" CellPadding="6" 
                            EnableModelValidation="True" 
                            onrowcommand="GVCourse_RowCommand" ForeColor="#111111" GridLines="None" >
                            <AlternatingRowStyle BackColor="#F9FAFB" />
                            <Columns>                                
                                <asp:BoundField DataField="Cks" HeaderText="课节">
                                    <ItemStyle HorizontalAlign="Center" CssClass="font-medium text-gray-700 w-12" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Cid" 
                                    DataNavigateUrlFormatString="~/teacher/courseshow.aspx?cid={0}" 
                                    DataTextField="Ctitle" HeaderText="学案" >
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="text-blue-600 hover:text-blue-800 font-medium py-3 px-2" />
                                </asp:HyperLinkField>
                                <asp:BoundField DataField="Cclass" HeaderText="类型" SortExpression="Cclass" >
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="text-gray-500 text-sm" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Cid"                                     
                                    DataNavigateUrlFormatString="~/teacher/package.aspx?cid={0}" HeaderText="打包" 
                                    Text="下载" >
                                    <ItemStyle CssClass="text-gray-600 hover:text-gray-900 text-sm" HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="发布" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LbtnCpublish" runat="server" CausesValidation="false" 
                                           CommandArgument='<%# Bind("Cid") %>'  CommandName="Cp" Text='<%# Eval("Cpublish") %>' CssClass="text-sm px-2 py-1 rounded bg-gray-100 hover:bg-gray-200 transition-colors"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:HyperLinkField DataNavigateUrlFields="Cid" 
                                    DataNavigateUrlFormatString="~/teacher/courseanalyse.aspx?cid={0}" 
                                    Text="分析" HeaderText="作品" >
                                    <ItemStyle CssClass="text-blue-500 hover:text-blue-700 text-sm" HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="探讨">
                                    <ItemTemplate>                                    
                                        <asp:HyperLink ID="Hl" runat="server" Text="反思" CssClass="text-purple-600 hover:text-purple-800 text-sm"></asp:HyperLink>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="推荐" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LbtnCgood" runat="server" CausesValidation="false" 
                                           CommandArgument='<%# Bind("Cid") %>'  CommandName="Cg" ToolTip="默认为True，学生平台作品收藏学案列表中显示；False则不显示!" Text='<%# Eval("Cgood") %>' CssClass="text-sm px-2 py-1 rounded bg-gray-100 hover:bg-gray-200 transition-colors"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:HyperLinkField DataNavigateUrlFields="Cid" 
                                    DataNavigateUrlFormatString="~/teacher/courseedit.aspx?cid={0}" Text="编辑" 
                                    HeaderText="内容">
                                    <ItemStyle CssClass="text-gray-600 hover:text-blue-600 text-sm w-12" HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="日期" SortExpression="Cdate">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" 
                                            Text='<%# DataBinder.Eval(Container.DataItem,"Cdate","{0:d}")%>' CssClass="text-sm text-gray-400"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" CssClass="w-24" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="入库" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LbtnCold" runat="server" CausesValidation="false" 
                                          CommandArgument='<%# Bind("Cid") %>'  ToolTip="转移到学案仓库中保留" CommandName="Cu" Text="转移" CssClass="text-xs text-orange-600 hover:text-orange-800 bg-orange-50 px-2 py-1 rounded border border-orange-200"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" CssClass="w-16" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#F3F4F6" Font-Bold="True" ForeColor="#374151" CssClass="border-b border-gray-200 text-sm" Height="40px" />
                            <RowStyle BackColor="#FFFFFF" CssClass="border-b border-gray-100 hover:bg-gray-50 transition-colors" />
                            <PagerStyle BackColor="#F9FAFB" ForeColor="#374151" HorizontalAlign="Center" CssClass="border-t border-gray-200 p-2" />
                            <pagertemplate>
                                <div class="w-full flex justify-end items-center gap-4 text-sm text-gray-600 p-2">
                                    <span>
                                        第 <asp:Label ID="lblPageIndex" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" CssClass="font-semibold text-gray-800" /> 页
                                        共 <asp:Label ID="lblPageCount" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" CssClass="font-semibold text-gray-800" /> 页
                                    </span>
                                    <div class="flex gap-2">
                                        <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" commandargument="First" commandname="Page" text="首页" CssClass="px-2 py-1 rounded border border-gray-300 hover:bg-gray-100 transition-colors" />
                                        <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" commandargument="Prev" commandname="Page" text="上一页" CssClass="px-2 py-1 rounded border border-gray-300 hover:bg-gray-100 transition-colors" />
                                        <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" commandargument="Next" commandname="Page" text="下一页" CssClass="px-2 py-1 rounded border border-gray-300 hover:bg-gray-100 transition-colors" />
                                        <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" commandargument="Last" commandname="Page" text="尾页" CssClass="px-2 py-1 rounded border border-gray-300 hover:bg-gray-100 transition-colors" />
                                    </div>
                                </div>
                            </pagertemplate>
                            <SelectedRowStyle BackColor="#FEF3C7" Font-Bold="True" ForeColor="#92400E" />
                        </asp:GridView>
            </div>
        </div>

        <!-- Footer Action Bar -->
        <div class="flex justify-end items-center gap-4 py-4">
            <asp:Button ID="Btnimport" runat="server" Text="导入学案" onclick="Btnimport_Click"
                CssClass="bg-white border border-gray-300 text-gray-700 hover:bg-gray-50 font-medium py-1.5 px-4 rounded transition-colors cursor-pointer text-sm shadow-sm" />
            <asp:Button ID="Btnold" runat="server" Text="学案仓库" onclick="Btnold_Click"
                CssClass="bg-gray-100 border border-gray-300 text-gray-700 hover:bg-gray-200 font-medium py-1.5 px-4 rounded transition-colors cursor-pointer text-sm shadow-sm" />
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

