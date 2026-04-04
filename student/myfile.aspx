<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.master" StylesheetTheme="Student" AutoEventWireup="true" CodeFile="myfile.aspx.cs" Inherits="Student_myfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cphs" Runat="Server">
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
        <!-- Main Content (Left Column) -->
        <div class="lg:col-span-3 space-y-8 overflow-hidden min-w-0">
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-slate-800 flex items-center gap-2 border-b border-slate-100 pb-2">
                    <span class="w-1.5 h-5 bg-indigo-500 rounded-full inline-block"></span> 资源下载
                </h3>
<div class="overflow-x-auto w-full rounded-xl border border-slate-200 shadow-sm">
      <asp:GridView ID="GVSoft" runat="server" AllowPaging="True" 
          AutoGenerateColumns="False" 
          OnPageIndexChanging="GVSoft_PageIndexChanging" 
          OnRowDataBound="GVSoft_RowDataBound" Width="100%" SkinID="GridViewInfo" 
          PageSize="20" EnableModelValidation="True" CellPadding="3"
          CssClass="w-full text-slate-600 bg-white min-w-[600px]">
          <AlternatingRowStyle BorderStyle="None" />
          <Columns>
              <asp:BoundField HeaderText="序号">
                  <HeaderStyle CssClass="bg-slate-50 font-semibold px-4 py-3 w-16" />
                  <ItemStyle CssClass="text-center font-medium text-slate-500" />
              </asp:BoundField>
              <asp:BoundField DataField="Fclass" HeaderText="属性">
                  <HeaderStyle CssClass="bg-slate-50 font-semibold px-4 py-3" />
                  <ItemStyle CssClass="text-center" />
              </asp:BoundField>
              <asp:HyperLinkField DataNavigateUrlFields="fid" 
                  DataNavigateUrlFormatString="downfile.aspx?fid={0}" HeaderText="资源标题" 
                  DataTextField="Ftitle">
                  <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 font-semibold px-4 py-3" />
              <ItemStyle HorizontalAlign="Left" CssClass="px-4 py-2 font-medium text-slate-800 hover:text-indigo-600 transition" />
              </asp:HyperLinkField>
              <asp:BoundField DataField="Ffiletype" HeaderText="格式">
                  <HeaderStyle CssClass="bg-slate-50 font-semibold px-4 py-3" />
                  <ItemStyle CssClass="text-center text-xs font-mono text-slate-500 bg-slate-100 rounded px-1 py-0.5 max-w-[60px] mx-auto block w-max mt-1" />
              </asp:BoundField>
              <asp:BoundField DataField="Fhit" HeaderText="下载次数">
                  <HeaderStyle CssClass="bg-slate-50 font-semibold px-4 py-3" />
                  <ItemStyle CssClass="text-center text-emerald-600 font-medium" />
              </asp:BoundField>
              <asp:BoundField DataField="Fdate" HeaderText="更新日期">
                  <HeaderStyle CssClass="bg-slate-50 font-semibold px-4 py-3 hidden sm:table-cell" />
                  <ItemStyle Width="120px" CssClass="text-center text-sm text-slate-400 hidden sm:table-cell" />
              </asp:BoundField>
          </Columns>
          <pagertemplate>
            <div class="flex items-center justify-between px-4 py-3 bg-slate-50 border-t border-slate-200 sm:px-6">
                <div class="text-sm text-slate-500">
                第<asp:Label ID="lblPageIndex" runat="server" CssClass="font-medium text-slate-900 mx-1" 
                    text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" />
                页 / 共<asp:Label ID="lblPageCount" runat="server" CssClass="font-medium text-slate-900 mx-1" 
                    text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" />
                页 
                </div>
                <div class="flex gap-2">
                <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" 
                    commandargument="First" commandname="Page" CssClass="px-3 py-1 text-sm border border-slate-300 rounded-md hover:bg-slate-100 transition text-slate-600" text="首页" />
                <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" 
                    commandargument="Prev" commandname="Page" CssClass="px-3 py-1 text-sm border border-slate-300 rounded-md hover:bg-slate-100 transition text-slate-600" text="上一页" />
                <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" 
                    commandargument="Next" commandname="Page" CssClass="px-3 py-1 text-sm border border-slate-300 rounded-md hover:bg-slate-100 transition text-slate-600" text="下一页" />
                <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" 
                    commandargument="Last" commandname="Page" CssClass="px-3 py-1 text-sm border border-slate-300 rounded-md hover:bg-slate-100 transition text-slate-600" text="尾页" />
                </div>
            </div>
          </pagertemplate>
          <RowStyle Height="40px" CssClass="border-b border-slate-100 hover:bg-slate-50 transition" />
      </asp:GridView>
</div>
            </div>
        </div>

        <!-- Sidebar (Right Column) -->
        <div class="lg:col-span-1 space-y-6 self-start top-24 sticky">
            <div class="bg-indigo-50/50 border border-indigo-100 rounded-2xl p-5 shadow-sm overflow-hidden flex flex-col items-center">
                <img src="../images/soft.png" class="h-20 w-auto object-contain opacity-80 mb-4" />
                <h4 class="w-full text-indigo-800 font-bold mb-3 flex items-center gap-2 border-b border-indigo-200/60 pb-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
                    资源类别
                </h4>
                <asp:GridView ID="GVcategory" runat="server" AutoGenerateColumns="False" 
                    EnableModelValidation="True" 
                    ShowHeader="False" 
                    SkinID="GridViewMission" Width="100%" DataKeyNames="yid" 
                    onrowdatabound="GVcategory_RowDataBound"
                    CssClass="w-full text-slate-700">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="flex justify-center text-indigo-400">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path></svg>
                                </div>
                            </ItemTemplate>
                            <ItemStyle Width="40px" CssClass="py-2.5 border-b border-slate-200/50" />
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="yid" 
                            DataNavigateUrlFormatString="~/student/myfile.aspx?yid={0}" 
                            DataTextField="Ytitle" Target="_self" >
                        <ItemStyle HorizontalAlign="Left" CssClass="py-2.5 font-medium hover:text-indigo-600 transition block border-b border-slate-200/50" />
                        </asp:HyperLinkField>
                    </Columns>
                    <RowStyle CssClass="hover:bg-white/60 transition" />
                </asp:GridView>
            </div>
        </div>   
    </div>
</asp:Content>

