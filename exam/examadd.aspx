<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examadd.aspx.cs" Inherits="exam_examadd" MasterPageFile="~/teacher/Teach.master" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- 使用绝对路径重新引用JS文件，覆盖Master中的相对路径 -->
    <script src="/js/MenuCookie.js" type="text/javascript"></script>
    <script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script src="/js/ruffle.js" type="text/javascript"></script>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .exam-form { padding: 20px; max-width: 800px; margin: 0 auto; }
        .form-header { margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .form-header h2 { margin: 0; color: #333; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: 600; color: #333; }
        .form-group label span.required { color: #ff4d4f; }
        .form-control { width: 100%; padding: 8px 12px; border: 1px solid #d9d9d9; border-radius: 4px; box-sizing: border-box; }
        .form-control:focus { border-color: #40a9ff; outline: none; }
        .form-row { display: flex; gap: 15px; }
        .form-row .form-group { flex: 1; }
        .form-inline { display: inline-block; width: auto; }
        textarea.form-control { min-height: 80px; resize: vertical; }
        .checkbox-list label { display: inline-block; margin-right: 15px; font-weight: normal; }
        .checkbox-list input { margin-right: 5px; }
        .btn { display: inline-block; padding: 8px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-primary:hover { background: #40a9ff; }
        .btn-default { background: #f0f0f0; color: #333; }
        .btn-default:hover { background: #e0e0e0; }
        .form-actions { margin-top: 20px; padding-top: 15px; border-top: 1px solid #e8e8e8; text-align: center; }
        .form-actions .btn { min-width: 100px; margin: 0 5px; }
        .help-text { font-size: 12px; color: #999; margin-top: 5px; }
        .paper-select { border: 1px solid #d9d9d9; border-radius: 4px; padding: 10px; max-height: 200px; overflow-y: auto; }
        .paper-item { padding: 8px; border-bottom: 1px solid #f0f0f0; cursor: pointer; }
        .paper-item:hover { background: #f5f5f5; }
        .paper-item.selected { background: #e6f7ff; border-color: #1890ff; }
        .paper-item .name { font-weight: 600; }
        .paper-item .info { font-size: 12px; color: #999; margin-top: 3px; }
        .tab-nav { display: flex; border-bottom: 1px solid #e8e8e8; margin-bottom: 20px; }
        .tab-nav a { padding: 10px 20px; text-decoration: none; color: #666; border-bottom: 2px solid transparent; margin-bottom: -1px; }
        .tab-nav a:hover { color: #1890ff; }
        .tab-nav a.active { color: #1890ff; border-bottom-color: #1890ff; }
    </style>

    <div class="exam-form">
        <div class="form-header">
            <h2>创建考试</h2>
        </div>

        <div class="form-group">
            <label><span class="required">*</span> 考试名称</label>
            <asp:TextBox ID="txtExamName" runat="server" CssClass="form-control" placeholder="请输入考试名称"></asp:TextBox>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label><span class="required">*</span> 选择试卷</label>
                <asp:DropDownList ID="ddlPaper" runat="server" CssClass="form-control">
                </asp:DropDownList>
                <p class="help-text">如无可选试卷，请先<a href="paper/paperadd.aspx" style="color:#1890ff">创建试卷</a></p>
            </div>
            <div class="form-group">
                <label>考试类型</label>
                <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">正式考试</asp:ListItem>
                    <asp:ListItem Value="2">模拟考试</asp:ListItem>
                    <asp:ListItem Value="3">练习模式</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label>考试时间设置</label>
            <div class="checkbox-list" style="margin-bottom: 10px;">
                <label><asp:RadioButton ID="rbFixedTime" runat="server" GroupName="TimeMode" Checked="true" AutoPostBack="true" OnCheckedChanged="TimeMode_Changed" /> 固定时间段</label>
                <label><asp:RadioButton ID="rbValidDays" runat="server" GroupName="TimeMode" AutoPostBack="true" OnCheckedChanged="TimeMode_Changed" /> 发布后有效期内</label>
            </div>
        </div>

        <asp:Panel ID="pnlFixedTime" runat="server" Visible="true">
            <div class="form-row">
                <div class="form-group">
                    <label><span class="required">*</span> 开始时间</label>
                    <asp:TextBox ID="txtStartTime" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label><span class="required">*</span> 结束时间</label>
                    <asp:TextBox ID="txtEndTime" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlValidDays" runat="server" Visible="false">
            <div class="form-row">
                <div class="form-group">
                    <label><span class="required">*</span> 发布时间</label>
                    <asp:TextBox ID="txtPublishTime" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                    <p class="help-text">考试从此时间开始生效</p>
                </div>
                <div class="form-group">
                    <label><span class="required">*</span> 有效期限</label>
                    <asp:DropDownList ID="ddlValidDays" runat="server" CssClass="form-control">
                        <asp:ListItem Value="1">1天内</asp:ListItem>
                        <asp:ListItem Value="3">3天内</asp:ListItem>
                        <asp:ListItem Value="7">一周内（7天）</asp:ListItem>
                        <asp:ListItem Value="14">两周内（14天）</asp:ListItem>
                        <asp:ListItem Value="30">一个月内（30天）</asp:ListItem>
                        <asp:ListItem Value="90">三个月内（90天）</asp:ListItem>
                        <asp:ListItem Value="0">永久有效</asp:ListItem>
                    </asp:DropDownList>
                    <p class="help-text">学生可在此期限内任意时间参加考试</p>
                </div>
            </div>
        </asp:Panel>

        <div class="form-row">
            <div class="form-group">
                <label>考试时长（分钟）</label>
                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" Text="60"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>允许迟到（分钟）</label>
                <asp:TextBox ID="txtLateMinutes" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label>参与对象</label>
            <asp:DropDownList ID="ddlParticipantType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlParticipantType_SelectedIndexChanged">
                <asp:ListItem Value="1">指定班级</asp:ListItem>
                <asp:ListItem Value="2">全校学生</asp:ListItem>
                <asp:ListItem Value="3">指定学生</asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:Panel ID="pnlClassSelect" runat="server" Visible="false" CssClass="form-group">
            <label>选择班级</label>
            <div class="checkbox-list">
                <asp:CheckBoxList ID="cblClasses" runat="server" RepeatColumns="4" RepeatLayout="Flow">
                </asp:CheckBoxList>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlStudentSelect" runat="server" Visible="false" CssClass="form-group">
            <label>选择学生</label>
            <asp:TextBox ID="txtStudents" runat="server" CssClass="form-control" placeholder="输入学生学号，多个用逗号分隔"></asp:TextBox>
        </asp:Panel>

        <div class="form-group">
            <label>考试密码（留空则不需要密码）</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="设置考试密码"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>考试设置</label>
            <div class="checkbox-list">
                <label><asp:CheckBox ID="chkShowAnswer" runat="server" /> 交卷后显示答案</label>
                <label><asp:CheckBox ID="chkShowScore" runat="server" Checked="true" /> 交卷后显示分数</label>
                <label><asp:CheckBox ID="chkShowRank" runat="server" /> 显示排名</label>
            </div>
        </div>

        <div class="form-group">
            <label>防作弊设置</label>
            <div class="checkbox-list">
                <label><asp:CheckBox ID="chkDisableCopy" runat="server" Checked="true" /> 禁止复制</label>
                <label><asp:CheckBox ID="chkDisablePaste" runat="server" Checked="true" /> 禁止粘贴</label>
                <label><asp:CheckBox ID="chkDetectSwitch" runat="server" Checked="true" /> 检测切屏</label>
            </div>
            <div class="form-inline" style="margin-top: 10px;">
                <label>最大切屏次数：</label>
                <asp:TextBox ID="txtMaxSwitch" runat="server" CssClass="form-control" Text="3" Width="60px"></asp:TextBox>
                <span class="help-text">超过此次数自动提交</span>
            </div>
        </div>

        <div class="form-group">
            <label>备注说明</label>
            <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="考试注意事项等"></asp:TextBox>
        </div>

        <div class="form-actions">
            <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="btn btn-default" OnClick="btnCancel_Click" />
        </div>
    </div>
</asp:Content>
