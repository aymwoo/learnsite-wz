<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.master" StylesheetTheme="Student" AutoEventWireup="true" CodeFile="myinfo.aspx.cs" Inherits="Student_myinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cphs" Runat="Server">
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
        <!-- Main Content (Left Column) -->
        <div class="lg:col-span-3 space-y-8 overflow-hidden min-w-0">
            <!-- New Courses -->
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-slate-800 flex items-center gap-2 border-b border-slate-100 pb-2">
                    <span class="w-1.5 h-5 bg-orange-400 rounded-full inline-block"></span> 未学学案
                </h3>
<div class="overflow-x-auto w-full rounded-xl border border-slate-200 shadow-sm">
    <asp:GridView ID="GridViewnewkc" runat="server" Width="100%" 
        SkinID="GridViewInfo" onrowdatabound="GridViewnewkc_RowDataBound" 
        AutoGenerateColumns="False" 
        EnableModelValidation="True" PageSize="5" AllowPaging="True" 
        onpageindexchanging="GridViewnewkc_PageIndexChanging" 
        CssClass="w-full text-slate-600 bg-white min-w-[500px]">
        <Columns>
            <asp:BoundField DataField="cid"  Visible="false">
            <ItemStyle Width="30px" ForeColor="White" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="flex justify-center"><asp:Image ID="ImageLeaf" runat="server" ImageUrl="~/images/leaf.gif" /></div>
                </ItemTemplate>
                <ItemStyle Width="60px" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="cid" 
                DataNavigateUrlFormatString="~/student/showcourse.aspx?cid={0}" DataTextField="ctitle" 
                HeaderText="学案名称" >
            <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 font-semibold px-4 py-3" />
            <ItemStyle HorizontalAlign="Left" CssClass="px-4 py-2 font-medium text-slate-800 hover:text-blue-600 transition-colors" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Cdate" HeaderText="发布日期" >
            <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 font-semibold px-4 py-3" />
            <ItemStyle HorizontalAlign="Left" Width="120px" CssClass="px-4 py-2 text-sm text-slate-500" />
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
        <RowStyle Height="40px" CssClass="border-b border-slate-100 hover:bg-slate-50 transition" />
    </asp:GridView>
</div>
            </div>

            <!-- Done Courses -->
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-slate-800 flex items-center gap-2 border-b border-slate-100 pb-2">
                    <span class="w-1.5 h-5 bg-green-500 rounded-full inline-block"></span> 已学学案
                </h3>
<div class="overflow-x-auto w-full rounded-xl border border-slate-200 shadow-sm">
       <asp:GridView ID="GridViewdonekc" runat="server" AllowPaging="True" 
           AutoGenerateColumns="False" 
           EnableModelValidation="True" 
           OnPageIndexChanging="GridViewdonekc_PageIndexChanging" 
           onrowdatabound="GridViewdonekc_RowDataBound" SkinID="GridViewInfo" 
           Width="100%" PageSize="5" DataKeyNames="Cid"
           CssClass="w-full text-slate-600 bg-white min-w-[500px]">
           <Columns>
               <asp:BoundField DataField="Cid" Visible="false">
               <ItemStyle ForeColor="White" Width="30px" />
               </asp:BoundField>
                <asp:TemplateField>
                <ItemTemplate>
                    <div class="flex justify-center"><asp:Image ID="ImageLeaf" runat="server" ImageUrl="~/images/fruit.gif" Height="16px" /></div>
                </ItemTemplate>
                <ItemStyle Width="60px" />
            </asp:TemplateField>
               <asp:HyperLinkField DataNavigateUrlFields="Cid" 
                   DataNavigateUrlFormatString="~/student/showcourse.aspx?cid={0}" 
                   DataTextField="ctitle" HeaderText="学案名称">
               <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 font-semibold px-4 py-3" />
               <ItemStyle HorizontalAlign="Left" CssClass="px-4 py-2 font-medium text-slate-800 hover:text-green-600 transition-colors" />
               </asp:HyperLinkField>
               <asp:TemplateField HeaderText="学习进度">
                <ItemTemplate>
                    <asp:Literal ID="Process" runat="server"></asp:Literal>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 font-semibold px-4 py-3" />
                <ItemStyle HorizontalAlign="Left" CssClass="px-4 py-2" />
               </asp:TemplateField>
            <asp:BoundField DataField="Cdate" HeaderText="完成日期" >
            <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 font-semibold px-4 py-3" />
            <ItemStyle HorizontalAlign="Left" Width="120px" CssClass="px-4 py-2 text-sm text-slate-500" />
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
           <RowStyle Height="40px"  CssClass="border-b border-slate-100 hover:bg-slate-50 transition" />
       </asp:GridView>
