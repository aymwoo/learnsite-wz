<%@ Page Title="" Language="C#" MasterPageFile="~/manager/Manage.master" AutoEventWireup="true" CodeFile="teacher.aspx.cs" Inherits="Manager_teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .mgr-page { --ls-bg: linear-gradient(180deg,#f8fbff 0%,#f3f7ff 100%); --ls-border: #dbe6f5; --ls-text: #0f172a; --ls-muted: #64748b; padding: 28px; background: var(--ls-bg); min-height: calc(100vh - 8rem); }
        .mgr-page * { box-sizing: border-box; }
        .mgr-shell { display: flex; flex-direction: column; gap: 20px; }
        .mgr-hero { position: relative; overflow: hidden; border: 1px solid #bfdbfe; border-radius: 1rem; padding: 24px 28px; background: linear-gradient(135deg,#eff6ff 0%,#dbeafe 100%); color: #1e3a8a; box-shadow: 0 4px 16px rgba(37,99,235,.08); }
        .mgr-hero__content { display: flex; align-items: center; justify-content: space-between; gap: 16px; flex-wrap: wrap; }
        .mgr-hero__title { margin: 0; font-size: 22px; font-weight: 800; letter-spacing: -.02em; display: flex; align-items: center; gap: 10px; }
        .mgr-hero__subtitle { margin: 6px 0 0; font-size: 14px; color: rgba(239,246,255,.85); }
        .mgr-card { border: 1px solid var(--ls-border); border-radius: 1rem; background: rgba(255,255,255,.96); box-shadow: 0 12px 30px rgba(15,23,42,.05); overflow: hidden; }
        .mgr-card__head { padding: 20px 24px; border-bottom: 1px solid #f1f5f9; display: flex; align-items: center; justify-content: space-between; }
        .mgr-card__title { margin: 0; font-size: 16px; font-weight: 800; color: var(--ls-text); }
        .mgr-grid { width: 100%; border-collapse: collapse; }
        .mgr-grid th { background: #f8fafc; padding: 14px 16px; font-size: 14px; font-weight: 700; color: #64748b; text-align: center; border-bottom: 2px solid #f1f5f9; }
        .mgr-grid td { padding: 12px 16px; font-size: 14px; color: #334155; border-bottom: 1px solid #f1f5f9; text-align: center; }
        .mgr-grid tbody tr:hover { background-color: #f1f5f9; }
        .mgr-grid tbody tr:hover td { background-color: transparent; }
        .mgr-link { color: #4f46e5; font-weight: 700; text-decoration: none; }
        .mgr-link:hover { color: #3730a3; text-decoration: underline; }
        .mgr-del-btn { color: #b91c1c; font-weight: 700; text-decoration: none; cursor: pointer; background: none; border: none; font-size: 14px; }
        .mgr-del-btn:hover { text-decoration: underline; }
        .mgr-btn { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 18px; border-radius: 1rem; border: none; font-size: 14px; font-weight: 700; cursor: pointer; transition: transform .18s, box-shadow .18s; text-decoration: none; }
        .mgr-btn--primary { background: linear-gradient(135deg,#4f46e5 0%,#4338ca 100%); color: #fff; box-shadow: 0 8px 16px rgba(79,70,229,.2); }
        .mgr-btn--primary:hover { transform: translateY(-1px); color: #fff; }
    </style>
    <div class="mgr-page">
        <div class="mgr-shell">
            <div class="mgr-hero">
                <div class="mgr-hero__content">
                    <div>
                        <h1 class="mgr-hero__title"><i class="bi bi-person-badge-fill" style="color:#93c5fd;"></i> 教师管理</h1>
                        <p class="mgr-hero__subtitle">管理平台教师账号、权限及班级分配</p>
                    </div>
                    <asp:Button ID="Btnadd" runat="server" Text="＋ 添加教师" onclick="Btnadd_Click" CssClass="mgr-btn mgr-btn--primary" />
                </div>
            </div>

            <div class="mgr-card">
                <div class="mgr-card__head"><h2 class="mgr-card__title">教师列表</h2></div>
                <asp:GridView ID="GVTeacher" runat="server" AutoGenerateColumns="False" Width="100%"
                    CssClass="mgr-grid" GridLines="None"
                    onpageindexchanging="GVTeacher_PageIndexChanging"
                    onrowdatabound="GVTeacher_RowDataBound" EnableModelValidation="True"
                    onrowcommand="GVTeacher_RowCommand">
                    <Columns>
                        <asp:BoundField HeaderText="序号"><ItemStyle Width="60px" CssClass="font-mono text-slate-400" /></asp:BoundField>
                        <asp:BoundField DataField="Hname" HeaderText="账号"><ItemStyle CssClass="font-bold text-indigo-600" /></asp:BoundField>
                        <asp:BoundField DataField="Hnick" HeaderText="昵称" />
                        <asp:BoundField DataField="Hpwd" HeaderText="密码"><ItemStyle CssClass="font-mono text-slate-400" /></asp:BoundField>
                        <asp:TemplateField HeaderText="权限">
                            <ItemTemplate><asp:Label ID="LabelHpermiss" runat="server" Text='<%# Bind("Hpermiss") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Hnote" HeaderText="备注"><ItemStyle CssClass="text-slate-500" /></asp:BoundField>
                        <asp:BoundField DataField="Hcount" HeaderText="学案数"><ItemStyle CssClass="font-mono text-emerald-600 font-bold" /></asp:BoundField>
                        <asp:TemplateField HeaderText="班级">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkRoom" runat="server" NavigateUrl='<%# Eval("hid","roomselect.aspx?hid={0}") %>' Text="选择班级" CssClass="mgr-link"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="hid" DataNavigateUrlFormatString="teacheredit.aspx?hid={0}" Text="修改" HeaderText="操作">
                            <ItemStyle CssClass="mgr-link" />
                        </asp:HyperLinkField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDel" runat="server" CausesValidation="false" CommandName="D" Text="删除" CommandArgument='<%# Bind("hid") %>' CssClass="mgr-del-btn" ToolTip="如果删除后想恢复，请手动在数据库Teacher表将该账号的删除标志重置为false！"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
