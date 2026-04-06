<%@ Page Title="" Language="C#" MasterPageFile="~/lessons/prescm.master"  StylesheetTheme="Student"  AutoEventWireup="true" CodeFile="presurvey.aspx.cs" Inherits="Lessons_presurvey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Ppcm" Runat="Server">
    <style type="text/css">
        .presurvey-page { width: min(1180px, calc(100% - 24px)); margin: 0 auto; display: flex; flex-direction: column; gap: 20px; }
        .presurvey-toolbar { position: sticky; top: 16px; z-index: 1000; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; padding: 18px 22px; border-radius: 20px; border: 1px solid rgba(148, 163, 184, 0.22); background: rgba(255,255,255,.92); box-shadow: 0 16px 36px rgba(15, 23, 42, 0.12); backdrop-filter: blur(14px); }
        .presurvey-toolbar__intro { display: flex; flex-direction: column; gap: 4px; flex: 1 1 320px; }
        .presurvey-toolbar__eyebrow { font-size: 12px; font-weight: 700; letter-spacing: .12em; text-transform: uppercase; color: #2563eb; }
        .presurvey-toolbar__title { font-size: 22px; font-weight: 800; line-height: 1.2; color: #0f172a; }
        .presurvey-toolbar__meta { font-size: 14px; color: #475569; line-height: 1.7; }
        .presurvey-toolbar__actions { display: flex; align-items: center; justify-content: flex-end; flex-wrap: wrap; gap: 12px; flex: 0 1 auto; }
        .presurvey-btn, .presurvey-btn-disabled { display: inline-flex; align-items: center; justify-content: center; min-height: 44px; min-width: 126px; padding: 0 18px; border-radius: 14px; border: 1px solid #cbd5e1; font-weight: 700; text-decoration: none; box-shadow: 0 12px 24px rgba(15, 23, 42, 0.08); transition: all .3s ease; }
        .presurvey-btn { background: linear-gradient(135deg, #64748b, #475569); color: #f8fafc; cursor: pointer; }
        .presurvey-btn:hover { color: #f8fafc; text-decoration: none; transform: translateY(-2px); }
        .presurvey-btn-disabled { background: #e2e8f0; color: #64748b; cursor: not-allowed; }
        .presurvey-badge { display: inline-flex; align-items: center; justify-content: center; min-width: 128px; padding: 12px 16px; border-radius: 14px; background: linear-gradient(135deg, #f59e0b, #d97706); color: #fff7ed; font-size: 14px; font-weight: 800; box-shadow: 0 12px 24px rgba(217, 119, 6, 0.2); }
        .presurvey-card, .presurvey-content, .presurvey-preview-note { background: #fff; border: 1px solid #e2e8f0; border-radius: 20px; box-shadow: 0 8px 24px rgba(15, 23, 42, 0.06); }
        .presurvey-card { padding: 24px; overflow: hidden; }
        .presurvey-meta { display: flex; flex-wrap: wrap; gap: 12px 24px; align-items: center; padding: 14px 16px; border-radius: 16px; background: #f8fafc; border: 1px solid #e2e8f0; color: #475569; }
        .presurvey-meta strong { color: #0f172a; }
        .presurvey-content { padding: 24px; line-height: 1.9; color: #334155; }
        .presurvey-preview-note { display: flex; align-items: flex-start; justify-content: space-between; gap: 16px; flex-wrap: wrap; padding: 20px 24px; background: linear-gradient(135deg, #f8fbff 0%, #f1f5f9 100%); }
        .presurvey-preview-note__info { display: flex; flex-direction: column; gap: 6px; flex: 1 1 260px; }
        .presurvey-preview-note__label { font-size: 12px; font-weight: 700; letter-spacing: .08em; text-transform: uppercase; color: #475569; }
        .presurvey-preview-note__title { font-size: 18px; font-weight: 800; color: #0f172a; }
        .presurvey-preview-note__desc { font-size: 14px; line-height: 1.7; color: #475569; }
        .presurvey-preview-note__status { display: inline-flex; align-items: center; justify-content: center; min-width: 156px; padding: 10px 14px; border-radius: 999px; background: #eff6ff; color: #1d4ed8; font-size: 14px; font-weight: 800; }
        .presurvey-question-shell { width: min(760px, 100%); margin: 0 auto; padding: 24px; background: #fff; border: 1px solid #e2e8f0; border-radius: 20px; box-shadow: 0 8px 24px rgba(15, 23, 42, 0.06); }
        .presurvey-question-head { display: flex; align-items: center; justify-content: space-between; gap: 12px; flex-wrap: wrap; margin-bottom: 18px; padding-bottom: 16px; border-bottom: 1px solid #e2e8f0; }
        .presurvey-question-head__title { font-size: 18px; font-weight: 800; color: #0f172a; }
        .presurvey-question-head__meta { font-size: 14px; color: #64748b; }
        .presurvey-action-row { display: flex; align-items: center; justify-content: center; gap: 12px; flex-wrap: wrap; margin-top: 20px; }
        .presurvey-action-note { margin-top: 12px; font-size: 13px; color: #64748b; line-height: 1.7; text-align: center; }
        .presurvey-float { position: fixed; left: max(12px, calc(50% - 700px)); top: 190px; width: 140px; padding: 14px 16px; border-radius: 18px; border: 1px solid #dbeafe; background: rgba(239,246,255,.96); color: #1e3a8a; box-shadow: 0 16px 32px rgba(37,99,235,.12); }
        .presurvey-float__label { font-size: 12px; font-weight: 700; letter-spacing: .08em; text-transform: uppercase; color: #475569; }
        .presurvey-float__value { margin-top: 8px; font-size: 24px; font-weight: 800; color: #1d4ed8; }
        .presurvey-footer-note { text-align: center; font-size: 14px; color: #64748b; line-height: 1.8; }
        @media (max-width: 768px) {
            .presurvey-page { width: calc(100% - 12px); }
            .presurvey-toolbar { top: 12px; padding: 16px; }
            .presurvey-toolbar__intro, .presurvey-toolbar__actions { flex: 1 1 100%; }
            .presurvey-toolbar__actions { justify-content: flex-start; }
            .presurvey-float { position: static; width: 100%; }
        }
        @media (max-width: 480px) {
            .presurvey-btn, .presurvey-btn-disabled, .presurvey-badge { width: calc(50% - 6px); min-width: 0; }
            .presurvey-preview-note, .presurvey-question-head { flex-direction: column; align-items: flex-start; }
        }
    </style>

    <div id="student" class="presurvey-page">
        <div class="presurvey-toolbar">
            <div class="presurvey-toolbar__intro">
                <div class="presurvey-toolbar__eyebrow">教师预览</div>
                <div class="presurvey-toolbar__title">旧版 Survey 预览</div>
                <div class="presurvey-toolbar__meta">用于教师查看学生端作答页面布局与当前评估方式，预览模式下不会真实提交结果。</div>
            </div>
            <div class="presurvey-toolbar__actions">
                <div class="presurvey-badge"><%= EnableAiAssessment ? "AI 评价" : "规则模式" %></div>
                <a href="<%=ReturnUrl %>" class="presurvey-btn">返回学案</a>
            </div>
        </div>

        <div class="presurvey-card">
            <div class="course-node-head flex items-center gap-3 mb-4" style="padding:24px 24px 20px;margin:-24px -24px 16px;">
                <asp:ImageButton ID="Btnclock" runat="server" ImageUrl="~/images/clock.gif" Enabled="False" />
                <asp:Label runat="server" ID="Lbtitle" Font-Bold="True" Font-Size="16px"></asp:Label>
            </div>
            <div class="presurvey-meta">
                <div>姓名：<strong><asp:Label runat="server" ID="Lbsname" ForeColor="#0066FF">演示</asp:Label></strong></div>
                <div>学号：<strong><asp:Label runat="server" ID="Lbsnum" ForeColor="#0066FF">10101010</asp:Label></strong></div>
                <div>得分：<strong><asp:Label runat="server" ID="Lbfscore" ForeColor="#0066FF">00</asp:Label></strong></div>
                <div>类型：<strong><asp:Label runat="server" ID="Lbtypecn" ForeColor="#0066FF"></asp:Label></strong></div>
                <asp:Label runat="server" ID="Lbtype" Visible="False"></asp:Label>
                <asp:Label runat="server" ID="Lbcheck" Font-Bold="False"></asp:Label>
            </div>
        </div>

        <div class="presurvey-content">
            <div id="vcontent" runat="server"></div>
        </div>

        <div class="presurvey-preview-note">
            <div class="presurvey-preview-note__info">
                <div class="presurvey-preview-note__label">当前预览</div>
                <div class="presurvey-preview-note__title"><%= EnableAiAssessment ? "学生提交后将生成 AI 测验评估" : "学生提交后将生成规则评估摘要" %></div>
                <div class="presurvey-preview-note__desc">这里展示的是学生端作答页效果。教师预览仅用于检查题目、文案和评估方式，不会保存学生作答记录。</div>
            </div>
            <div class="presurvey-preview-note__status"><%= EnableAiAssessment ? "AI 已启用" : "规则模式" %></div>
        </div>

        <div class="presurvey-question-shell">
            <div class="presurvey-question-head">
                <div class="presurvey-question-head__title">题目预览</div>
                <div class="presurvey-question-head__meta">按学生端页面显示当前 Survey 题目列表与选项。</div>
            </div>
            <asp:DataList ID="DataListonly" runat="server" DataKeyField="Qid"
                RepeatColumns="1" RepeatLayout="Flow"
                onitemdatabound="DataListonly_ItemDataBound" >
                <ItemTemplate>
                    <div onmouseover="this.style.backgroundColor='#F8DFC9'" onmouseout="this.style.backgroundColor='' " style="margin: auto; border-bottom-style: dashed; border-bottom-width: 1px; border-bottom-color: #B0B0B0;">
                        <div style="width: 30px; float: left; left:6px; background-color: #F8DFC9;">
                            &nbsp;<asp:Label ID="Labelnum" Text='<%# Container.ItemIndex + 1%> ' runat="server" Font-Bold="True"></asp:Label>
                        </div>
                        <div style="width: 450px; float: left; left:40px">
                            &nbsp;<asp:Label ID="Labelquestion" runat="server" Text='<%# HttpUtility.HtmlDecode( Eval("Qtitle").ToString()) %>'></asp:Label>
                        </div>
                        <br />
                        <div style="margin: auto; width: 80%;">
                            <asp:RadioButtonList ID="RBLselect" runat="server"
                                RepeatLayout="Flow" RepeatColumns="1" RepeatDirection="Horizontal"
                                CellPadding="3" CellSpacing="6">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <div class="presurvey-action-row">
                <asp:Button ID="Btnok" runat="server" Text="提交答卷" BorderStyle="None" CssClass="presurvey-btn-disabled" />
                <asp:Button ID="Btnshow" runat="server" Text="查看结果" BorderStyle="None" CssClass="presurvey-btn-disabled" />
            </div>
            <div class="presurvey-action-note">预览模式下按钮仅用于展示学生端布局，不会执行真实提交。</div>
        </div>

        <script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" >
        function passrefresh() {
                var target = document.getElementById("ctl00_Ppcm_Lbtime");
                if (!target) return;
                var oldt = parseInt(target.innerHTML || target.textContent || "0", 10) || 0;
                target.innerHTML = oldt + 1;
        }
        setTimeout("passrefresh()", 60000); //指定60秒刷新一次       
        </script>

        <div id="editInfo" class="presurvey-float">
            <div class="presurvey-float__label">时间流逝</div>
            <div class="presurvey-float__value"><asp:Label runat="server" ID="Lbtime" Font-Bold="True">0</asp:Label> 分钟</div>
        </div>

        <div class="presurvey-footer-note">
            注意：调查测验限时 8 分钟，每超 1 分钟扣除 1 学分。
        </div>
    </div>
</asp:Content>
