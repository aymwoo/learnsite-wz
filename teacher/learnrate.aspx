<%@ Page Language="C#" AutoEventWireup="true" CodeFile="learnrate.aspx.cs" Inherits="teacher_learnrate" ResponseEncoding="utf-8" Culture="zh-CN" UICulture="zh-CN" %>

<%@ Register assembly="Anthem" namespace="Anthem" tagprefix="anthem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <title></title>

    <link href="../js/css/tailwind-utilities.css" rel="stylesheet">
    <style type="text/css">
        body {
            margin: 0;
            font-family: "Segoe UI", "Microsoft YaHei", Arial, sans-serif;
            background: linear-gradient(180deg, #f8fbff 0%, #eef4ff 100%);
            color: #0f172a;
        }

        .lr-page {
            min-height: 100vh;
            padding: 24px;
        }

        .lr-shell {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .lr-hero {
            border: 1px solid #1e3a8a;
            border-radius: 1rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(99, 102, 241, 0.22), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #312e81 52%, #4f46e5 100%);
            color: #eff6ff;
            box-shadow: 0 24px 54px rgba(79, 70, 229, 0.2);
        }

        .lr-hero__row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 16px;
            align-items: center;
        }

        .lr-title {
            margin: 0;
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .lr-subtitle {
            margin: 8px 0 0;
            font-size: 14px;
            color: rgba(239, 246, 255, 0.86);
        }

        .lr-toolbar {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: center;
            padding: 12px 16px;
            border-radius: 0.9rem;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.18);
            backdrop-filter: blur(8px);
        }

        .lr-toolbar-label {
            font-size: 13px;
            font-weight: 700;
            color: rgba(239,246,255,0.9);
            white-space: nowrap;
        }

        .lr-select {
            min-width: 240px;
            min-height: 40px;
            padding: 0 12px;
            border: 1px solid rgba(255,255,255,0.25);
            border-radius: 0.65rem;
            background: rgba(255,255,255,0.96);
            color: #0f172a;
            font-size: 14px;
            font-weight: 700;
            outline: none;
        }

        .lr-card {
            border: 1px solid #dbe6f5;
            border-radius: 1rem;
            background: rgba(255,255,255,0.98);
            box-shadow: 0 14px 34px rgba(15, 23, 42, 0.06);
            overflow: hidden;
        }

        .lr-card__head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            padding: 18px 22px;
            border-bottom: 1px solid #eef2ff;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
        }

        .lr-card__title {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            color: #0f172a;
        }

        .lr-card__desc {
            margin: 4px 0 0;
            font-size: 13px;
            color: #64748b;
        }

        .lr-refresh {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 40px;
            padding: 0 18px;
            border: none;
            border-radius: 0.75rem;
            font-size: 13px;
            font-weight: 700;
            color: #ffffff;
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            box-shadow: 0 10px 22px rgba(79, 70, 229, 0.22);
            cursor: pointer;
        }

        .lr-grid-wrap {
            padding: 18px;
            overflow-x: auto;
        }

        .lr-grid-wrap table {
            width: 100%;
            min-width: 720px;
            border-collapse: separate;
            border-spacing: 0;
            background: #ffffff;
        }

        .lr-grid-wrap th {
            padding: 12px 10px;
            background: linear-gradient(135deg, #334155 0%, #1e293b 100%);
            color: #f8fafc;
            font-size: 12px;
            font-weight: 800;
            text-align: center;
            border-right: 1px solid rgba(255,255,255,0.08);
            white-space: nowrap;
        }

        .lr-grid-wrap td {
            height: 38px;
            padding: 8px 10px;
            border-right: 1px solid #f1f5f9;
            border-bottom: 1px solid #f1f5f9;
            font-size: 13px;
            text-align: center;
            color: #334155;
            white-space: nowrap;
        }

        .lr-grid-wrap tr:nth-child(even) td {
            background: #fcfdff;
        }

        .lr-grid-wrap tr:hover td {
            background: #f8faff;
        }

        .lr-msg {
            padding: 0 22px 18px;
            font-size: 12px;
            color: #64748b;
            text-align: right;
        }

        @media (max-width: 768px) {
            .lr-page { padding: 16px; }
            .lr-hero { padding: 20px; }
            .lr-title { font-size: 22px; }
            .lr-select { min-width: 100%; width: 100%; }
            .lr-toolbar { width: 100%; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="lr-page">
        <div class="lr-shell">
            <div class="lr-hero">
                <div class="lr-hero__row">
                    <div>
                        <h1 class="lr-title">学习进度</h1>
                        <p class="lr-subtitle">按学案项目查看班级学习节奏，颜色越深表示用时越长。</p>
                    </div>
                    <div class="lr-toolbar">
                        <span class="lr-toolbar-label"><asp:Label ID="LabelGradeClass" runat="server"></asp:Label></span>
                        <asp:DropDownList ID="DDLCid" runat="server" CssClass="lr-select" AutoPostBack="True"
                            onselectedindexchanged="DDLCid_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="lr-card">
                <div class="lr-card__head">
                    <div>
                        <h2 class="lr-card__title">班级进度热力表</h2>
                        <p class="lr-card__desc">绿色较浅表示完成较快，绿色较深表示停留更久。</p>
                    </div>
                    <asp:Button ID="BtnreflashText" runat="server" Text="刷新数据" CssClass="lr-refresh" OnClick="BtnreflashText_Click" />
                </div>
                <div class="lr-grid-wrap">
                    <anthem:GridView ID="GridViewclass" runat="server" OnRowDataBound="GridViewclass_RowDataBound"
                        TabIndex="1" CellPadding="2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                        BorderWidth="2px" Font-Names="Arial" HorizontalAlign="Center"
                        EnableModelValidation="True">
                        <RowStyle HorizontalAlign="Center" BorderStyle="None" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#305E9C" Font-Bold="True" ForeColor="White" />
                    </anthem:GridView>
                </div>
                <div class="lr-msg">
                    <asp:Label ID="Labelmsg" runat="server"></asp:Label>
                </div>
            </div>

            <asp:Button ID="Btnreflash" runat="server" Text="刷新" OnClick="Btnreflash_Click" Style="display:none;" />
        </div>
    </div>

    <script type ="text/javascript" >
        function myrefresh() {
            document.getElementById("<%= Btnreflash.ClientID %>").click();
        }
        setTimeout("myrefresh()", 5000); //指定5秒刷新一次作品
    </script>
    </form>
</body>
</html>
