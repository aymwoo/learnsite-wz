<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" AutoEventWireup="true" CodeFile="surveysettings.aspx.cs" Inherits="teacher_surveysettings" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .survey-settings-shell { width: min(1180px, calc(100% - 24px)); margin: 0 auto; padding: 24px 0 40px; display: flex; flex-direction: column; gap: 20px; }
        .survey-settings-toolbar { position: sticky; top: 16px; z-index: 1000; display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 16px; padding: 18px 22px; border-radius: 20px; border: 1px solid rgba(148, 163, 184, 0.22); background: rgba(255,255,255,.92); box-shadow: 0 16px 36px rgba(15, 23, 42, 0.12); backdrop-filter: blur(14px); }
        .survey-settings-toolbar-intro { display: flex; flex-direction: column; gap: 4px; flex: 1 1 320px; }
        .survey-settings-toolbar-eyebrow { font-size: 12px; font-weight: 700; letter-spacing: .12em; text-transform: uppercase; color: #2563eb; }
        .survey-settings-toolbar-title { font-size: 22px; font-weight: 800; line-height: 1.2; color: #0f172a; }
        .survey-settings-toolbar-meta { font-size: 14px; color: #475569; line-height: 1.7; }
        .survey-settings-toolbar-actions { display: flex; flex-wrap: wrap; align-items: center; justify-content: flex-end; gap: 12px; flex: 0 1 auto; }
        .survey-settings-card { background: #fff; border: 1px solid #e2e8f0; border-radius: 24px; box-shadow: 0 16px 40px -28px rgba(15, 23, 42, 0.45); overflow: hidden; }
        .survey-settings-hero { padding: 28px 32px; background: linear-gradient(135deg, #1d4ed8 0%, #4338ca 55%, #7c3aed 100%); color: #fff; }
        .survey-settings-kicker { display: inline-block; padding: 6px 12px; border-radius: 999px; background: rgba(255,255,255,.16); border: 1px solid rgba(255,255,255,.18); font-size: 12px; font-weight: 700; letter-spacing: .08em; }
        .survey-settings-title { margin: 14px 0 0; font-size: 28px; font-weight: 800; line-height: 1.25; }
        .survey-settings-subtitle { margin: 10px 0 0; max-width: 720px; color: rgba(255,255,255,.88); line-height: 1.8; }
        .survey-settings-body { padding: 28px 32px 32px; display: grid; gap: 22px; }
        .survey-settings-btn-row { display: flex; flex-wrap: wrap; gap: 12px; }
        .survey-settings-btn { display: inline-flex; align-items: center; justify-content: center; min-height: 44px; min-width: 126px; padding: 0 18px; border-radius: 14px; border: 1px solid #cbd5e1; background: #eff6ff; color: #1d4ed8; font-weight: 700; text-decoration: none; box-shadow: 0 12px 24px rgba(15, 23, 42, 0.08); transition: all .3s ease; }
        .survey-settings-btn:hover { color: #1e40af; background: #dbeafe; text-decoration: none; transform: translateY(-2px); }
        .survey-settings-btn-primary { border-color: #2563eb; background: linear-gradient(135deg, #2563eb 0%, #4338ca 100%); color: #fff; cursor: pointer; }
        .survey-settings-btn-primary:hover { color: #fff; background: linear-gradient(135deg, #1d4ed8 0%, #3730a3 100%); }
        .survey-settings-grid { display: grid; gap: 18px; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); }
        .survey-settings-info { padding: 18px 20px; border-radius: 18px; border: 1px solid #e2e8f0; background: #f8fafc; }
        .survey-settings-info-label { font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: .05em; }
        .survey-settings-info-value { margin-top: 8px; font-size: 16px; font-weight: 700; color: #0f172a; word-break: break-word; }
        .survey-settings-toggle { padding: 22px 24px; border-radius: 22px; border: 1px solid #bfdbfe; background: linear-gradient(135deg, #eff6ff 0%, #f8fbff 100%); }
        .survey-settings-toggle-head { display: flex; flex-wrap: wrap; align-items: center; gap: 10px; }
        .survey-settings-toggle-badge { display: inline-flex; align-items: center; justify-content: center; min-width: 78px; padding: 4px 10px; border-radius: 999px; background: #2563eb; color: #fff; font-size: 12px; font-weight: 700; }
        .survey-settings-toggle-status { font-size: 15px; font-weight: 700; color: #1e3a8a; }
        .survey-settings-toggle-label { display: inline-flex; align-items: center; gap: 10px; margin-top: 14px; font-size: 16px; font-weight: 700; color: #0f172a; cursor: pointer; }
        .survey-settings-toggle-label input { width: 18px; height: 18px; accent-color: #2563eb; }
        .survey-settings-toggle-desc { margin-top: 12px; color: #475569; line-height: 1.8; }
        .survey-settings-section-title { font-size: 18px; font-weight: 800; color: #0f172a; }
        .survey-settings-content { padding: 22px 24px; border-radius: 22px; border: 1px solid #e2e8f0; background: #fff; color: #334155; line-height: 1.9; }
        .survey-settings-message { padding: 14px 18px; border-radius: 16px; background: #ecfeff; border: 1px solid #a5f3fc; color: #155e75; font-weight: 600; }
        .survey-settings-message--error { background: #fef2f2; border-color: #fecaca; color: #991b1b; }
        .survey-settings-message--success { background: #ecfeff; border-color: #a5f3fc; color: #155e75; }
        @media (max-width: 768px) {
            .survey-settings-shell { width: calc(100% - 12px); }
            .survey-settings-toolbar { top: 12px; padding: 16px; }
            .survey-settings-toolbar-intro, .survey-settings-toolbar-actions { flex: 1 1 100%; }
            .survey-settings-toolbar-actions { justify-content: flex-start; }
        }
        @media (max-width: 480px) {
            .survey-settings-btn { width: calc(50% - 6px); min-width: 0; }
        }
    </style>

    <div class="survey-settings-shell">
        <div class="survey-settings-toolbar">
            <div class="survey-settings-toolbar-intro">
                <div class="survey-settings-toolbar-eyebrow">Survey AI</div>
                <div class="survey-settings-toolbar-title">旧版 Survey 设置</div>
                <div class="survey-settings-toolbar-meta">按单个活动控制是否启用 AI 评价，并快速打开教师预览或学生页面检查结果。</div>
            </div>
            <div class="survey-settings-toolbar-actions">
                <asp:HyperLink ID="HyperLinkReturn" runat="server" CssClass="survey-settings-btn">返回学案</asp:HyperLink>
                <asp:HyperLink ID="HyperLinkPreview" runat="server" CssClass="survey-settings-btn" Target="_blank">教师预览</asp:HyperLink>
                <asp:HyperLink ID="HyperLinkStudent" runat="server" CssClass="survey-settings-btn" Target="_blank">学生页面</asp:HyperLink>
                <asp:Button ID="BtnSave" runat="server" CssClass="survey-settings-btn survey-settings-btn-primary" Text="保存设置" OnClick="BtnSave_Click" />
            </div>
        </div>

        <div class="survey-settings-card">
            <div class="survey-settings-hero">
                <span class="survey-settings-kicker">Survey AI</span>
                <h1 class="survey-settings-title"><asp:Literal ID="LiteralTitle" runat="server"></asp:Literal></h1>
                <p class="survey-settings-subtitle">旧版 Survey 调查/测验也支持按单个活动独立控制 AI 评价。开启后，学生提交时调用 AI 生成测验评估；关闭后只生成规则评估摘要。</p>
            </div>
            <div class="survey-settings-body">
                <div class="survey-settings-grid">
                    <div class="survey-settings-info">
                        <div class="survey-settings-info-label">活动类型</div>
                        <div class="survey-settings-info-value"><asp:Literal ID="LiteralType" runat="server"></asp:Literal></div>
                    </div>
                    <div class="survey-settings-info">
                        <div class="survey-settings-info-label">课程编号</div>
                        <div class="survey-settings-info-value"><asp:Literal ID="LiteralCid" runat="server"></asp:Literal></div>
                    </div>
                    <div class="survey-settings-info">
                        <div class="survey-settings-info-label">Survey 编号</div>
                        <div class="survey-settings-info-value"><asp:Literal ID="LiteralVid" runat="server"></asp:Literal></div>
                    </div>
                </div>

                <div class="survey-settings-toggle">
                    <div class="survey-settings-toggle-head">
                        <span class="survey-settings-toggle-badge">AI 评价</span>
                        <span class="survey-settings-toggle-status"><asp:Literal ID="LiteralStatus" runat="server"></asp:Literal></span>
                    </div>
                    <label class="survey-settings-toggle-label">
                        <asp:CheckBox ID="CheckBoxEnableAi" runat="server" />
                        <span>启用 AI 评价</span>
                    </label>
                    <div class="survey-settings-toggle-desc">按当前调查/测验单独控制。该设置不会影响其它 Survey 活动，也不会依赖全局是否默认启用 AI。</div>
                </div>

                <div class="survey-settings-section-title">活动说明</div>
                <div class="survey-settings-content">
                    <asp:Literal ID="LiteralContent" runat="server"></asp:Literal>
                </div>

                <asp:Label ID="LabelMessage" runat="server" CssClass="survey-settings-message" Visible="false"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
