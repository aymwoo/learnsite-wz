<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="Teacher_signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .signin-page {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            --ls-primary-soft: #dbeafe;
            --ls-success: #16a34a;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
            min-height: calc(100vh - 8rem);
        }

        .signin-page * {
            box-sizing: border-box;
        }

        .lesson-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .lesson-hero {
            position: relative;
            overflow: hidden;
            border: 1px solid var(--ls-border);
            border-radius: 1rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(59, 130, 246, 0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #0d9488 52%, #2dd4bf 100%);
            color: #eff6ff;
            box-shadow: 0 20px 40px rgba(13, 148, 136, 0.15);
        }

        .lesson-hero__content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }

        .lesson-hero__title {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.02em;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .lesson-hero__subtitle {
            margin: 6px 0 0;
            font-size: 14px;
            color: rgba(239, 246, 255, 0.88);
        }

        .filter-group {
            display: flex;
            align-items: center;
            gap: 12px;
            background: rgba(255, 255, 255, 0.12);
            padding: 8px 16px;
            border-radius: 1rem;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .filter-item {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .filter-label {
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: rgba(255, 255, 255, 0.7);
        }

        .filter-select {
            background: transparent;
            border: none;
            color: #ffffff;
            font-weight: 800;
            font-size: 15px;
            cursor: pointer;
            outline: none;
            padding: 2px 4px;
        }
        
        .filter-select option {
            color: #334155;
        }

        .lesson-card {
            border: 1px solid var(--ls-border);
            border-radius: 1rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
            overflow: hidden;
        }

        .action-bar {
            padding: 20px 24px;
            background: #ffffff;
            border-bottom: 1px solid var(--ls-border);
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .signin-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            padding: 0 20px;
            border-radius: 0.85rem;
            font-size: 13px;
            font-weight: 700;
            transition: all 0.2s;
            cursor: pointer;
            border: none;
        }

        .signin-btn--primary {
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            color: #ffffff;
            box-shadow: 0 8px 16px rgba(79, 70, 229, 0.2);
        }

        .signin-btn--primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 10px 20px rgba(79, 70, 229, 0.3);
        }

        .signin-btn--outline {
            background: #ffffff;
            color: #475569;
            border: 1px solid #e2e8f0;
        }

        .signin-btn--outline:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
        }

        /* GridView Styling */
        .signin-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .signin-grid th {
            background: #f8fafc;
            padding: 16px;
            font-size: 13px;
            font-weight: 700;
            color: #64748b;
            text-align: center;
            border-bottom: 2px solid #f1f5f9;
        }

        .signin-grid td {
            padding: 14px 16px;
            font-size: 14px;
            color: #334155;
            border-bottom: 1px solid #f1f5f9;
            text-align: center;
        }

        .signin-grid tbody tr {
            display: table-row;
        }

        .signin-grid tbody tr:hover {
            background-color: #f1f5f9;
        }

        .signin-grid tbody tr:hover td {
            background-color: transparent;
        }

        .view-link {
            color: #4f46e5;
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .view-link:hover {
            color: #3730a3;
            text-decoration: underline;
        }

        .pager-container {
            padding: 16px 24px;
            background: #f8fafc;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 13px;
            font-weight: 600;
            color: #64748b;
        }

        .pager-buttons {
            display: flex;
            gap: 8px;
        }

        .pager-btn {
            padding: 6px 14px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            color: #475569;
            text-decoration: none;
            transition: all 0.2s;
        }

        .pager-btn:hover {
            background: #f1f5f9;
            border-color: #cbd5e1;
            color: #0f172a;
        }

        @media (max-width: 768px) {
            .signin-page { padding: 16px; }
            .lesson-hero__content { flex-direction: column; align-items: flex-start; }
            .action-bar { flex-direction: column; }
            .signin-btn { width: 100%; }
        }
    </style>

    <div class="signin-page">
        <div class="lesson-shell">
            <!-- Header -->
            <div class="lesson-hero">
                <div class="lesson-hero__content">
                    <div>
                        <h1 class="lesson-hero__title">
                            <i class="bi bi-person-check-fill" style="color: #99f6e4;"></i> 学生签到记录
                        </h1>
                        <p class="lesson-hero__subtitle">查看各班级每日签到汇总，支持数据导出与详细记录巡查</p>
                    </div>
                    
                    <div class="filter-group">
                        <div class="filter-item">
                            <span class="filter-label">年级</span>
                            <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="DDLgrade_SelectedIndexChanged" CssClass="filter-select">
                            </asp:DropDownList>
                        </div>
                        <div style="width: 1px; height: 16px; background: rgba(255,255,255,0.2);"></div>
                        <div class="filter-item">
                            <span class="filter-label">班级</span>
                            <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="DDLclass_SelectedIndexChanged" CssClass="filter-select">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="lesson-card">
                <div class="action-bar">
                    <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click" 
                        Text="导出签到表" ToolTip="将本学期本班签到以Excel表格导出" CssClass="signin-btn signin-btn--primary" />
                    
                    <asp:Button ID="BtnExcelNoSign" runat="server" OnClick="BtnExcelNoSign_Click" 
                        Text="导出缺席表" ToolTip="将本学期本班缺席以Excel表格导出" CssClass="signin-btn signin-btn--outline" />
                </div>

                <asp:GridView ID="GVSignin" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" PageSize="20" Width="100%" 
                    onpageindexchanging="GVSignin_PageIndexChanging" 
                    onrowdatabound="GVSignin_RowDataBound" GridLines="None"
                    CssClass="signin-grid">
                    <Columns>
                        <asp:BoundField HeaderText="序号">
                            <ItemStyle CssClass="font-mono text-slate-400" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sgrade" HeaderText="年级" />
                        <asp:BoundField DataField="Sclass" HeaderText="班级">
                            <ItemStyle CssClass="font-bold text-slate-700" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Qyear" HeaderText="年份">
                            <ItemStyle CssClass="font-mono" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Qmonth" HeaderText="月份">
                            <ItemStyle CssClass="font-mono" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Qday" HeaderText="日期">
                            <ItemStyle CssClass="font-mono" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="Sgrade,Sclass,Qyear,Qmonth,Qday" 
                            DataNavigateUrlFormatString="signshow.aspx?sgrade={0}&amp;&amp;sclass={1}&amp;&amp;qyear={2}&amp;&amp;qmonth={3}&amp;&amp;qday={4}" 
                            Text='<i class="bi bi-eye-fill"></i> 查看详细' HeaderText="操作">
                            <ItemStyle CssClass="view-link" />
                        </asp:HyperLinkField>
                    </Columns>
                    <PagerTemplate>
                        <div class="pager-container">
                            <span>第 <asp:Label ID="lblPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>" style="color: #4f46e5;"></asp:Label> / <asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label> 页</span>
                            
                            <div class="pager-buttons">
                                <asp:LinkButton ID="btnFirst" runat="server" CommandArgument="First" CommandName="Page" CssClass="pager-btn">首页</asp:LinkButton>
                                <asp:LinkButton ID="btnPrev" runat="server" CommandArgument="Prev" CommandName="Page" CssClass="pager-btn">上一页</asp:LinkButton>
                                <asp:LinkButton ID="btnNext" runat="server" CommandArgument="Next" CommandName="Page" CssClass="pager-btn">下一页</asp:LinkButton>
                                <asp:LinkButton ID="btnLast" runat="server" CommandArgument="Last" CommandName="Page" CssClass="pager-btn">尾页</asp:LinkButton>
                            </div>
                        </div>
                    </PagerTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>