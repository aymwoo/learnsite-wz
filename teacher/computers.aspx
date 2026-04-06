<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="computers.aspx.cs" Inherits="Teacher_computers" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    <style type="text/css">
        .comp-page {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
            min-height: calc(100vh - 8rem);
        }

        .comp-page * {
            box-sizing: border-box;
        }

        .comp-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Hero */
        .comp-hero {
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

        .comp-hero__title {
            margin: 0;
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .comp-hero__subtitle {
            max-width: 760px;
            margin: 8px 0 0;
            font-size: 14px;
            line-height: 1.8;
            color: rgba(239, 246, 255, 0.88);
        }

        /* Grid */
        .comp-grid {
            display: grid;
            gap: 20px;
            grid-template-columns: repeat(12, minmax(0, 1fr));
        }

        /* Card */
        .comp-card {
            min-width: 0;
            border: 1px solid var(--ls-border);
            border-radius: 0.75rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
        }

        .comp-card--span-12 { grid-column: span 12; }
        .comp-card--span-8 { grid-column: span 8; }
        .comp-card--span-4 { grid-column: span 4; }

        .comp-card--table {
            background: linear-gradient(160deg, #ffffff 0%, #f0f7ff 100%);
        }

        .comp-card--actions {
            background: linear-gradient(160deg, #ffffff 0%, #f5f3ff 100%);
        }

        .comp-card--import {
            background: linear-gradient(160deg, #ffffff 0%, #f0fdf4 100%);
        }

        .comp-card__head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 12px;
            align-items: center;
            padding: 20px 24px 0;
        }

        .comp-card__title {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            letter-spacing: -0.02em;
            color: var(--ls-text);
        }

        .comp-card__body {
            padding: 18px 24px 22px;
        }

        /* Sort bar */
        .comp-sort {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
            padding: 14px;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            background: #ffffff;
        }

        .comp-sort-label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .comp-sort span {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            font-size: 13px;
            color: #334155;
        }

        /* Table */
        .comp-table-wrap {
            margin-top: 14px;
            overflow-x: auto;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
        }

        .comp-table-wrap table {
            width: 100%;
            border-collapse: collapse;
        }

        .comp-table-wrap th {
            position: sticky;
            top: 0;
            z-index: 2;
            padding: 10px 16px;
            background: #f8fafc;
            border-bottom: 2px solid #e2e8f0;
            font-size: 13px;
            font-weight: 700;
            color: #475569;
            text-align: left;
            white-space: nowrap;
        }

        .comp-table-wrap td {
            padding: 10px 16px;
            border-bottom: 1px solid #f1f5f9;
            font-size: 14px;
            color: #334155;
            vertical-align: middle;
        }

        .comp-table-wrap tr:hover td {
            background: #f8fafc;
        }

        .comp-table-wrap td a {
            color: #4338ca;
            text-decoration: none;
            font-weight: 600;
            font-size: 13px;
        }

        .comp-table-wrap td a:hover {
            color: #312e81;
            text-decoration: underline;
        }

        .comp-cell--seq {
            text-align: center;
            font-weight: 600;
            color: #94a3b8;
            width: 50px;
        }

        .comp-cell--ip a {
            color: #2563eb !important;
            font-family: monospace;
            font-weight: 700;
        }

        .comp-cell--lock {
            text-align: center;
        }

        .comp-cell--lock-btn {
            text-align: center;
        }

        .comp-cell--lock-btn input[type="image"] {
            width: 16px;
            height: 16px;
            opacity: 0.6;
            transition: opacity 0.15s;
            cursor: pointer;
        }

        .comp-cell--lock-btn input[type="image"]:hover {
            opacity: 1;
        }

        .comp-cell--date {
            font-size: 12px;
            color: #94a3b8;
        }

        .comp-cell--del a {
            color: #e11d48 !important;
        }

        .comp-cell--del a:hover {
            color: #9f1239 !important;
        }

        /* Action buttons */
        .comp-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .comp-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 38px;
            padding: 0 18px;
            border-radius: 0.375rem;
            border: none;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.18s, box-shadow 0.18s;
        }

        .comp-btn:hover {
            transform: translateY(-1px);
        }

        .comp-btn--primary {
            color: #ffffff;
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.2);
        }

        .comp-btn--danger {
            color: #ffffff;
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.2);
        }

        .comp-btn--secondary {
            color: #1d4ed8;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
        }

        .comp-btn--success {
            color: #ffffff;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.2);
        }

        .comp-hint {
            display: block;
            margin-top: 10px;
            padding: 10px 14px;
            border-radius: 0.375rem;
            background: #dbeafe;
            color: #1e3a8a;
            font-size: 12px;
            line-height: 1.7;
            border: 1px solid #bfdbfe;
        }

        .comp-check-group {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 14px;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            background: #f8fafc;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
        }

        /* Import section */
        .comp-import-form {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .comp-import-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }

        .comp-file-input {
            font-size: 13px;
            color: #475569;
        }

        .comp-msg {
            font-size: 13px;
            font-weight: 600;
            color: #1e40af;
        }

        /* Sample table */
        .comp-sample {
            margin-top: 12px;
        }

        .comp-sample__label {
            font-size: 12px;
            font-weight: 700;
            color: var(--ls-muted);
            margin-bottom: 8px;
        }

        .comp-sample-table {
            width: 260px;
            border-collapse: collapse;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            overflow: hidden;
        }

        .comp-sample-table th,
        .comp-sample-table td {
            padding: 8px 16px;
            border: 1px solid #e2e8f0;
            font-size: 13px;
            text-align: center;
        }

        .comp-sample-table th {
            background: #f8fafc;
            font-weight: 700;
            color: #475569;
        }

        .comp-sample-table td {
            color: #64748b;
            font-family: monospace;
        }

        @media (max-width: 1200px) {
            .comp-card--span-8,
            .comp-card--span-4 {
                grid-column: span 12;
            }
        }

        @media (max-width: 768px) {
            .comp-page {
                padding: 16px;
            }

            .comp-hero {
                padding: 20px 16px;
            }

            .comp-hero__title {
                font-size: 22px;
            }

            .comp-card__head {
                padding: 16px 16px 0;
            }

            .comp-card__body {
                padding: 14px 16px 18px;
            }

            .comp-actions {
                flex-direction: column;
            }

            .comp-btn {
                width: 100%;
            }
        }
    </style>

    <div class="comp-page">
        <div class="comp-shell">
            <div class="comp-hero">
                <h1 class="comp-hero__title">计算机管理</h1>
                <p class="comp-hero__subtitle">管理电脑室IP地址、主机名绑定状态和学号分配。</p>
            </div>

            <div class="comp-grid">
                <div class="comp-card comp-card--span-12 comp-card--table">
                    <div class="comp-card__head">
                        <h2 class="comp-card__title">IP地址列表</h2>
                    </div>
                    <div class="comp-card__body">
                        <div class="comp-sort">
                            <span class="comp-sort-label">排序方式</span>
                            <asp:RadioButtonList ID="Radiobtnorder" runat="server" AutoPostBack="True"
                                onselectedindexchanged="Radiobtnorder_SelectedIndexChanged"
                                RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Selected="True" Value="1">IP地址</asp:ListItem>
                                <asp:ListItem Value="2">计算机名</asp:ListItem>
                                <asp:ListItem Value="3">日期</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <div class="comp-table-wrap">
                            <asp:GridView ID="GVComputer" runat="server"
                                AutoGenerateColumns="False" CellPadding="0" GridLines="None"
                                PageSize="20" Width="100%" EnableModelValidation="True"
                                onrowcommand="GVComputer_RowCommand"
                                onrowdatabound="GVComputer_RowDataBound" DataKeyNames="Pid">
                                <Columns>
                                    <asp:BoundField HeaderText="序号">
                                        <ItemStyle CssClass="comp-cell--seq" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField DataNavigateUrlFields="Pip"
                                        DataNavigateUrlFormatString="ipstudent.aspx?qip={0}" DataTextField="Pip"
                                        HeaderText="IP地址" Target="_blank">
                                        <ItemStyle CssClass="comp-cell--ip" />
                                    </asp:HyperLinkField>
                                    <asp:TemplateField HeaderText="计算机名">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pmachine") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="电脑室">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Pm") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Pnum" HeaderText="分配学号" />
                                    <asp:BoundField DataField="Pon" HeaderText="是否登录" Visible="False" />
                                    <asp:CheckBoxField DataField="Plock" HeaderText="绑定状态">
                                        <ItemStyle CssClass="comp-cell--lock" />
                                    </asp:CheckBoxField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="ImageButton1" runat="server" CausesValidation="false"
                                                CommandArgument='<%# Eval("Pid") %>' CommandName="Lock"
                                                Text="锁定" ToolTip="更新锁定状态" CssClass="comp-lock-btn" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="comp-cell--lock-btn" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Pdate" HeaderText="更新日期">
                                        <ItemStyle CssClass="comp-cell--date" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"
                                                CommandArgument='<%# Eval("Pid") %>' CommandName="Del" Text="删除" ToolTip="删除该条记录"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="comp-cell--del" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="" />
                                <RowStyle CssClass="" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <div class="comp-card comp-card--span-8 comp-card--actions">
                    <div class="comp-card__head">
                        <h2 class="comp-card__title">批量操作</h2>
                    </div>
                    <div class="comp-card__body">
                        <div class="comp-actions">
                            <asp:Button ID="BtnDelAll" runat="server" onclick="BtnDelAll_Click"
                                Text="全体删除" CssClass="comp-btn comp-btn--danger" />
                            <asp:Button ID="BtnUnlock" runat="server" onclick="BtnUnlock_Click"
                                Text="全体解绑" CssClass="comp-btn comp-btn--secondary" />
                            <asp:Button ID="BtnOnlock" runat="server"
                                Text="全体绑定" onclick="BtnOnlock_Click" CssClass="comp-btn comp-btn--success" />
                            <asp:Button ID="BtnAssign" runat="server"
                                Text="自动分配" onclick="BtnAssign_Click"
                                ToolTip="培训时用，先获取所有学生机IP，然后点自动分配学号" Visible="False" CssClass="comp-btn comp-btn--primary" />
                            <asp:Button ID="BtnClear" runat="server" Text="清除分配"
                                ToolTip="清除分配的学号" onclick="BtnClear_Click" Visible="False" CssClass="comp-btn comp-btn--secondary" />
                            <asp:Button ID="BtnRefresh" runat="server"
                                Text="刷新" onclick="BtnRefresh_Click" CssClass="comp-btn comp-btn--primary" />
                        </div>
                        <div class="comp-hint">解除绑定后，学生登录更新记录就会自动绑定。</div>
                        <div style="margin-top: 10px;">
                            <span class="comp-check-group">
                                <asp:CheckBox ID="CheckBoxhostname" runat="server" AutoPostBack="True"
                                    oncheckedchanged="CheckBoxhostname_CheckedChanged"
                                    Text="自动获取主机名" ToolTip="同网段获取正常，如果跨网段请关闭并导入主机名和IP绑定表格" />
                            </span>
                        </div>
                    </div>
                </div>

                <div class="comp-card comp-card--span-4 comp-card--import">
                    <div class="comp-card__head">
                        <h2 class="comp-card__title">导入主机名</h2>
                    </div>
                    <div class="comp-card__body">
                        <div class="comp-import-form">
                            <div class="comp-import-row">
                                <div class="ls-upload" data-accept=".xls,.xlsx" data-label="点击或拖拽上传Excel" data-hint="支持 xls / xlsx 格式">
                                    <asp:FileUpload ID="FuHostnameIp" runat="server" />
                                </div>
                                <asp:Button ID="BtnImport" runat="server" onclick="BtnImport_Click"
                                    Text="导入Excel" CssClass="comp-btn comp-btn--primary" />
                            </div>
                            <asp:Label ID="Labelmsg" runat="server" CssClass="comp-msg"></asp:Label>

                            <div class="comp-sample">
                                <div class="comp-sample__label">Excel格式参考</div>
                                <table class="comp-sample-table">
                                    <tr><th>ip</th><th>hostname</th></tr>
                                    <tr><td>192.168.0.20</td><td>pc1</td></tr>
                                    <tr><td>192.168.0.21</td><td>pc2</td></tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/fileupload.js"></script>
</asp:Content>
