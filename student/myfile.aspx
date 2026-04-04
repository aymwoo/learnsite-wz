<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.master" StylesheetTheme="Student" AutoEventWireup="true" CodeFile="myfile.aspx.cs" Inherits="Student_myfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cphs" Runat="Server">
<style>
    /* File type badge colors */
    .ft-badge {
        display: inline-block; padding: 2px 8px; border-radius: 6px;
        font-size: 11px; font-weight: 700; letter-spacing: 0.04em;
        text-transform: uppercase; font-family: monospace;
    }
    .ft-zip  { background:#fef3c7; color:#92400e; }
    .ft-exe  { background:#fee2e2; color:#991b1b; }
    .ft-pdf  { background:#fde8d8; color:#c2410c; }
    .ft-doc,.ft-docx { background:#dbeafe; color:#1e40af; }
    .ft-xls,.ft-xlsx { background:#dcfce7; color:#166534; }
    .ft-ppt,.ft-pptx { background:#fce7f3; color:#9d174d; }
    .ft-mp4,.ft-avi,.ft-mov { background:#ede9fe; color:#5b21b6; }
    .ft-mp3,.ft-wav { background:#d1fae5; color:#065f46; }
    .ft-png,.ft-jpg,.ft-gif { background:#e0f2fe; color:#0c4a6e; }
    .ft-default { background:#f1f5f9; color:#475569; }

    /* Category sidebar button */
    .cat-btn {
        display: flex; align-items: center; gap: 8px; width: 100%;
        padding: 8px 12px; border-radius: 10px; text-align: left;
        font-size: 14px; font-weight: 500; color: #3730a3;
        background: transparent; transition: all 0.18s ease;
        text-decoration: none !important;
        border-bottom: 1px solid rgba(99,102,241,0.08);
    }
    .cat-btn:hover, .cat-btn:visited { color: #3730a3 !important; }
    .cat-btn:hover { background: rgba(99,102,241,0.08); color: #312e81 !important; }
    .cat-btn-icon { color: #6366f1; flex-shrink: 0; }

    /* GridView row hover override from code-behind inline styles */
    #GVSoftWrapper table tr:hover td { background-color: #f0f4ff !important; }

    /* Download count badge */
    .dl-count {
        display: inline-flex; align-items: center; gap: 3px;
        background: #ecfdf5; color: #065f46;
        padding: 2px 8px; border-radius: 20px; font-size: 12px; font-weight: 600;
    }
</style>

<div class="space-y-6 w-full">
    <!-- Page Header -->
    <div class="flex items-center gap-3">
        <div class="w-10 h-10 rounded-xl bg-indigo-100 flex items-center justify-center flex-shrink-0">
            <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
            </svg>
        </div>
        <div>
            <h2 class="text-xl font-bold text-slate-800 leading-tight">在线资源</h2>
            <p class="text-sm text-slate-500 mt-0.5">浏览并下载老师分享的学习资源</p>
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
        <!-- Main Content -->
        <div class="lg:col-span-3 space-y-4 overflow-hidden min-w-0">

            <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
                <!-- Table header bar -->
                <div class="flex items-center justify-between px-5 py-4 border-b border-slate-100 bg-gradient-to-r from-indigo-50/60 to-transparent">
                    <div class="flex items-center gap-2">
                        <svg class="w-4 h-4 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        <span class="font-semibold text-slate-700 text-sm">资源列表</span>
                    </div>
                    <span class="text-xs text-slate-400 bg-slate-100 px-2 py-1 rounded-full">点击标题下载</span>
                </div>

                <div id="GVSoftWrapper" class="overflow-x-auto w-full">
                    <asp:GridView ID="GVSoft" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" 
                        OnPageIndexChanging="GVSoft_PageIndexChanging" 
                        OnRowDataBound="GVSoft_RowDataBound" Width="100%" SkinID="GridViewInfo" 
                        PageSize="20" EnableModelValidation="True" CellPadding="0"
                        CssClass="w-full text-slate-600 bg-white min-w-[560px]">
                        <AlternatingRowStyle CssClass="bg-slate-50/50" />
                        <Columns>
                            <asp:BoundField HeaderText="#">
                                <HeaderStyle CssClass="bg-slate-50 text-slate-500 font-semibold text-xs uppercase tracking-wide px-4 py-3 w-12 text-center" />
                                <ItemStyle CssClass="text-center font-medium text-slate-400 text-sm px-4 py-3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fclass" HeaderText="分类">
                                <HeaderStyle CssClass="bg-slate-50 text-slate-500 font-semibold text-xs uppercase tracking-wide px-3 py-3 w-20" />
                                <ItemStyle CssClass="text-center px-3 py-3" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="fid" 
                                DataNavigateUrlFormatString="downfile.aspx?fid={0}" HeaderText="资源标题" 
                                DataTextField="Ftitle">
                                <HeaderStyle HorizontalAlign="Left" CssClass="bg-slate-50 text-slate-500 font-semibold text-xs uppercase tracking-wide px-4 py-3" />
                                <ItemStyle HorizontalAlign="Left" CssClass="px-4 py-3 font-medium text-indigo-600 hover:text-indigo-800 transition-colors" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="Ffiletype" HeaderText="格式">
                                <HeaderStyle CssClass="bg-slate-50 text-slate-500 font-semibold text-xs uppercase tracking-wide px-3 py-3 w-20 text-center" />
                                <ItemStyle CssClass="text-center px-3 py-3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fhit" HeaderText="下载">
                                <HeaderStyle CssClass="bg-slate-50 text-slate-500 font-semibold text-xs uppercase tracking-wide px-3 py-3 w-20 text-center" />
                                <ItemStyle CssClass="text-center px-3 py-3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fdate" HeaderText="更新日期">
                                <HeaderStyle CssClass="bg-slate-50 text-slate-500 font-semibold text-xs uppercase tracking-wide px-4 py-3 hidden md:table-cell w-28 text-center" />
                                <ItemStyle Width="120px" CssClass="text-center text-xs text-slate-400 hidden md:table-cell px-4 py-3" />
                            </asp:BoundField>
                        </Columns>
                        <pagertemplate>
                            <div class="flex items-center justify-between px-5 py-3 bg-slate-50 border-t border-slate-100">
                                <div class="text-xs text-slate-500">
                                    第 <asp:Label ID="lblPageIndex" runat="server" CssClass="font-semibold text-slate-700"
                                        text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>" /> 页 / 共
                                    <asp:Label ID="lblPageCount" runat="server" CssClass="font-semibold text-slate-700"
                                        text="<%# ((GridView)Container.Parent.Parent).PageCount %>" /> 页
                                </div>
                                <div class="flex gap-1.5">
                                    <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" commandargument="First" commandname="Page"
                                        CssClass="px-3 py-1.5 text-xs font-medium border border-slate-200 rounded-lg hover:bg-indigo-50 hover:border-indigo-300 hover:text-indigo-600 transition text-slate-600" text="首页" />
                                    <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" commandargument="Prev" commandname="Page"
                                        CssClass="px-3 py-1.5 text-xs font-medium border border-slate-200 rounded-lg hover:bg-indigo-50 hover:border-indigo-300 hover:text-indigo-600 transition text-slate-600" text="上一页" />
                                    <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" commandargument="Next" commandname="Page"
                                        CssClass="px-3 py-1.5 text-xs font-medium border border-slate-200 rounded-lg hover:bg-indigo-50 hover:border-indigo-300 hover:text-indigo-600 transition text-slate-600" text="下一页" />
                                    <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" commandargument="Last" commandname="Page"
                                        CssClass="px-3 py-1.5 text-xs font-medium border border-slate-200 rounded-lg hover:bg-indigo-50 hover:border-indigo-300 hover:text-indigo-600 transition text-slate-600" text="尾页" />
                                </div>
                            </div>
                        </pagertemplate>
                        <RowStyle CssClass="border-b border-slate-100 hover:bg-indigo-50/30 transition-colors" />
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="lg:col-span-1 space-y-5 self-start top-24 sticky">
            <!-- Category Card -->
            <div class="bg-white border border-slate-200/80 rounded-2xl shadow-sm overflow-hidden">
                <div class="px-4 py-4 bg-gradient-to-r from-indigo-50 to-purple-50/40 border-b border-indigo-100/60 flex items-center gap-2">
                    <svg class="w-4 h-4 text-indigo-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"/>
                    </svg>
                    <span class="font-bold text-indigo-800 text-sm">资源分类</span>
                </div>
                <div class="p-3">
                    <!-- All resources link -->
                    <a href="myfile.aspx" class="cat-btn mb-1">
                        <svg class="cat-btn-icon w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"/>
                        </svg>
                        全部资源
                    </a>
                    <asp:GridView ID="GVcategory" runat="server" AutoGenerateColumns="False" 
                        EnableModelValidation="True" 
                        ShowHeader="False" 
                        SkinID="GridViewMission" Width="100%" DataKeyNames="yid" 
                        onrowdatabound="GVcategory_RowDataBound"
                        CssClass="w-full" GridLines="None">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="yid" 
                                DataNavigateUrlFormatString="~/student/myfile.aspx?yid={0}" 
                                DataTextField="Ytitle" Target="_self">
                                <ItemStyle HorizontalAlign="Left" CssClass="py-0.5" />
                            </asp:HyperLinkField>
                        </Columns>
                        <RowStyle CssClass="" />
                    </asp:GridView>
                </div>
            </div>

            <!-- Tips card -->
            <div class="bg-amber-50 border border-amber-200/60 rounded-2xl p-4 shadow-sm">
                <div class="flex items-start gap-3">
                    <div class="w-8 h-8 rounded-lg bg-amber-100 flex items-center justify-center flex-shrink-0 mt-0.5">
                        <svg class="w-4 h-4 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                    </div>
                    <div>
                        <p class="text-xs font-semibold text-amber-800 mb-1">使用提示</p>
                        <p class="text-xs text-amber-700 leading-relaxed">点击资源标题即可下载文件。如遇无法下载，请联系老师。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
// Render file type badges with color coding
(function() {
    var colorMap = {
        'zip':'ft-zip','rar':'ft-zip','7z':'ft-zip',
        'exe':'ft-exe','msi':'ft-exe',
        'pdf':'ft-pdf',
        'doc':'ft-doc','docx':'ft-docx',
        'xls':'ft-xls','xlsx':'ft-xlsx',
        'ppt':'ft-ppt','pptx':'ft-pptx',
        'mp4':'ft-mp4','avi':'ft-avi','mov':'ft-mov',
        'mp3':'ft-mp3','wav':'ft-wav',
        'png':'ft-png','jpg':'ft-png','gif':'ft-gif','jpeg':'ft-png'
    };
    // Target the 4th column (index 3) cells in GVSoft
    var table = document.getElementById('<%= GVSoft.ClientID %>');
    if (!table) return;
    var rows = table.rows;
    for (var i = 1; i < rows.length; i++) {
        var cells = rows[i].cells;
        if (cells.length < 4) continue;
        // File type cell (col index 3)
        var ftCell = cells[3];
        var ext = (ftCell.innerText || ftCell.textContent || '').trim().toLowerCase().replace('.','');
        var cls = colorMap[ext] || 'ft-default';
        if (ext) {
            ftCell.innerHTML = '<span class="ft-badge ' + cls + '">' + ext + '</span>';
        }
        // Download count cell (col index 4)
        var dlCell = cells[4];
        var count = (dlCell.innerText || dlCell.textContent || '').trim();
        if (count !== '') {
            dlCell.innerHTML = '<span class="dl-count"><svg style="width:11px;height:11px" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/></svg>' + count + '</span>';
        }
    }
    // Style category hyperlinks as cat-btn
    var catTable = document.getElementById('<%= GVcategory.ClientID %>');
    if (catTable) {
        var catRows = catTable.rows;
        for (var j = 0; j < catRows.length; j++) {
            var links = catRows[j].getElementsByTagName('a');
            for (var k = 0; k < links.length; k++) {
                links[k].className = 'cat-btn';
                links[k].innerHTML = '<svg class="cat-btn-icon" style="width:14px;height:14px;flex-shrink:0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"/></svg>' + links[k].textContent;
            }
        }
    }
})();
</script>
</asp:Content>
