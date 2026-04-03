<%@ Page Title="" Language="C#" MasterPageFile="~/manager/Manage.master" AutoEventWireup="true" CodeFile="roomselect.aspx.cs" Inherits="Manager_roomselect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .mgr-page { --ls-bg: linear-gradient(180deg,#f8fbff 0%,#f3f7ff 100%); --ls-border: #dbe6f5; --ls-text: #0f172a; padding: 28px; background: var(--ls-bg); min-height: calc(100vh - 8rem); }
        .mgr-page * { box-sizing: border-box; }
        .mgr-shell { display: flex; flex-direction: column; gap: 20px; }
        .mgr-hero { border: 1px solid #bfdbfe; border-radius: 1rem; padding: 24px 28px; background: linear-gradient(135deg,#eff6ff 0%,#dbeafe 100%); color: #1e3a8a; box-shadow: 0 4px 16px rgba(37,99,235,.08); }
        .mgr-hero__title { margin: 0; font-size: 22px; font-weight: 800; display: flex; align-items: center; gap: 10px; }
        .mgr-hero__subtitle { margin: 6px 0 0; font-size: 13px; color: rgba(239,246,255,.85); }
        .mgr-card { border: 1px solid var(--ls-border); border-radius: 1rem; background: rgba(255,255,255,.96); box-shadow: 0 12px 30px rgba(15,23,42,.05); overflow: hidden; }
        .mgr-card__head { padding: 20px 24px; border-bottom: 1px solid #f1f5f9; }
        .mgr-card__title { margin: 0; font-size: 16px; font-weight: 800; color: var(--ls-text); }
        .mgr-card__body { padding: 20px 24px; display: flex; flex-direction: column; gap: 16px; }
        .mgr-legend { display: flex; align-items: center; gap: 16px; flex-wrap: wrap; font-size: 13px; color: #475569; }
        .mgr-legend__item { display: inline-flex; align-items: center; gap: 6px; font-weight: 600; }
        .mgr-legend__swatch { display: inline-block; width: 14px; height: 14px; border-radius: .25rem; border: 1px solid #e2e8f0; }
        .mgr-room-grid { display: flex; flex-wrap: wrap; gap: 10px; }
        .mgr-room-item { display: flex; flex-direction: column; align-items: center; gap: 6px; padding: 10px 8px; border: 1px solid #e2e8f0; border-radius: 1rem; background: #f8fafc; width: 80px; }
        .mgr-actions { display: flex; gap: 10px; }
        .mgr-btn { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 20px; border-radius: 1rem; border: none; font-size: 13px; font-weight: 700; cursor: pointer; transition: transform .18s, box-shadow .18s; }
        .mgr-btn--primary { background: linear-gradient(135deg,#2563eb 0%,#1d4ed8 100%); color: #fff; box-shadow: 0 8px 16px rgba(37,99,235,.2); }
        .mgr-btn--primary:hover { transform: translateY(-1px); }
        .mgr-btn--outline { background: #fff; color: #475569; border: 1px solid #e2e8f0; }
        .mgr-btn--outline:hover { background: #f8fafc; }
    </style>
    <div class="mgr-page">
        <div class="mgr-shell">
            <div class="mgr-hero">
                <h1 class="mgr-hero__title"><i class="bi bi-check2-square" style="color:#93c5fd;"></i> 班级选择</h1>
                <p class="mgr-hero__subtitle">为教师分配可管理的班级</p>
            </div>

            <div class="mgr-card">
                <div class="mgr-card__head"><h2 class="mgr-card__title">选择班级</h2></div>
                <div class="mgr-card__body">
                    <div class="mgr-legend">
                        <span class="mgr-legend__item">
                            <asp:Label ID="Labelnot" runat="server" BackColor="WhiteSmoke" Width="14px" Height="14px" BorderColor="#E4E4E4" BorderStyle="Solid" BorderWidth="1px" CssClass="mgr-legend__swatch"></asp:Label>
                            可选
                        </span>
                        <span class="mgr-legend__item">
                            <asp:Label ID="Labelselect" runat="server" BackColor="#D1F8D6" Width="14px" Height="14px" BorderColor="#E4E4E4" BorderStyle="Solid" BorderWidth="1px" CssClass="mgr-legend__swatch"></asp:Label>
                            已选
                        </span>
                        <span class="mgr-legend__item">
                            <asp:Label ID="Labelother" runat="server" BackColor="Gray" Width="14px" Height="14px" BorderColor="#E4E4E4" BorderStyle="Solid" BorderWidth="1px" CssClass="mgr-legend__swatch"></asp:Label>
                            不可选
                        </span>
                    </div>

                    <asp:DataList ID="DLroom" runat="server" RepeatColumns="8" RepeatDirection="Horizontal"
                        onitemdatabound="DLroom_ItemDataBound" DataKeyField="Rid" CellPadding="0" CellSpacing="6">
                        <ItemTemplate>
                            <div class="mgr-room-item">
                                <asp:HyperLink ID="Rgradeclass" runat="server" Font-Size="13px" Font-Underline="False"
                                    BackColor="WhiteSmoke" ForeColor="Black" BorderColor="#E4E4E4" BorderWidth="1px" BorderStyle="Solid"
                                    style="display:inline-flex;align-items:center;justify-content:center;width:52px;height:28px;border-radius:.5rem;font-weight:700;text-decoration:none;font-size:13px;"></asp:HyperLink>
                                <asp:CheckBox ID="CheckRoom" runat="server" />
                                <asp:Label ID="LabelRid" runat="server" Text='<%# Eval("Rid") %>' Visible="False"></asp:Label>
                                <asp:Label ID="LabelRhid" runat="server" Text='<%# Eval("Rhid") %>' Visible="False"></asp:Label>
                                <asp:Label ID="LabelRgrade" runat="server" Text='<%# Eval("Rgrade") %>' Visible="False"></asp:Label>
                                <asp:Label ID="LabelRclass" runat="server" Text='<%# Eval("Rclass") %>' Visible="False"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <div class="mgr-actions">
                        <asp:Button ID="Btnselect" runat="server" Text="确定" onclick="Btnselect_Click" CssClass="mgr-btn mgr-btn--primary" />
                        <asp:Button ID="Btnreturn" runat="server" Text="返回" onclick="Btnreturn_Click" CssClass="mgr-btn mgr-btn--outline" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
