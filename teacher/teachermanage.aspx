<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="teachermanage.aspx.cs" Inherits="Teacher_teachermanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style>
        .manage-page { padding: 24px; }
        .manage-shell { display: flex; flex-direction: column; gap: 24px; }
        .manage-hero {
            position: relative;
            overflow: hidden;
            border-radius: 24px;
            padding: 28px 32px;
            background: linear-gradient(135deg, #0f172a 0%, #4f46e5 50%, #06b6d4 100%);
            color: #eff6ff;
            box-shadow: 0 20px 46px rgba(15, 23, 42, 0.16);
        }
        .manage-hero::after {
            content: "";
            position: absolute;
            top: -60px;
            right: -40px;
            width: 220px;
            height: 220px;
            border-radius: 999px;
            background: rgba(255,255,255,0.08);
        }
        .manage-hero__content {
            position: relative;
            z-index: 1;
            display: flex;
            justify-content: space-between;
            gap: 20px;
            flex-wrap: wrap;
            align-items: flex-start;
        }
        .manage-hero__title { margin: 0; font-size: 32px; font-weight: 800; letter-spacing: 0.04em; }
        .manage-hero__subtitle { margin: 10px 0 0; max-width: 760px; color: rgba(239,246,255,0.9); line-height: 1.75; }
        .manage-hero__chip {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 10px 14px;
            border-radius: 14px;
            background: rgba(15,23,42,0.22);
            border: 1px solid rgba(255,255,255,0.16);
            font-weight: 700;
        }
        .manage-grid {
            display: grid;
            grid-template-columns: repeat(12, minmax(0, 1fr));
            gap: 20px;
        }
        .manage-section {
            grid-column: span 12;
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 22px;
            box-shadow: 0 14px 34px rgba(15, 23, 42, 0.06);
            overflow: hidden;
        }
        .manage-section__head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding: 22px 24px 0;
        }
        .manage-section__title { margin: 0; font-size: 20px; font-weight: 800; color: #0f172a; }
        .manage-section__desc { margin: 6px 0 0; color: #64748b; font-size: 14px; }
        .manage-section__body { padding: 22px 24px 24px; }
        .manage-section--student .manage-badge { background: #dcfce7; color: #15803d; }
        .manage-section--teach .manage-badge { background: #dbeafe; color: #1d4ed8; }
        .manage-section--system .manage-badge { background: #fee2e2; color: #dc2626; }
        .manage-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 84px;
            padding: 8px 12px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 800;
        }
        .manage-link-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 14px;
        }
        .manage-link {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 18px 18px;
            border-radius: 18px;
            border: 1px solid #e2e8f0;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
            text-decoration: none;
            color: #0f172a;
            transition: transform 0.18s ease, box-shadow 0.18s ease, border-color 0.18s ease;
        }
        .manage-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 24px rgba(59, 130, 246, 0.12);
            border-color: #93c5fd;
            color: #0f172a;
        }
        .manage-link__icon {
            width: 48px;
            height: 48px;
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 24px;
            box-shadow: inset 0 0 0 1px rgba(255,255,255,0.5);
        }
        .manage-section--student .manage-link__icon { background: linear-gradient(135deg, #dcfce7 0%, #bbf7d0 100%); }
        .manage-section--teach .manage-link__icon { background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%); }
        .manage-section--system .manage-link__icon { background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%); }
        .manage-link__text { display: flex; flex-direction: column; gap: 4px; min-width: 0; }
        .manage-link__title { font-size: 15px; font-weight: 800; }
        .manage-link__desc { font-size: 13px; color: #64748b; line-height: 1.5; }
        @media (max-width: 1180px) {
            .manage-link-grid { grid-template-columns: repeat(3, minmax(0, 1fr)); }
        }
        @media (max-width: 860px) {
            .manage-link-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        }
        @media (max-width: 640px) {
            .manage-page { padding: 16px; }
            .manage-hero { padding: 22px 20px; }
            .manage-hero__title { font-size: 26px; }
            .manage-section__head, .manage-section__body { padding-left: 18px; padding-right: 18px; }
            .manage-link-grid { grid-template-columns: 1fr; }
        }
    </style>

    <div class="manage-page">
        <div class="manage-shell">
            <section class="manage-hero">
                <div class="manage-hero__content">
                    <div>
                        <h1 class="manage-hero__title">课堂管理中心</h1>
                        <p class="manage-hero__subtitle">汇总学生管理、教学巡检与机房系统工具入口，方便教师在课堂前、中、后快速切换常用管理功能。</p>
                    </div>
                    <div class="manage-hero__chip">Teacher Control Hub</div>
                </div>
            </section>

            <div class="manage-grid">
                <section class="manage-section manage-section--student">
                    <div class="manage-section__head">
                        <div>
                            <h2 class="manage-section__title">学生管理</h2>
                            <p class="manage-section__desc">围绕学生表现、统计、检查、座位与班级信息维护的常用入口。</p>
                        </div>
                        <span class="manage-badge">Student</span>
                    </div>
                    <div class="manage-section__body">
                        <div class="manage-link-grid">
                            <asp:HyperLink ID="HLsignin" runat="server" NavigateUrl="~/teacher/signinmanage.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">⭐</span>
                                <span class="manage-link__text"><span class="manage-link__title">表现评价</span><span class="manage-link__desc">查看并管理学生课堂表现记录</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLstudentstats" runat="server" NavigateUrl="~/teacher/studentstats.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">📊</span>
                                <span class="manage-link__text"><span class="manage-link__title">学习统计</span><span class="manage-link__desc">统计学生学习数据与参与情况</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLpostclasscheck" runat="server" NavigateUrl="~/teacher/PostClassCheck.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">🔍</span>
                                <span class="manage-link__text"><span class="manage-link__title">课后检查</span><span class="manage-link__desc">课后作业与课堂成果抽查入口</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLclasscheck" runat="server" NavigateUrl="~/teacher/check.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">✅</span>
                                <span class="manage-link__text"><span class="manage-link__title">课前检查</span><span class="manage-link__desc">上课前机房与学生状态检查</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLpingjia" runat="server" NavigateUrl="~/pingjia/pingjia.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">📝</span>
                                <span class="manage-link__text"><span class="manage-link__title">学生评价</span><span class="manage-link__desc">进入学生综合评价模块</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLseat" runat="server" NavigateUrl="~/teacher/seatmanage.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">🪑</span>
                                <span class="manage-link__text"><span class="manage-link__title">座位管理</span><span class="manage-link__desc">机房座位与学生位置调整</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLstudentnumedit" runat="server" NavigateUrl="~/teacher/studentnumedit.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">✏️</span>
                                <span class="manage-link__text"><span class="manage-link__title">修改学号</span><span class="manage-link__desc">批量修正学生学号信息</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLhonorboard" runat="server" NavigateUrl="~/teacher/honorboardmanage.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">🏆</span>
                                <span class="manage-link__text"><span class="manage-link__title">荣誉榜设置</span><span class="manage-link__desc">配置荣誉榜展示与荣誉规则</span></span>
                            </asp:HyperLink>
                        </div>
                    </div>
                </section>

                <section class="manage-section manage-section--teach">
                    <div class="manage-section__head">
                        <div>
                            <h2 class="manage-section__title">教学管理</h2>
                            <p class="manage-section__desc">课表、登记与签到等教学过程类管理功能入口。</p>
                        </div>
                        <span class="manage-badge">Teaching</span>
                    </div>
                    <div class="manage-section__body">
                        <div class="manage-link-grid">
                            <asp:HyperLink ID="HLskdjshow" runat="server" NavigateUrl="~/teacher/skdjshow.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">📋</span>
                                <span class="manage-link__text"><span class="manage-link__title">登记查看</span><span class="manage-link__desc">查看课堂登记与教学记录信息</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLsigninview" runat="server" NavigateUrl="~/teacher/signin.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">📌</span>
                                <span class="manage-link__text"><span class="manage-link__title">签到查看</span><span class="manage-link__desc">浏览学生签到历史和统计情况</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLlesson" runat="server" NavigateUrl="~/kcb/CourseSchedule.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">📅</span>
                                <span class="manage-link__text"><span class="manage-link__title">课表管理</span><span class="manage-link__desc">维护机房课程表与上课时间安排</span></span>
                            </asp:HyperLink>
                        </div>
                    </div>
                </section>

                <section class="manage-section manage-section--system">
                    <div class="manage-section__head">
                        <div>
                            <h2 class="manage-section__title">系统管理</h2>
                            <p class="manage-section__desc">机房设备映射、广播模型等系统级支持工具。</p>
                        </div>
                        <span class="manage-badge">System</span>
                    </div>
                    <div class="manage-section__body">
                        <div class="manage-link-grid">
                            <asp:HyperLink ID="HLcomputer" runat="server" NavigateUrl="~/teacher/computers.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">💻</span>
                                <span class="manage-link__text"><span class="manage-link__title">机器名 IP 对应表</span><span class="manage-link__desc">查看计算机名称与 IP 地址对应关系</span></span>
                            </asp:HyperLink>
                            <asp:HyperLink ID="HLmythware" runat="server" NavigateUrl="~/teacher/mythware.aspx" CssClass="manage-link">
                                <span class="manage-link__icon">🖥️</span>
                                <span class="manage-link__text"><span class="manage-link__title">极域班级模型</span><span class="manage-link__desc">查看并维护极域广播相关模型数据</span></span>
                            </asp:HyperLink>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
