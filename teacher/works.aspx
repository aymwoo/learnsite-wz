<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="works.aspx.cs" Inherits="Teacher_works" ResponseEncoding="utf-8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../webform/bootstrap-icons.min.css" />
    

    <div class="course-page">
        <div class="course-shell">
            <section class="course-hero">
                <div class="course-hero-content">
                    <div>
                        <span class="course-eyebrow">Teacher Workspace</span>
                        <h1 class="course-title">作品评价</h1>
                        <p class="course-subtitle">按年级筛选当前发布的学案，快速预览并评价各班级学生提交的作品情况。</p>
                    </div>
                    <div class="course-hero-action">
                        <button type="button" id="pg" onclick="package()" class="course-secondary-btn" style="color: #4f46e5; border-color: #c7d2fe; display: inline-flex; align-items: center; gap: 0.4rem;">
                            <i class="bi bi-box-seam"></i> 作品打包
                        </button>
                        <asp:Button ID="Btnterm" runat="server" Text="学期总评" onclick="Btnterm_Click"
                            ToolTip="跳转到学期总评页面" CssClass="course-primary-btn" />
                    </div>
                </div>
            </section>

            <section class="course-toolbar">
                <div class="course-toolbar-grid">
                    <div class="course-field">
                        <span class="course-field-label">作品选择</span>
                        <div style="display: flex; align-items: center; gap: 0.5rem;">
                            <asp:DropDownList ID="DDLgrade" runat="server" Width="80px"
                                EnableTheming="True" AutoPostBack="True"
                                onselectedindexchanged="DDLgrade_SelectedIndexChanged" CssClass="course-select">
                            </asp:DropDownList>
                            <span class="course-field-label" style="margin-bottom: 0;">年级</span>
                        </div>
                    </div>
                    <div class="course-field">
                        <span class="course-field-label">当前学期</span>
                        <asp:Label ID="Labelmsg" runat="server" CssClass="course-note"></asp:Label>
                    </div>
                </div>
            </section>

            <section class="course-table-panel">
                <div class="course-table-header">
                    <div>
                        <h2 class="course-table-title">学案列表</h2>
                        <p class="course-table-desc">查看各个学案下各班级提交的作品，点击未评数或查看图标进入详细评价页面。</p>
                    </div>
                    <span class="course-table-chip">最多每页 20 条</span>
                </div>

                <div class="course-table-wrap custom-scrollbar">
                    <asp:GridView ID="GVCourse" runat="server" AllowPaging="True"
                        AutoGenerateColumns="False" DataKeyNames="Cid"
                        PageSize="20" Width="100%" CssClass="course-grid"
                        onpageindexchanging="GVCourse_PageIndexChanging"
                        onrowdatabound="GVCourse_RowDataBound" CellPadding="0"
                        EnableModelValidation="True" ForeColor="#111111" GridLines="None">
                        <AlternatingRowStyle BackColor="#FBFDFF" />
                        <Columns>
                            <asp:BoundField DataField="Cid" HeaderText="序号" InsertVisible="False"
                                ReadOnly="True" SortExpression="Cid" >
                                <ControlStyle Width="50px" />
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataTextField="Ctitle" HeaderText="学案" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="Cclass" HeaderText="类型" SortExpression="Cclass" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="未评数">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HlNoCheck" runat="server" CssClass="course-badge course-badge-warning"></asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="评价">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HLCheck" runat="server" Target="_blank"
                                        NavigateUrl='<%# "workcheck.aspx?cid=" + Eval("Cid") + "&grade=" + Eval("Cobj") %>'
                                        CssClass="course-icon-btn course-icon-btn-sm course-icon-info mx-auto">
                                        <i class="bi bi-eye"></i>
                                    </asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Cdate" HeaderText="日期" SortExpression="Cdate" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="160px" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#F8FAFC" Font-Bold="True" ForeColor="#0F172A" />
                        <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" ForeColor="#475569" />
                        <PagerStyle CssClass="course-pager-row" BackColor="#F8FAFC" ForeColor="#111111" HorizontalAlign="Center" />
                        <pagertemplate>
                            <div class="course-pager">
                                <span>第<asp:Label ID="lblPageIndex" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1  %>" />页</span>
                                <span>共<asp:Label ID="lblPageCount" runat="server" text="<%# ((GridView)Container.Parent.Parent).PageCount  %>" />页</span>
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
                        <RowStyle BackColor="#FFFFFF" />
                        <SelectedRowStyle BackColor="#E0E7FF" Font-Bold="True" ForeColor="#312E81" />
                    </asp:GridView>
                </div>
            </section>
        </div>

        
    </div>
    <script type="text/javascript" src="../js/works.js"></script>
</asp:Content>
