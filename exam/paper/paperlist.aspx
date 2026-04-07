<%@ page language="C#" autoeventwireup="true" inherits="exam_paper_paperlist, App_Web_3lfzrhqj" masterpagefile="~/teacher/Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/js/MenuCookie.js" type="text/javascript"></script>
    <script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script src="/js/ruffle.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .paper-container { padding: 20px; }
        .paper-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .paper-header h2 { margin: 0; color: #333; }
        .btn { display: inline-block; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; font-size: 14px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-primary:hover { background: #40a9ff; }
        .btn-secondary { background: #6c757d; color: #fff; }
        .btn-secondary:hover { background: #5a6268; }
        .paper-filter { margin-bottom: 15px; padding: 10px; background: #f5f5f5; border-radius: 4px; }
        .paper-filter select { padding: 6px 10px; border: 1px solid #d9d9d9; border-radius: 4px; }
        .paper-card { background: #fff; border-radius: 8px; margin-bottom: 15px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); transition: transform 0.2s; }
        .paper-card:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
        .paper-card-body { padding: 15px; }
        .paper-title { font-size: 16px; font-weight: 600; color: #333; margin-bottom: 8px; }
        .paper-info { font-size: 13px; color: #999; margin-bottom: 5px; }
        .paper-actions { text-align: right; }
        .paper-actions .btn { padding: 4px 12px; font-size: 12px; margin-left: 5px; }
        .btn-outline-primary { background: transparent; border: 1px solid #1890ff; color: #1890ff; }
        .btn-outline-primary:hover { background: #1890ff; color: #fff; }
        .btn-outline-danger { background: transparent; border: 1px solid #ff4d4f; color: #ff4d4f; }
        .btn-outline-danger:hover { background: #ff4d4f; color: #fff; }
        .status-badge { display: inline-block; padding: 2px 8px; border-radius: 10px; font-size: 12px; margin-bottom: 8px; }
        .status-0 { background: #f0f0f0; color: #666; }
        .status-1 { background: #e6f7ff; color: #1890ff; }
        .empty-data { text-align: center; padding: 40px; color: #999; }
    </style>

    <div class="paper-container">
        <div class="paper-header">
            <h2>试卷管理</h2>
            <div>
                <asp:Button ID="btnAdd" runat="server" Text="添加试卷" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                <a href="../examlist.aspx" class="btn btn-secondary">返回</a>
            </div>
        </div>

        <div class="paper-filter">
            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                <asp:ListItem Value="-1">全部状态</asp:ListItem>
                <asp:ListItem Value="0">未发布</asp:ListItem>
                <asp:ListItem Value="1">已发布</asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:Repeater ID="rptPapers" runat="server" OnItemCommand="rptPapers_ItemCommand">
            <ItemTemplate>
                <div class="paper-card">
                    <div class="paper-card-body">
                        <div style="display:flex; justify-content:space-between; align-items:flex-start;">
                            <div>
                                <span class="status-badge status-<%# Eval("Status") %>"><%# GetStatusName(Eval("Status")) %></span>
                                <div class="paper-title"><%# Eval("PaperName") %></div>
                                <div class="paper-info">
                                    题目数：<%# Eval("QuestionCount") %> | 
                                    总分：<%# Eval("TotalScore") %>分 | 
                                    时长：<%# Eval("Duration") %>分钟 |
                                    类型：<%# GetPaperTypeName(Eval("PaperType")) %>
                                </div>
                                <div class="paper-info">创建时间：<%# Eval("CreateTime", "{0:yyyy-MM-dd HH:mm}") %></div>
                            </div>
                            <div class="paper-actions">
                                <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-outline-primary" CommandName="Edit" CommandArgument='<%# Eval("PaperId") %>'>编辑</asp:LinkButton>
                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-outline-danger" CommandName="Delete" CommandArgument='<%# Eval("PaperId") %>' OnClientClick="return confirm('确定删除此试卷？')">删除</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Panel ID="pnlEmpty" runat="server" CssClass="empty-data" Visible="false">
            <p>暂无试卷数据</p>
            <asp:Button ID="btnAddEmpty" runat="server" Text="添加试卷" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        </asp:Panel>
    </div>
</asp:Content>
