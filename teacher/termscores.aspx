<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="termscores.aspx.cs" Inherits="Teacher_termscores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .term-page {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            --ls-primary-soft: #dbeafe;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
        }

        .term-page * {
            box-sizing: border-box;
        }

        .term-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Hero banner */
        .term-hero {
            position: relative;
            overflow: hidden;
            border: 1px solid var(--ls-border);
            border-radius: 0.75rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(59, 130, 246, 0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #1d4ed8 52%, #38bdf8 100%);
            color: #eff6ff;
            box-shadow: 0 28px 60px rgba(37, 99, 235, 0.2);
        }

        .term-hero__content {
            position: relative;
            z-index: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 16px;
            align-items: center;
        }

        .term-hero__title {
            margin: 0;
            font-size: 28px;
            line-height: 1.15;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .term-hero__subtitle {
            max-width: 760px;
            margin: 8px 0 0;
            font-size: 14px;
            line-height: 1.8;
            color: rgba(239, 246, 255, 0.88);
        }

        .term-hero__badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 16px;
            border-radius: 0.375rem;
            background: rgba(255, 255, 255, 0.14);
            border: 1px solid rgba(255, 255, 255, 0.16);
            backdrop-filter: blur(14px);
            font-size: 15px;
            font-weight: 700;
            color: #eff6ff;
        }

        /* Grid layout */
        .term-grid {
            display: grid;
            gap: 20px;
            grid-template-columns: repeat(12, minmax(0, 1fr));
        }

        /* Card */
        .term-card {
            min-width: 0;
            border: 1px solid var(--ls-border);
            border-radius: 0.75rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
        }

        .term-card--span-12 { grid-column: span 12; }
        .term-card--span-8 { grid-column: span 8; }
        .term-card--span-4 { grid-column: span 4; }

        .term-theme--blue { background: linear-gradient(160deg, #ffffff 0%, #f0f7ff 100%); }
        .term-theme--indigo { background: linear-gradient(160deg, #ffffff 0%, #eef2ff 100%); }
        .term-theme--slate { background: linear-gradient(160deg, #ffffff 0%, #f8fafc 100%); }

        .term-card__head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 12px;
            align-items: flex-start;
            padding: 20px 24px 0;
        }

        .term-card__title {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.02em;
            color: var(--ls-text);
        }

        .term-card__body {
            padding: 18px 24px 22px;
        }

        /* Form layout */
        .term-form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 14px;
            align-items: flex-end;
        }

        .term-field {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .term-label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .term-select {
            min-height: 38px;
            padding: 0 12px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 14px;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .term-select:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        .term-select--sm {
            width: 72px;
        }

        /* Buttons */
        .term-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }

        .term-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 38px;
            padding: 0 16px;
            border-radius: 0.375rem;
            border: none;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.18s ease, box-shadow 0.18s ease, background-color 0.18s ease;
        }

        .term-btn:hover {
            transform: translateY(-1px);
        }

        .term-btn--primary {
            color: #ffffff;
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.2);
        }

        .term-btn--success {
            color: #ffffff;
            background: linear-gradient(135deg, #16a34a 0%, #15803d 100%);
            box-shadow: 0 6px 16px rgba(22, 163, 74, 0.2);
        }

        .term-btn--warning {
            color: #ffffff;
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            box-shadow: 0 6px 16px rgba(245, 158, 11, 0.2);
        }

        .term-btn--secondary {
            color: #1d4ed8;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            box-shadow: none;
        }

        .term-btn--ghost {
            color: #475569;
            background: #f1f5f9;
            border: 1px solid #e2e8f0;
            box-shadow: none;
        }

        .term-btn[disabled] {
            opacity: 0.58;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        /* Weight config */
        .term-weight-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: flex-end;
        }

        .term-weight-item {
            display: flex;
            flex-direction: column;
            gap: 4px;
            align-items: center;
        }

        .term-weight-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--ls-muted);
        }

        .term-weight-sep {
            display: flex;
            align-items: center;
            min-height: 38px;
            font-size: 13px;
            font-weight: 700;
            color: #94a3b8;
        }

        /* Alert / Message */
        .term-msg {
            margin-top: 10px;
            padding: 10px 14px;
            border-radius: 0.375rem;
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #991b1b;
            font-size: 13px;
            line-height: 1.6;
        }

        .term-msg:empty {
            display: none;
        }

        .term-note {
            display: block;
            padding: 10px 14px;
            border-radius: 0.375rem;
            background: #f1f5f9;
            color: #334155;
            font-size: 12px;
            line-height: 1.7;
        }

        /* GridView table styling */
        .term-table-wrap {
            overflow-x: auto;
            border: 1px solid var(--ls-border);
            border-radius: 0.5rem;
        }

        .term-table-wrap table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .term-table-wrap th {
            padding: 10px 12px;
            background: linear-gradient(180deg, #f1f5f9 0%, #e8edf4 100%);
            color: #334155;
            font-weight: 700;
            font-size: 12px;
            text-align: center;
            border-bottom: 2px solid #dbe6f5;
            white-space: nowrap;
            position: sticky;
            top: 0;
            z-index: 1;
        }

        .term-table-wrap td {
            padding: 8px 12px;
            text-align: center;
            border-bottom: 1px solid #f1f5f9;
            color: #0f172a;
            white-space: nowrap;
        }

        .term-table-wrap tr:hover td {
            background: #f0f7ff;
        }

        .term-table-wrap tr:nth-child(even) td {
            background: #fafbfd;
        }

        .term-table-wrap tr:nth-child(even):hover td {
            background: #f0f7ff;
        }

        .term-table-wrap td a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
        }

        .term-table-wrap td a:hover {
            color: #1d4ed8;
            text-decoration: underline;
        }

        @media (max-width: 1200px) {
            .term-card--span-8,
            .term-card--span-4 {
                grid-column: span 12;
            }
        }

        @media (max-width: 768px) {
            .term-page {
                padding: 16px;
            }

            .term-hero {
                padding: 18px;
            }

            .term-hero__title {
                font-size: 22px;
            }

            .term-card__head,
            .term-card__body {
                padding-left: 16px;
                padding-right: 16px;
            }

            .term-form-row,
            .term-weight-grid {
                flex-direction: column;
                align-items: stretch;
            }

            .term-select--sm {
                width: 100%;
            }
        }
    </style>

    <div class="placehold term-page">
        <div class="term-shell">
            <div class="term-hero">
                <div class="term-hero__content">
                    <div>
                        <h1 class="term-hero__title">学期总评</h1>
                        <p class="term-hero__subtitle">统计折算各项成绩并生成期末总评，支持导出 Excel。</p>
                    </div>
                    <div class="term-hero__badge">
                        第 <asp:Label ID="Lbterm" runat="server"></asp:Label> 学期
                    </div>
                </div>
            </div>

            <div class="term-grid">
                <section class="term-card term-card--span-8 term-theme--blue">
                    <div class="term-card__head">
                        <h2 class="term-card__title">班级与操作</h2>
                    </div>
                    <div class="term-card__body">
                        <div class="term-form-row">
                            <div class="term-field">
                                <span class="term-label">年级</span>
                                <asp:DropDownList ID="DDLgrade" runat="server" CssClass="term-select term-select--sm"
                                    AutoPostBack="True" onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="term-field">
                                <span class="term-label">班级</span>
                                <asp:DropDownList ID="DDLclass" runat="server" CssClass="term-select term-select--sm"
                                    AutoPostBack="True" onselectedindexchanged="DDLclass_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="term-actions" style="margin-top: 16px;">
                            <asp:Button ID="BtnScoresNo" runat="server" OnClick="BtnScoresNo_Click"
                                Text="未评设置C" SkinID="BtnNormal" ToolTip="所教班级未评作品全部设置为C（分值6）"
                                CssClass="term-btn term-btn--warning" />
                            <asp:Button ID="BtnScores" runat="server" OnClick="BtnScore_Click"
                                Text="总分折算" SkinID="BtnNormal" ToolTip="先统计总分，再得出折算总分"
                                CssClass="term-btn term-btn--primary" />
                            <asp:Button ID="Btnape" runat="server" onclick="Btnape_Click"
                                Text="期末总评" SkinID="BtnNormal"
                                CssClass="term-btn term-btn--success" />
                            <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click"
                                Text="导出Excel" SkinID="BtnNormal" ToolTip="将学生期末成绩以Excel表格导出"
                                CssClass="term-btn term-btn--secondary" />
                            <asp:Button ID="Btntermview" runat="server" Text="学期查询" OnClick="Btntermview_Click"
                                SkinID="BtnNormal" CssClass="term-btn term-btn--secondary" />
                            <asp:Button ID="Btnback" runat="server" Text="返回" OnClick="Btnback_Click"
                                SkinID="BtnNormal" CssClass="term-btn term-btn--ghost" />
                        </div>

                        <div class="term-msg">
                            <asp:Label ID="Labelmsg" runat="server" SkinID="LabelMsgRed"></asp:Label>
                        </div>
                    </div>
                </section>

                <section class="term-card term-card--span-4 term-theme--indigo">
                    <div class="term-card__head">
                        <h2 class="term-card__title">总分折算比重</h2>
                    </div>
                    <div class="term-card__body">
                        <div class="term-weight-grid">
                            <div class="term-weight-item">
                                <span class="term-weight-label">作品+小组+讨论+表单+测评</span>
                                <asp:DropDownList ID="DDLwork" runat="server" CssClass="term-select term-select--sm">
                                    <asp:ListItem Selected="True">100</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <span class="term-weight-sep">:</span>
                            <div class="term-weight-item">
                                <span class="term-weight-label">测验</span>
                                <asp:DropDownList ID="DDLexam" runat="server" CssClass="term-select term-select--sm">
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem Selected="True">50</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <span class="term-weight-sep">:</span>
                            <div class="term-weight-item">
                                <span class="term-weight-label">中英文</span>
                                <asp:DropDownList ID="DDLtyper" runat="server" CssClass="term-select term-select--sm">
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem Selected="True">10</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <span class="term-weight-sep">:</span>
                            <div class="term-weight-item">
                                <span class="term-weight-label">表现</span>
                                <asp:DropDownList ID="DDLattitude" runat="server" CssClass="term-select term-select--sm">
                                    <asp:ListItem Selected="True">100</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <span class="term-note" style="margin-top: 14px;">
                            期末总评等级比重：优秀 &gt; 80%、良好 &gt; 60%、及格 &gt; 30%、不及格 = 0%
                        </span>
                    </div>
                </section>

                <section class="term-card term-card--span-12 term-theme--slate">
                    <div class="term-card__head">
                        <h2 class="term-card__title">学生成绩明细</h2>
                    </div>
                    <div class="term-card__body">
                        <div class="term-table-wrap">
                            <asp:GridView ID="GVCourse" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="Sid" SkinID="GVmission" OnRowDataBound="GVCourse_RowDataBound"
                                PageSize="25" Width="100%" EnableModelValidation="True">
                                <Columns>
                                    <asp:BoundField HeaderText="编号" />
                                    <asp:BoundField DataField="Snum" HeaderText="学号" />
                                    <asp:BoundField DataField="Sgradeclass" HeaderText="班级" />
                                    <asp:HyperLinkField DataNavigateUrlFields="Snum"
                                        DataNavigateUrlFormatString="studentwork.aspx?snum={0}" DataTextField="Sname"
                                        HeaderText="姓名" Target="_blank" />
                                    <asp:BoundField DataField="Sscore" HeaderText="作品" />
                                    <asp:BoundField DataField="Sgscore" HeaderText="小组" />
                                    <asp:BoundField DataField="Spscore" HeaderText="讨论" />
                                    <asp:BoundField DataField="Stxtform" HeaderText="表单" />
                                    <asp:BoundField DataField="Svscore" HeaderText="测验" />
                                    <asp:BoundField DataField="Schinese" HeaderText="拼音" />
                                    <asp:BoundField DataField="Sfscore" HeaderText="英语" />
                                    <asp:BoundField DataField="Stscore" HeaderText="中文" />
                                    <asp:BoundField DataField="Sidle" HeaderText="测评" />
                                    <asp:BoundField DataField="Sattitude" HeaderText="表现" />
                                    <asp:BoundField DataField="Sallscore" HeaderText="总分" />
                                    <asp:BoundField DataField="Sape" HeaderText="评定" />
                                    <asp:BoundField DataField="Stenscore" HeaderText="评定" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
