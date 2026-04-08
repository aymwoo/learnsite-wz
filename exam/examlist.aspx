<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examlist.aspx.cs" Inherits="exam_examlist" MasterPageFile="~/teacher/Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- 使用绝对路径重新引用JS文件，覆盖Master中的相对路径 -->
    <script src="/js/MenuCookie.js" type="text/javascript"></script>
    <script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script src="/js/ruffle.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .exam-container { padding: 20px; }
        .exam-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .exam-header h2 { margin: 0; color: #333; }
        .btn { display: inline-block; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; font-size: 14px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-primary:hover { background: #40a9ff; }
        .btn-success { background: #52c41a; color: #fff; }
        .btn-warning { background: #faad14; color: #fff; }
        .btn-danger { background: #ff4d4f; color: #fff; }
        .btn-sm { padding: 4px 8px; font-size: 12px; margin: 0 2px; }
        .exam-filter { margin-bottom: 15px; padding: 10px; background: #f5f5f5; border-radius: 4px; }
        .exam-filter select, .exam-filter input { padding: 6px 10px; border: 1px solid #d9d9d9; border-radius: 4px; margin-right: 10px; }
        .exam-table { width: 100%; border-collapse: collapse; background: #fff; }
        .exam-table th, .exam-table td { padding: 12px; text-align: center; border-bottom: 1px solid #e8e8e8; }
        .exam-table th { background: #fafafa; font-weight: 600; color: #333; text-align: center; }
        .exam-table tr:hover { background: #f5f5f5; }
        .status { display: inline-block; padding: 2px 8px; border-radius: 10px; font-size: 12px; }
        .status-0 { background: #f0f0f0; color: #666; }
        .status-1 { background: #e6f7ff; color: #1890ff; }
        .status-2 { background: #f6ffed; color: #52c41a; }
        .status-3 { background: #fff7e6; color: #fa8c16; }
        .status-4 { background: #f9f9f9; color: #999; }
        .actions a { color: #1890ff; text-decoration: none; margin-right: 8px; white-space: nowrap; }
        .actions a:hover { color: #40a9ff; }
        .empty-data { text-align: center; padding: 40px; color: #999; }
        .pagination { margin-top: 15px; text-align: center; }
        .pagination a, .pagination span { display: inline-block; padding: 5px 10px; margin: 0 2px; border: 1px solid #d9d9d9; border-radius: 4px; }
        .pagination a { text-decoration: none; color: #333; }
        .pagination a:hover { border-color: #1890ff; color: #1890ff; }
        .pagination .current { background: #1890ff; color: #fff; border-color: #1890ff; }
    </style>

    <div class="exam-container">
        <div class="exam-header">
            <h2>考试管理</h2>
            <div>
                <a href="paper/paperlist.aspx" class="btn btn-warning">试卷管理</a>
                <a href="question/banklist.aspx" class="btn btn-success">题库管理</a>
                <a href="examadd.aspx" class="btn btn-primary">+ 创建考试</a>
            </div>
        </div>

        <div class="exam-filter">
            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                <asp:ListItem Value="-1">全部状态</asp:ListItem>
                <asp:ListItem Value="0">未发布</asp:ListItem>
                <asp:ListItem Value="1">已发布</asp:ListItem>
                <asp:ListItem Value="2">进行中</asp:ListItem>
                <asp:ListItem Value="3">已结束</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtKeyword" runat="server" placeholder="搜索考试名称..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" />
        </div>

        <asp:Repeater ID="rptExamList" runat="server">
            <HeaderTemplate>
                <table class="exam-table">
                    <thead>
                        <tr>
                            <th style="width:25%">考试名称</th>
                            <th style="width:12%">试卷</th>
                            <th style="width:25%">考试时间</th>
                            <th style="width:6%">时长</th>
                            <th style="width:9%">提交情况</th>
                            <th style="width:8%">状态</th>
                            <th style="width:15%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <strong><%# Eval("ExamName") %></strong> <small style="color:#999">(<%# Eval("ExamCode") %>)</small>
                    </td>
                    <td><%# Eval("PaperName") %></td>
                    <td>
                        <%# GetTimeDisplay(Container.DataItem as LearnSite.Model.Exam) %>
                    </td>
                    <td><%# Eval("Duration") %>分钟</td>
                    <td><%# Eval("SubmittedCount") %>/<%# Eval("ParticipantCount") %></td>
                    <td><span class="status status-<%# Eval("Status") %>"><%# GetStatusText(Eval("Status")) %></span></td>
                    <td class="actions">
                        <asp:PlaceHolder ID="phEdit" runat="server" Visible='<%# (int)Eval("Status") == 0 %>'>
                            <a href="examedit.aspx?id=<%# Eval("ExamId") %>">编辑</a>
                        </asp:PlaceHolder>
                        <a href="exammonitor.aspx?id=<%# Eval("ExamId") %>">监控</a>
                        <a href="examresult.aspx?id=<%# Eval("ExamId") %>">成绩</a>
                        <asp:PlaceHolder ID="phPublish" runat="server" Visible='<%# (int)Eval("Status") == 0 %>'>
                            <asp:LinkButton ID="lbtnPublish" runat="server" 
                                CommandArgument='<%# Eval("ExamId") %>' 
                                OnCommand="lbtnPublish_Command"
                                OnClientClick="return confirm('确定发布考试吗？发布后不可修改！');">发布</asp:LinkButton>
                        </asp:PlaceHolder>
                        <asp:PlaceHolder ID="phDelete" runat="server" Visible='<%# (int)Eval("Status") == 0 %>'>
                            <asp:LinkButton ID="lbtnDelete" runat="server" 
                                CommandArgument='<%# Eval("ExamId") %>' 
                                OnCommand="lbtnDelete_Command"
                                OnClientClick="return confirm('确定删除此考试吗？');"
                                style="color:#ff4d4f">删除</asp:LinkButton>
                        </asp:PlaceHolder>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
                <asp:PlaceHolder ID="phEmpty" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'>
                    <div class="empty-data">暂无考试数据，请点击"创建考试"添加</div>
                </asp:PlaceHolder>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
