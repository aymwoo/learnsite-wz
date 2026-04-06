<%@ Page Title="" Language="C#" StylesheetTheme="Teacher" AutoEventWireup="true"   CodeFile="notsign.aspx.cs" Inherits="Teacher_notsign" ResponseEncoding="utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
<title></title>
    <link href="../App_Themes/Teacher/admin-form.css" rel="stylesheet" />
    <style type="text/css">
        .popup-page {
            --admin-form-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef6ff 100%);
            --admin-form-hero-bg: linear-gradient(135deg, #0f766e 0%, #0f9b8e 55%, #22c55e 100%);
            --admin-form-hero-shadow: 0 22px 45px -28px rgba(15, 118, 110, 0.72);
            --admin-form-primary-bg: #0f766e;
            --admin-form-primary-hover: #0d675f;
            --admin-form-primary-shadow: 0 14px 24px -18px rgba(15, 118, 110, 0.85);
            --admin-form-focus: #14b8a6;
            --admin-form-focus-ring: rgba(20, 184, 166, 0.14);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="admin-form-page popup-page">
        <div class="admin-form-shell">
            <section class="admin-form-hero">
                <div class="admin-form-hero-content">
                    <div class="admin-form-eyebrow">Absence Note</div>
                    <h1 class="admin-form-title">缺席备注</h1>
                    <p class="admin-form-subtitle">为 <asp:Label ID="Labelname" runat="server" Font-Bold="True"></asp:Label> 同学填写缺席原因。</p>
                </div>
            </section>
            <section class="admin-form-panel">
                <h2 class="admin-form-section-title">备注内容</h2>
                <p class="admin-form-section-desc">填写后提交，备注将显示在未签到列表中。</p>
                <asp:TextBox ID="TextBox1" runat="server" Width="220px" Height="112px"
                    BackColor="#FFE7CE" TextMode="MultiLine" CssClass="admin-form-input admin-form-textarea"></asp:TextBox>
                <div style="margin-top:1rem;"><asp:Label ID="Labelmsg" runat="server"></asp:Label></div>
            </section>
            <section class="admin-form-actions">
                <div class="admin-form-action-row">
                    <asp:Button ID="Btnnotsign" runat="server" Text="确定"
                        onclick="Btnnotsign_Click" CssClass="admin-form-btn admin-form-btn--primary" />
                </div>
            </section>
        </div>
    </div>
    </form>
</body>
</html>
