<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="soft.aspx.cs" Inherits="Teacher_soft" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    

    <div class="soft-page">
        <div class="soft-shell">
            <div class="soft-hero">
                <div class="soft-hero__content">
                    <div>
                        <h1 class="soft-hero__title">资源管理</h1>
                        <p class="soft-hero__subtitle">浏览、添加和管理教学资源，按分类筛选查看资源列表。</p>
                    </div>
            <div class="softdiv">
                <asp:GridView ID="GVSource" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False"  CellPadding="5" 
                    PageSize="20"  SkinID="GridViewInfo" Width="100%"
                    onpageindexchanging="GVSource_PageIndexChanging" 
                    onrowdatabound="GVSource_RowDataBound" EnableModelValidation="True" 
                    onrowcommand="GVSource_RowCommand">
                    <Columns>
                        <asp:BoundField HeaderText="序号" />
                        <asp:BoundField DataField="Fclass" HeaderText="属性" />
                        <asp:HyperLinkField DataNavigateUrlFields="Fid" 
                            DataNavigateUrlFormatString="~/teacher/softview.aspx?fid={0}" 
                            DataTextField="Ftitle" HeaderText="标题" />
                        <asp:BoundField DataField="Ffiletype" HeaderText="格式" />
                        <asp:BoundField DataField="Fhit" HeaderText="次数" />
                        <asp:BoundField DataField="Fopen" HeaderText="评分方式" />
                        <asp:HyperLinkField DataNavigateUrlFields="Furl" HeaderText="下载" Text="点击" 
                            Target="_blank" />
                        <asp:CheckBoxField DataField="Fhide" HeaderText="隐藏" ReadOnly="True" />
                        <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                            CommandArgument='<%# Eval("Fid") %>' CommandName="Change" 
                            ImageUrl="~/images/refresh.gif" Text="更新" ToolTip="发布：无或隐藏：√" />
                    </ItemTemplate>
                </asp:TemplateField>
                        <asp:BoundField DataField="Fdate" HeaderText="日期" />
                        <asp:HyperLinkField DataNavigateUrlFields="Fid,Furl" 
                            DataNavigateUrlFormatString="~/teacher/softdel.aspx?fid={0}&amp;&amp;furl={1}" 
                            Text="删除" />
                    </Columns>
                    <pagertemplate>
                        <div  class="pagediv">
                            第<asp:Label ID="lblPageIndex" runat="server" 
                                text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" />
                            页  共<asp:Label ID="lblPageCount" runat="server" 
                                text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" />
                            页 
                            <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" 
                                commandargument="First" commandname="Page" Font-Underline="False" 
                                ForeColor="Black" text="首页" />
                            <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" 
                                commandargument="Prev" commandname="Page" Font-Underline="False" 
                                ForeColor="Black" text="上一页" />
                            <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" 
                                commandargument="Next" commandname="Page" Font-Underline="False" 
                                ForeColor="Black" text="下一页" />
                            <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" 
                                commandargument="Last" commandname="Page" Font-Underline="False" 
                                ForeColor="Black" text="尾页" />
                        </div>
                    </pagertemplate>
                </asp:GridView>
            </div>

            <div class="soft-card">
                <div class="soft-card__head">
                    <h2 class="soft-card__title">资源列表</h2>
                    <div class="soft-card__filter">
                        <span class="soft-card__label">分类</span>
                        <asp:DropDownList ID="ddlcategory" runat="server" AutoPostBack="True"
                            onselectedindexchanged="ddlcategory_SelectedIndexChanged" CssClass="soft-select">
                        </asp:DropDownList>
                        <asp:Label ID="Label1" runat="server" CssClass="soft-count"></asp:Label>
                    </div>
                </div>
                <div class="soft-card__body" style="padding-bottom: 0;">
                    <div class="soft-table-wrap">
                        <asp:GridView ID="GVSource" runat="server" AllowPaging="True"
                            AutoGenerateColumns="False" PageSize="20" Width="100%"
                            onpageindexchanging="GVSource_PageIndexChanging"
                            onrowdatabound="GVSource_RowDataBound" EnableModelValidation="True"
                            onrowcommand="GVSource_RowCommand" CellPadding="0" GridLines="None">
                            <AlternatingRowStyle CssClass="soft-row--alt" />
                            <Columns>
                                <asp:BoundField HeaderText="序号">
                                    <HeaderStyle CssClass="soft-th--center" Width="60px" />
                                    <ItemStyle CssClass="soft-cell--seq" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fclass" HeaderText="属性">
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--attr" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Fid"
                                    DataNavigateUrlFormatString="~/teacher/softview.aspx?fid={0}"
                                    DataTextField="Ftitle" HeaderText="标题">
                                    <ItemStyle CssClass="soft-cell--title" />
                                </asp:HyperLinkField>
                                <asp:BoundField DataField="Ffiletype" HeaderText="格式">
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--type" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fhit" HeaderText="下载">
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--num" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fopen" HeaderText="学分">
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--credit" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Furl" HeaderText="下载" Text="获取" Target="_blank">
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--download" />
                                </asp:HyperLinkField>
                                <asp:CheckBoxField DataField="Fhide" HeaderText="隐藏" ReadOnly="True">
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--hide" />
                                </asp:CheckBoxField>
                                <asp:TemplateField ShowHeader="False" HeaderText="状态">
                                    <ItemTemplate>
                                        <asp:Button ID="ImageButton1" runat="server" CausesValidation="False"
                                            CommandArgument='<%# Eval("Fid") %>' CommandName="Change"
                                            Text="切换状态" ToolTip="发布：无或隐藏：√" CssClass="soft-toggle-btn" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--toggle" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Fdate" HeaderText="修改日期">
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--date" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Fid,Furl"
                                    DataNavigateUrlFormatString="~/teacher/softdel.aspx?fid={0}&amp;&amp;furl={1}"
                                    Text="删除" HeaderText="管理">
                                    <HeaderStyle CssClass="soft-th--center" />
                                    <ItemStyle CssClass="soft-cell--action" />
                                </asp:HyperLinkField>
                            </Columns>
                            <HeaderStyle CssClass="" />
                            <RowStyle CssClass="" />
                            <PagerStyle CssClass="soft-pager" />
                            <PagerTemplate>
                                <span class="soft-pager__info">
                                    第 <asp:Label ID="lblPageIndex" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" CssClass="soft-pager__info-num" /> 页
                                    共 <asp:Label ID="lblPageCount" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" CssClass="soft-pager__info-num" /> 页
                                </span>
                                <div class="soft-pager__btns">
                                    <asp:LinkButton ID="btnFirst" runat="server" causesvalidation="False" commandargument="First" commandname="Page" text="首页" CssClass="soft-pager__btn" />
                                    <asp:LinkButton ID="btnPrev" runat="server" causesvalidation="False" commandargument="Prev" commandname="Page" text="上一页" CssClass="soft-pager__btn" />
                                    <asp:LinkButton ID="btnNext" runat="server" causesvalidation="False" commandargument="Next" commandname="Page" text="下一页" CssClass="soft-pager__btn" />
                                    <asp:LinkButton ID="btnLast" runat="server" causesvalidation="False" commandargument="Last" commandname="Page" text="尾页" CssClass="soft-pager__btn" />
                                </div>
                            </PagerTemplate>
                            <SelectedRowStyle CssClass="soft-row--selected" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
