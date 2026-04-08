<%@ Page Language="C#" AutoEventWireup="true" CodeFile="questionlist.aspx.cs" Inherits="exam_question_questionlist" MasterPageFile="~/teacher/Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- 使用绝对路径重新引用JS文件，覆盖Master中的相对路径 -->
    <script src="/js/MenuCookie.js" type="text/javascript"></script>
    <script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script src="/js/ruffle.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .question-container { padding: 20px; }
        .question-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .question-header h2 { margin: 0; }
        .btn { display: inline-block; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; font-size: 14px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-success { background: #52c41a; color: #fff; }
        .btn-default { background: #f0f0f0; color: #333; }
        .filter-bar { margin-bottom: 15px; padding: 10px; background: #f5f5f5; border-radius: 4px; }
        .filter-bar select, .filter-bar input { padding: 6px 10px; border: 1px solid #d9d9d9; border-radius: 4px; margin-right: 10px; }
        .question-table { width: 100%; border-collapse: collapse; background: #fff; }
        .question-table th, .question-table td { padding: 12px; text-align: left; border-bottom: 1px solid #e8e8e8; }
        .question-table th { background: #fafafa; font-weight: 600; }
        .question-table tr:hover { background: #f5f5f5; }
        .type-tag { display: inline-block; padding: 2px 8px; border-radius: 4px; font-size: 12px; }
        .type-1 { background: #e6f7ff; color: #1890ff; }
        .type-2 { background: #f6ffed; color: #52c41a; }
        .type-3 { background: #fff7e6; color: #fa8c16; }
        .type-4 { background: #f9f0ff; color: #722ed1; }
        .type-5 { background: #fff1f0; color: #f5222d; }
        .difficulty-1 { color: #52c41a; }
        .difficulty-2 { color: #faad14; }
        .difficulty-3 { color: #f5222d; }
        .question-content { max-width: 400px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
        .actions a { color: #1890ff; text-decoration: none; margin-right: 10px; }
        .actions a.danger { color: #ff4d4f; }
        .pagination { margin-top: 15px; text-align: center; }
        .pagination a, .pagination span { display: inline-block; padding: 5px 10px; margin: 0 2px; border: 1px solid #d9d9d9; border-radius: 4px; }
        .pagination a { text-decoration: none; color: #333; }
        .pagination a:hover { border-color: #1890ff; color: #1890ff; }
        .pagination .current { background: #1890ff; color: #fff; border-color: #1890ff; }
        .select-bar { margin-bottom: 15px; padding: 10px; background: #e6f7ff; border-radius: 4px; border: 1px solid #91d5ff; }
        .select-bar .selected-info { color: #1890ff; font-weight: bold; }
    </style>

    <div class="question-container">
        <div class="question-header">
            <div>
                <h2><asp:Literal ID="ltlBankName" runat="server"></asp:Literal> - 题目管理</h2>
            </div>
            <div>
                <asp:Panel ID="pnlNormalButtons" runat="server">
                    <a href="questionadd.aspx?bankId=<%= BankId %>" class="btn btn-primary">+ 添加题目</a>
                    <a href="questionimport.aspx?bankId=<%= BankId %>" class="btn btn-success">批量导入</a>
                    <a href="banklist.aspx" class="btn btn-default">返回题库</a>
                </asp:Panel>
                <asp:Panel ID="pnlSelectButtons" runat="server" Visible="false">
                    <asp:Button ID="btnConfirmSelect" runat="server" Text="确认选择" CssClass="btn btn-success" OnClick="btnConfirmSelect_Click" />
                    <a href="../paper/paperadd.aspx" class="btn btn-default">取消</a>
                </asp:Panel>
            </div>
        </div>

        <asp:Panel ID="pnlSelectBar" runat="server" Visible="false" CssClass="select-bar">
            <span>已选择 <span class="selected-info" id="selectedCount">0</span> 道题目</span>
            <input type="hidden" id="selectedIds" name="selectedIds" runat="server" />
        </asp:Panel>

        <div class="filter-bar">
            <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="">全部题型</asp:ListItem>
                <asp:ListItem Value="1">单选题</asp:ListItem>
                <asp:ListItem Value="2">多选题</asp:ListItem>
                <asp:ListItem Value="3">判断题</asp:ListItem>
                <asp:ListItem Value="4">填空题</asp:ListItem>
                <asp:ListItem Value="5">简答题</asp:ListItem>
                <asp:ListItem Value="6">连线题</asp:ListItem>
                <asp:ListItem Value="7">分类题</asp:ListItem>
                <asp:ListItem Value="8">组合题</asp:ListItem>
                <asp:ListItem Value="9">多项填空</asp:ListItem>
                <asp:ListItem Value="10">下拉选择</asp:ListItem>
                <asp:ListItem Value="11">打分题</asp:ListItem>
                <asp:ListItem Value="12">矩阵单选</asp:ListItem>
                <asp:ListItem Value="13">矩阵多选</asp:ListItem>
                <asp:ListItem Value="14">NPS评分</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlDifficulty" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="">全部难度</asp:ListItem>
                <asp:ListItem Value="1">简单</asp:ListItem>
                <asp:ListItem Value="2">中等</asp:ListItem>
                <asp:ListItem Value="3">困难</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtKeyword" runat="server" placeholder="搜索题目内容..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" />
        </div>

        <asp:Repeater ID="rptQuestions" runat="server" OnItemCommand="rptQuestions_ItemCommand" OnItemDataBound="rptQuestions_ItemDataBound">
            <HeaderTemplate>
                <table class="question-table">
                    <thead>
                        <tr>
                            <th style="width:5%"><asp:Literal ID="ltlSelectHeader" runat="server"></asp:Literal></th>
                            <th style="width:5%">ID</th>
                            <th style="width:10%">题型</th>
                            <th style="width:40%">题目内容</th>
                            <th style="width:10%">难度</th>
                            <th style="width:8%">分值</th>
                            <th style="width:10%">正确率</th>
                            <th style="width:10%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:Literal ID="ltlCheckbox" runat="server"></asp:Literal></td>
                    <td><%# Eval("QuestionId") %></td>
                    <td><span class="type-tag type-<%# Eval("QuestionType") %>"><%# GetTypeName(Eval("QuestionType")) %></span></td>
                    <td class="question-content" title="<%# Eval("QuestionText") %>"><%# Eval("QuestionText") %></td>
                    <td class="difficulty-<%# Eval("Difficulty") %>"><%# GetDifficultyName(Eval("Difficulty")) %></td>
                    <td><%# Eval("Score") %>分</td>
                    <td><%# Eval("CorrectRate") %>%</td>
                    <td class="actions">
                        <asp:Panel ID="pnlNormalActions" runat="server">
                            <a href="questionadd.aspx?id=<%# Eval("QuestionId") %>&bankId=<%# BankId %>">编辑</a>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("QuestionId") %>' CssClass="danger" OnClientClick="return confirm('确定删除此题目吗？');">删除</asp:LinkButton>
                        </asp:Panel>
                        <asp:Panel ID="pnlSelectActions" runat="server" Visible="false">
                            <a href="javascript:void(0)" onclick="toggleSelect(<%# Eval("QuestionId") %>, this)" class="btn-select">选择</a>
                        </asp:Panel>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <div class="pagination">
            <asp:Literal ID="ltlPagination" runat="server"></asp:Literal>
        </div>
    </div>

    <script>
        var selectedQuestions = [];
        
        function toggleSelect(questionId, btn) {
            var index = selectedQuestions.indexOf(questionId);
            if (index > -1) {
                selectedQuestions.splice(index, 1);
                btn.innerText = '选择';
                btn.style.color = '#1890ff';
            } else {
                selectedQuestions.push(questionId);
                btn.innerText = '已选';
                btn.style.color = '#52c41a';
            }
            document.getElementById('selectedCount').innerText = selectedQuestions.length;
            document.getElementById('<%= selectedIds.ClientID %>').value = selectedQuestions.join(',');
        }
    </script>
</asp:Content>
