<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Analysis.aspx.cs" Inherits="webform_Analysis" %>

<!DOCTYPE html PUBLIC "-W3CDTD XHTML 1.0 TransitionalEN" "http:www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>学生成绩表</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
            background: #f8fafc;
            color: #334155;
            line-height: 1.6;
            padding: 20px;
            min-height: 100vh;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            overflow: hidden;
        }
        
        .header {
            padding: 2px;
            border-bottom: 1px solid #e2e8f0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .header h2 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 4px;
        }
        
        .header p {
            opacity: 0.9;
            font-size: 14px;
        }
        
        .table-container {
            padding: 24px 32px;
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
            font-weight: 600;
            text-align: left;
            padding: 12px 16px;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #e2e8f0;
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
            padding: 24px 32px;
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
        }
        
        .stat-item {
            text-align: center;
            padding: 6px;
            background: white;
            border-radius: 8px;
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
            padding: 16px 32px;
            font-size: 12px;
            color: #94a3b8;
            border-top: 1px solid #f1f5f9;
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
            padding:10px;
            margin:auto;
            cursor:pointer;
        }
        .snameno:hover
        {
            font-weight: 600;           
        }
    </style>

    <link href="https://cdn.bootcdn.net/ajax/libs/tailwindcss/2.2.19/utilities.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2 class ="txtcenter">学生成绩表</h2>
                <p class ="txtcenter">实时成绩与用时统计</p>
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
                <h3>详题分析</h3>
                 <asp:Repeater ID="RepeaterAnalysis" runat="server">
                    <HeaderTemplate>
                        <table border="1" style="width:100%;">
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
                     <FooterTemplate></table></FooterTemplate>
                 </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>

