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

        <script type ="text/javascript" >
            function package() {
                var urlpg = "../teacher/workpackage.aspx" ;
                openLessonModal(urlpg, "作品打包", 300);
            }
        </script>
                    <asp:Button ID="Btnterm" runat="server" Text="学期总评"  SkinID="BtnNormal" 
                onclick="Btnterm_Click" ToolTip="跳转到学期总评页面"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
        </div>
        <div>
        <div class="centerdiv">
            <asp:GridView ID="GVCourse" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False"  CellPadding="6" DataKeyNames="Cid"  SkinID="GridViewInfo"
                PageSize="20" Width="100%" 
                onpageindexchanging="GVCourse_PageIndexChanging" 
                onrowdatabound="GVCourse_RowDataBound" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="Cid" HeaderText="序号" InsertVisible="False" 
                        ReadOnly="True" SortExpression="Cid" >
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="50px" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:HyperLinkField 
                        DataTextField="Ctitle" HeaderText="学案" >
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="Cclass" HeaderText="类型" SortExpression="Cclass" >
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemStyle Width="60px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="未评数">
                        <ItemTemplate>
                            <asp:HyperLink ID="HlNoCheck" runat="server"  CssClass="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 transition duration-300 shadow-md text-center inline-block"></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Font-Bold="True" Width="60px" />
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="Cid,Cobj" 
                        DataNavigateUrlFormatString="workcheck.aspx?cid={0}&amp;grade={1}" 
                        Text="查看" HeaderText="评价" Target="_blank">
                    <ItemStyle Width="60px" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="Cdate" HeaderText="日期" SortExpression="Cdate" >
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" Width="160px" />
                    </asp:BoundField>
                </Columns>
                <pagertemplate>
                    <div  class="pagediv">
                        第<asp:Label ID="lblPageIndex" runat="server" 
                            text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" />
                        页  共<asp:Label ID="lblPageCount" runat="server" 
                            text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" />
                        页 
                        <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" 
                            commandargument="First" commandname="Page" Font-Underline="False" 
                            ForeColor="Black" text="首页" />
                        <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" 
                            commandargument="Prev" commandname="Page" Font-Underline="False" 
                            ForeColor="Black" text="上一页" />
                        <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" 
                            commandargument="Next" commandname="Page" Font-Underline="False" 
                            ForeColor="Black" text="下一页" />
                        <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" 
                            commandargument="Last" commandname="Page" Font-Underline="False" 
                            ForeColor="Black" text="尾页" />
                    </div>
                </pagertemplate>
            </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>
