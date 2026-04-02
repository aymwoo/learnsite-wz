<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.master" StylesheetTheme="Student" AutoEventWireup="true" CodeFile="mywork.aspx.cs" Inherits="Student_mywork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cphs" Runat="Server">
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
        <!-- Main Content (Left Column) -->
        <div class="lg:col-span-3 space-y-8 overflow-hidden min-w-0">
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-slate-800 flex items-center gap-2 border-b border-slate-100 pb-2">
                    <span class="w-1.5 h-5 bg-blue-500 rounded-full inline-block"></span> 我的作品
                </h3>
    <asp:GridView ID="GridViewworks" runat="server" AllowPaging="True" OnPageIndexChanging="GridViewworks_PageIndexChanging" 
        PageSize="15" Width="100%" SkinID="GridViewInfo" 
        onrowdatabound="GridViewworks_RowDataBound" AutoGenerateColumns="False" EnableModelValidation="True"
        CssClass="w-full text-slate-600 bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm">
        <Columns>            
            <asp:TemplateField>
            <ItemTemplate>
                <div class="flex justify-center"><asp:Image ID="ImageLeaf" runat="server" ImageUrl="~/images/fruit.gif" Height="16px" /></div>
            </ItemTemplate>
            <ItemStyle Width="60px" />
            </asp:TemplateField>           
            <asp:BoundField DataField="Ctitle" HeaderText="所属学案" >
            <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 font-semibold px-4 py-3" />
            <ItemStyle HorizontalAlign="Left" CssClass="px-4 py-2 text-sm text-slate-600 truncate max-w-[200px]" />
            </asp:BoundField>           
            <asp:BoundField DataField="Mtitle" HeaderText="相关活动" >
            <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 font-semibold px-4 py-3" />
            <ItemStyle HorizontalAlign="Left" CssClass="px-4 py-2 font-medium text-slate-800" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="wid" 
                DataNavigateUrlFormatString="downwork.aspx?Wid={0}" HeaderText="作品操作" 
                Text="查看 / 下载" Target="_blank">
            <HeaderStyle CssClass="bg-slate-50 font-semibold px-4 py-3" />
            <ItemStyle Width="140px" CssClass="px-4 py-2 font-medium text-blue-600 hover:text-blue-800 transition" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Wscore" HeaderText="学分">
            <HeaderStyle CssClass="bg-slate-50 font-semibold px-2 py-3" />
            <ItemStyle Width="60px" CssClass="text-center font-semibold text-emerald-600 px-2 py-2" />
            </asp:BoundField>
            <asp:BoundField DataField="Wdscore" HeaderText="加分">
            <HeaderStyle CssClass="bg-slate-50 font-semibold px-2 py-3" />
            <ItemStyle Width="60px" CssClass="text-center text-orange-500 font-medium px-2 py-2" />
            </asp:BoundField>            
            <asp:BoundField DataField="Wvote" HeaderText="鲜花">
            <HeaderStyle CssClass="bg-slate-50 font-semibold px-2 py-3" />
            <ItemStyle Width="60px" CssClass="text-center text-pink-500 font-medium px-2 py-2" />
            </asp:BoundField>            
            <asp:BoundField DataField="cobj" HeaderText="年级" >
            <HeaderStyle CssClass="bg-slate-50 font-semibold px-2 py-3 hidden sm:table-cell" />
            <ItemStyle Width="60px" CssClass="text-center text-slate-500 text-sm hidden sm:table-cell" />
            </asp:BoundField>
            <asp:BoundField DataField="cterm" HeaderText="学期" >
            <HeaderStyle CssClass="bg-slate-50 font-semibold px-2 py-3 hidden md:table-cell" />
            <ItemStyle Width="60px" CssClass="text-center text-slate-500 text-sm hidden md:table-cell" />
            </asp:BoundField>
        </Columns>
        <PagerTemplate>
            <div class="flex items-center justify-between px-4 py-3 bg-slate-50 border-t border-slate-200 sm:px-6">
                <div class="text-sm text-slate-500">
                第<asp:Label ID="lblPageIndex" runat="server" CssClass="font-medium text-slate-900 mx-1" 
                    Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>"></asp:Label>
                页 / 共<asp:Label ID="lblPageCount" runat="server" CssClass="font-medium text-slate-900 mx-1" 
                    Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label>
                页 
                </div>
                <div class="flex gap-2">
                <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" 
                    CommandArgument="First" CommandName="Page" CssClass="px-3 py-1 text-sm border border-slate-300 rounded-md hover:bg-slate-100 transition text-slate-600" Text="首页"></asp:LinkButton>
                <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" 
                    CommandArgument="Prev" CommandName="Page" CssClass="px-3 py-1 text-sm border border-slate-300 rounded-md hover:bg-slate-100 transition text-slate-600" Text="上一页"></asp:LinkButton>
                <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" 
                    CommandArgument="Next" CommandName="Page" CssClass="px-3 py-1 text-sm border border-slate-300 rounded-md hover:bg-slate-100 transition text-slate-600" Text="下一页"></asp:LinkButton>
                <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" 
                    CommandArgument="Last" CommandName="Page" CssClass="px-3 py-1 text-sm border border-slate-300 rounded-md hover:bg-slate-100 transition text-slate-600" Text="尾页"></asp:LinkButton>
                </div>
            </div>
        </PagerTemplate>
        <RowStyle Height="44px" CssClass="border-b border-slate-100 hover:bg-slate-50 transition" />
    </asp:GridView>
            </div>
        </div>

        <!-- Sidebar (Right Column) -->
        <div class="lg:col-span-1 space-y-6 self-start top-24 sticky">
            <div class="bg-indigo-50 border border-indigo-100 rounded-2xl p-5 shadow-sm overflow-hidden">
                <h4 class="text-indigo-800 font-bold mb-4 flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path></svg>
                    优秀作品推荐
                </h4>
                <asp:GridView ID="Topwork" runat="server" AllowPaging="True" Width="100%" 
                    SkinID="GridViewInfo" AutoGenerateColumns="False" 
                                EnableModelValidation="True" EmptyDataText="暂无数据" 
                                onrowdatabound="Topwork_RowDataBound"
                                CssClass="w-full text-xs text-slate-700 min-w-min">
                                <Columns>
                                    <asp:BoundField HeaderText="序号">
                                        <HeaderStyle CssClass="py-2 text-left text-indigo-900 border-b border-indigo-200" />
                                        <ItemStyle CssClass="py-2 border-b border-indigo-100/50" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Wname" HeaderText="作者">
                                        <HeaderStyle CssClass="py-2 text-left text-indigo-900 border-b border-indigo-200" />
                                        <ItemStyle CssClass="py-2 font-medium border-b border-indigo-100/50" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField DataNavigateUrlFields="wid" 
                                        DataNavigateUrlFormatString="downwork.aspx?Wid={0}" HeaderText="赏析" 
                                        Text="★ 点击" Target="_blank">
                                        <HeaderStyle CssClass="py-2 text-left text-indigo-900 border-b border-indigo-200" />
                                        <ItemStyle CssClass="py-2 text-indigo-600 font-bold hover:text-indigo-800 border-b border-indigo-100/50" />
                                    </asp:HyperLinkField>
                                </Columns>
                </asp:GridView>
            </div>

            <div class="flex flex-col gap-3">
                <asp:HyperLink ID="HLworks" runat="server" 
                    NavigateUrl="~/student/masterwork.aspx" Target="_blank" 
                    CssClass="w-full flex items-center justify-center gap-2 py-3 bg-white border-2 border-green-500 text-green-600 font-bold rounded-xl hover:bg-green-500 hover:text-white transition duration-300 shadow-sm text-sm">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
                    查看我的作品收藏
                </asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

