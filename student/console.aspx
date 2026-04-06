<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true" CodeFile="console.aspx.cs" Inherits="Student_console" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<style>
    .prog-wrap * { box-sizing: border-box; }
    .prog-grid { display: grid; grid-template-columns: 1fr 300px; gap: 20px; align-items: start; width: 100%; }
    @media (max-width: 1024px) { .prog-grid { grid-template-columns: 1fr; } .prog-sidebar { position: static !important; } }
    .prog-card { border: 1px solid #dbe6f5; border-radius: 0.75rem; background: rgba(255,255,255,0.97); box-shadow: 0 12px 30px rgba(15,23,42,0.05); min-width: 0; }
    .prog-sidebar { position: sticky; top: 116px; }
    .prog-sidebar-card { background: linear-gradient(160deg, #ffffff 0%, #eef2ff 100%); }
    .prog-card__head { display: flex; align-items: center; gap: 10px; padding: 16px 20px 0; }
    .prog-card__title { margin: 0; font-size: 15px; font-weight: 800; color: #0f172a; flex: 1; }
    .prog-sidebar-icon { display: inline-flex; align-items: center; justify-content: center; width: 30px; height: 30px; border-radius: 0.5rem; background: #e0e7ff; color: #4338ca; flex-shrink: 0; }
    .prog-sidebar-icon svg { width: 15px; height: 15px; }
    .prog-card__body { padding: 14px 20px 18px; }
    .prog-divider { border: none; border-top: 1px solid #e2e8f0; margin: 12px 0; }
    /* GridView table */
    .prog-gv-wrap { overflow-x: auto; border-radius: 0.5rem; border: 1px solid #e2e8f0; }
    .prog-gv-wrap table { width: 100%; font-size: 13px; color: #475569; border-collapse: collapse; background: #fff; }
    .prog-gv-wrap th { background: #f8fafc; font-weight: 700; padding: 7px 10px; text-align: left; border-bottom: 1px solid #e2e8f0; }
    .prog-gv-wrap td { padding: 6px 10px; border-bottom: 1px solid #f1f5f9; }
    /* Action buttons */
    .prog-btn-stack { display: flex; flex-direction: column; gap: 8px; align-items: center; margin-top: 12px; }
    .prog-btn { display: inline-flex; align-items: center; justify-content: center; width: 100%; min-height: 38px; padding: 0 14px; border-radius: 0.375rem; font-size: 13px; font-weight: 700; cursor: pointer; border: none; transition: transform 0.18s, background 0.18s; }
    .prog-btn-primary { background: linear-gradient(135deg, #3b82f6 0%, #4f46e5 100%); color: #fff; box-shadow: 0 2px 8px rgba(79,70,229,0.25); }
    .prog-btn-primary:hover { transform: translateY(-1px); box-shadow: 0 4px 14px rgba(79,70,229,0.35); }
    .prog-btn-outline-green { display: inline-flex; align-items: center; justify-content: center; width: 100%; min-height: 38px; padding: 0 14px; border-radius: 0.375rem; font-size: 13px; font-weight: 700; text-decoration: none; cursor: pointer; background: #f0fdf4; color: #14532d; border: 2px solid #86efac; transition: transform 0.18s; }
    .prog-btn-outline-green:hover { transform: translateY(-1px); background: #dcfce7; }
    /* skin overrides for BtnIdle (buttonSkinPink injects inline styles) */
    .prog-btn-stack input.prog-btn-primary,
    .prog-btn-stack input[type=submit].prog-btn-primary,
    .prog-btn-stack input[type=button].prog-btn-primary {
        width: 100% !important;
        min-height: 38px !important;
        height: auto !important;
        font-size: 13px !important;
        font-weight: 700 !important;
        background: linear-gradient(135deg, #3b82f6 0%, #4f46e5 100%) !important;
        color: #fff !important;
        border: none !important;
        border-radius: 0.375rem !important;
        box-sizing: border-box !important;
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        cursor: pointer !important;
    }
    /* score label color */
    .score-label { font-weight: 700; color: #059669; }
</style>

<asp:Label ID="LabelCid" runat="server" Visible="False"></asp:Label>
<asp:Label ID="LabelLid" runat="server" Visible="False"></asp:Label>
<asp:Label ID="LabelNid" runat="server" Visible="False"></asp:Label>

<div class="prog-wrap">
<div class="prog-grid">

    <!-- Main Content -->
    <div class="prog-card" style="background:linear-gradient(160deg,#fff 0%,#f0f7ff 100%);">
        <div class="prog-card__body">
            <div style="text-align:center;padding-bottom:20px;border-bottom:1px solid #e2e8f0;margin-bottom:16px;">
                <asp:Label ID="LabelMtitle" runat="server" style="font-size:clamp(18px,2.5vw,24px);font-weight:800;color:#0f172a;letter-spacing:-0.02em;"></asp:Label>
            </div>
            <div id="Mcontent" style="color:#334155;line-height:1.85;font-size:1.05rem;word-wrap:break-word;word-break:break-word;" runat="server"></div>
        </div>
    </div>

    <!-- Right Sidebar -->
    <div class="prog-sidebar">
        <div class="prog-card prog-sidebar-card">
            <div class="prog-card__head">
                <div class="prog-sidebar-icon">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path></svg>
                </div>
                <h3 class="prog-card__title">测评面板</h3>
            </div>
            <div class="prog-card__body">
                <link href="../kindeditor/themes/me/me.css" rel="stylesheet" type="text/css" />
                <script charset="utf-8" src="../kindeditor/kindeditor-min.js" type="text/javascript"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js" type="text/javascript"></script>

                <div class="prog-gv-wrap">
                    <asp:GridView ID="GVSolve" runat="server" EnableModelValidation="True"
                        AutoGenerateColumns="False" onrowdatabound="GVSolve_RowDataBound"
                        Width="100%" CssClass="">
                        <Columns>
                            <asp:BoundField HeaderText="题目">
                                <HeaderStyle />
                                <ItemStyle />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="得分">
                                <ItemTemplate>
                                    <asp:Label ID="Labelscore" runat="server" Text='<%# Bind("Vscore") %>' CssClass="score-label"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Labelflag" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="prog-btn-stack">
                    <asp:Button ID="BtnIdle" runat="server" Font-Bold="True"
                        SkinID="buttonSkinPink" Text="开始测评" onclick="BtnIdle_Click"
                        CssClass="prog-btn prog-btn-primary" />

                    <asp:ImageButton ID="Btnclock" runat="server" ImageUrl="~/images/clock.gif"
                        onclick="Btnclock_Click" style="width:32px;height:32px;opacity:0.7;transition:opacity 0.2s;" />

                    <asp:Image ID="Imagepass" runat="server" ImageUrl="~/images/pass.png" style="width:72px;height:auto;opacity:0.85;" />

                    <asp:HyperLink ID="Hlsolve" runat="server" Target="_blank"
                        CssClass="prog-btn-outline-green">班级测评报告</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</asp:Content>
