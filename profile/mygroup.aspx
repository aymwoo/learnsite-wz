<%@ Page Title="" Language="C#" MasterPageFile="~/profile/Pf.master"  StylesheetTheme="Student"  AutoEventWireup="true" CodeFile="mygroup.aspx.cs" Inherits="Profile_mygroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cstu" Runat="Server">
<style>
.pf-start{padding:20px 16px;background:linear-gradient(180deg,#f8fbff 0%,#f3f7ff 100%);font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;color:#0f172a}
.pf-start *{box-sizing:border-box}
.pf-card{border:1px solid #dbe6f5;border-radius:1rem;background:#fff;box-shadow:0 8px 24px rgba(15,23,42,.06);overflow:hidden;margin-bottom:16px}
.pf-card__head{padding:14px 18px;border-bottom:1px solid #f1f5f9;display:flex;align-items:center;gap:10px}
.pf-card__icon{width:34px;height:34px;border-radius:.75rem;background:#eef2ff;border:1px solid #c7d2fe;display:inline-flex;align-items:center;justify-content:center;flex-shrink:0}
.pf-card__title{margin:0;font-size:15px;font-weight:800;color:#0f172a;letter-spacing:-.02em}
.pf-card__body{padding:16px 18px 18px}
/* GridView table */
.pf-grid-wrap{overflow-x:auto;border-radius:.75rem;border:1px solid #e2e8f0}
.pf-grid-wrap table{width:100%;border-collapse:collapse;font-size:13px}
.pf-grid-wrap th{background:#f8fafc;padding:9px 12px;font-weight:700;color:#475569;font-size:11px;text-transform:uppercase;letter-spacing:.05em;border-bottom:1px solid #e2e8f0;text-align:left;white-space:nowrap}
.pf-grid-wrap td{padding:10px 12px;border-bottom:1px solid #f1f5f9;color:#1e293b;vertical-align:middle}
.pf-grid-wrap tr:last-child td{border-bottom:0}
.pf-grid-wrap tr:hover td{background:#f8fafc}
/* action links in GridView */
.pf-grid-wrap a{display:inline-flex;align-items:center;justify-content:center;min-height:28px;padding:0 10px;border-radius:.5rem;font-size:12px;font-weight:700;text-decoration:none;background:#eff6ff;color:#2563eb;border:1px solid #bfdbfe;margin-right:4px;cursor:pointer;transition:background .2s}
.pf-grid-wrap a:hover{background:#dbeafe}
/* pager */
.pf-pager{display:flex;align-items:center;gap:6px;padding:10px 12px;background:#f8fafc;font-size:12px;color:#64748b;flex-wrap:wrap}
.pf-pager a{display:inline-flex;align-items:center;justify-content:center;min-height:28px;padding:0 10px;border-radius:.5rem;border:1px solid #e2e8f0;background:#fff;color:#475569;font-size:11px;font-weight:700;text-decoration:none;cursor:pointer;transition:background .2s}
.pf-pager a:hover{background:#eff6ff;border-color:#bfdbfe;color:#2563eb}
/* edit name row */
.pf-name-row{display:flex;align-items:center;gap:8px;flex-wrap:wrap;padding:12px 0}
.pf-name-label{font-size:12px;font-weight:700;color:#475569;white-space:nowrap}
.pf-input{min-height:38px!important;padding:0 12px!important;border:1px solid #cbd5e1!important;border-radius:.625rem!important;background:#f8fafc!important;color:#0f172a!important;font-size:13px!important;transition:border-color .2s!important}
.pf-input:focus{border-color:#60a5fa!important;outline:none!important;background:#fff!important;box-shadow:0 0 0 3px rgba(96,165,250,.18)!important}
.pf-btn-sm{display:inline-flex!important;align-items:center!important;justify-content:center!important;min-height:36px!important;padding:0 16px!important;border-radius:.625rem!important;border:0!important;font-size:13px!important;font-weight:700!important;cursor:pointer!important;color:#fff!important;background:linear-gradient(135deg,#2563eb 0%,#1d4ed8 100%)!important;box-shadow:0 4px 12px rgba(37,99,235,.2)!important;white-space:nowrap!important;transition:transform .18s!important}
.pf-btn-sm:hover{transform:translateY(-1px)!important}
.pf-free-box{padding:12px 14px;background:#f0f9ff;border:1px solid #bae6fd;border-radius:.75rem;font-size:13px;color:#0369a1;line-height:1.8}
.pf-free-title{font-size:11px;font-weight:700;color:#475569;text-transform:uppercase;letter-spacing:.05em;margin-bottom:6px}
</style>
<div class="pf-start">
  <!-- 小组列表 -->
  <div class="pf-card">
    <div class="pf-card__head">
      <div class="pf-card__icon">
        <svg width="17" height="17" fill="none" stroke="#4f46e5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
      </div>
      <h2 class="pf-card__title">小组申请</h2>
    </div>
    <div class="pf-card__body">
      <asp:Panel ID="Panelapply" runat="server">
        <div class="pf-grid-wrap">
          <asp:GridView ID="GVgroup" runat="server"
              AutoGenerateColumns="False" SkinID="GridViewInfo"
              onrowdatabound="GVgroup_RowDataBound"
              Width="100%" EnableModelValidation="True" CellPadding="0"
              DataKeyNames="Sid" onrowcommand="GVgroup_RowCommand"
              CssClass="w-full" GridLines="None" BorderWidth="0">
              <Columns>
                  <asp:BoundField HeaderText="序号" Visible="false"><ItemStyle Width="40px" /></asp:BoundField>
                  <asp:BoundField DataField="Sgtitle" HeaderText="小组名称"><ItemStyle Width="120px" HorizontalAlign="Left" /></asp:BoundField>
                  <asp:TemplateField HeaderText="组长">
                      <ItemTemplate>
                          <asp:Image ID="Imageflag" runat="server" ImageUrl="~/images/gflag.gif" style="vertical-align:middle;margin-right:4px" />
                          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Sname") %>'></asp:Label>
                      </ItemTemplate>
                      <ItemStyle Width="90px" HorizontalAlign="Left" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="成员">
                      <ItemTemplate>
                          <asp:Label ID="Labelmember" runat="server"></asp:Label>
                      </ItemTemplate>
                      <ItemStyle HorizontalAlign="Left" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="操作" ShowHeader="False">
                      <ItemTemplate>
                          <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"
                              CommandArgument='<%# Eval("Sid") %>' CommandName="AddGroup" Text="参加"></asp:LinkButton>
                          <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false"
                              CommandArgument='<%# Eval("Sid") %>' CommandName="outGroup" Text="退组"></asp:LinkButton>
                      </ItemTemplate>
                      <ItemStyle Width="90px" />
                  </asp:TemplateField>
              </Columns>
              <RowStyle Height="38px" />
          </asp:GridView>
        </div>
      </asp:Panel>

      <asp:Panel ID="PanelSgtitle" runat="server">
        <div class="pf-name-row">
          <span class="pf-name-label">我的小组名称：</span>
          <asp:TextBox ID="TextBox1" runat="server" CssClass="pf-input"></asp:TextBox>
          <asp:Button ID="BtnSgtitle" runat="server" onclick="BtnSgtitle_Click" SkinID="buttonSkin" Text="修改" CssClass="pf-btn-sm" />
        </div>
      </asp:Panel>
    </div>
  </div>

  <!-- 未加入小组的同学 -->
  <div class="pf-card">
    <div class="pf-card__head">
      <div class="pf-card__icon">
        <svg width="17" height="17" fill="none" stroke="#0891b2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/></svg>
      </div>
      <h2 class="pf-card__title">未加入小组的同学</h2>
    </div>
    <div class="pf-card__body">
      <div class="pf-free-box">
        <asp:Label ID="Labelfree" runat="server"></asp:Label>
      </div>
    </div>
  </div>
</div>
</asp:Content>

