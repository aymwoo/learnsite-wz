<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="signshow.aspx.cs" Inherits="Teacher_signshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../App_Themes/Teacher/admin-form.css" rel="stylesheet" />
    <style type="text/css">
        .signshow-page {
            --admin-form-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef6ff 100%);
            --admin-form-hero-bg: linear-gradient(135deg, #0f766e 0%, #0f9b8e 55%, #22c55e 100%);
            --admin-form-hero-shadow: 0 22px 45px -28px rgba(15, 118, 110, 0.72);
            --admin-form-primary-bg: #0f766e;
            --admin-form-primary-hover: #0d675f;
            --admin-form-primary-shadow: 0 14px 24px -18px rgba(15, 118, 110, 0.85);
            --admin-form-secondary-border: #99f6e4;
            --admin-form-secondary-bg: #ecfeff;
            --admin-form-secondary-hover: #cffafe;
            --admin-form-secondary-fg: #115e59;
        }

        .signshow-page .admin-form-grid-wrap {
            overflow-x: auto;
        }
    </style>
    <div class="admin-form-page signshow-page">
        <div class="admin-form-shell">
            <section class="admin-form-hero">
                <div class="admin-form-hero-content">
                    <div class="admin-form-eyebrow">Attendance Detail</div>
                    <h1 class="admin-form-title">签到详情</h1>
                    <p class="admin-form-subtitle">查看本次签到的已签到和未签到学生列表，并支持按学号或 IP 地址排序查看。</p>
                </div>
            </section>

            <section class="admin-form-panel">
                <div class="admin-form-toolbar">
                    <div>
                        <h2 class="admin-form-section-title">已签到列表 <asp:Label ID="Labelsignin" runat="server" Font-Size="9pt"></asp:Label></h2>
                        <p class="admin-form-section-desc">显示已完成签到的学生记录及其作品、表现和备注信息。</p>
                    </div>
                    <asp:RadioButtonList ID="RBtnList" runat="server" AutoPostBack="True"
                        onselectedindexchanged="RBtnList_SelectedIndexChanged"
                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="0">学号排序</asp:ListItem>
                        <asp:ListItem Value="1">IP地址排序</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="admin-form-grid-wrap">
                    <asp:GridView ID="GVSignin" runat="server" AutoGenerateColumns="False"
                        CellPadding="2" PageSize="15"
                        Width="100%" ToolTip="已签到的记录" SkinID="GridViewInfo"
                        onrowdatabound="GVSignin_RowDataBound" EnableModelValidation="True">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField />
                            <asp:BoundField DataField="Qnum" HeaderText="学号" />
                            <asp:BoundField DataField="Qgrade" HeaderText="年级" />
                            <asp:BoundField DataField="Qclass" HeaderText="班级" />
                            <asp:BoundField DataField="Qname" HeaderText="姓名" >
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Qwork" HeaderText="作品" />
                            <asp:BoundField DataField="Qattitude" HeaderText="表现" />
                            <asp:BoundField DataField="Qnote" HeaderText="备注" />
                            <asp:BoundField DataField="Qgroup" HeaderText="组评" />
                            <asp:BoundField DataField="Qgscore" HeaderText="分值" />
                            <asp:BoundField DataField="Qip" HeaderText="IP地址" />
                            <asp:BoundField DataField="Qdate" HeaderText="日期" />
                        </Columns>
                    </asp:GridView>
                </div>
            </section>

            <section class="admin-form-panel">
                <div>
                    <h2 class="admin-form-section-title">未签到列表 <asp:Label ID="Labelnosign" runat="server" Font-Size="9pt"></asp:Label></h2>
                    <p class="admin-form-section-desc">显示当天缺席或未完成签到的学生，并附带缺席原因和联系人信息。</p>
                </div>
                <div class="admin-form-grid-wrap">
                    <asp:GridView ID="GVNoSign" runat="server" AutoGenerateColumns="False"
                       CellPadding="2" Width="100%" ToolTip="未签到列表" SkinID="GridViewInfo"
                        onrowdatabound="GVNoSign_RowDataBound" DataKeyNames="Snum">
                        <Columns>
                            <asp:BoundField />
                            <asp:BoundField DataField="Snum" HeaderText="学号" />
                            <asp:BoundField DataField="Sgrade" HeaderText="年级" />
                            <asp:BoundField DataField="Sclass" HeaderText="班级" />
                            <asp:BoundField DataField="Sname" HeaderText="姓名" >
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Sattitude" HeaderText="表现" />
                            <asp:BoundField DataField="Sheadtheacher" HeaderText="班主任" />
                            <asp:BoundField DataField="Sparents" HeaderText="父母" />
                            <asp:BoundField DataField="Saddress" HeaderText="家庭地址" />
                            <asp:BoundField DataField="Sphone" HeaderText="联系电话" />
                            <asp:BoundField HeaderText="缺席原因" />
                        </Columns>
                    </asp:GridView>
                </div>
            </section>

            <section class="admin-form-actions">
                <div class="admin-form-action-row">
                    <asp:Button ID="ButtonReturn" runat="server" onclick="ButtonReturn_Click" Text="返回" CssClass="admin-form-btn admin-form-btn--secondary" />
                </div>
            </section>
        </div>
    </div>
</asp:Content>
