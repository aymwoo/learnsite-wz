<%@ page title="" language="C#" masterpagefile="~/teacher/Teach.master" stylesheettheme="Teacher" autoeventwireup="true" inherits="Teacher_signinmanage, App_Web_fwgio5h2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .manage-container {
            width: 98%;
            margin: 0 auto;
        }
        .header-bar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        .header-bar .title {
            font-size: 18px;
            font-weight: bold;
        }
        .header-bar .selector {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .header-bar select {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
        .header-bar .btn-return {
            background: rgba(255,255,255,0.2);
            color: white;
            border: 1px solid rgba(255,255,255,0.3);
            padding: 8px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
        }
        .header-bar .btn-return:hover {
            background: rgba(255,255,255,0.3);
        }
        .score-panels {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        .score-panel {
            flex: 1;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        .score-panel.add-panel .panel-header {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        }
        .score-panel.sub-panel .panel-header {
            background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
        }
        .panel-header {
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
        }
        .score-display {
            text-align: center;
            padding: 20px;
            background: #f8f9fa;
            border-bottom: 1px solid #eee;
        }
        .score-number {
            font-size: 240px;
            font-weight: bold;
            line-height: 1;
        }
        .score-number.add {
            color: #11998e;
        }
        .score-number.sub {
            color: #eb3349;
        }
        .score-label {
            font-size: 14px;
            color: #666;
            margin-top: 5px;
        }
        .panel-body {
            padding: 15px 20px;
        }
        .checkbox-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 15px;
        }
        .checkbox-item {
            display: flex;
            align-items: center;
            background: #f8f9fa;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.2s;
            border: 2px solid transparent;
        }
        .checkbox-item:hover {
            background: #e9ecef;
        }
        .checkbox-item.selected {
            border-color: #667eea;
            background: #f0f4ff;
        }
        .checkbox-item input {
            margin-right: 8px;
            cursor: pointer;
        }
        .checkbox-item label {
            cursor: pointer;
            font-size: 14px;
            color: #333;
        }
        .panel-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 10px;
            border-top: 1px solid #eee;
        }
        .btn-action {
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-add {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
        }
        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(17, 153, 142, 0.4);
        }
        .btn-sub {
            background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
            color: white;
        }
        .btn-sub:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(235, 51, 73, 0.4);
        }
        .message-label {
            font-size: 13px;
            padding: 5px 10px;
            border-radius: 3px;
        }
        .unsign-panel {
            background: linear-gradient(135deg, #ff9966 0%, #ff5e62 100%);
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 15px rgba(255, 94, 98, 0.3);
        }
        .unsign-panel .unsign-title {
            font-size: 15px;
            font-weight: bold;
        }
        .unsign-panel .unsign-desc {
            font-size: 13px;
            opacity: 0.9;
        }
        .btn-unsign {
            background: white;
            color: #ff5e62;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-unsign:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        .grid-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            padding: 15px;
        }
        .grid-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .grid-header .select-all {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .grid-header .tip {
            color: #666;
            font-size: 13px;
        }
        .no-class-tip {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 16px;
        }
        .no-class-tip .icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
    </style>
    
    <script type="text/javascript">
        function updateAddScore() {
            var checkboxes = document.getElementById('<%= CBLAddReason.ClientID %>').getElementsByTagName('input');
            var count = 0;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].type == 'checkbox' && checkboxes[i].checked) {
                    count++;
                    checkboxes[i].parentElement.classList.add('selected');
                } else {
                    checkboxes[i].parentElement.classList.remove('selected');
                }
            }
            var totalScore = count * 5;
            document.getElementById('<%= lblAddTotal.ClientID %>').innerText = "+" + totalScore;
            document.getElementById('<%= lblAddCount.ClientID %>').innerText = "选中 " + count + " 项，每项5分";
        }
        
        function updateSubScore() {
            var checkboxes = document.getElementById('<%= CBLSubReason.ClientID %>').getElementsByTagName('input');
            var count = 0;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].type == 'checkbox' && checkboxes[i].checked) {
                    count++;
                    checkboxes[i].parentElement.classList.add('selected');
                } else {
                    checkboxes[i].parentElement.classList.remove('selected');
                }
            }
            var totalScore = count * 5;
            document.getElementById('<%= lblSubTotal.ClientID %>').innerText = "-" + totalScore;
            document.getElementById('<%= lblSubCount.ClientID %>').innerText = "选中 " + count + " 项，每项5分";
        }
    </script>
    
    <div class="manage-container">
        <div class="header-bar">
            <div class="title">签到表现评价</div>
            <div class="selector">
                <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True"
                    onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                </asp:DropDownList>
                <span>年级</span>
                <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True"
                    onselectedindexchanged="DDLclass_SelectedIndexChanged">
                </asp:DropDownList>
                <span>班级</span>
                <asp:Label ID="Lbterm" runat="server"></asp:Label>
            </div>
            <asp:Button ID="BtnReturn" runat="server" Text="返回" CssClass="btn-return"
                onclick="BtnReturn_Click" ToolTip="返回教师管理首页" />
        </div>

        <asp:Panel ID="PanelNoClass" runat="server" Visible="false">
            <div class="no-class-tip">
                <div class="icon">📚</div>
                <div>当前没有正在上课的班级，请先在"开始上课"页面选择班级开始上课</div>
            </div>
        </asp:Panel>

        <asp:Panel ID="PanelContent" runat="server" Visible="true">
            <div class="score-panels">
                <div class="score-panel add-panel">
                    <div class="panel-header">批量加分（每项5分）</div>
                    <div class="score-display">
                        <div class="score-number add"><asp:Label ID="lblAddTotal" runat="server">+0</asp:Label></div>
                        <div class="score-label"><asp:Label ID="lblAddCount" runat="server">选中 0 项，每项5分</asp:Label></div>
                    </div>
                    <div class="panel-body">
                        <div class="checkbox-grid">
                            <asp:CheckBoxList ID="CBLAddReason" runat="server" RepeatLayout="Flow" onclick="updateAddScore()">
                                <asp:ListItem Value="路队有序">路队有序</asp:ListItem>
                                <asp:ListItem Value="按时签到">按时签到</asp:ListItem>
                                <asp:ListItem Value="认真学习">认真学习</asp:ListItem>
                                <asp:ListItem Value="爱护公物">爱护公物</asp:ListItem>
                                <asp:ListItem Value="保持卫生">保持卫生</asp:ListItem>
                                <asp:ListItem Value="遵守纪律">遵守纪律</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                        <div class="panel-footer">
                            <asp:Label ID="lblAddMsg" runat="server" CssClass="message-label" ForeColor="#11998e"></asp:Label>
                            <asp:Button ID="BtnAddScore" runat="server" Text="确定加分" CssClass="btn-action btn-add"
                                onclick="BtnAddScore_Click" />
                        </div>
                    </div>
                </div>

                <div class="score-panel sub-panel">
                    <div class="panel-header">批量减分（每项5分）</div>
                    <div class="score-display">
                        <div class="score-number sub"><asp:Label ID="lblSubTotal" runat="server">-0</asp:Label></div>
                        <div class="score-label"><asp:Label ID="lblSubCount" runat="server">选中 0 项，每项5分</asp:Label></div>
                    </div>
                    <div class="panel-body">
                        <div class="checkbox-grid">
                            <asp:CheckBoxList ID="CBLSubReason" runat="server" RepeatLayout="Flow" onclick="updateSubScore()">
                                <asp:ListItem Value="路队喧闹">路队喧闹</asp:ListItem>
                                <asp:ListItem Value="没有签到">没有签到</asp:ListItem>
                                <asp:ListItem Value="不爱学习">不爱学习</asp:ListItem>
                                <asp:ListItem Value="大声喧哗">大声喧哗</asp:ListItem>
                                <asp:ListItem Value="损坏设备">损坏设备</asp:ListItem>
                                <asp:ListItem Value="偷吃东西">偷吃东西</asp:ListItem>
                                <asp:ListItem Value="乱扔垃圾">乱扔垃圾</asp:ListItem>
                                <asp:ListItem Value="不放桌椅">不放桌椅</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                        <div class="panel-footer">
                            <asp:Label ID="lblSubMsg" runat="server" CssClass="message-label" ForeColor="#eb3349"></asp:Label>
                            <asp:Button ID="BtnSubScore" runat="server" Text="确定减分" CssClass="btn-action btn-sub"
                                onclick="BtnSubScore_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="unsign-panel">
                <div>
                    <div class="unsign-title">未签到学生操作</div>
                    <div class="unsign-desc">为当前班级今天未签到的学生减30分</div>
                </div>
                <div>
                    <asp:Button ID="BtnUnSignSub" runat="server" Text="未签到学生减30分" CssClass="btn-unsign"
                        onclick="BtnUnSignSub_Click" ToolTip="为所有未签到的学生减30分" />
                    <asp:Label ID="lblUnSignMsg" runat="server" style="margin-left:15px; font-size:13px;"></asp:Label>
                </div>
            </div>

            <div class="grid-container">
                <div class="grid-header">
                    <div class="select-all">
                        <asp:CheckBox ID="CBSelectAll" runat="server" AutoPostBack="True"
                            oncheckedchanged="CBSelectAll_CheckedChanged" Text="全选" />
                    </div>
                    <div class="tip">提示：勾选学生后可进行批量加减分操作</div>
                </div>
                <asp:GridView ID="GVSignin" runat="server" AllowPaging="True"
                    AutoGenerateColumns="False" PageSize="50" Width="100%"
                    onpageindexchanging="GVSignin_PageIndexChanging"
                    CellPadding="8" DataKeyNames="Qid" GridLines="Both" 
                    BorderColor="#e0e0e0" BorderStyle="Solid" BorderWidth="1px">
                    <HeaderStyle BackColor="#f5f5f5" ForeColor="#333" Font-Bold="true" Height="35px" />
                    <RowStyle Height="32px" />
                    <AlternatingRowStyle BackColor="#fafafa" />
                    <PagerStyle Height="35px" />
                    <Columns>
                        <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                            <ItemTemplate>
                                <asp:CheckBox ID="CBSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="序号" DataField="RowNum" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="学号" DataField="Qnum" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="姓名" DataField="Sname" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="签到时间" DataField="Qdate" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="座位号" DataField="Qmachine" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="IP地址" DataField="Qip" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="学习表现" DataField="Qattitude" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="备注" DataField="Qnote" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
