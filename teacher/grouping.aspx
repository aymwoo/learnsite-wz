<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" AutoEventWireup="true" CodeFile="grouping.aspx.cs" Inherits="Teacher_grouping" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<style type="text/css">
    /* ===== Page Header ===== */
    .grp-header {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 1.25rem 1.5rem;
        background: linear-gradient(135deg, #1e3a5f 0%, #1d4ed8 100%);
        border-radius: 14px;
        margin-bottom: 1.25rem;
        color: #ffffff;
    }
    .grp-header-icon {
        width: 40px; height: 40px;
        background: rgba(255,255,255,0.15);
        border-radius: 10px;
        display: flex; align-items: center; justify-content: center;
        font-size: 1.25rem; flex-shrink: 0;
    }
    .grp-header-title {
        font-size: 1.1rem; font-weight: 800; color: #ffffff;
    }
    .grp-header-sub { font-size: 0.8rem; color: #93c5fd; margin-top: 1px; }

    /* ===== Student Picker Card ===== */
    .grp-card {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 14px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        margin-bottom: 1.25rem;
        overflow: hidden;
    }
    .grp-card-head {
        background: #f8fafc;
        border-bottom: 1px solid #e2e8f0;
        padding: 0.75rem 1.25rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 0.5rem;
    }
    .grp-card-title {
        font-size: 0.85rem;
        font-weight: 700;
        color: #374151;
        text-transform: uppercase;
        letter-spacing: 0.06em;
    }
    .grp-card-body { padding: 1rem 1.25rem; }

    /* ===== Student chips in DLclass ===== */
    .grp-student-chip {
        display: inline-flex;
        flex-direction: column;
        align-items: center;
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 10px;
        padding: 6px 4px 4px;
        width: 72px;
        text-align: center;
        transition: background 0.15s, border-color 0.15s;
    }
    .grp-student-chip:hover { background: #eff6ff; border-color: #bfdbfe; }
    .grp-snum { font-size: 0.65rem; color: #94a3b8; line-height: 1.2; }
    .grp-sname { font-size: 0.82rem; font-weight: 600; color: #1e293b; line-height: 1.3; }
    .grp-sscore { font-size: 0.72rem; color: #3b82f6; font-weight: 600; }

    /* ===== Help text ===== */
    .grp-hint {
        font-size: 0.8rem;
        color: #64748b;
        background: #f0f9ff;
        border: 1px solid #bae6fd;
        border-radius: 8px;
        padding: 0.5rem 0.9rem;
        margin-bottom: 1rem;
    }

    /* ===== GridView override ===== */
    #GVGroups {
        width: 100% !important;
        border-collapse: collapse;
        font-size: 0.88rem;
        color: #1e293b;
    }
    #GVGroups th {
        background: #f1f5f9;
        font-weight: 700;
        font-size: 0.78rem;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        color: #475569;
        padding: 0.65rem 0.9rem;
        border-bottom: 2px solid #e2e8f0;
        text-align: left;
    }
    #GVGroups td {
        padding: 0.55rem 0.9rem;
        border-bottom: 1px solid #f1f5f9;
        vertical-align: middle;
    }
    #GVGroups tr:last-child td { border-bottom: none; }
    #GVGroups tr.alt-row td { background: #f8fafc; }
    #GVGroups a { color: #2563eb; text-decoration: none; font-size: 0.82rem; }
    #GVGroups a:hover { color: #1d4ed8; text-decoration: underline; }

    .grp-group-flag { vertical-align: middle; margin-right: 4px; }
    .grp-group-name { font-weight: 700; color: #1e293b; }
    .grp-avg-score { font-size: 0.8rem; color: #059669; font-weight: 700; }

    /* ===== Bottom actions ===== */
    .grp-bottom-actions {
        display: flex;
        align-items: center;
        gap: 1rem;
        flex-wrap: wrap;
        margin-top: 0.75rem;
        padding-top: 0.75rem;
        border-top: 1px solid #f1f5f9;
    }
</style>

<!-- Page Header -->
<div class="grp-header">
    <div class="grp-header-icon">&#128101;</div>
    <div>
        <div class="grp-header-title">
            <asp:Label ID="labelclass" runat="server"></asp:Label>分组管理
        </div>
        <div class="grp-header-sub">选中学生后点击「参加」加入小组；点击成员姓名可退组</div>
    </div>
</div>

<!-- Student Picker Card -->
<div class="grp-card">
    <div class="grp-card-head">
        <span class="grp-card-title">未分组学生</span>
        <asp:RadioButtonList ID="RBsort" runat="server" AutoPostBack="True"
            Font-Size="9pt" onselectedindexchanged="RBsort_SelectedIndexChanged"
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <Items>
                <asp:ListItem Value="0" Selected="True">学分排序</asp:ListItem>
                <asp:ListItem Value="1">学号排序</asp:ListItem>
            </Items>
        </asp:RadioButtonList>
    </div>
    <div class="grp-card-body">
        <asp:DataList ID="DLclass" runat="server" RepeatColumns="10"
            RepeatDirection="Horizontal" DataKeyField="Sid" CellPadding="2" CellSpacing="2"
            HorizontalAlign="Left">
            <ItemTemplate>
                <div class="grp-student-chip">
                    <span class="grp-snum"><asp:Label ID="LabelSnum" runat="server" Text='<%# Eval("Snum") %>'></asp:Label></span>
                    <span class="grp-sname"><asp:Label ID="LabelSname" runat="server" Text='<%# Eval("Sname") %>'></asp:Label></span>
                    <span class="grp-sscore"><asp:Label ID="LabelSscore" runat="server" Text='<%# Eval("Sscore") %>'></asp:Label></span>
                    <asp:CheckBox ID="SelectStu" runat="server"/>
                    <asp:Label ID="LabelSid" runat="server" Text='<%# Eval("Sid") %>' Visible="false"></asp:Label>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>

<!-- Groups Card -->
<div class="grp-card">
    <div class="grp-card-head">
        <span class="grp-card-title">小组列表</span>
    </div>
    <div class="grp-card-body" style="padding:0;">
        <div class="grp-hint" style="margin:1rem 1.25rem 0.5rem;">
            说明：选中上方学生后点击「参加」加入对应小组；点击成员姓名可退组
        </div>
        <asp:GridView ID="GVGroups" runat="server" AutoGenerateColumns="False"
            CellPadding="0" EnableModelValidation="True"
            GridLines="None" HorizontalAlign="Left"
            onrowdatabound="GVGroups_RowDataBound" onrowcommand="GVGroups_RowCommand"
            DataKeyNames="Sid" BorderStyle="None"
            onrowcancelingedit="GVGroups_RowCancelingEdit"
            onrowediting="GVGroups_RowEditing" onrowupdating="GVGroups_RowUpdating">
            <AlternatingRowStyle CssClass="alt-row" />
            <Columns>
                <asp:TemplateField HeaderText="小组名称">
                    <ItemTemplate>
                        <img alt="" src="../images/gflag.gif" class="grp-group-flag" />
                        <asp:Label ID="LabelSgtitle" runat="server" Text='<%# Bind("Sgtitle") %>' CssClass="grp-group-name"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TBoxSgtitle" runat="server" Text='<%# Bind("Sgtitle") %>'
                            style="border:1px solid #cbd5e1;border-radius:6px;padding:3px 6px;font-size:0.88rem;"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemStyle Width="160px" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:CommandField CancelImageUrl="~/images/c.gif" EditImageUrl="~/images/e.gif"
                    ShowEditButton="True" UpdateImageUrl="~/images/u.gif" ButtonType="Image">
                    <ItemStyle Width="60px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="组长">
                    <ItemTemplate>
                        <asp:Label ID="LabelSname" runat="server" Text='<%# Bind("Sname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="64px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="成员">
                    <ItemTemplate>
                        <asp:DataList ID="DLgstu" runat="server" RepeatColumns="12" CellPadding="2"
                            onitemcommand="DLgstu_ItemCommand" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <ItemTemplate>
                                <asp:LinkButton ID="Gstu" runat="server" CommandName="Q"
                                    CommandArgument='<%# Eval("Sid") %>'
                                    Text='<%# Eval("Sname") %>'
                                    ToolTip="点击退组"
                                    style="font-size:0.82rem;color:#2563eb;background:#eff6ff;border-radius:4px;padding:1px 5px;display:inline-block;margin:1px;"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:DataList>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="平均分">
                    <ItemTemplate>
                        <asp:Label ID="LabelSscores" runat="server" CssClass="grp-avg-score"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="60px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkBtnAdd" runat="server" CausesValidation="false"
                            CommandName="A" CommandArgument='<%# Eval("Sid") %>'
                            style="display:inline-block;background:#3b82f6;color:#fff;border-radius:6px;padding:2px 10px;font-size:0.82rem;text-decoration:none;">参加</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle />
            <RowStyle Height="32px" />
        </asp:GridView>

        <div class="grp-bottom-actions" style="padding:0.75rem 1.25rem 1.25rem;">
            <asp:CheckBox ID="CkQuit" runat="server" Checked="True" Text="锁定成员退组"
                ToolTip="默认选中锁定，无法退组；如果要退组请取消" />
            <asp:Button ID="Btnauto" runat="server" SkinID="BtnNormal" Text="自动分组"
                ToolTip="根据小组限制人数自动分组，积分最高为组长，如果小组限制人数为0则自动默认为4人"
                onclick="Btnauto_Click"
                CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition shadow-md border-0 text-sm" />
        </div>
    </div>
</div>
</asp:Content>
