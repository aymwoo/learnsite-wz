<%@ Page Title="" Language="C#" MasterPageFile="~/manager/Manage.master" AutoEventWireup="true" CodeFile="createroom.aspx.cs" Inherits="Manager_createroom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .mgr-page { --ls-bg: linear-gradient(180deg,#f8fbff 0%,#f3f7ff 100%); --ls-border: #dbe6f5; --ls-text: #0f172a; --ls-muted: #64748b; padding: 28px; background: var(--ls-bg); min-height: calc(100vh - 8rem); }
        .mgr-page * { box-sizing: border-box; }
        .mgr-shell { display: flex; flex-direction: column; gap: 20px; max-width: 1000px; margin: 0 auto; }
        .mgr-hero { border: 1px solid var(--ls-border); border-radius: 1rem; padding: 24px 28px; background: radial-gradient(circle at top left,rgba(245,158,11,.18),transparent 38%), linear-gradient(135deg,#78350f 0%,#d97706 52%,#fbbf24 100%); color: #fffbeb; box-shadow: 0 20px 40px rgba(217,119,6,.15); }
        .mgr-hero__title { margin: 0; font-size: 22px; font-weight: 800; display: flex; align-items: center; gap: 10px; }
        .mgr-hero__subtitle { margin: 6px 0 0; font-size: 13px; color: rgba(255,251,235,.85); }
        .mgr-card { border: 1px solid var(--ls-border); border-radius: 1rem; background: rgba(255,255,255,.96); box-shadow: 0 12px 30px rgba(15,23,42,.05); overflow: hidden; }
        .mgr-card__head { padding: 20px 24px; border-bottom: 1px solid #f1f5f9; }
        .mgr-card__title { margin: 0; font-size: 16px; font-weight: 800; color: var(--ls-text); }
        .mgr-card__body { padding: 20px 24px; display: flex; flex-direction: column; gap: 16px; }
        .mgr-toolbar { display: flex; flex-wrap: wrap; align-items: center; gap: 12px; }
        .mgr-label { font-size: 13px; font-weight: 700; color: #334155; }
        .mgr-select { min-height: 40px; padding: 0 10px; border: 1px solid #cbd5e1; border-radius: .75rem; background: #f8fafc; color: #0f172a; font-size: 14px; font-weight: 700; }
        .mgr-input { min-height: 40px; padding: 0 12px; border: 1px solid #cbd5e1; border-radius: .75rem; background: #f8fafc; color: #0f172a; font-size: 14px; width: 70px; }
        .mgr-btn { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 18px; border-radius: 1rem; border: none; font-size: 13px; font-weight: 700; cursor: pointer; transition: transform .18s, box-shadow .18s; }
        .mgr-btn--primary { background: linear-gradient(135deg,#d97706 0%,#b45309 100%); color: #fff; box-shadow: 0 8px 16px rgba(217,119,6,.2); }
        .mgr-btn--primary:hover { transform: translateY(-1px); }
        .mgr-btn--blue { background: linear-gradient(135deg,#2563eb 0%,#1d4ed8 100%); color: #fff; box-shadow: 0 8px 16px rgba(37,99,235,.2); }
        .mgr-btn--blue:hover { transform: translateY(-1px); }
        .mgr-grid { width: 100%; border-collapse: collapse; }
        .mgr-grid th { background: #f8fafc; padding: 14px 16px; font-size: 13px; font-weight: 700; color: #64748b; text-align: center; border-bottom: 2px solid #f1f5f9; }
        .mgr-grid td { padding: 12px 16px; font-size: 14px; color: #334155; border-bottom: 1px solid #f1f5f9; text-align: center; }
        .mgr-grid tbody tr:hover { background-color: #f1f5f9; }
        .mgr-grid tbody tr:hover td { background-color: transparent; }
        .pager-container { padding: 14px 20px; background: #f8fafc; display: flex; align-items: center; justify-content: space-between; font-size: 13px; font-weight: 600; color: #64748b; }
        .pager-buttons { display: flex; gap: 8px; }
        .pager-btn { padding: 5px 12px; background: #fff; border: 1px solid #e2e8f0; border-radius: 8px; color: #475569; text-decoration: none; transition: all .2s; }
        .pager-btn:hover { background: #f1f5f9; }
        .mgr-msg { font-size: 13px; font-weight: 700; color: #dc2626; }
        .mgr-divider { height: 1px; background: #f1f5f9; }
    </style>
    <div class="mgr-page">
        <div class="mgr-shell">
            <div class="mgr-hero">
                <h1 class="mgr-hero__title"><i class="bi bi-building" style="color:#fde68a;"></i> 班级设置</h1>
                <p class="mgr-hero__subtitle">创建和管理全校完整班级列表</p>
            </div>

            <div class="mgr-card">
                <div class="mgr-card__head"><h2 class="mgr-card__title">批量创建班级</h2></div>
                <div class="mgr-card__body">
                    <div class="mgr-toolbar">
                        <span class="mgr-label">年级范围</span>
                        <asp:DropDownList ID="DDLgrademin" runat="server" CssClass="mgr-select">
                            <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem><asp:ListItem Selected="True">7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem><asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem><asp:ListItem>16</asp:ListItem>
                        </asp:DropDownList>
                        <span class="mgr-label">年级 到</span>
                        <asp:DropDownList ID="DDLgrademax" runat="server" CssClass="mgr-select">
                            <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem Selected="True">9</asp:ListItem><asp:ListItem>10</asp:ListItem><asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem><asp:ListItem>16</asp:ListItem>
                        </asp:DropDownList>
                        <span class="mgr-label">年级 &nbsp; 班级数上限</span>
                        <asp:DropDownList ID="DDLclassmax" runat="server" CssClass="mgr-select"></asp:DropDownList>
                        <asp:Button ID="Btncreate" runat="server" Text="批量创建" onclick="Btncreate_Click" CssClass="mgr-btn mgr-btn--primary" />
                    </div>
                    <div class="mgr-divider"></div>
                    <div class="mgr-toolbar">
                        <span class="mgr-label">手动添加单个班级</span>
                        <span style="font-size:13px;color:#64748b;">年级</span>
                        <asp:TextBox ID="TextBoxGrade" runat="server" CssClass="mgr-input"></asp:TextBox>
                        <span style="font-size:13px;color:#64748b;">班级</span>
                        <asp:TextBox ID="TextBoxClass" runat="server" CssClass="mgr-input"></asp:TextBox>
                        <asp:Button ID="BtncreateOne" runat="server" Text="添加该班级" onclick="BtncreateOne_Click" CssClass="mgr-btn mgr-btn--blue" />
                    </div>
                    <asp:Label ID="Labelmsg" runat="server" CssClass="mgr-msg"></asp:Label>
                </div>
            </div>

            <div class="mgr-card">
                <div class="mgr-card__head"><h2 class="mgr-card__title">全校班级列表</h2></div>
                <asp:GridView ID="GVclass" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CssClass="mgr-grid" GridLines="None" Width="100%"
                    onpageindexchanging="GVclass_PageIndexChanging"
                    onrowdatabound="GVclass_RowDataBound" PageSize="15" DataKeyNames="Rid"
                    onrowcommand="GVclass_RowCommand" EnableModelValidation="True">
                    <Columns>
                        <asp:BoundField HeaderText="序号"><ItemStyle Width="60px" CssClass="font-mono text-slate-400" /></asp:BoundField>
                        <asp:BoundField DataField="Rhid" HeaderText="教师" />
                        <asp:BoundField DataField="Rgrade" HeaderText="年级" />
                        <asp:BoundField DataField="Rclass" HeaderText="班级" />
                        <asp:ButtonField CommandName="Del" HeaderText="操作" Text="删除"><ItemStyle CssClass="text-rose-500 font-bold cursor-pointer" /></asp:ButtonField>
                    </Columns>
                    <PagerTemplate>
                        <div class="pager-container">
                            <span>第 <asp:Label ID="lblPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>" style="color:#4f46e5;"></asp:Label> / <asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label> 页</span>
                            <div class="pager-buttons">
                                <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First" CommandName="Page" CssClass="pager-btn">首页</asp:LinkButton>
                                <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev" CommandName="Page" CssClass="pager-btn">上一页</asp:LinkButton>
                                <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next" CommandName="Page" CssClass="pager-btn">下一页</asp:LinkButton>
                                <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last" CommandName="Page" CssClass="pager-btn">尾页</asp:LinkButton>
                            </div>
                        </div>
                    </PagerTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
