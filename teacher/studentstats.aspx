<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="studentstats.aspx.cs" Inherits="Teacher_studentstats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .stats-container {
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
            flex-wrap: wrap;
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
        .filter-bar {
            background: white;
            border-radius: 10px;
            padding: 15px 20px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }
        .filter-bar .filter-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .filter-bar .filter-item label {
            font-size: 14px;
            color: #666;
        }
        .filter-bar select {
            padding: 6px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
        .summary-cards {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        .summary-card {
            flex: 1;
            min-width: 120px;
            background: white;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }
        .summary-card .value {
            font-size: 28px;
            font-weight: bold;
            color: #667eea;
        }
        .summary-card .label {
            font-size: 13px;
            color: #666;
            margin-top: 5px;
        }
        .summary-card.green .value { color: #11998e; }
        .summary-card.orange .value { color: #f39c12; }
        .summary-card.red .value { color: #eb3349; }
        .summary-card.blue .value { color: #3498db; }
        .grid-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            padding: 15px;
            overflow-x: auto;
        }
        .grid-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .grid-header .title {
            font-size: 16px;
            font-weight: bold;
            color: #333;
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
        .add-score { color: #11998e; font-weight: bold; }
        .sub-score { color: #eb3349; font-weight: bold; }
        .reason-cell { 
            font-size: 12px; 
            text-align: left !important; 
            max-width: 200px;
            word-break: break-all;
        }
        .reason-add { color: #11998e; }
        .reason-sub { color: #eb3349; }
    </style>
    
    <div class="stats-container">
        <div class="header-bar">
            <div class="title">学生统计</div>
            <div class="selector">
                <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True"
                    onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                </asp:DropDownList>
                <span>年级</span>
                <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True"
                    onselectedindexchanged="DDLclass_SelectedIndexChanged">
                </asp:DropDownList>
                <span>班级</span>
            </div>
            <asp:Button ID="BtnReturn" runat="server" Text="返回" CssClass="btn-return"
                onclick="BtnReturn_Click" ToolTip="返回管理页面" />
        </div>

        <asp:Panel ID="PanelNoClass" runat="server" Visible="false">
            <div class="no-class-tip">
                <div class="icon">📊</div>
                <div>当前没有正在上课的班级，请先在"开始上课"页面选择班级开始上课</div>
            </div>
        </asp:Panel>

        <asp:Panel ID="PanelContent" runat="server" Visible="true">
            <div class="filter-bar">
                <div class="filter-item">
                    <label>学期：</label>
                    <asp:DropDownList ID="DDLterm" runat="server" AutoPostBack="True"
                        onselectedindexchanged="DDLterm_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="filter-item">
                    <label>课程：</label>
                    <asp:DropDownList ID="DDLcourse" runat="server" AutoPostBack="True"
                        onselectedindexchanged="DDLcourse_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <div class="summary-cards">
                <div class="summary-card green">
                    <div class="value"><asp:Label ID="lblTotalStudents" runat="server">0</asp:Label></div>
                    <div class="label">学生总数</div>
                </div>
                <div class="summary-card blue">
                    <div class="value"><asp:Label ID="lblTotalSignin" runat="server">0</asp:Label></div>
                    <div class="label">签到总次数</div>
                </div>
                <div class="summary-card orange">
                    <div class="value"><asp:Label ID="lblTotalWorks" runat="server">0</asp:Label></div>
                    <div class="label">作业提交总数</div>
                </div>
                <div class="summary-card">
                    <div class="value"><asp:Label ID="lblAvgScore" runat="server">0</asp:Label></div>
                    <div class="label">平均综合分</div>
                </div>
                <div class="summary-card green">
                    <div class="value"><asp:Label ID="lblTotalAddCount" runat="server">0</asp:Label></div>
                    <div class="label">加分总次数</div>
                </div>
                <div class="summary-card red">
                    <div class="value"><asp:Label ID="lblTotalSubCount" runat="server">0</asp:Label></div>
                    <div class="label">扣分总次数</div>
                </div>
            </div>

            <div class="grid-container">
                <div class="grid-header">
                    <div class="title">学生详细统计</div>
                </div>
                <asp:GridView ID="GVStats" runat="server" AutoGenerateColumns="False" 
                    Width="100%" CellPadding="8" GridLines="Both" 
                    BorderColor="#e0e0e0" BorderStyle="Solid" BorderWidth="1px"
                    AllowPaging="True" PageSize="30" 
                    onpageindexchanging="GVStats_PageIndexChanging"
                    OnRowDataBound="GVStats_RowDataBound">
                    <HeaderStyle BackColor="#f5f5f5" ForeColor="#333" Font-Bold="true" Height="35px" />
                    <RowStyle Height="32px" />
                    <AlternatingRowStyle BackColor="#fafafa" />
                    <PagerStyle Height="35px" />
                    <Columns>
                        <asp:BoundField HeaderText="序号" DataField="RowNum" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="学号" DataField="Snum" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="姓名" DataField="Sname" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="座位" DataField="Sseat" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="应到" DataField="ShouldCount" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="签到" DataField="SignCount" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="作业数" DataField="WorkCount" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="作业分" DataField="WorkScore" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="作品分" DataField="Sscore" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="测验分" DataField="Squiz" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="加分次数" DataField="AddCount" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="扣分次数" DataField="SubCount" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="加分分数" DataField="TotalAddScore" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="扣分分数" DataField="TotalSubScore" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="表现分" DataField="Sattitude" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="加分原因" DataField="AddReasons" ItemStyle-CssClass="reason-cell reason-add" />
                        <asp:BoundField HeaderText="扣分原因" DataField="SubReasons" ItemStyle-CssClass="reason-cell reason-sub" />
                        <asp:BoundField HeaderText="综合分" DataField="Stenscore" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
