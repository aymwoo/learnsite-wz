<%@ Page Language="C#" AutoEventWireup="true" StylesheetTheme="Teacher" CodeFile="softnomic.aspx.cs" Inherits="Teacher_softnomic" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>自学园作品评价与展示</title>
    <style type="text/css">
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            color: #0f172a;
            min-height: 100vh;
        }

        .nomic-page {
            max-width: 960px;
            margin: 0 auto;
            padding: 24px 20px;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        /* Hero */
        .nomic-hero {
            position: relative;
            overflow: hidden;
            border: 1px solid #dbe6f5;
            border-radius: 0.75rem;
            padding: 20px 24px;
            background:
                radial-gradient(circle at top left, rgba(59, 130, 246, 0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #1d4ed8 52%, #38bdf8 100%);
            color: #eff6ff;
            box-shadow: 0 20px 48px rgba(37, 99, 235, 0.18);
        }

        .nomic-hero__title {
            font-size: 22px;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .nomic-hero__subtitle {
            margin-top: 6px;
            font-size: 13px;
            color: rgba(239, 246, 255, 0.85);
            line-height: 1.6;
        }

        /* Card */
        .nomic-card {
            border: 1px solid #dbe6f5;
            border-radius: 0.75rem;
            background: rgba(255, 255, 255, 0.96);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
        }

        .nomic-card--filter {
            background: linear-gradient(160deg, #ffffff 0%, #f0f7ff 100%);
        }

        .nomic-card--controls {
            background: linear-gradient(160deg, #ffffff 0%, #f5f3ff 100%);
        }

        .nomic-card--preview {
            background: linear-gradient(160deg, #ffffff 0%, #f0fdfa 100%);
        }

        .nomic-card__head {
            padding: 16px 20px 0;
        }

        .nomic-card__title {
            font-size: 15px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: -0.02em;
        }

        .nomic-card__body {
            padding: 14px 20px 18px;
        }

        /* Filter form */
        .nomic-filter-grid {
            display: grid;
            gap: 12px;
            grid-template-columns: 1fr 1fr;
        }

        .nomic-field {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .nomic-field--full {
            grid-column: span 2;
        }

        .nomic-label {
            font-size: 12px;
            font-weight: 700;
            color: #334155;
        }

        .nomic-select {
            width: 100%;
            min-height: 38px;
            padding: 0 12px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 13px;
            font-weight: 600;
            transition: border-color 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }

        .nomic-select:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        /* Control toolbar */
        .nomic-toolbar {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            align-items: center;
        }

        .nomic-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 34px;
            padding: 0 14px;
            border-radius: 0.375rem;
            border: none;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.18s, box-shadow 0.18s, background-color 0.18s;
        }

        .nomic-btn:hover {
            transform: translateY(-1px);
        }

        .nomic-btn--primary {
            color: #ffffff;
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
        }

        .nomic-btn--danger {
            color: #ffffff;
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.2);
        }

        .nomic-btn--ghost {
            color: #475569;
            background: #f1f5f9;
            border: 1px solid #e2e8f0;
        }

        .nomic-btn--ghost:hover {
            background: #e2e8f0;
        }

        .nomic-nav-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 34px;
            padding: 0 12px;
            border-radius: 0.375rem;
            border: 1px solid #e2e8f0;
            background: #ffffff;
            cursor: pointer;
            transition: background-color 0.15s, border-color 0.15s;
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .nomic-nav-btn:hover {
            background: #f1f5f9;
            border-color: #c7d2fe;
        }

        .nomic-student-select {
            min-width: 120px;
            min-height: 34px;
            padding: 0 10px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #ffffff;
            color: #0f172a;
            font-size: 13px;
            font-weight: 700;
        }

        .nomic-student-select:focus {
            border-color: #60a5fa;
            outline: none;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        .nomic-counter {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
            padding: 0 6px;
        }

        .nomic-divider {
            width: 1px;
            height: 24px;
            background: #e2e8f0;
            margin: 0 4px;
        }

        /* Scoring section */
        .nomic-score-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
            margin-top: 12px;
        }

        .nomic-comment-input {
            flex: 1;
            min-width: 180px;
            min-height: 34px;
            padding: 6px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #fffbeb;
            color: #0f172a;
            font-size: 13px;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .nomic-comment-input:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        .nomic-grade-group {
            display: inline-flex;
            gap: 2px;
            background: #f1f5f9;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            padding: 2px;
        }

        .nomic-grade-group label,
        .nomic-grade-group span {
            display: inline-flex;
            align-items: center;
            gap: 3px;
            padding: 4px 8px;
            font-size: 12px;
            font-weight: 700;
            color: #475569;
            border-radius: 0.25rem;
            cursor: pointer;
            transition: background-color 0.15s, color 0.15s;
        }

        .nomic-grade-group label:hover,
        .nomic-grade-group span:hover {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .nomic-grade-group input[type="radio"] {
            margin: 0;
        }

        .nomic-check-group {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 4px 10px;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            background: #f8fafc;
            font-size: 12px;
            font-weight: 600;
            color: #475569;
        }

        /* Preview area */
        .nomic-preview {
            min-height: 200px;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            background: #ffffff;
            padding: 16px;
            overflow: auto;
        }

        .nomic-preview object,
        .nomic-preview embed,
        .nomic-preview iframe,
        .nomic-preview img {
            max-width: 100%;
        }

        /* Refresh button */
        .nomic-refresh {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 34px;
            padding: 0 14px;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            background: #f8fafc;
            cursor: pointer;
            transition: background-color 0.15s;
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .nomic-refresh:hover {
            background: #e2e8f0;
        }

        .nomic-hidden {
            display: none;
        }

        @media (max-width: 768px) {
            .nomic-page {
                padding: 16px 12px;
            }

            .nomic-hero {
                padding: 16px;
            }

            .nomic-hero__title {
                font-size: 18px;
            }

            .nomic-filter-grid {
                grid-template-columns: 1fr;
            }

            .nomic-field--full {
                grid-column: span 1;
            }

            .nomic-card__body {
                padding: 12px 14px 16px;
            }

            .nomic-score-row {
                flex-direction: column;
                align-items: stretch;
            }

            .nomic-comment-input {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="nomic-page">
            <div class="nomic-hero">
                <h1 class="nomic-hero__title">自学作品评价</h1>
                <p class="nomic-hero__subtitle">浏览学生自学作品，进行评分和评语反馈。</p>
            </div>

            <div class="nomic-card nomic-card--filter">
                <div class="nomic-card__head">
                    <h2 class="nomic-card__title">资源筛选</h2>
                </div>
                <div class="nomic-card__body">
                    <div class="nomic-filter-grid">
                        <div class="nomic-field">
                            <span class="nomic-label">资源分类</span>
                            <asp:DropDownList ID="DDLCategory" runat="server"
                                AutoPostBack="True" CssClass="nomic-select"
                                onselectedindexchanged="DDLCategory_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="nomic-field">
                            <span class="nomic-label">资源标题</span>
                            <asp:DropDownList ID="DDLsoft" runat="server"
                                AutoPostBack="True" CssClass="nomic-select"
                                onselectedindexchanged="DDLsoft_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <div class="nomic-card nomic-card--controls">
                <div class="nomic-card__head">
                    <h2 class="nomic-card__title">播放控制与评分</h2>
                </div>
                <div class="nomic-card__body">
                    <div class="nomic-toolbar">
                        <asp:Button ID="Btnflash" runat="server" Text="刷新"
                            onclick="Btnflash_Click" SkinID="BtnSmall"
                            CssClass="nomic-btn nomic-btn--primary" />
                        <asp:Button ID="Btnrestart" runat="server" Text="重新"
                            onclick="Btnrestart_Click" SkinID="BtnSmall"
                            CssClass="nomic-btn nomic-btn--ghost" />
                        <asp:Button ID="Btnstop" runat="server" Text="继续"
                            onclick="Btnstop_Click" SkinID="BtnSmall"
                            CssClass="nomic-btn nomic-btn--ghost" />

                        <div class="nomic-divider"></div>

                        <asp:Button ID="ImgBtnLeft" runat="server"
                            Text="上一项" OnClick="ImgBtnLeft_Click"
                            CssClass="nomic-nav-btn" />
                        <asp:DropDownList ID="DDLstore" runat="server"
                            AutoPostBack="True" CssClass="nomic-student-select"
                            onselectedindexchanged="DDLstore_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="ImgBtnright" runat="server"
                            Text="下一项" OnClick="ImgBtnright_Click"
                            CssClass="nomic-nav-btn" />
                        <asp:Label ID="Labelnum" runat="server" CssClass="nomic-counter"></asp:Label>
                    </div>

                    <asp:Label ID="lbcurindex" runat="server" Text="0" CssClass="nomic-hidden"></asp:Label>

                    <div class="nomic-score-row">
                        <span class="nomic-label">教师评语</span>
                        <asp:TextBox ID="TextBoxWself" runat="server" CssClass="nomic-comment-input"></asp:TextBox>
                        <asp:RadioButtonList ID="RBLselect" runat="server" RepeatDirection="Horizontal"
                            AutoPostBack="True" RepeatLayout="Flow" CssClass="nomic-grade-group"
                            onselectedindexchanged="RBLselect_SelectedIndexChanged">
                            <asp:ListItem>G</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                            <asp:ListItem>O</asp:ListItem>
                        </asp:RadioButtonList>
                        <span class="nomic-check-group">
                            <asp:CheckBox ID="CkFlash" runat="server"
                                oncheckedchanged="CkFlash_CheckedChanged" Text="FlashLoop"
                                ToolTip="Flash播放循环设置" AutoPostBack="True" />
                        </span>
                        <asp:Button ID="Btndel" runat="server" Text="删除"
                            onclick="Btndel_Click" SkinID="BtnSmall"
                            ToolTip="删除该作品，不可恢复！" CssClass="nomic-btn nomic-btn--danger" />
                    </div>
                </div>
            </div>

            <div class="nomic-card nomic-card--preview">
                <div class="nomic-card__head">
                    <h2 class="nomic-card__title">作品预览</h2>
                </div>
                <div class="nomic-card__body">
                    <div class="nomic-preview">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </div>
                    <div style="margin-top: 12px; text-align: center;">
                        <asp:Button ID="ImgBtn" runat="server" Text="刷新展播"
                            OnClick="ImgBtn_Click" ToolTip="循环展播专用刷新" CssClass="nomic-refresh" />
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function myrefresh() {
                var stxt = document.getElementById("<%= Btnstop.ClientID %>").value;
                if (stxt == "暂停") {
                    document.getElementById("<%= ImgBtn.ClientID %>").click();
                }
            }
            setTimeout("myrefresh()", 8000);
        </script>
    </form>
</body>
</html>
