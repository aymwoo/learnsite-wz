<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Analysis.aspx.cs" Inherits="webform_Analysis" ResponseEncoding="utf-8" Culture="zh-CN" UICulture="zh-CN" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <title>学生成绩表</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: "Segoe UI", "Microsoft YaHei", Arial, sans-serif;
            background: linear-gradient(180deg, #f8fbff 0%, #eef4ff 100%);
            color: #334155;
            line-height: 1.6;
            padding: 24px;
            min-height: 100vh;
        }

        .page-shell {
            max-width: 1180px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .hero {
            border: 1px solid #1e3a8a;
            border-radius: 16px;
            padding: 26px 30px;
            background:
                radial-gradient(circle at top left, rgba(99, 102, 241, 0.22), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #312e81 52%, #4f46e5 100%);
            color: #eff6ff;
            box-shadow: 0 24px 54px rgba(79, 70, 229, 0.2);
        }

        .hero h1 {
            font-size: 30px;
            font-weight: 800;
            letter-spacing: -0.03em;
            margin-bottom: 8px;
        }

        .hero p {
            font-size: 14px;
            color: rgba(239, 246, 255, 0.88);
        }
        
        .container {
            width: 100%;
            background: white;
            border-radius: 16px;
            border: 1px solid #dbe6f5;
            box-shadow: 0 14px 34px rgba(15, 23, 42, 0.06);
            overflow: hidden;
        }
        
        .header {
            padding: 18px 24px;
            border-bottom: 1px solid #e2e8f0;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
            color: #0f172a;
        }
        
        .header h2 {
            font-size: 22px;
            font-weight: 800;
            margin-bottom: 4px;
        }
        
        .header p {
            opacity: 1;
            font-size: 14px;
            color: #64748b;
        }

        .page-status {
            margin-top: 10px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 6px 12px;
            border-radius: 999px;
            background: #eef2ff;
            color: #4338ca;
            font-size: 12px;
            font-weight: 700;
        }
        
        .table-container {
            padding: 22px 24px;
            overflow-x: auto;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }
        
        thead {
            background: #f8fafc;
        }
        
        th {
            font-weight: 800;
            text-align: left;
            padding: 12px 16px;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #e2e8f0;
            white-space: nowrap;
        }
        
        td {
            padding: 14px 16px;
            border-bottom: 1px solid #f1f5f9;
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        tr:hover {
            background: #f8fafc;
        }
        
        .number-cell {
            width: 80px;
            color: #64748b;
            font-weight: 500;
        }
        
        .name-cell {
            font-weight: 500;
            color: #1e293b;
        }
        
        .score-cell {
            font-weight: 600;
            color: #10b981;
        }
        
        .time-cell {
            color: #f59e0b;
            font-weight: 500;
        }
        
        .stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            padding: 0 24px 24px;
            background: #ffffff;
            border-top: 1px solid #e2e8f0;
        }
        
        .stat-item {
            text-align: center;
            padding: 18px 12px;
            background: linear-gradient(160deg, #ffffff 0%, #f8fbff 100%);
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }
        
        .stat-item h3 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 4px;
            color: #1e293b;
        }
        
        .stat-item p {
            font-size: 13px;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .footer {
            padding: 22px 24px 26px;
            font-size: 12px;
            color: #94a3b8;
            border-top: 1px solid #f1f5f9;
            background: linear-gradient(180deg, #ffffff 0%, #fcfdff 100%);
        }
        .footer h3,
        .analysis-title {
            font-size: 18px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 12px;
        }
        .sizesmall
        {
            width:60px;   
            text-align:center;  
        }
        .size
        {
            width:80px; 
            text-align:center;   
        }
        .txtcenter
        {
            text-align:center;
        }
        .snameno
        {            
            display:inline-flex;
            align-items:center;
            min-height:36px;
            padding:0 14px;
            margin:0 10px 10px 0;
            cursor:pointer;
            border-radius:999px;
            background:#eff6ff;
            color:#1d4ed8;
            font-weight:700;
        }
        .snameno:hover
        {
            background:#dbeafe;
        }

        @media (max-width: 768px) {
            body { padding: 16px; }
            .hero { padding: 20px; }
            .hero h1 { font-size: 24px; }
            .stats { grid-template-columns: 1fr; }
            .table-container, .header, .footer { padding-left: 18px; padding-right: 18px; }
        }
    </style>

    <link href="../js/css/tailwind-utilities.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <div class="hero">
                <h1>学生成绩分析</h1>
                <p>查看班级测验得分、用时、题目正确率与未参加名单。</p>
            </div>

        <div class="container">
            <div class="header">
                <h2 class ="txtcenter">学生成绩表</h2>
                <p class ="txtcenter">实时成绩、平均分与用时统计</p>
                <div class="txtcenter">
                    <span class="page-status"><%=PageStatus %></span>
                </div>
            </div>
            
            <div class="table-container">
                <asp:Repeater ID="RepeaterList" runat="server">
                    <HeaderTemplate>
                        <table>
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>成绩</th>
                                    <th>用时（分）</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="number-cell"><%# Container.ItemIndex + 1 %></td>
                            <td class="name-cell"><%# HttpUtility.UrlDecode(Eval("Asname").ToString()) %></td>
                            <td class="score-cell"><%# Eval("Ascore") %></td>
                            <td class="time-cell"><%# Eval("Aspent") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            
            <div class="stats">
                <div class="stat-item">
                    <h3><%=Persons %>人</h3>
                    <p>总人数</p>
                </div>
                <div class="stat-item">
                    <h3><%=avgScore %></h3>
                    <p>平均分</p>
                </div>
                <div class="stat-item">
                    <h3><%=avgSpent %>分钟</h3>
                    <p>平均用时</p>
                </div>
            </div>
            <div class="table-container">
                <h3 class="analysis-title">详题分析</h3>
                 <asp:Repeater ID="RepeaterAnalysis" runat="server">
                    <HeaderTemplate>
                        <table style="width:100%;">
                        <tr>
                            <th>序号</th>
                            <th>题型</th>
                            <th>题目内容</th>
                            <th>答对数</th>
                            <th>正确率</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="sizesmall"><%# Container.ItemIndex + 1 %></td>
                            <td class="size"><%# Eval("QuestionTypeText") %></td>
                            <td><%# Eval("QuestionTitle") %></td>
                            <td  class="size"><%# Eval("CorrectCount") %></td>
                            <td  class="size"><%# Eval("Accuracy") %>%</td>
                        </tr>
                    </ItemTemplate>
                     <FooterTemplate></table></FooterTemplate>
                 </asp:Repeater>
            </div>
            <div class="footer">
            <h3>未测验学生名单</h3>
                 <asp:Repeater ID="RepeaterNo" runat="server">
                    <ItemTemplate>                        
                            <span class="snameno" ><%# Eval("Sname")%></span>
                    </ItemTemplate>
                 </asp:Repeater>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
