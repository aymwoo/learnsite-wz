<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="works.aspx.cs" Inherits="Teacher_works" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../webform/bootstrap-icons.min.css" />
    <style type="text/css">
        .course-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #1e293b 0%, #3730a3 55%, #4f46e5 100%);
            --workspace-primary-bg: rgba(255, 255, 255, 0.94);
            --workspace-primary-fg: #312e81;
            --workspace-primary-hover: #ffffff;
            --workspace-primary-shadow: 0 12px 30px -20px rgba(15, 23, 42, 0.9);
        }

        .course-hero-action {
            min-width: 220px;
            display: flex;
            justify-content: flex-end;
            align-items: flex-start;
            gap: 0.8rem;
        }

        .course-toolbar-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1rem;
            align-items: end;
        }

        .course-table-header {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .course-table-chip {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            padding: 0.5rem 0.8rem;
            border-radius: 9999px;
            background: #eef2ff;
            color: #4338ca;
            font-size: 0.82rem;
            font-weight: 600;
        }

        .course-grid {
            min-width: 980px;
        }

        .course-grid td:first-child,
        .course-grid th:first-child {
            padding-left: 1.1rem;
        }

        .course-grid td:last-child,
        .course-grid th:last-child {
            padding-right: 1.1rem;
        }

        .course-grid a:hover {
            color: #312e81;
        }

        .course-grid td:nth-child(2) a {
            color: #0f172a;
            font-weight: 600;
        }

        .course-grid td:nth-child(3),
        .course-grid td:nth-child(6) {
            color: #475569;
            white-space: nowrap;
        }

        .course-icon-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            font-size: 1.1rem;
            transition: all 0.2s ease;
            text-decoration: none;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            color: #64748b;
        }

        .course-icon-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .course-icon-primary { color: #3b82f6; border-color: #bfdbfe; background: #eff6ff; }
        .course-icon-primary:hover { color: #1d4ed8; background: #dbeafe; }

        .course-icon-success { color: #10b981; border-color: #a7f3d0; background: #ecfdf5; }
        .course-icon-success:hover { color: #047857; background: #d1fae5; }

        .course-icon-warning { color: #f59e0b; border-color: #fde68a; background: #fffbeb; }
        .course-icon-warning:hover { color: #b45309; background: #fef3c7; }

        .course-icon-danger { color: #ef4444; border-color: #fecaca; background: #fef2f2; }
        .course-icon-danger:hover { color: #b91c1c; background: #fee2e2; }

        .course-icon-info { color: #8b5cf6; border-color: #ddd6fe; background: #f5f3ff; }
        .course-icon-info:hover { color: #6d28d9; background: #ede9fe; }

        .course-icon-secondary { color: #64748b; border-color: #e2e8f0; background: #f8fafc; }
        .course-icon-secondary:hover { color: #334155; background: #f1f5f9; }

        .course-grid .course-pager-row,
        .course-grid td.course-pager-row {
            background: #f8fafc;
        }

        .course-grid .course-pager-row td,
        .course-grid td.course-pager-row {
            background: #f8fafc;
            padding: 1rem 1.1rem;
        }

        .course-pager {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: flex-end;
            gap: 0.65rem;
            color: #475569;
            font-size: 0.88rem;
        }

        .course-pager a {
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

        .course-pager a:hover {
            background: #eef2ff;
            border-color: #c7d2fe;
            color: #3730a3;
        }

        .course-footer {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
            gap: 0.8rem;
        }

        .course-primary-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.75rem;
            border-radius: 9999px;
            font-weight: 700;
            font-size: 0.95rem;
            color: #ffffff;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 12px -3px rgba(16, 185, 129, 0.4);
            transition: all 0.25s ease;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .course-primary-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px -4px rgba(16, 185, 129, 0.6);
            background: linear-gradient(135deg, #34d399 0%, #10b981 100%);
        }

        .course-primary-btn:active {
            transform: translateY(0);
        }

        .course-secondary-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.65rem 1.4rem;
            border-radius: 0.5rem;
            font-weight: 600;
            font-size: 0.9rem;
            color: #475569;
            background: #ffffff;
            border: 1px solid #cbd5e1;
            cursor: pointer;
            box-shadow: 0 2px 4px -1px rgba(0, 0, 0, 0.05);
            transition: all 0.2s ease;
        }

        .course-secondary-btn:hover {
            color: #3b82f6;
            border-color: #93c5fd;
            background: #eff6ff;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(59, 130, 246, 0.1);
        }

        .course-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.25rem 0.6rem;
            border-radius: 9999px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .course-badge-success { background: #ecfdf5; color: #059669; border: 1px solid #a7f3d0; }
        .course-badge-warning { background: #fffbeb; color: #d97706; border: 1px solid #fde68a; }

        @media (max-width: 768px) {
            .course-hero-action {
                width: 100%;
                justify-content: flex-start;
            }

            .course-table-wrap {
                overflow-x: visible;
                border: 0;
                background: transparent;
            }

            .course-grid {
                min-width: 0;
                border-collapse: separate;
            }

            .course-grid th {
                display: none;
            }

            .course-grid tr {
                display: block;
            }

            .course-grid tr + tr {
                margin-top: 0.9rem;
            }

            .course-grid td {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 0.75rem;
                padding: 0.72rem 1rem;
                border-bottom: 1px solid #eef2f7;
                background: #ffffff;
                text-align: right;
            }

            .course-grid td:first-child {
                padding-left: 1rem;
            }

            .course-grid td:last-child {
                padding-right: 1rem;
            }

            .course-grid td:before {
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

            .course-grid td:nth-child(1):before { content: "序号"; }
            .course-grid td:nth-child(2):before { content: "学案"; }
            .course-grid td:nth-child(3):before { content: "类型"; }
            .course-grid td:nth-child(4):before { content: "未评数"; }
            .course-grid td:nth-child(5):before { content: "评价"; }
            .course-grid td:nth-child(6):before { content: "日期"; }

            .course-grid tr td:first-child {
                border-top-left-radius: 1rem;
                border-top-right-radius: 1rem;
                border-top: 1px solid #e2e8f0;
            }

            .course-grid tr td:last-child {
                border-bottom-left-radius: 1rem;
                border-bottom-right-radius: 1rem;
                border-bottom: 1px solid #e2e8f0;
                box-shadow: 0 12px 28px -24px rgba(15, 23, 42, 0.35);
            }

            .course-grid td:nth-child(2),
            .course-grid td:nth-child(6) {
                align-items: flex-start;
            }

            .course-grid td.course-pager-row {
                display: block;
                padding: 0.9rem 1rem;
                text-align: left;
                border: 1px solid #e2e8f0;
                border-radius: 1rem;
                box-shadow: none;
            }

            .course-grid td.course-pager-row:before {
                display: none;
            }

            .course-pager {
                justify-content: flex-start;
            }
        }
    </style>

    <div class="course-page">
        <div class="course-shell">
            <section class="course-hero">
                <div class="course-hero-content">
                    <div>
                        <span class="course-eyebrow">Teacher Workspace</span>
                        <h1 class="course-title">作品评价</h1>
                        <p class="course-subtitle">按年级筛选当前发布的学案，快速预览并评价各班级学生提交的作品情况。</p>
                    </div>
                    <div class="course-hero-action">
                        <span id="pg" onclick="package()" class="course-secondary-btn" style="color: #4f46e5; border-color: #c7d2fe; display: inline-flex; align-items: center; gap: 0.4rem;">
                            <i class="bi bi-box-seam"></i> 作品打包
                        </span>
                        <asp:Button ID="Btnterm" runat="server" Text="学期总评" onclick="Btnterm_Click"
                            ToolTip="跳转到学期总评页面" CssClass="course-primary-btn" />
                    </div>
                </div>
            </section>

            <section class="course-toolbar">
                <div class="course-toolbar-grid">
                    <div class="course-field">
                        <span class="course-field-label">作品选择</span>
                        <div style="display: flex; align-items: center; gap: 0.5rem;">
                            <asp:DropDownList ID="DDLgrade" runat="server" Width="80px"
                                EnableTheming="True" AutoPostBack="True"
                                onselectedindexchanged="DDLgrade_SelectedIndexChanged" CssClass="course-select">
                            </asp:DropDownList>
                            <span class="course-field-label" style="margin-bottom: 0;">年级</span>
                        </div>
                    </div>
                    <div class="course-field">
                        <span class="course-field-label">当前学期</span>
                        <asp:Label ID="Labelmsg" runat="server" CssClass="course-note"></asp:Label>
                    </div>
                </div>
            </section>

            <section class="course-table-panel">
                <div class="course-table-header">
                    <div>
                        <h2 class="course-table-title">学案列表</h2>
                        <p class="course-table-desc">查看各个学案下各班级提交的作品，点击未评数或查看图标进入详细评价页面。</p>
                    </div>
                    <span class="course-table-chip">最多每页 20 条</span>
                </div>

                <div class="course-table-wrap custom-scrollbar">
                    <asp:GridView ID="GVCourse" runat="server" AllowPaging="True"
                        AutoGenerateColumns="False" DataKeyNames="Cid"
                        PageSize="20" Width="100%" CssClass="course-grid"
                        onpageindexchanging="GVCourse_PageIndexChanging"
                        onrowdatabound="GVCourse_RowDataBound" CellPadding="0"
                        EnableModelValidation="True" ForeColor="#111111" GridLines="None">
                        <AlternatingRowStyle BackColor="#FBFDFF" />
                        <Columns>
                            <asp:BoundField DataField="Cid" HeaderText="序号" InsertVisible="False"
                                ReadOnly="True" SortExpression="Cid" >
                                <ControlStyle Width="50px" />
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataTextField="Ctitle" HeaderText="学案" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="Cclass" HeaderText="类型" SortExpression="Cclass" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="未评数">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HlNoCheck" runat="server" CssClass="course-badge course-badge-warning"></asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:HyperLinkField DataNavigateUrlFields="Cid,Cobj"
                                DataNavigateUrlFormatString="workcheck.aspx?cid={0}&amp;grade={1}"
                                Text="&lt;i class=&quot;bi bi-eye&quot;&gt;&lt;/i&gt;" HeaderText="评价" Target="_blank">
                                <ItemStyle HorizontalAlign="Center" CssClass="course-icon-btn course-icon-info" style="display:inline-flex; margin-top: 0.5rem; margin-bottom: 0.5rem;" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="Cdate" HeaderText="日期" SortExpression="Cdate" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="160px" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#F8FAFC" Font-Bold="True" ForeColor="#0F172A" />
                        <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" ForeColor="#475569" />
                        <PagerStyle CssClass="course-pager-row" BackColor="#F8FAFC" ForeColor="#111111" HorizontalAlign="Center" />
                        <pagertemplate>
                            <div class="course-pager">
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
                        <SelectedRowStyle BackColor="#E0E7FF" Font-Bold="True" ForeColor="#312E81" />
                    </asp:GridView>
                </div>
            </section>
        </div>

        <script type="text/javascript">
            function package() {
                var urlpg = "../teacher/workpackage.aspx";
                openLessonModal(urlpg, "作品打包", 300);
            }
        </script>
    </div>
</asp:Content>
