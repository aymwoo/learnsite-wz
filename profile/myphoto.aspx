<%@ Page Title="" Language="C#" MasterPageFile="~/profile/Pf.master"  StylesheetTheme="Student"  AutoEventWireup="true" CodeFile="myphoto.aspx.cs" Inherits="Profile_myphoto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cstu" Runat="Server">
<link href="../js/fileupload.css" rel="stylesheet" />
<style>
.pf-start{padding:20px 16px;background:linear-gradient(180deg,#f8fbff 0%,#f3f7ff 100%);font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;color:#0f172a}
.pf-start *{box-sizing:border-box}
.pf-card{border:1px solid #dbe6f5;border-radius:1rem;background:#fff;box-shadow:0 8px 24px rgba(15,23,42,.06);overflow:hidden;max-width:420px;margin:0 auto}
.pf-card__head{padding:16px 20px;border-bottom:1px solid #f1f5f9;display:flex;align-items:center;gap:10px}
.pf-card__icon{width:36px;height:36px;border-radius:.75rem;background:#fff7ed;border:1px solid #fed7aa;display:inline-flex;align-items:center;justify-content:center;flex-shrink:0}
.pf-card__title{margin:0;font-size:16px;font-weight:800;color:#0f172a;letter-spacing:-.02em}
.pf-card__body{padding:20px;display:flex;flex-direction:column;align-items:center;gap:16px}
.pf-photo-wrap{width:160px;height:160px;border-radius:1rem;overflow:hidden;border:3px solid #fed7aa;box-shadow:0 8px 24px rgba(234,88,12,.12);background:#fff7ed;display:flex;align-items:center;justify-content:center}
.pf-photo-wrap img{width:100%;height:100%;object-fit:cover}
.pf-btn{display:inline-flex!important;align-items:center!important;justify-content:center!important;min-height:44px!important;width:100%!important;padding:0!important;border-radius:.75rem!important;border:0!important;font-size:14px!important;font-weight:700!important;cursor:pointer!important;color:#fff!important;background:linear-gradient(135deg,#ea580c 0%,#c2410c 100%)!important;box-shadow:0 8px 20px rgba(234,88,12,.22)!important;transition:transform .18s!important}
.pf-btn:hover{transform:translateY(-1px)!important}
.pf-btn[disabled]{opacity:.55!important;cursor:not-allowed!important;transform:none!important;box-shadow:none!important}
.pf-msg{display:block;width:100%;padding:10px 14px;border-radius:.75rem;font-size:13px;background:#fee2e2;color:#991b1b;border:1px solid #fecaca;text-align:center}
.pf-note{font-size:12px;color:#94a3b8;text-align:center;line-height:1.6;background:#f8fafc;border-radius:.5rem;padding:10px 14px;border:1px solid #e2e8f0;width:100%}
</style>
<div class="pf-start">
  <div class="pf-card">
    <div class="pf-card__head">
      <div class="pf-card__icon">
        <svg width="18" height="18" fill="none" stroke="#ea580c" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
      </div>
      <h2 class="pf-card__title">修改相片</h2>
    </div>
    <div class="pf-card__body">
      <asp:Panel ID="Panel1" runat="server">
        <div class="pf-photo-wrap">
          <asp:Image ID="Imageface" runat="server" style="max-width:160px;max-height:160px;object-fit:cover" />
        </div>
        <div class="ls-upload" data-accept=".jpg,.jpeg,.png" data-max-size="2048" data-label="点击或拖拽上传相片" data-hint="支持 jpg / jpeg / png，最大 2048 KB">
          <asp:FileUpload ID="PhotoFileUpload" runat="server" />
        </div>
        <asp:Button ID="Btnphoto" runat="server" Enabled="False" onclick="Btnphoto_Click" SkinID="buttonSkin" Text="提交相片" CssClass="pf-btn" />
        <asp:Label ID="Labelstr" runat="server" SkinID="LabelMsgRed" CssClass="pf-msg"></asp:Label>
        <p class="pf-note">支持 jpg / jpeg / png，大小不超过 2048 KB，过大将自动缩小至宽 320px</p>
      </asp:Panel>
    </div>
  </div>
</div>
<script src="../js/fileupload.js"></script>
</asp:Content>

