<%@ Page Title="" Language="C#" MasterPageFile="~/manager/Manage.master" AutoEventWireup="true" CodeFile="createroom.aspx.cs" Inherits="Manager_createroom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    
    <div class="room-page">
        <div class="room-shell">
            <div class="room-hero">
                <h1 class="room-hero__title"><i class="bi bi-building"></i> 班级设置</h1>
                <p class="room-hero__subtitle">创建和管理全校完整班级列表</p>
            </div>

            <div class="room-card">
                <div class="room-card__head"><h2 class="room-card__title">批量创建班级</h2></div>
                <div class="room-card__body">
                    <div class="room-toolbar">
                        <span class="room-label">年级范围</span>
                        <asp:DropDownList ID="DDLgrademin" runat="server" CssClass="room-select">
                            <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem><asp:ListItem Selected="True">7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem><asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem><asp:ListItem>16</asp:ListItem>
                        </asp:DropDownList>
                        <span class="room-label">年级 到</span>
                        <asp:DropDownList ID="DDLgrademax" runat="server" CssClass="room-select">
                            <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem><asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem Selected="True">9</asp:ListItem><asp:ListItem>10</asp:ListItem><asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem><asp:ListItem>16</asp:ListItem>
                        </asp:DropDownList>
                        <span class="room-label">年级</span>
                        <span class="room-label">班级数上限</span>
                        <asp:DropDownList ID="DDLclassmax" runat="server" CssClass="room-select"></asp:DropDownList>
                        <asp:Button ID="Btncreate" runat="server" Text="批量创建" onclick="Btncreate_Click" CssClass="room-btn room-btn--primary" />
                    </div>
                    <div class="room-divider"></div>
                    <div class="room-toolbar">
                        <span class="room-label">手动添加单个班级</span>
                        <span class="room-muted">年级</span>
                        <asp:TextBox ID="TextBoxGrade" runat="server" CssClass="room-input"></asp:TextBox>
                        <span class="room-muted">班级</span>
                        <asp:TextBox ID="TextBoxClass" runat="server" CssClass="room-input"></asp:TextBox>
                        <asp:Button ID="BtncreateOne" runat="server" Text="添加该班级" onclick="BtncreateOne_Click" CssClass="room-btn room-btn--success" />
                    </div>
                    <asp:Label ID="Labelmsg" runat="server" CssClass="room-msg"></asp:Label>
                </div>
            </div>

            <div class="room-card">
                <div class="room-card__head"><h2 class="room-card__title">全校班级列表</h2></div>
                <asp:GridView ID="GVclass" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CssClass="room-grid" GridLines="None" Width="100%"
                    onpageindexchanging="GVclass_PageIndexChanging"
                    onrowdatabound="GVclass_RowDataBound" PageSize="15" DataKeyNames="Rid"
                    onrowcommand="GVclass_RowCommand" EnableModelValidation="True">
                    <Columns>
                        <asp:BoundField HeaderText="序号"><ItemStyle Width="60px" CssClass="room-seq" /></asp:BoundField>
                        <asp:BoundField DataField="Rhid" HeaderText="教师" />
                        <asp:BoundField DataField="Rgrade" HeaderText="年级" />
                        <asp:BoundField DataField="Rclass" HeaderText="班级" />
                        <asp:ButtonField CommandName="Del" HeaderText="操作" Text="删除"><ItemStyle CssClass="room-del" /></asp:ButtonField>
                    </Columns>
                    <PagerTemplate>
                        <div class="room-pager">
                            <span>第 <asp:Label ID="lblPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>" CssClass="room-pager__current"></asp:Label> / <asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label> 页</span>
                            <div class="room-pager__nav">
                                <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First" CommandName="Page" CssClass="room-pager__btn">首页</asp:LinkButton>
                                <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev" CommandName="Page" CssClass="room-pager__btn">上一页</asp:LinkButton>
                                <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next" CommandName="Page" CssClass="room-pager__btn">下一页</asp:LinkButton>
                                <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last" CommandName="Page" CssClass="room-pager__btn">尾页</asp:LinkButton>
                            </div>
                        </div>
                    </PagerTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
