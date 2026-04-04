<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="gauge.aspx.cs" Inherits="Teacher_gauge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .gauge-page {
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
            min-height: calc(100vh - 8rem);
        }

        .gauge-page * {
            box-sizing: border-box;
        }

        .gauge-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin: 0 auto;
        }

        .gauge-hero {
            position: relative;
            overflow: hidden;
            border: 1px solid var(--ls-border);
            border-radius: 1rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(99, 102, 241, 0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(139, 92, 246, 0.16), transparent 26%),
                linear-gradient(135deg, #312e81 0%, #6366f1 52%, #a78bfa 100%);
            color: #eef2ff;
            box-shadow: 0 20px 40px rgba(99, 102, 241, 0.15);
        }

        .gauge-hero__title {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.02em;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .gauge-hero__subtitle {
            margin: 6px 0 0;
            font-size: 14px;
            color: rgba(238, 242, 255, 0.88);
        }

        .gauge-card {
            border: 1px solid var(--ls-border);
            border-radius: 1rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
            overflow: hidden;
        }

        .gauge-card__head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 12px;
            align-items: flex-start;
            padding: 22px 24px 0;
        }

        .gauge-card__title {
            margin: 0;
            font-size: 20px;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.02em;
            color: var(--ls-text);
        }

        .gauge-card__desc {
            margin: 8px 0 0;
            font-size: 13px;
            line-height: 1.7;
            color: var(--ls-muted);
        }

        .gauge-card__body {
            padding: 22px 24px 24px;
        }

        .gauge-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .gauge-grid th {
            background: #f8fafc;
            padding: 16px;
            font-size: 13px;
            font-weight: 700;
            color: #64748b;
            text-align: center;
            border-bottom: 2px solid #f1f5f9;
        }

        .gauge-grid td {
            padding: 14px 16px;
            font-size: 14px;
            color: #334155;
            border-bottom: 1px solid #f1f5f9;
            text-align: center;
        }

        .gauge-grid tbody tr:hover {
            background-color: #f1f5f9;
        }

        .gauge-grid tbody tr:hover td {
            background-color: transparent;
        }

        .gauge-link {
            color: #4f46e5;
            font-weight: 700;
            text-decoration: none;
        }

        .gauge-link:hover {
            color: #3730a3;
            text-decoration: underline;
        }

        .gauge-delete-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 1rem;
            background: #fee2e2;
            color: #b91c1c;
            font-size: 14px;
            font-weight: 800;
            text-decoration: none;
            border: 1px solid #fecaca;
            cursor: pointer;
            transition: all 0.2s;
        }

        .gauge-delete-btn:hover {
            background: #b91c1c;
            color: #ffffff;
        }

        .gauge-form {
            display: grid;
            gap: 16px;
            grid-template-columns: 1fr 2fr auto;
            align-items: end;
        }

        .gauge-field {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .gauge-label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .gauge-select,
        .gauge-input {
            width: 100% !important;
            min-height: 48px;
            padding: 0 14px;
            border: 1px solid #cbd5e1;
            border-radius: 1rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 14px;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
        }

        .gauge-select:focus,
        .gauge-input:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(96, 165, 250, 0.18);
        }

        .gauge-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 48px;
            padding: 0 20px;
            border-radius: 1rem;
            border: none;
            font-size: 14px;
            font-weight: 700;
            color: #ffffff;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            box-shadow: 0 10px 24px rgba(16, 185, 129, 0.2);
            cursor: pointer;
            transition: transform 0.18s ease, box-shadow 0.18s ease;
        }

        .gauge-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 28px rgba(16, 185, 129, 0.3);
        }

        .gauge-alert {
            display: flex;
            flex-direction: column;
            gap: 12px;
            padding: 18px 20px;
            border-radius: 1rem;
            background: linear-gradient(135deg, #fffbeb 0%, #fefce8 100%);
            border: 1px solid #fde68a;
        }

        .gauge-alert__item {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            font-size: 13px;
            line-height: 1.7;
        }

        .gauge-alert__icon {
            flex-shrink: 0;
            margin-top: 2px;
        }

        .gauge-alert__text {
            color: #78350f;
        }

        .gauge-alert__text strong {
            color: #92400e;
        }

        @media (max-width: 768px) {
            .gauge-page { padding: 16px; }
            .gauge-form { grid-template-columns: 1fr; }
            .gauge-btn { width: 100%; }
        }
    </style>

    <div class="gauge-page">
        <div class="gauge-shell">
            <div class="gauge-hero">
                <h1 class="gauge-hero__title">
                    <i class="bi bi-ui-checks-grid" style="color: #c7d2fe;"></i> 自定义量化评价标准
                </h1>
                <p class="gauge-hero__subtitle">创建和管理作品互评的量化指标库，支持多种作品类型的评价维度配置</p>
            </div>

            <div class="gauge-card">
                <div class="gauge-card__head">
                    <div>
                        <h2 class="gauge-card__title">量规列表</h2>
                        <p class="gauge-card__desc">点击标题可编辑具体评价项目，已使用的量规无法删除</p>
                    </div>
                </div>
                <div class="gauge-card__body">
                    <asp:GridView ID="GVGauge" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="Gid" Width="100%" 
                        CssClass="gauge-grid" 
                        onrowcommand="GVGauge_RowCommand" EnableModelValidation="True" 
                        onrowdatabound="GVGauge_RowDataBound" GridLines="None">
                        <Columns>
                            <asp:BoundField HeaderText="序号">
                                <ItemStyle CssClass="font-mono text-slate-400" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gtype" HeaderText="分类">
                                <ItemStyle CssClass="font-semibold text-slate-700" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="Gid"  
                                DataNavigateUrlFormatString="~/teacher/gaugeitem.aspx?gid={0}" 
                                DataTextField="Gtitle" HeaderText="标题">
                                <ItemStyle CssClass="gauge-link text-left" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="Gcount" HeaderText="使用次数">
                                <ItemStyle CssClass="font-mono text-emerald-600 font-semibold" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gdate" HeaderText="日期">
                                <ItemStyle CssClass="text-slate-500 text-xs" Width="120px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton ID="BtnEdit" runat="server" CausesValidation="false" 
                                        CommandArgument='<%# Eval("Gid") %>' CommandName="Del" 
                                        Text="✖" ToolTip="删除" CssClass="gauge-delete-btn"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="gauge-card">
                <div class="gauge-card__head">
                    <div>
                        <h2 class="gauge-card__title">添加量规</h2>
                        <p class="gauge-card__desc">选择作品类型并填写量规标题，创建新的评价标准</p>
                    </div>
                </div>
                <div class="gauge-card__body">
                    <div class="gauge-form">
                        <div class="gauge-field">
                            <span class="gauge-label">作品类型</span>
                            <asp:DropDownList ID="DDLtype" runat="server" CssClass="gauge-select"></asp:DropDownList>
                        </div>
                        <div class="gauge-field">
                            <span class="gauge-label">量规标题</span>
                            <asp:TextBox ID="TextBoxGtitle" runat="server" CssClass="gauge-input" placeholder="例如：Scratch游戏作品互评表"></asp:TextBox>
                        </div>
                        <asp:Button ID="Btnadd" runat="server" Text="添加量规" onclick="Btnadd_Click" CssClass="gauge-btn" />
                    </div>
                </div>
            </div>

            <div class="gauge-alert">
                <div class="gauge-alert__item">
                    <i class="bi bi-exclamation-triangle-fill text-amber-500 gauge-alert__icon"></i>
                    <span class="gauge-alert__text"><strong>注意：</strong>评价标准一旦被使用后，将无法删除，请慎重填写！</span>
                </div>
                <div class="gauge-alert__item">
                    <i class="bi bi-info-circle-fill text-blue-500 gauge-alert__icon"></i>
                    <span class="gauge-alert__text">当活动中未指定互评评价标准时，系统将自动选取相应作品类型中的第一条评价标准。</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>