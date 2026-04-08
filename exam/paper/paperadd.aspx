<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperadd.aspx.cs" Inherits="exam_paper_paperadd" MasterPageFile="~/teacher/Teach.master" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/js/MenuCookie.js" type="text/javascript"></script>
    <script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script src="/js/ruffle.js" type="text/javascript"></script>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .paper-form { padding: 20px; }
        .form-header { margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .form-header h2 { margin: 0; color: #333; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: 600; color: #333; }
        .form-group label span.required { color: #ff4d4f; }
        .form-control { width: 100%; padding: 8px 12px; border: 1px solid #d9d9d9; border-radius: 4px; box-sizing: border-box; }
        .form-control:focus { border-color: #40a9ff; outline: none; }
        .form-row { display: flex; gap: 15px; margin-bottom: 15px; }
        .form-row .form-group { flex: 1; }
        textarea.form-control { min-height: 80px; resize: vertical; }
        .btn { display: inline-block; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; font-size: 14px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-primary:hover { background: #40a9ff; }
        .btn-secondary { background: #6c757d; color: #fff; }
        .btn-secondary:hover { background: #5a6268; }
        .btn-outline-primary { background: transparent; border: 1px solid #1890ff; color: #1890ff; }
        .btn-outline-primary:hover { background: #1890ff; color: #fff; }
        .form-actions { margin-top: 20px; padding-top: 15px; border-top: 1px solid #e8e8e8; display: flex; justify-content: space-between; align-items: center; }
        .form-actions .btn { min-width: 80px; margin-left: 8px; }
        .question-section { margin-top: 20px; }
        .question-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; }
        .question-header h4 { margin: 0; color: #333; }
        .question-item { border: 1px solid #e8e8e8; border-radius: 6px; padding: 15px; margin-bottom: 10px; background: #fafafa; }
        .question-item:hover { background: #f0f0f0; }
        .question-content { margin-bottom: 10px; }
        .question-meta { font-size: 12px; color: #999; }
        .question-actions { text-align: right; margin-top: 10px; }
        .question-actions .btn { padding: 4px 12px; font-size: 12px; }
        .empty-tip { text-align: center; padding: 40px; color: #999; background: #fafafa; border-radius: 4px; }
        .score-info { color: #666; }
    </style>

    <div class="paper-form">
        <div class="form-header">
            <h2>添加试卷</h2>
        </div>

        <div class="form-row">
            <div class="form-group" style="flex: 2;">
                <label><span class="required">*</span> 试卷名称</label>
                <asp:TextBox ID="txtPaperName" runat="server" CssClass="form-control" placeholder="请输入试卷名称"></asp:TextBox>
            </div>
            <div class="form-group" style="flex: 1;">
                <label>试卷类型</label>
                <asp:DropDownList ID="ddlPaperType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">普通试卷</asp:ListItem>
                    <asp:ListItem Value="2">随机试卷</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>总分</label>
                <asp:TextBox ID="txtTotalScore" runat="server" CssClass="form-control" Text="100"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>及格分</label>
                <asp:TextBox ID="txtPassScore" runat="server" CssClass="form-control" Text="60"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>建议时长(分钟)</label>
                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" Text="60"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label>试卷说明</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="请输入试卷说明"></asp:TextBox>
        </div>

        <div class="question-section">
            <div class="question-header">
                <h4>试题列表</h4>
                <asp:Button ID="btnAddQuestion" runat="server" Text="从题库添加题目" CssClass="btn btn-outline-primary" OnClick="btnAddQuestion_Click" />
            </div>

            <asp:Literal ID="ltlQuestionList" runat="server"></asp:Literal>

            <asp:Panel ID="pnlNoQuestion" runat="server" CssClass="empty-tip">
                <p>暂无题目，请点击"从题库添加题目"按钮添加试题</p>
            </asp:Panel>
        </div>

        <div class="form-actions">
            <div class="score-info">
                共 <asp:Label ID="lblQuestionCount" runat="server" Text="0"></asp:Label> 题，总分 <asp:Label ID="lblScoreSum" runat="server" Text="0"></asp:Label> 分
            </div>
            <div>
                <asp:Button ID="btnSave" runat="server" Text="保存试卷" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <a href="paperlist.aspx" class="btn btn-secondary">返回</a>
            </div>
        </div>
    </div>
</asp:Content>