</div>
            </div>

            <!-- Active Students Board -->
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-slate-800 flex items-center gap-2 border-b border-slate-100 pb-2 mt-4">
                    <span class="w-1.5 h-5 bg-blue-500 rounded-full inline-block"></span> 今天签到的同学
                </h3>
                <div class="bg-indigo-50/50 rounded-2xl p-4 border border-indigo-100/60 w-full overflow-x-auto min-w-0">
                    <asp:DataList ID="DataListonline" runat="server" DataKeyField="Qid"
                                RepeatLayout="Flow"
                        onitemdatabound="DataListonline_ItemDataBound" CssClass="flex flex-nowrap md:flex-wrap gap-3">
                        <ItemTemplate>
                            <div class="rounded-lg border border-white bg-white/70 shadow-sm overflow-hidden flex flex-col items-center p-1.5 hover:shadow-md hover:scale-105 transition-all w-24 shrink-0">
                                <div class="w-full text-center py-1 bg-blue-50/80 rounded mb-1">
                                    <asp:HyperLink ID="HyperQname" runat="server" CssClass="text-sm font-semibold text-slate-800 hover:text-blue-600 transition block truncate cursor-pointer"
                                        Text='<%# Eval("Sname") %>' ToolTip='<%# Eval("Qip") %>' ></asp:HyperLink>
                                </div>
                                <div class="flex flex-col items-center justify-center">
                                    <asp:Image ID="Imageflag" runat="server" CssClass="my-1 rounded-sm shadow-sm opacity-90" />
                                    <asp:Label ID="Labeltime" runat="server" Text='<%# Eval("Qdate") %>' CssClass="text-xs text-slate-400 block truncate w-full text-center mt-1"></asp:Label>
                                </div>
                                <asp:Label ID="LabelSleader" runat="server" Text='<%# Eval("Sleader") %>' Visible="false" ></asp:Label>
                                <asp:Label ID="LabelSgroup" runat="server" Text='<%# Eval("Sgroup") %>' Visible="false" ></asp:Label>
                                <asp:Label ID="LabelQnum" runat="server" Text='<%# Eval("Qnum") %>' Visible="false" ></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>

        <!-- Sidebar (Right Column) -->
        <div class="lg:col-span-1 border border-slate-200/60 bg-slate-50/50 rounded-2xl p-5 shadow-sm flex flex-col items-center space-y-6 self-start top-24 sticky">

            <div class="w-full bg-orange-50 border border-orange-100 rounded-xl p-4 mt-1">
                <div class="flex items-center gap-2 text-orange-600 font-semibold text-sm mb-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path></svg>
                    最新作品评语
                </div>
                <div class="text-sm text-slate-700 leading-relaxed min-h-[3rem] italic p-1 border-l-2 border-orange-300 ml-1 pl-2 font-medium">
                    <asp:Label ID="LabelWself" runat="server" ></asp:Label>
                </div>
                <div class="mt-3 text-right">
                    <asp:HyperLink ID="Hlwork" runat="server" CssClass="text-xs inline-flex items-center gap-1 text-orange-500 hover:text-orange-700 font-bold transition cursor-pointer">
                        查看作品 <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                    </asp:HyperLink>
                </div>
            </div>
            
            <div class="flex flex-col sm:flex-row lg:flex-col gap-3 w-full mt-2 pt-4 border-t border-slate-200/60">
                <asp:Button ID="BtnProfile" runat="server" OnClick="BtnProfile_Click"
                    Text="我的资料" CausesValidation="False" OnClientClick="openModernGroupModal(); return false;"
                    CssClass="flex-1 w-full flex justify-center py-2.5 px-4 border border-slate-300 rounded-xl text-sm font-semibold text-slate-700 bg-white hover:bg-slate-50 transition-all duration-300 shadow-sm cursor-pointer" />
                <asp:Button ID="BtnExit" runat="server" onclick="BtnExit_Click" 
                    Enabled="False" Text="" 
                    CssClass="flex-1 w-full flex justify-center py-2.5 px-4 rounded-xl text-sm font-semibold text-white bg-red-500 hover:bg-red-600 focus:ring-2 focus:ring-offset-2 focus:ring-red-500 transition-all duration-300 shadow-md border-0 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed" />
            </div>
            
            <asp:Label ID="LabelCids" runat="server" ForeColor="White" Visible="false"></asp:Label>
            
            <!-- Modern Tailwind CSS Modal for '我的资料'（多标签页整合版） -->
            <div id="modernGroupModal" class="fixed inset-0 z-[9999] hidden" aria-labelledby="modal-title" role="dialog" aria-modal="true">
                <!-- Background backdrop -->
                <div id="modernGroupModalBackdrop" class="fixed inset-0 bg-slate-900/60 backdrop-blur-sm transition-opacity opacity-0" aria-hidden="true"></div>

                <div class="fixed inset-0 z-10 w-screen overflow-y-auto">
                    <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-6">
                        <!-- Modal panel -->
                        <div id="modernGroupModalPanel" class="relative transform rounded-2xl bg-white text-left shadow-2xl transition-all sm:my-8 w-full opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95 border border-slate-100" style="overflow:hidden; max-width:min(660px, calc(100vw - 2rem)); box-sizing:border-box;">
                            <!-- Header -->
                            <div style="background:linear-gradient(to right,#eef2ff,#ffffff); padding:1rem 1.25rem; border-bottom:1px solid #e0e7ff; display:flex; align-items:center; justify-content:space-between;">
                                <h3 style="margin:0; font-size:1.0625rem; font-weight:800; color:#312e81; display:flex; align-items:center; gap:0.5rem;" id="modal-title">
                                    <svg style="width:1.125rem; height:1.125rem; color:#4f46e5;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                                    我的资料
                                </h3>
                                <button type="button" onclick="closeModernGroupModal()" style="color:#94a3b8; background:transparent; border:none; padding:0.375rem; border-radius:0.5rem; cursor:pointer; transition:all 0.2s; line-height:0;" onmouseover="this.style.color='#e11d48';this.style.background='#fff1f2'" onmouseout="this.style.color='#94a3b8';this.style.background='transparent'">
                                    <span class="sr-only">Close</span>
                                    <svg style="width:1.25rem; height:1.25rem;" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" /></svg>
                                </button>
                            </div>
                            <!-- Student Info Bar -->
                            <div style="padding:0.625rem 1.25rem; background:linear-gradient(to right,#f8fafc,rgba(238,242,255,0.3)); border-bottom:1px solid #f1f5f9; overflow:hidden;">
                                <div style="display:flex; align-items:center; gap:0.75rem; flex-wrap:wrap;">
                                    <!-- Avatar -->
                                    <div style="position:relative; flex-shrink:0;">
                                        <asp:Image ID="Imageface" runat="server" style="width:48px; height:48px; border-radius:50%; object-fit:cover; border:2px solid #fff; box-shadow:0 2px 8px rgba(0,0,0,0.1);" />
                                        <div style="position:absolute; bottom:-2px; right:-2px; background:linear-gradient(135deg,#fb923c,#ec4899); color:#fff; font-size:9px; font-weight:700; padding:1px 5px; border-radius:9999px; box-shadow:0 1px 3px rgba(0,0,0,0.15); border:1.5px solid #fff; line-height:1.4;">
                                            <asp:Label ID="LabelRank" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- Info Chips -->
                                    <div style="display:flex; flex-wrap:wrap; align-items:center; gap:0.375rem; min-width:0; flex:1;">
                                        <span style="display:inline-flex; align-items:center; gap:0.25rem; padding:0.25rem 0.5rem; border-radius:0.375rem; background:#fff; border:1px solid #e2e8f0; font-size:0.75rem; font-weight:500; color:#475569; box-shadow:0 1px 2px rgba(0,0,0,0.04); white-space:nowrap;">
                                            <svg style="width:0.75rem; height:0.75rem; color:#60a5fa; flex-shrink:0;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                                            <asp:Label ID="sname" runat="server" style="font-weight:600; color:#1e293b;"></asp:Label>
                                        </span>
                                        <span style="display:inline-flex; align-items:center; gap:0.25rem; padding:0.25rem 0.5rem; border-radius:0.375rem; background:#fff; border:1px solid #e2e8f0; font-size:0.75rem; font-weight:500; color:#475569; box-shadow:0 1px 2px rgba(0,0,0,0.04); white-space:nowrap;">
                                            <svg style="width:0.75rem; height:0.75rem; color:#818cf8; flex-shrink:0;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0m-5 8a2 2 0 100-4 2 2 0 000 4zm0 0c1.306 0 2.417.835 2.83 2M9 14a3.001 3.001 0 00-2.83 2M15 11h3m-3 4h2"></path></svg>
                                            <asp:Label ID="snum" runat="server" style="color:#334155;"></asp:Label>
                                        </span>
                                        <span style="display:inline-flex; align-items:center; gap:0.25rem; padding:0.25rem 0.5rem; border-radius:0.375rem; background:#fff; border:1px solid #e2e8f0; font-size:0.75rem; font-weight:500; color:#475569; box-shadow:0 1px 2px rgba(0,0,0,0.04); white-space:nowrap;">
                                            <svg style="width:0.75rem; height:0.75rem; color:#34d399; flex-shrink:0;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                                            <asp:Label ID="sclass" runat="server" style="color:#334155;"></asp:Label>
                                        </span>
                                        <span style="display:inline-flex; align-items:center; gap:0.25rem; padding:0.25rem 0.5rem; border-radius:0.375rem; background:#fff; border:1px solid #e2e8f0; font-size:0.75rem; font-weight:500; color:#475569; box-shadow:0 1px 2px rgba(0,0,0,0.04); white-space:nowrap;">
                                            <svg style="width:0.75rem; height:0.75rem; color:#fbbf24; flex-shrink:0;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                                            <asp:HyperLink ID="HLgroup" runat="server" style="color:#4f46e5; font-weight:700; text-decoration:none;">加入小组</asp:HyperLink>
                                        </span>
                                    </div>
                                    <!-- Team Members -->
                                    <div style="display:none; align-items:center; gap:0.25rem; padding:0.25rem 0.5rem; border-radius:0.375rem; background:rgba(241,245,249,0.8); border:1px solid rgba(226,232,240,0.6); font-size:0.6875rem; color:#64748b; flex-shrink:0; max-width:180px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;" class="sm-team-show">
                                        <svg style="width:0.75rem; height:0.75rem; color:#94a3b8; flex-shrink:0;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path></svg>
                                        <asp:Label ID="Labelteam" runat="server" style="color:#475569; font-weight:500;"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <style>
                                @media (min-width: 640px) { .sm-team-show { display: inline-flex !important; } }
                                .profile-modal-tabs { display:flex; gap:0; overflow-x:auto; overflow-y:hidden; -webkit-overflow-scrolling:touch; scrollbar-width:none; }
                                .profile-modal-tabs::-webkit-scrollbar { display:none; }
                                .profile-tab-btn { display:inline-flex; align-items:center; gap:0.25rem; padding:0.5rem 0.625rem; font-size:0.75rem; font-weight:500; white-space:nowrap; border:none; background:transparent; color:#64748b; cursor:pointer; border-bottom:2px solid transparent; transition:all 0.2s; outline:none; flex-shrink:0; }
                                .profile-tab-btn:hover { color:#334155; background:rgba(241,245,249,0.6); }
                                .profile-tab-btn.active { color:#4f46e5; font-weight:600; border-bottom-color:#4f46e5; background:#fff; }
                                .profile-tab-btn svg { width:0.875rem; height:0.875rem; flex-shrink:0; }
                            </style>
                            <!-- Tab Navigation -->
                            <div style="background:#f8fafc; border-bottom:1px solid #e2e8f0; padding:0 0.75rem; overflow:hidden;">
                                <nav class="profile-modal-tabs" aria-label="资料导航">
                                    <button id="tab-group" type="button" onclick="switchProfileTab('../profile/mygroup.aspx', 'tab-group')"
                                        class="profile-tab profile-tab-btn active">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                                        小组
                                    </button>
                                    <button id="tab-sign" type="button" onclick="switchProfileTab('../profile/mysign.aspx', 'tab-sign')"
                                        class="profile-tab profile-tab-btn">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path></svg>
                                        签到
                                    </button>
                                    <button id="tab-term" type="button" onclick="switchProfileTab('../profile/myterm.aspx', 'tab-term')"
                                        class="profile-tab profile-tab-btn">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path></svg>
                                        成果
                                    </button>
                                    <button id="tab-photo" type="button" onclick="switchProfileTab('../profile/myphoto.aspx', 'tab-photo')"
                                        class="profile-tab profile-tab-btn">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                        相片
                                    </button>
                                    <button id="tab-name" type="button" onclick="switchProfileTab('../profile/myname.aspx', 'tab-name')"
                                        class="profile-tab profile-tab-btn">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path></svg>
                                        姓名
                                    </button>
                                    <button id="tab-sex" type="button" onclick="switchProfileTab('../profile/mysex.aspx', 'tab-sex')"
                                        class="profile-tab profile-tab-btn">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                                        性别
                                    </button>
                                    <button id="tab-pwd" type="button" onclick="switchProfileTab('../profile/mypwd.aspx', 'tab-pwd')"
                                        class="profile-tab profile-tab-btn">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
                                        密码
                                    </button>
                                    <button id="tab-class" type="button" onclick="switchProfileTab('../profile/myclass.aspx', 'tab-class')"
                                        class="profile-tab profile-tab-btn">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                                        班级
                                    </button>
                                    <button id="tab-change" type="button" onclick="switchProfileTab('../profile/mychange.aspx', 'tab-change')"
                                        class="profile-tab profile-tab-btn">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"></path></svg>
                                        组长
                                    </button>
                                </nav>
                            </div>
                            <!-- Content (Iframe) -->
                            <div style="background:#fff; overflow:hidden;">
                                <iframe id="modernGroupModalIframe" src="" style="width:100%; height:520px; border:none; display:block;" title="我的资料"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                function switchProfileTab(url, tabId) {
                    document.getElementById('modernGroupModalIframe').src = url;
                    document.querySelectorAll('.profile-tab').forEach(function(tab) {
                        tab.classList.remove('active');
                    });
                    var activeTab = document.getElementById(tabId);
                    if (activeTab) {
                        activeTab.classList.add('active');
                    }
                }

                function openModernGroupModal() {
                    var modal = document.getElementById('modernGroupModal');
                    var backdrop = document.getElementById('modernGroupModalBackdrop');
                    var panel = document.getElementById('modernGroupModalPanel');
                    var iframe = document.getElementById('modernGroupModalIframe');

                    // Load default tab (小组合作) if no page is loaded yet
                    if (!iframe.src || iframe.src === window.location.href || iframe.src === '') {
                        switchProfileTab('../profile/mygroup.aspx', 'tab-group');
                    }

                    // Show modal
                    modal.classList.remove('hidden');

                    // Trigger entrance animations
                    setTimeout(function() {
                        backdrop.classList.remove('opacity-0');
                        backdrop.classList.add('opacity-100');
                        panel.classList.remove('opacity-0', 'translate-y-4', 'sm:translate-y-0', 'sm:scale-95');
                        panel.classList.add('opacity-100', 'translate-y-0', 'sm:scale-100');
                    }, 10);
                }

                function closeModernGroupModal() {
                    var modal = document.getElementById('modernGroupModal');
                    var backdrop = document.getElementById('modernGroupModalBackdrop');
                    var panel = document.getElementById('modernGroupModalPanel');

                    // Trigger exit animations
                    backdrop.classList.remove('opacity-100');
                    backdrop.classList.add('opacity-0');
                    panel.classList.remove('opacity-100', 'translate-y-0', 'sm:scale-100');
                    panel.classList.add('opacity-0', 'translate-y-4', 'sm:translate-y-0', 'sm:scale-95');

                    // Hide modal after animation completes
                    setTimeout(function() {
                        modal.classList.add('hidden');
                    }, 300);
                }

                // Close modal when clicking the backdrop
                document.getElementById('modernGroupModalBackdrop').addEventListener('click', closeModernGroupModal);

                // Close modal with Escape key
                document.addEventListener('keydown', function(e) {
                    if (e.key === 'Escape' && !document.getElementById('modernGroupModal').classList.contains('hidden')) {
                        closeModernGroupModal();
                    }
                });

                // Legacy Modal popup scripts using TINY.box
                function showPortfolioModal(snum) {
                    var url = "../student/myportfolio.aspx?Snum=" + snum;
                    TINY.box.show({ iframe: url, boxid: 'frameless', width: 800, height: 600, fixed: false, maskopacity: 60, close: true });
                }

                function showWorkModal(wid) {
                    var url = "../student/downwork.aspx?Wid=" + wid;
                    TINY.box.show({ iframe: url, boxid: 'frameless', width: 600, height: 400, fixed: false, maskopacity: 60, close: true });
                }

                // showGroupModal kept for backward compatibility
                function showGroupModal() {
                    openModernGroupModal();
                }

                var i = 2;
                function setbar() {
                    i--;
                    var btnid = "<%= BtnExit.ClientID %>";
                    var btnObj = document.getElementById(btnid);
                    if (!btnObj) return;
                    
                    if (btnObj.value !== "") {
                        btnObj.value = "系统退出";
                    }
                    if (i < 0) {
                        btnObj.disabled = false;
                        if (btnObj.value !== "") {
                            btnObj.value = "系统退出";
                        }
                        return;
                    } else {
                        btnObj.disabled = true;
                    }
                    setTimeout(setbar, 1000);
                }
                setTimeout(setbar, 500); 
            </script>
        </div>
    </div>
</asp:Content>

