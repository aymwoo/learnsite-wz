<%@ Page Title="" Language="C#" MasterPageFile="~/manager/Manage.master" AutoEventWireup="true" CodeFile="setting.aspx.cs" Inherits="Manager_setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .mgr-page { --ls-bg: linear-gradient(180deg,#f8fbff 0%,#f3f7ff 100%); --ls-border: #dbe6f5; --ls-text: #0f172a; --ls-muted: #64748b; padding: 28px; background: var(--ls-bg); min-height: calc(100vh - 8rem); }
        .mgr-page * { box-sizing: border-box; }
        .mgr-shell { display: flex; flex-direction: column; gap: 20px; }
        .mgr-hero { position: relative; overflow: hidden; border: 1px solid #99f6e4; border-radius: 1rem; padding: 24px 28px; background: linear-gradient(135deg,#f0fdfa 0%,#ccfbf1 100%); color: #134e4a; box-shadow: 0 4px 16px rgba(13,148,136,.08); }
        .mgr-hero__title { margin: 0; font-size: 22px; font-weight: 800; letter-spacing: -.02em; display: flex; align-items: center; gap: 10px; }
        .mgr-hero__subtitle { margin: 6px 0 0; font-size: 13px; color: rgba(240,253,250,.85); }
        .mgr-card { border: 1px solid var(--ls-border); border-radius: 1rem; background: rgba(255,255,255,.96); box-shadow: 0 12px 30px rgba(15,23,42,.05); overflow: hidden; }
        .mgr-card__head { padding: 20px 24px; border-bottom: 1px solid #f1f5f9; }
        .mgr-card__title { margin: 0; font-size: 16px; font-weight: 800; color: var(--ls-text); }
        .mgr-card__body { padding: 20px 24px; display: flex; flex-direction: column; gap: 18px; }
        .mgr-field { display: flex; align-items: center; gap: 12px; flex-wrap: wrap; }
        .mgr-label { font-size: 13px; font-weight: 700; color: #334155; min-width: 120px; }
        .mgr-select, .mgr-input { min-height: 40px; padding: 0 12px; border: 1px solid #cbd5e1; border-radius: .75rem; background: #f8fafc; color: #0f172a; font-size: 14px; transition: border-color .2s, box-shadow .2s; }
        .mgr-select:focus, .mgr-input:focus { border-color: #60a5fa; outline: none; background: #fff; box-shadow: 0 0 0 4px rgba(96,165,250,.18); }
        .mgr-btn { display: inline-flex; align-items: center; justify-content: center; min-height: 36px; padding: 0 16px; border-radius: .75rem; border: none; font-size: 13px; font-weight: 700; cursor: pointer; transition: transform .18s, box-shadow .18s; }
        .mgr-btn--primary { background: linear-gradient(135deg,#2563eb 0%,#1d4ed8 100%); color: #fff; box-shadow: 0 8px 16px rgba(37,99,235,.2); }
        .mgr-btn--primary:hover { transform: translateY(-1px); }
        .mgr-btn--amber { background: #f59e0b; color: #fff; }
        .mgr-divider { height: 1px; background: #f1f5f9; }
        .mgr-msg { font-size: 13px; font-weight: 700; color: #dc2626; }
    </style>
    <div class="mgr-page">
        <div class="mgr-shell">
            <div class="mgr-hero">
                <h1 class="mgr-hero__title"><i class="bi bi-gear-fill" style="color:#99f6e4;"></i> 系统设置</h1>
                <p class="mgr-hero__subtitle">配置平台全局参数，修改后立即生效</p>
            </div>

            <div class="mgr-card">
                <div class="mgr-card__head"><h2 class="mgr-card__title">当前设置</h2></div>
                <div class="mgr-card__body">
                    <div class="mgr-field">
                        <span class="mgr-label">网站名称</span>
                        <asp:TextBox ID="TextBoxsite" runat="server" CssClass="mgr-input" style="width:200px;"></asp:TextBox>
                        <asp:Button ID="Buttonsite" runat="server" Text="修改" onclick="Buttonsite_Click" CssClass="mgr-btn mgr-btn--primary" />
                    </div>
                    <div class="mgr-divider"></div>
                    <div class="mgr-field">
                        <span class="mgr-label">学生登录方式</span>
                        <asp:DropDownList ID="DDLLoginMode" runat="server" CssClass="mgr-select" AutoPostBack="True" onselectedindexchanged="DDLLoginMode_SelectedIndexChanged" ToolTip="选择学生登录方式">
                            <asp:ListItem Value="0">个人密码</asp:ListItem>
                            <asp:ListItem Value="1">班级密码</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mgr-field">
                        <span class="mgr-label">账号登录限制</span>
                        <asp:CheckBox ID="CheckBoxSingleLogin" runat="server" AutoPostBack="True" oncheckedchanged="CheckBoxSingleLogin_CheckedChanged" Text="一个账号只能在一台电脑登录" ToolTip="选中则一个学生账号不能在多台电脑登录同个平台！" />
                    </div>
                    <div class="mgr-divider"></div>
                    <div class="mgr-field">
                        <span class="mgr-label">当前学期</span>
                        <asp:DropDownList ID="DDLterm" runat="server" CssClass="mgr-select" AutoPostBack="True" onselectedindexchanged="DDLterm_SelectedIndexChanged">
                            <asp:ListItem Value="1">第一学期</asp:ListItem>
                            <asp:ListItem Value="2">第二学期</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mgr-field">
                        <span class="mgr-label">资源下载限制</span>
                        <asp:CheckBox ID="CheckBoxDownCan" runat="server" AutoPostBack="True" oncheckedchanged="CheckBoxDownCan_CheckedChanged" Text="是否限制下载" />
                    </div>
                    <div class="mgr-field">
                        <span class="mgr-label">资源下载时间</span>
                        <asp:DropDownList ID="DDLDownTime" runat="server" AutoPostBack="True" CssClass="mgr-select" onselectedindexchanged="DDLDownTime_SelectedIndexChanged">
                            <asp:ListItem Value="10">10分钟</asp:ListItem>
                            <asp:ListItem Value="20">20分钟</asp:ListItem>
                            <asp:ListItem Value="30">30分钟</asp:ListItem>
                            <asp:ListItem Value="40">40分钟</asp:ListItem>
                            <asp:ListItem Value="50">50分钟</asp:ListItem>
                            <asp:ListItem Value="60">60分钟</asp:ListItem>
                        </asp:DropDownList>
                        <span style="font-size:13px;color:#64748b;">之后可下载</span>
                    </div>
                    <div class="mgr-field">
                        <span class="mgr-label">作品查看时间</span>
                        <asp:DropDownList ID="DDLworkdowntime" runat="server" CssClass="mgr-select" AutoPostBack="True" onselectedindexchanged="DDLworkdowntime_SelectedIndexChanged">
                            <asp:ListItem>0</asp:ListItem><asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem><asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <span style="font-size:13px;color:#64748b;">天后可以查看</span>
                    </div>
                    <div class="mgr-field">
                        <span class="mgr-label">作品提交限制</span>
                        <asp:CheckBox ID="CheckBoxWorkIp" runat="server" AutoPostBack="True" oncheckedchanged="CheckBoxWorkIp_CheckedChanged" Text="对同班作品提交进行IP限制（同班一个IP限制提交一份作品）" />
                    </div>
                    <div class="mgr-divider"></div>
                    <div class="mgr-field">
                        <span class="mgr-label">Cookies失效</span>
                        <asp:DropDownList ID="DDLCookiesPeriod" runat="server" AutoPostBack="True" CssClass="mgr-select" onselectedindexchanged="DDLCookiesPeriod_SelectedIndexChanged">
                            <asp:ListItem Value="0">关闭失效</asp:ListItem>
                            <asp:ListItem Value="1">45分钟</asp:ListItem>
                            <asp:ListItem Value="2">1小时</asp:ListItem>
                            <asp:ListItem Value="3">3小时</asp:ListItem>
                            <asp:ListItem Value="4">5小时</asp:ListItem>
                            <asp:ListItem Value="5">永久</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mgr-field">
                        <span class="mgr-label">作品上传控件</span>
                        <asp:DropDownList ID="DDLUploadMode" runat="server" AutoPostBack="True" CssClass="mgr-select" onselectedindexchanged="DDLUploadMode_SelectedIndexChanged">
                            <asp:ListItem Value="0">普通无刷新方式上传</asp:ListItem>
                            <asp:ListItem Value="1">Plupload方式上传</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mgr-field">
                        <span class="mgr-label">教师平台登录限制</span>
                        <asp:CheckBox ID="CheckBoxLogin" runat="server" oncheckedchanged="CheckBoxLogin_CheckedChanged" Text="限制为跟服务器同网段才能登录" AutoPostBack="True" />
                        <asp:Image ID="ImageLogin" runat="server" ImageUrl="~/images/green.gif" />
                    </div>
                    <div class="mgr-divider"></div>
                    <div class="mgr-field">
                        <span class="mgr-label">全部学案收回</span>
                        <asp:Button ID="Btnpublish" runat="server" Text="一键收回隐藏" onclick="Btnpublish_Click" ToolTip="收回的学案只是在学生界面不显示，教师界面仍显示并可再设置成发布状态" CssClass="mgr-btn mgr-btn--amber" />
                    </div>
                    <asp:Label ID="Labelmsg" runat="server" CssClass="mgr-msg"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
