<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="courseold.aspx.cs" Inherits="Teacher_courseold" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .course-old-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #ecfeff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #164e63 0%, #0f766e 55%, #0ea5e9 100%);
            --workspace-hero-shadow: 0 22px 45px -28px rgba(14, 116, 144, 0.7);
            --workspace-primary-bg: rgba(255, 255, 255, 0.94);
            --workspace-primary-fg: #155e75;
            --workspace-primary-hover: #ffffff;
            --workspace-primary-shadow: 0 12px 30px -20px rgba(15, 23, 42, 0.9);
            --workspace-focus: #0891b2;
            --workspace-focus-ring: rgba(8, 145, 178, 0.14);
        }

        .course-old-hero-action {
            min-width: 220px;
            display: flex;
            justify-content: flex-end;
            align-items: flex-start;
        }

        .course-old-toolbar-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1rem;
            align-items: end;
        }

        .course-old-table-header {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .course-old-table-chip {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            padding: 0.5rem 0.8rem;
            border-radius: 9999px;
            background: #ecfeff;
            color: #0f766e;
            font-size: 0.82rem;
            font-weight: 600;
        }

        .course-old-grid {
            min-width: 920px;
        }

        .course-old-grid a:hover {
            color: #155e75;
        }

        .course-old-grid td:nth-child(4) a {
            color: #0f172a;
            font-weight: 600;
        }

        .course-old-grid td:nth-child(6) a,
        .course-old-grid td:nth-child(8) a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 3.8rem;
            padding: 0.42rem 0.82rem;
            border-radius: 0.375rem;
            background: #f8fafc;
            border: 1px solid #bae6fd;
            color: #0f766e;
            font-size: 0.84rem;
            font-weight: 700;
        }

        .course-old-grid td:nth-child(6) a:hover,
        .course-old-grid td:nth-child(8) a:hover {
            background: #cffafe;
            color: #155e75;
        }

        .course-old-grid td:nth-child(1),
        .course-old-grid td:nth-child(2),
        .course-old-grid td:nth-child(3),
        .course-old-grid td:nth-child(5),
        .course-old-grid td:nth-child(7) {
            color: #475569;
            white-space: nowrap;
        }

        .course-old-grid .course-old-pager-row,
        .course-old-grid td.course-old-pager-row {
            background: #f8fafc;
        }

        .course-old-grid .course-old-pager-row td,
        .course-old-grid td.course-old-pager-row {
            background: #f8fafc;
            padding: 1rem 1.1rem;
        }

        .course-old-pager {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: flex-end;
            gap: 0.65rem;
            color: #475569;
            font-size: 0.88rem;
        }

        .course-old-pager a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.38rem 0.72rem;
            border-radius: 9999px;
            border: 1px solid #cbd5e1;
            background: #ffffff;
            color: #334155;
            font-weight: 600;
        }

        .course-old-pager a:hover {
            background: #ecfeff;
            border-color: #a5f3fc;
            color: #155e75;
        }

        .course-old-warning {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.72rem 1.05rem;
            border-radius: 9999px;
            background: #fff7ed;
            border: 1px solid #fdba74;
            color: #9a3412;
            font-size: 0.92rem;
            font-weight: 700;
        }

        .course-old-note-box { text-align: center; }

        .course-old-secondary-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.7rem 1.5rem;
            border-radius: 0.375rem;
            font-weight: 700;
            font-size: 0.9rem;
            color: #475569;
            background: #ffffff;
            border: 1px solid #cbd5e1;
            cursor: pointer;
            box-shadow: 0 4px 12px -3px rgba(0, 0, 0, 0.05);
            transition: all 0.25s ease;
            text-decoration: none;
        }

        .course-old-secondary-btn:hover {
            color: #0891b2;
            border-color: #0891b2;
            background: #ecfeff;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px -4px rgba(8, 145, 178, 0.2);
        }

        .course-old-secondary-btn:active {
            transform: translateY(0);
        }

        @media (max-width: 768px) {
            .course-old-hero-action {
                width: 100%;
                justify-content: flex-start;
            }

            .course-old-table-wrap {
                overflow-x: visible;
                border: 0;
                background: transparent;
            }

            .course-old-grid th {
                display: none;
            }

            .course-old-grid tr {
                display: block;
            }

            .course-old-grid tr + tr {
                margin-top: 0.9rem;
            }

            .course-old-grid td {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 0.75rem;
                padding: 0.72rem 1rem;
                border-bottom: 1px solid #eef2f7;
                background: #ffffff;
                text-align: right;
            }

            .course-old-grid td:first-child {
                padding-left: 1rem;
            }

            .course-old-grid td:last-child {
                padding-right: 1rem;
            }

            .course-old-grid td:before {
                content: "";
                flex: 0 0 auto;
                margin-right: auto;
                color: #64748b;
                font-size: 0.78rem;
                font-weight: 700;
                letter-spacing: 0.02em;
                text-transform: uppercase;
                text-align: left;
            }

            .course-old-grid td:nth-child(1):before { content: "年级"; }
            .course-old-grid td:nth-child(2):before { content: "学期"; }
            .course-old-grid td:nth-child(3):before { content: "课节"; }
            .course-old-grid td:nth-child(4):before { content: "仓库学案"; }
            .course-old-grid td:nth-child(5):before { content: "类型"; }
            .course-old-grid td:nth-child(6):before { content: "操作"; }
            .course-old-grid td:nth-child(7):before { content: "日期"; }
            .course-old-grid td:nth-child(8):before { content: "删除"; }

            .course-old-grid tr td:first-child {
                border-top-left-radius: 1rem;
                border-top-right-radius: 1rem;
                border-top: 1px solid #e2e8f0;
            }

            .course-old-grid tr td:last-child {
                border-bottom-left-radius: 1rem;
                border-bottom-right-radius: 1rem;
                border-bottom: 1px solid #e2e8f0;
                box-shadow: 0 12px 28px -24px rgba(15, 23, 42, 0.35);
            }

            .course-old-grid td:nth-child(4),
            .course-old-grid td:nth-child(7) {
                align-items: flex-start;
            }

            .course-old-grid td:nth-child(4) a {
                text-align: left;
                max-width: 70%;
            }

            .course-old-grid td.course-old-pager-row {
                display: block;
                padding: 0.9rem 1rem;
                text-align: left;
                border: 1px solid #e2e8f0;
                border-radius: 1rem;
                box-shadow: none;
            }

            .course-old-grid td.course-old-pager-row:before {
                display: none;
            }

            .course-old-pager {
                justify-content: flex-start;
            }
        }
    </style>

    <div class="course-old-page">
        <div class="course-old-shell">
            <section class="course-old-hero">
                <div class="course-old-hero-content">
                    <div>
                        <span class="course-old-eyebrow">Archive Workspace</span>
                        <h1 class="course-old-title">学案仓库</h1>
                        <p class="course-old-subtitle">集中查看已转入仓库的学案，保留原有启用、删除与筛选流程，仅优化布局层次、视觉表现与移动端浏览体验。</p>
                    </div>
                    <div class="course-old-hero-action">
                        <asp:Button ID="Btnreturn" runat="server" Text="返回学案列表" onclick="Btnreturn_Click" CssClass="course-old-secondary-btn" />
                    </div>
                </div>
            </section>

            <section class="course-old-toolbar">
                <div class="course-old-toolbar-grid">
                    <div class="course-old-field">
                        <span class="course-old-field-label">选择年级</span>
                        <asp:DropDownList ID="DDLgrade" runat="server" Width="60px" EnableTheming="True" AutoPostBack="True" onselectedindexchanged="DDLgrade_SelectedIndexChanged" CssClass="course-old-select"></asp:DropDownList>
                    </div>
                    <div class="course-old-field">
                        <span class="course-old-field-label">选择学期</span>
                        <asp:DropDownList ID="DDLterm" runat="server" EnableTheming="True" AutoPostBack="True" onselectedindexchanged="DDLterm_SelectedIndexChanged" ToolTip="选择要显示学案的学期，不改变后台默认学期设置" CssClass="course-old-select">
                            <asp:ListItem Value="1">第一学期</asp:ListItem>
                            <asp:ListItem Value="2">第二学期</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="course-old-field">
                        <span class="course-old-field-label">当前设置</span>
                        <asp:Label ID="Labelmsg" runat="server" Font-Bold="False" CssClass="course-old-note"></asp:Label>
                    </div>
                    <div class="course-old-field">
                        <span class="course-old-field-label">提示区域</span>
                        <asp:Label ID="Labelspace" runat="server" CssClass="course-old-spacer"></asp:Label>
                    </div>
                </div>
            </section>

            <section class="course-old-table-panel">
                <div class="course-old-table-header">
                    <div>
                        <h2 class="course-old-table-title">仓库学案列表</h2>
                        <p class="course-old-table-desc">支持浏览、重新启用和删除。所有原有数据绑定、命令按钮和页面事件保持不变。</p>
                    </div>
                    <span class="course-old-table-chip">仓库内容仅支持浏览</span>
                </div>
                <div class="course-old-table-wrap custom-scrollbar">
                    <asp:GridView ID="GVCourse" runat="server" AllowPaging="True"
                        AutoGenerateColumns="False" DataKeyNames="Cid"
                        PageSize="20" Width="100%" CssClass="course-old-grid"
                        onpageindexchanging="GVCourse_PageIndexChanging"
                        onrowdatabound="GVCourse_RowDataBound" CellPadding="6"
                        EnableModelValidation="True"
                        onrowcommand="GVCourse_RowCommand" ForeColor="#111111" GridLines="None">
                        <AlternatingRowStyle BackColor="#FBFDFF" />
                        <Columns>
                            <asp:BoundField DataField="Cobj" HeaderText="年级">
                                <ControlStyle Width="20px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cterm" HeaderText="学期" />
                            <asp:BoundField DataField="Cks" HeaderText="课节">
                                <ControlStyle Width="20px" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="Cid"
                                DataNavigateUrlFormatString="~/teacher/courseshow.aspx?cid={0}&amp;cold=T"
                                DataTextField="Ctitle" HeaderText="仓库学案">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="Cclass" HeaderText="类型" SortExpression="Cclass" />
                            <asp:TemplateField HeaderText="操作" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"
                                        CommandArgument='<%# Bind("Cid") %>' CommandName="U" ToolTip="将此学案重新启用，在学案列表中显示出来" Text="启用"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="日期" SortExpression="Cdate">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"
                                        Text='<%# DataBinder.Eval(Container.DataItem,"Cdate","{0:d}")%>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="70px" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:HyperLinkField DataNavigateUrlFields="Cid,Cobj"
                                DataNavigateUrlFormatString="~/teacher/coursedel.aspx?cid={0}&grade={1}" Text="删除">
                                <ItemStyle Width="60px" />
                            </asp:HyperLinkField>
                        </Columns>
                        <FooterStyle BackColor="#F8FAFC" Font-Bold="True" ForeColor="#0F172A" />
                        <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" ForeColor="#475569" />
                        <PagerStyle CssClass="course-old-pager-row" BackColor="#F8FAFC" ForeColor="#111111" HorizontalAlign="Center" />
                        <pagertemplate>
                            <div class="course-old-pager">
                                <span>第<asp:Label ID="lblPageIndex" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" />页</span>
                                <span>共<asp:Label ID="lblPageCount" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" />页</span>
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
                        <RowStyle BackColor="#FFFFFF" />
                        <SelectedRowStyle BackColor="#CFFAFE" Font-Bold="True" ForeColor="#155E75" />
                    </asp:GridView>
                </div>
            </section>

            <section class="course-old-note-box">
                <span class="course-old-warning">仓库中的学案只能浏览，不能编辑</span>
            </section>
        </div>
    </div>
</asp:Content>
