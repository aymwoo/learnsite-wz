<%@ page language="C#" autoeventwireup="true" inherits="exam_exammonitor, App_Web_2eqpgcf5" masterpagefile="~/teacher/Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .monitor-container { padding: 20px; }
        .monitor-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .monitor-header h2 { margin: 0; }
        .stats-cards { display: flex; gap: 15px; margin-bottom: 20px; }
        .stat-card { flex: 1; background: #fff; border-radius: 8px; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); text-align: center; }
        .stat-card .value { font-size: 32px; font-weight: bold; color: #1890ff; }
        .stat-card .label { font-size: 14px; color: #666; margin-top: 5px; }
        .stat-card.warning .value { color: #faad14; }
        .stat-card.success .value { color: #52c41a; }
        .monitor-content { display: flex; gap: 20px; }
        .student-list { flex: 2; background: #fff; border-radius: 8px; padding: 15px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        .student-list h3 { margin: 0 0 15px 0; font-size: 16px; }
        .filter-bar { margin-bottom: 15px; }
        .filter-bar select, .filter-bar input { padding: 6px 10px; border: 1px solid #d9d9d9; border-radius: 4px; }
        .student-table { width: 100%; border-collapse: collapse; }
        .student-table th, .student-table td { padding: 10px; text-align: left; border-bottom: 1px solid #f0f0f0; font-size: 13px; }
        .student-table th { background: #fafafa; font-weight: 600; }
        .status-badge { display: inline-block; padding: 2px 8px; border-radius: 10px; font-size: 12px; }
        .status-answering { background: #e6f7ff; color: #1890ff; }
        .status-submitted { background: #f6ffed; color: #52c41a; }
        .progress-bar { height: 6px; background: #f0f0f0; border-radius: 3px; overflow: hidden; }
        .progress-bar .progress { height: 100%; background: #1890ff; transition: width 0.3s; }
        .realtime-panel { flex: 1; background: #fff; border-radius: 8px; padding: 15px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        .realtime-panel h3 { margin: 0 0 15px 0; font-size: 16px; }
        .realtime-item { padding: 10px; border-bottom: 1px solid #f0f0f0; font-size: 13px; }
        .realtime-item .time { color: #999; font-size: 12px; }
        .btn { padding: 6px 16px; border: none; border-radius: 4px; cursor: pointer; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-danger { background: #ff4d4f; color: #fff; }
        .auto-refresh { display: flex; align-items: center; gap: 10px; margin-bottom: 15px; }
    </style>
    <script type="text/javascript">
        function autoRefresh() {
            var chk = document.getElementById('<%= chkAutoRefresh.ClientID %>');
            if (chk && chk.checked) {
                setTimeout(function () {
                    __doPostBack('Refresh', '');
                }, 30000);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="monitor-container">
        <div class="monitor-header">
            <div>
                <h2><asp:Literal ID="ltlExamName" runat="server"></asp:Literal></h2>
                <p style="margin:5px 0 0;color:#666;font-size:13px;">
                    考试时间：<asp:Literal ID="ltlExamTime" runat="server"></asp:Literal>
                </p>
            </div>
            <div>
                <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="btn btn-primary" OnClick="btnRefresh_Click" />
                <a href="examlist.aspx" class="btn" style="background:#f0f0f0;color:#333;text-decoration:none;padding:6px 16px;border-radius:4px;">返回列表</a>
            </div>
        </div>

        <div class="stats-cards">
            <div class="stat-card">
                <div class="value"><asp:Literal ID="ltlTotalCount" runat="server">0</asp:Literal></div>
                <div class="label">应考人数</div>
            </div>
            <div class="stat-card">
                <div class="value"><asp:Literal ID="ltlAnsweringCount" runat="server">0</asp:Literal></div>
                <div class="label">答题中</div>
            </div>
            <div class="stat-card success">
                <div class="value"><asp:Literal ID="ltlSubmittedCount" runat="server">0</asp:Literal></div>
                <div class="label">已提交</div>
            </div>
            <div class="stat-card warning">
                <div class="value"><asp:Literal ID="ltlAvgScore" runat="server">0</asp:Literal></div>
                <div class="label">平均分</div>
            </div>
        </div>

        <div class="monitor-content">
            <div class="student-list">
                <h3>学生状态</h3>
                <div class="filter-bar">
                    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        <asp:ListItem Value="">全部班级</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                        <asp:ListItem Value="">全部状态</asp:ListItem>
                        <asp:ListItem Value="0">答题中</asp:ListItem>
                        <asp:ListItem Value="1">已提交</asp:ListItem>
                    </asp:DropDownList>
                    <label style="margin-left:15px;">
                        <asp:CheckBox ID="chkAutoRefresh" runat="server" Checked="true" />
                        自动刷新（30秒）
                    </label>
                </div>
                <asp:Repeater ID="rptStudents" runat="server">
                    <HeaderTemplate>
                        <table class="student-table">
                            <thead>
                                <tr>
                                    <th>学号</th>
                                    <th>姓名</th>
                                    <th>班级</th>
                                    <th>状态</th>
                                    <th>答题进度</th>
                                    <th>分数</th>
                                    <th>用时</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("StudentId") %></td>
                            <td><%# Eval("StudentName") %></td>
                            <td><%# Eval("ClassName") %></td>
                            <td>
                                <span class="status-badge status-<%# (int)Eval("Status") == 0 ? "answering" : "submitted" %>">
                                    <%# (int)Eval("Status") == 0 ? "答题中" : "已提交" %>
                                </span>
                            </td>
                            <td>
                                <div class="progress-bar">
                                    <div class="progress" style="width:<%# GetProgress(Eval("Answers")) %>%"></div>
                                </div>
                            </td>
                            <td><%# Eval("TotalScore") %></td>
                            <td><%# FormatDuration(Eval("Duration")) %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

            <div class="realtime-panel">
                <h3>实时动态</h3>
                <asp:Repeater ID="rptRealtime" runat="server">
                    <ItemTemplate>
                        <div class="realtime-item">
                            <div><%# Eval("StudentName") %> <%# Eval("Action") %></div>
                            <div class="time"><%# Eval("Time") %></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <script type="text/javascript">autoRefresh();</script>
</asp:Content>
