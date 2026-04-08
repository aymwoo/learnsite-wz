<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examresult.aspx.cs" Inherits="exam_examresult" MasterPageFile="~/teacher/Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .result-container { padding: 20px; }
        .result-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .result-header h2 { margin: 0; }
        .btn { display: inline-block; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; font-size: 14px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-success { background: #52c41a; color: #fff; }
        .btn-default { background: #f0f0f0; color: #333; }
        .stats-summary { display: flex; gap: 15px; margin-bottom: 20px; }
        .stat-item { flex: 1; background: #fff; border-radius: 8px; padding: 15px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); text-align: center; }
        .stat-item .value { font-size: 28px; font-weight: bold; color: #1890ff; }
        .stat-item .label { font-size: 13px; color: #666; margin-top: 5px; }
        .score-distribution { background: #fff; border-radius: 8px; padding: 15px; margin-bottom: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        .score-distribution h3 { margin: 0 0 15px 0; font-size: 16px; }
        .bar-chart { display: flex; align-items: flex-end; height: 150px; gap: 10px; padding: 0 20px; }
        .bar-item { flex: 1; display: flex; flex-direction: column; align-items: center; }
        .bar { width: 100%; background: #1890ff; border-radius: 4px 4px 0 0; min-height: 2px; }
        .bar-label { font-size: 12px; color: #666; margin-top: 5px; }
        .bar-value { font-size: 12px; color: #1890ff; margin-top: 3px; }
        .filter-bar { margin-bottom: 15px; padding: 10px; background: #f5f5f5; border-radius: 4px; }
        .filter-bar select, .filter-bar input { padding: 6px 10px; border: 1px solid #d9d9d9; border-radius: 4px; margin-right: 10px; }
        .result-table { width: 100%; border-collapse: collapse; background: #fff; }
        .result-table th, .result-table td { padding: 10px; text-align: left; border-bottom: 1px solid #e8e8e8; }
        .result-table th { background: #fafafa; font-weight: 600; }
        .result-table tr:hover { background: #f5f5f5; }
        .rank-badge { display: inline-block; padding: 2px 8px; border-radius: 4px; font-size: 12px; font-weight: bold; }
        .rank-1 { background: #ffd700; color: #333; }
        .rank-2 { background: #c0c0c0; color: #333; }
        .rank-3 { background: #cd7f32; color: #fff; }
        .score-pass { color: #52c41a; font-weight: bold; }
        .score-fail { color: #ff4d4f; font-weight: bold; }
        .actions a { color: #1890ff; text-decoration: none; margin-right: 10px; }
        .export-bar { margin-bottom: 15px; }
    </style>

    <div class="result-container">
        <div class="result-header">
            <div>
                <h2><asp:Literal ID="ltlExamName" runat="server"></asp:Literal> - 成绩管理</h2>
            </div>
            <div>
                <asp:Button ID="btnExport" runat="server" Text="导出Excel" CssClass="btn btn-success" OnClick="btnExport_Click" />
                <a href="examlist.aspx" class="btn btn-default">返回列表</a>
            </div>
        </div>

        <div class="stats-summary">
            <div class="stat-item">
                <div class="value"><asp:Literal ID="ltlTotalCount" runat="server">0</asp:Literal></div>
                <div class="label">参考人数</div>
            </div>
            <div class="stat-item">
                <div class="value"><asp:Literal ID="ltlAvgScore" runat="server">0</asp:Literal></div>
                <div class="label">平均分</div>
            </div>
            <div class="stat-item">
                <div class="value"><asp:Literal ID="ltlMaxScore" runat="server">0</asp:Literal></div>
                <div class="label">最高分</div>
            </div>
            <div class="stat-item">
                <div class="value"><asp:Literal ID="ltlMinScore" runat="server">0</asp:Literal></div>
                <div class="label">最低分</div>
            </div>
            <div class="stat-item">
                <div class="value"><asp:Literal ID="ltlPassRate" runat="server">0</asp:Literal>%</div>
                <div class="label">及格率</div>
            </div>
        </div>

        <div class="score-distribution">
            <h3>分数段分布</h3>
            <div class="bar-chart">
                <asp:Repeater ID="rptDistribution" runat="server">
                    <ItemTemplate>
                        <div class="bar-item">
                            <div class="bar" style="height:<%# GetBarHeight(Eval("Count")) %>px;"></div>
                            <div class="bar-value"><%# Eval("Count") %></div>
                            <div class="bar-label"><%# Eval("Range") %></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div class="filter-bar">
            <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                <asp:ListItem Value="">全部班级</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlScoreRange" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlScoreRange_SelectedIndexChanged">
                <asp:ListItem Value="">全部分数</asp:ListItem>
                <asp:ListItem Value="90">优秀(>=90)</asp:ListItem>
                <asp:ListItem Value="80">良好(>=80)</asp:ListItem>
                <asp:ListItem Value="60">及格(>=60)</asp:ListItem>
                <asp:ListItem Value="0">不及格(&lt;60)</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtKeyword" runat="server" placeholder="学号/姓名"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" />
        </div>

        <asp:Repeater ID="rptResults" runat="server">
            <HeaderTemplate>
                <table class="result-table">
                    <thead>
                        <tr>
                            <th style="width:5%">排名</th>
                            <th style="width:10%">学号</th>
                            <th style="width:10%">姓名</th>
                            <th style="width:10%">班级</th>
                            <th style="width:10%">成绩</th>
                            <th style="width:8%">客观题</th>
                            <th style="width:8%">主观题</th>
                            <th style="width:8%">用时</th>
                            <th style="width:12%">提交时间</th>
                            <th style="width:8%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:PlaceHolder runat="server" Visible='<%# (int)Eval("RankInClass") <= 3 && (int)Eval("RankInClass") > 0 %>'>
                            <span class="rank-badge rank-<%# Eval("RankInClass") %>"><%# Eval("RankInClass") %></span>
                        </asp:PlaceHolder>
                        <asp:PlaceHolder runat="server" Visible='<%# (int)Eval("RankInClass") > 3 || (int)Eval("RankInClass") == 0 %>'>
                            <%# Eval("RankInClass") %>
                        </asp:PlaceHolder>
                    </td>
                    <td><%# Eval("StudentId") %></td>
                    <td><%# Eval("StudentName") %></td>
                    <td><%# Eval("ClassName") %></td>
                    <td>
                        <span class='<%# (decimal)Eval("TotalScore") >= (decimal)Eval("PassScore") ? "score-pass" : "score-fail" %>'>
                            <%# Eval("TotalScore") %>
                        </span>
                    </td>
                    <td><%# Eval("ObjectiveScore") %></td>
                    <td><%# Eval("SubjectiveScore") %></td>
                    <td><%# FormatDuration(Eval("Duration")) %></td>
                    <td><%# Eval("SubmitTime", "{0:MM-dd HH:mm}") %></td>
                    <td class="actions">
                        <a href="examreview.aspx?id=<%# Eval("AnswerId") %>">查看答卷</a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
