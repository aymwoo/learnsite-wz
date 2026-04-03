<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="soft.aspx.cs" Inherits="Teacher_soft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .soft-manage {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            --ls-primary-soft: #dbeafe;
            --ls-success: #16a34a;
            --ls-success-soft: #dcfce7;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
            min-height: calc(100vh - 8rem);
        }

        .soft-manage * {
            box-sizing: border-box;
        }

        .lesson-card {
            border: 1px solid var(--ls-border);
            border-radius: 1rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
            margin-bottom: 24px;
            overflow: hidden;
        }

        .soft-header {
            padding: 24px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .soft-filter {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .soft-label {
            font-size: 15px;
            font-weight: 700;
            color: #334155;
        }

        .soft-select {
            min-width: 160px;
            height: 44px;
            padding: 0 14px;
            border: 1px solid #cbd5e1;
            border-radius: 0.85rem;
            background: #ffffff;
            color: #0f172a;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.2s ease;
            cursor: pointer;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
        }

        .soft-select:focus {
            border-color: var(--ls-primary);
            outline: none;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        .soft-actions {
            display: flex;
            gap: 10px;
        }

        .soft-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            height: 44px;
            padding: 0 20px;
            border-radius: 0.85rem;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.2s;
            border: none;
            cursor: pointer;
        }

        .soft-btn--success {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: #ffffff;
            box-shadow: 0 8px 20px rgba(16, 185, 129, 0.2);
        }

        .soft-btn--success:hover {
            transform: translateY(-1px);
            box-shadow: 0 10px 25px rgba(16, 185, 129, 0.3);
        }

        .soft-btn--primary {
            background: #f0fdfa;
            color: #059669;
            border: 1px solid #bbf7d0;
        }

        .soft-btn--primary:hover {
            background: #dcfce7;
            transform: translateY(-1px);
        }

        .soft-grid-container {
            padding: 0;
            background: #ffffff;
        }
        
        @media (max-width: 768px) {
            .soft-manage { padding: 16px; }
            .soft-header { padding: 16px; flex-direction: column; align-items: stretch; }
            .soft-select { width: 100%; }
            .soft-actions { flex-direction: column; }
        }
    </style>

    <div class="soft-manage">
        <div class="lesson-card">
            <div class="soft-header">
                <div class="soft-filter">
                    <span class="soft-label">资源分类</span>
                    <asp:DropDownList ID="ddlcategory" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlcategory_SelectedIndexChanged" CssClass="soft-select">
                    </asp:DropDownList>
                    <asp:Label ID="Label1" runat="server" CssClass="hidden md:inline-block ml-2 text-slate-400 text-sm"></asp:Label>
                </div>
                
                <div class="soft-actions">
                    <asp:HyperLink ID="Hlkadd" runat="server" CssClass="soft-btn soft-btn--success" 
                        NavigateUrl="~/teacher/softadd.aspx" Target="_self">
                        <i class="bi bi-plus-lg mr-1.5"></i> 资源添加
                    </asp:HyperLink>
                    
                    <asp:HyperLink ID="Hlkcategory" runat="server" CssClass="soft-btn soft-btn--primary" 
                        NavigateUrl="~/teacher/softcategory.aspx" Target="_self">
                        <i class="bi bi-gear mr-1.5"></i> 分类设置
                    </asp:HyperLink>
                    
                    <asp:HyperLink ID="Hlkcgscore" runat="server" CssClass="soft-btn soft-btn--primary" 
                        NavigateUrl="~/teacher/softnomic.aspx" Target="_blank">
                        <i class="bi bi-patch-check mr-1.5"></i> 自学评价
                    </asp:HyperLink>
                </div>
            </div>

            <div class="soft-grid-container">
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

