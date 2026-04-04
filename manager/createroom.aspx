<%@ Page Title="" Language="C#" MasterPageFile="~/manager/Manage.master" AutoEventWireup="true" CodeFile="createroom.aspx.cs" Inherits="Manager_createroom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .room-page {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            --ls-danger: #dc2626;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
            min-height: calc(100vh - 8rem);
        }

        .room-page * { box-sizing: border-box; }

        .room-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* ── hero ── */
        .room-hero {
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

        .room-hero__title {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.03em;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .room-hero__subtitle {
            margin: 8px 0 0;
            font-size: 14px;
            line-height: 1.8;
            color: rgba(239, 246, 255, 0.88);
        }

        /* ── card ── */
        .room-card {
            border: 1px solid var(--ls-border);
            border-radius: 0.75rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
            overflow: hidden;
        }

        .room-card__head {
            padding: 20px 24px;
            border-bottom: 1px solid #f1f5f9;
        }

        .room-card__title {
            margin: 0;
            font-size: 16px;
            font-weight: 800;
            color: var(--ls-text);
        }

        .room-card__body {
            padding: 20px 24px;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        /* ── toolbar ── */
        .room-toolbar {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 12px;
        }

        .room-label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .room-muted {
            font-size: 13px;
            color: var(--ls-muted);
        }

        /* ── form controls ── */
        .room-select {
            min-height: 40px;
            padding: 0 10px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 14px;
            font-weight: 700;
            transition: border-color 0.2s, box-shadow 0.2s, background-color 0.2s;
        }

        .room-select:focus {
            border-color: #60a5fa;
            outline: none;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        .room-input {
            min-height: 40px;
            padding: 0 12px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 14px;
            font-weight: 700;
            width: 70px;
            text-align: center;
            transition: border-color 0.2s, box-shadow 0.2s, background-color 0.2s;
        }

        .room-input:focus {
            border-color: #60a5fa;
            outline: none;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        /* ── buttons ── */
        .room-btn {
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
            transition: transform 0.18s, box-shadow 0.18s;
        }

        .room-btn:hover { transform: translateY(-1px); }

        .room-btn--primary {
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            color: #fff;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.2);
        }

        .room-btn--success {
            background: linear-gradient(135deg, #16a34a 0%, #15803d 100%);
            color: #fff;
            box-shadow: 0 6px 16px rgba(22, 163, 74, 0.2);
        }

        /* ── grid / table ── */
        .room-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .room-grid th {
            background: #f8fafc;
            padding: 14px 16px;
            font-size: 13px;
            font-weight: 700;
            color: var(--ls-muted);
            text-align: center;
            border-bottom: 2px solid #f1f5f9;
        }

        .room-grid td {
            padding: 12px 16px;
            font-size: 14px;
            color: #334155;
            border-bottom: 1px solid #f1f5f9;
            text-align: center;
        }

        .room-grid tbody tr:hover { background-color: #f1f5f9; }
        .room-grid tbody tr:hover td { background-color: transparent; }

        .room-del { color: #dc2626; font-weight: 700; cursor: pointer; }

        /* ── pager ── */
        .room-pager {
            padding: 14px 20px;
            background: #f8fafc;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 13px;
            font-weight: 600;
            color: var(--ls-muted);
        }

        .room-pager__nav { display: flex; gap: 6px; }

        .room-pager__btn {
            padding: 5px 12px;
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            color: #475569;
            text-decoration: none;
            font-size: 13px;
            transition: background 0.2s, border-color 0.2s;
        }

        .room-pager__btn:hover {
            background: #f1f5f9;
            border-color: #cbd5e1;
        }

        .room-pager__current { color: #4f46e5; font-weight: 700; }

        /* ── misc ── */
        .room-msg { font-size: 14px; font-weight: 700; color: var(--ls-danger); }
        .room-divider { height: 1px; background: #f1f5f9; }
        .room-seq { font-family: ui-monospace, SFMono-Regular, monospace; color: #94a3b8; }

        /* ── responsive ── */
        @media (max-width: 768px) {
            .room-page { padding: 16px; }
            .room-hero { padding: 20px; }
            .room-hero__title { font-size: 20px; }
            .room-card__head { padding: 16px 18px; }
            .room-card__body { padding: 16px 18px; }
            .room-toolbar { gap: 8px; }
            .room-pager { flex-direction: column; gap: 10px; }
        }
    </style>
    <div class="room-page">
        <div class="room-shell">
            <div class="room-hero">
                <h1 class="room-hero__title"><i class="bi bi-building"></i> 班级设置</h1>
                <p class="room-hero__subtitle">创建和管理全校完整班级列表</p>
            </div>

            <div class="room-card">
                <div class="room-card__head"><h2 class="room-card__title">批量创建班级</h2></div>
                <div class="room-card__body">
                    <div class="room-toolbar">
                        <span class="room-label">年级范围</span>
                        <asp:DropDownList ID="DDLgrademin" runat="server" CssClass="room-select">
                            <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem><asp:ListItem Selected="True">7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem><asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem><asp:ListItem>16</asp:ListItem>
                        </asp:DropDownList>
                        <span class="room-label">年级 到</span>
                        <asp:DropDownList ID="DDLgrademax" runat="server" CssClass="room-select">
                            <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem Selected="True">9</asp:ListItem><asp:ListItem>10</asp:ListItem><asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem><asp:ListItem>16</asp:ListItem>
                        </asp:DropDownList>
                        <span class="room-label">年级</span>
                        <span class="room-label">班级数上限</span>
                        <asp:DropDownList ID="DDLclassmax" runat="server" CssClass="room-select"></asp:DropDownList>
                        <asp:Button ID="Btncreate" runat="server" Text="批量创建" onclick="Btncreate_Click" CssClass="room-btn room-btn--primary" />
                    </div>
                    <div class="room-divider"></div>
                    <div class="room-toolbar">
                        <span class="room-label">手动添加单个班级</span>
                        <span class="room-muted">年级</span>
                        <asp:TextBox ID="TextBoxGrade" runat="server" CssClass="room-input"></asp:TextBox>
                        <span class="room-muted">班级</span>
                        <asp:TextBox ID="TextBoxClass" runat="server" CssClass="room-input"></asp:TextBox>
                        <asp:Button ID="BtncreateOne" runat="server" Text="添加该班级" onclick="BtncreateOne_Click" CssClass="room-btn room-btn--success" />
                    </div>
                    <asp:Label ID="Labelmsg" runat="server" CssClass="room-msg"></asp:Label>
                </div>
            </div>

            <div class="room-card">
                <div class="room-card__head"><h2 class="room-card__title">全校班级列表</h2></div>
                <asp:GridView ID="GVclass" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CssClass="room-grid" GridLines="None" Width="100%"
                    onpageindexchanging="GVclass_PageIndexChanging"
                    onrowdatabound="GVclass_RowDataBound" PageSize="15" DataKeyNames="Rid"
                    onrowcommand="GVclass_RowCommand" EnableModelValidation="True">
                    <Columns>
                        <asp:BoundField HeaderText="序号"><ItemStyle Width="60px" CssClass="room-seq" /></asp:BoundField>
                        <asp:BoundField DataField="Rhid" HeaderText="教师" />
                        <asp:BoundField DataField="Rgrade" HeaderText="年级" />
                        <asp:BoundField DataField="Rclass" HeaderText="班级" />
                        <asp:ButtonField CommandName="Del" HeaderText="操作" Text="删除"><ItemStyle CssClass="room-del" /></asp:ButtonField>
                    </Columns>
                    <PagerTemplate>
                        <div class="room-pager">
                            <span>第 <asp:Label ID="lblPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>" CssClass="room-pager__current"></asp:Label> / <asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label> 页</span>
                            <div class="room-pager__nav">
                                <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First" CommandName="Page" CssClass="room-pager__btn">首页</asp:LinkButton>
                                <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev" CommandName="Page" CssClass="room-pager__btn">上一页</asp:LinkButton>
                                <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next" CommandName="Page" CssClass="room-pager__btn">下一页</asp:LinkButton>
                                <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last" CommandName="Page" CssClass="room-pager__btn">尾页</asp:LinkButton>
                            </div>
                        </div>
                    </PagerTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
