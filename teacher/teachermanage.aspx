<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="teachermanage.aspx.cs" Inherits="Teacher_teachermanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .manage-container {
            width: 98%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 0;
        }
        .section-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
            padding-left: 10px;
            border-left: 4px solid #667eea;
        }
        .link-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 30px;
        }
        .link-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            min-width: 140px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            transition: all 0.3s;
            text-decoration: none;
            color: #333;
            display: block;
        }
        .link-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.2);
            color: #667eea;
        }
        .link-card .icon {
            font-size: 32px;
            margin-bottom: 10px;
        }
        .link-card .text {
            font-size: 14px;
            font-weight: 500;
        }
        .student-section .link-card {
            border-top: 3px solid #11998e;
        }
        .student-section .section-title {
            border-left-color: #11998e;
        }
        .teach-section .link-card {
            border-top: 3px solid #667eea;
        }
        .teach-section .section-title {
            border-left-color: #667eea;
        }
        .system-section .link-card {
            border-top: 3px solid #ff6b6b;
        }
        .system-section .section-title {
            border-left-color: #ff6b6b;
        }
    </style>
    
    <div class="manage-container">
        <div class="student-section">
            <div class="section-title">学生管理</div>
            <div class="link-grid">
                <asp:HyperLink ID="HLsignin" runat="server" NavigateUrl="~/teacher/signinmanage.aspx" CssClass="link-card">
                    <div class="icon">⭐</div>
                    <div class="text">表现评价</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLstudentstats" runat="server" NavigateUrl="~/teacher/studentstats.aspx" CssClass="link-card">
                    <div class="icon">📊</div>
                    <div class="text">学习统计</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLpostclasscheck" runat="server" NavigateUrl="~/teacher/PostClassCheck.aspx" CssClass="link-card">
                    <div class="icon">🔍</div>
                    <div class="text">课后检查</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLclasscheck" runat="server" NavigateUrl="~/teacher/check.aspx" CssClass="link-card">
                    <div class="icon">✅</div>
                    <div class="text">课前检查</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLpingjia" runat="server" NavigateUrl="~/pingjia/pingjia.aspx" CssClass="link-card">
                    <div class="icon">📝</div>
                    <div class="text">学生评价</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLseat" runat="server" NavigateUrl="~/teacher/seatmanage.aspx" CssClass="link-card">
                    <div class="icon">🪑</div>
                    <div class="text">座位管理</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLstudentnumedit" runat="server" NavigateUrl="~/teacher/studentnumedit.aspx" CssClass="link-card">
                    <div class="icon">✏️</div>
                    <div class="text">修改学号</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLhonorboard" runat="server" NavigateUrl="~/teacher/honorboardmanage.aspx" CssClass="link-card">
                    <div class="icon">🏆</div>
                    <div class="text">荣誉榜设置</div>
                </asp:HyperLink>
            </div>
        </div>
        
        <div class="teach-section">
            <div class="section-title">教学管理</div>
            <div class="link-grid">
                <asp:HyperLink ID="HLskdjshow" runat="server" NavigateUrl="~/teacher/skdjshow.aspx" CssClass="link-card">
                    <div class="icon">📋</div>
                    <div class="text">登记查看</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLsigninview" runat="server" NavigateUrl="~/teacher/signin.aspx" CssClass="link-card">
                    <div class="icon">📌</div>
                    <div class="text">签到查看</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLlesson" runat="server" NavigateUrl="~/kcb/CourseSchedule.aspx" CssClass="link-card">
                    <div class="icon">📅</div>
                    <div class="text">课表管理</div>
                </asp:HyperLink>
            </div>
        </div>
        
        <div class="system-section">
            <div class="section-title">系统管理</div>
            <div class="link-grid">
                <asp:HyperLink ID="HLcomputer" runat="server" NavigateUrl="~/teacher/computers.aspx" CssClass="link-card">
                    <div class="icon">💻</div>
                    <div class="text">机器名IP对应表</div>
                </asp:HyperLink>
                <asp:HyperLink ID="HLmythware" runat="server" NavigateUrl="~/teacher/mythware.aspx" CssClass="link-card">
                    <div class="icon">🖥️</div>
                    <div class="text">极域班级模型</div>
                </asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
