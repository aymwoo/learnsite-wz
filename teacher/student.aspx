<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="Teacher_student" ResponseEncoding="utf-8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="stu-page">
        <div class="stu-shell">

            <!-- Hero -->
            <div class="stu-hero">
                <div class="stu-hero__content">
                    <div>
                        <h1 class="stu-hero__title">
                            <i class="bi bi-people-fill" style="color:#93c5fd;"></i> 学生管理
                        </h1>
                        <p class="stu-hero__subtitle">管理班级学生信息、分组、密码及权限设置</p>
                    </div>
                    <div class="filter-group">
                        <div class="filter-item">
                            <span class="filter-label">年级</span>
                            <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True" CssClass="filter-select" onselectedindexchanged="DDLgrade_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div style="width:1px;height:16px;background:rgba(255,255,255,0.2);"></div>
                        <div class="filter-item">
                            <span class="filter-label">班级</span>
                            <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True" CssClass="filter-select" onselectedindexchanged="DDLclass_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Student Grid Card -->
            <div class="stu-card">
                <div class="stu-card__head">
                    <div>
                        <h2 class="stu-card__title">学生列表</h2>
                        <asp:Label ID="Label1" runat="server" CssClass="stu-card__desc"></asp:Label>
                    </div>
                    <asp:HyperLink ID="HkaddStu" runat="server" CssClass="stu-add-link">
                        <i class="bi bi-person-plus-fill"></i> 添加学生
                    </asp:HyperLink>
                </div>

                <div class="stu-list">
                    <div class="stu-list-header">
                        <div class="stu-list-header-cell">序号</div>
                        <div class="stu-list-header-cell">学号</div>
                        <div class="stu-list-header-cell">密码</div>
                        <div class="stu-list-header-cell"></div>
                        <div class="stu-list-header-cell">年级</div>
                        <div class="stu-list-header-cell">班级</div>
                        <div class="stu-list-header-cell">姓名</div>
                        <div class="stu-list-header-cell">性别</div>
                        <div class="stu-list-header-cell"></div>
                        <div class="stu-list-header-cell">组号</div>
                        <div class="stu-list-header-cell">成绩</div>
                        <div class="stu-list-header-cell">作品</div>
                        <div class="stu-list-header-cell">表现</div>
                        <div class="stu-list-header-cell">操作</div>
                    </div>
                    <asp:Repeater ID="RptStudent" runat="server" OnItemDataBound="RptStudent_ItemDataBound" OnItemCommand="RptStudent_ItemCommand">
                        <ItemTemplate>
                            <div class="stu-list-row">
                                <div class="stu-list-cell" style="color:#94a3b8;font-size:12px;"><asp:Label ID="LabelRowIndex" runat="server"></asp:Label></div>
                                <div class="stu-list-cell stu-list-cell--snum" style="font-weight:700;color:#4f46e5;font-family:monospace;"><%# Eval("Snum") %></div>
                                <div class="stu-list-cell" style="color:#94a3b8;">
                                    <asp:Label ID="Labelpwd" runat="server" Text="******" ToolTip='<%# Eval("Spwd") %>'></asp:Label>
                                </div>
                                <div class="stu-list-cell">
                                    <asp:Button ID="ImageButton1" runat="server" CausesValidation="False"
                                        CommandArgument='<%# Eval("Sid") %>' CommandName="ChangePwd"
                                        Text="重置" ToolTip="自动更新密码" CssClass="stu-mini-btn" />
                                </div>
                                <div class="stu-list-cell"><%# Eval("Sgrade") %></div>
                                <div class="stu-list-cell" style="font-weight:600;"><%# Eval("Sclass") %></div>
                                <div class="stu-list-cell" style="text-align:left;">
                                    <asp:HyperLink ID="Hlname" runat="server" Text='<%# Eval("Sname") %>' ToolTip='<%# Eval("Sid") %>' CssClass="stu-name-link"></asp:HyperLink>
                                </div>
                                <div class="stu-list-cell"><%# Eval("Sex") %></div>
                                <div class="stu-list-cell">
                                    <asp:Button ID="ImageBtnGroup" runat="server" CausesValidation="False"
                                        CommandArgument='<%# Eval("Sid") %>' CommandName="ChangeGroup"
                                        Text="分组" CssClass="stu-mini-btn" />
                                </div>
                                <div class="stu-list-cell">
                                    <asp:LinkButton ID="LinkBtnQuit" runat="server" CausesValidation="false"
                                        CommandArgument='<%# Eval("Sid") %>' CommandName="QuitGroup"
                                        Text='<%# Eval("Sgroup") %>'
                                        style="display:inline-flex;align-items:center;justify-content:center;width:26px;height:26px;border-radius:0.4rem;background:#f1f5f9;color:#475569;font-size:12px;font-weight:800;text-decoration:none;border:1px solid #e2e8f0;"></asp:LinkButton>
                                </div>
                                <div class="stu-list-cell">
                                    <a href='<%# "studentwork.aspx?snum=" + Eval("Snum") %>' class="stu-link" target="_blank"><%# Eval("Sscore") %></a>
                                </div>
                                <div class="stu-list-cell">
                                    <a href='<%# "studentworks.aspx?snum=" + Eval("Snum") %>' class="stu-link" target="_blank">浏览</a>
                                </div>
                                <div class="stu-list-cell" style="color:#f43f5e;font-weight:700;"><%# Eval("Sattitude") %></div>
                                <div class="stu-list-cell">
                                    <a href='<%# "studentdel.aspx?sid=" + Eval("Sid") + "&sgrade=" + Eval("Sgrade") + "&sclass=" + Eval("Sclass") %>' class="stu-link" style="color:#f43f5e;">删除</a>
                                </div>
                                <asp:Label ID="LabelSleader" runat="server" Text='<%# Eval("Sleader") %>' style="display:none;"></asp:Label>
                                <asp:Label ID="LabelSnum" runat="server" Text='<%# Eval("Snum") %>' style="display:none;"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div id="PagerDiv" runat="server" class="pager-container">
                    <span>第 <asp:Label ID="LblPageIndex" runat="server" style="color:#4f46e5;font-weight:800;"></asp:Label> / <asp:Label ID="LblPageCount" runat="server"></asp:Label> 页</span>
                    <div class="pager-buttons">
                        <asp:LinkButton ID="btnFirst" runat="server" CommandName="Page" CommandArgument="First" CssClass="pager-btn" OnClick="Pager_Click">首页</asp:LinkButton>
                        <asp:LinkButton ID="btnPrev" runat="server" CommandName="Page" CommandArgument="Prev" CssClass="pager-btn" OnClick="Pager_Click">上一页</asp:LinkButton>
                        <asp:LinkButton ID="btnNext" runat="server" CommandName="Page" CommandArgument="Next" CssClass="pager-btn" OnClick="Pager_Click">下一页</asp:LinkButton>
                        <asp:LinkButton ID="btnLast" runat="server" CommandName="Page" CommandArgument="Last" CssClass="pager-btn" OnClick="Pager_Click">尾页</asp:LinkButton>
                    </div>
                </div>
            </div>

            <!-- Operations Card -->
            <div class="stu-card">
                <div class="stu-card__head">
                    <div>
                        <h2 class="stu-card__title">批量操作</h2>
                        <p class="stu-card__desc">密码管理、分组操作与数据导出</p>
                    </div>
                </div>
                <div class="stu-action-bar">
                    <div class="stu-action-group">
                        <div class="stu-input-group">
                            <span class="stu-input-group__label">初始密码</span>
                            <asp:TextBox ID="TextBoxPwd" runat="server" CssClass="stu-input-group__input">12345</asp:TextBox>
                        </div>
                        <asp:Button ID="BtnSpwdInit" runat="server" OnClick="BtnSpwdInit_Click"
                            Text="初始化本班密码" ToolTip="将本班所有学生的密码初始为左侧自定义密码"
                            CssClass="stu-btn stu-btn--amber" />
                        <asp:Button ID="BtnSpell" runat="server" OnClick="BtnSpell_Click"
                            Text="转拼音缩写" ToolTip="将当前为原初始化密码的学生密码转换为其姓名拼音缩写"
                            CssClass="stu-btn stu-btn--outline" />
                    </div>
                    <div class="stu-action-group">
                        <div class="stu-input-group">
                            <span class="stu-input-group__label">小组上限</span>
                            <asp:DropDownList ID="DDLgroupMax" runat="server" CssClass="stu-input-group__input" style="min-width:60px;font-weight:800;text-align:center;cursor:pointer;" AutoPostBack="True" onselectedindexchanged="DDLgroupMax_SelectedIndexChanged">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem Selected="True">6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <asp:Button ID="Btngroups" runat="server" Text="分组管理" onclick="Btngroups_Click" CssClass="stu-btn stu-btn--primary" />
                        <asp:Button ID="BtnNoGroup" runat="server" OnClick="BtnNoGroup_Click"
                            Text="解除分组" ToolTip="一键将本班所有学生解除分组" CssClass="stu-btn stu-btn--danger" />
                        <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click"
                            Text="导出学生" ToolTip="将所有学生的基本信息导出Excel" CssClass="stu-btn stu-btn--green" />
                        <asp:Button ID="BtnRevive" runat="server" Text="恢复学生" onclick="BtnRevive_Click" CssClass="stu-btn stu-btn--blue" />
                    </div>
                </div>
            </div>

            <!-- Permissions Card -->
            <div class="stu-perm-card">
                <div class="stu-perm-row">
                    <span class="stu-perm-label"><i class="bi bi-shield-lock-fill" style="color:#94a3b8;margin-right:4px;"></i>权限设置</span>
                    <div class="stu-perm-divider"></div>
                    <label class="stu-check-item">
                        <asp:CheckBox ID="Ckreg" runat="server" oncheckedchanged="Ckreg_CheckedChanged" AutoPostBack="True" />
                        允许在线注册
                    </label>
                    <div class="stu-perm-divider"></div>
                    <span class="stu-perm-label">个人资料修改</span>
                    <label class="stu-check-item">
                        <asp:CheckBox ID="Ckclass" runat="server" ToolTip="允许学生修改个人资料中的班级" oncheckedchanged="Ckclass_CheckedChanged" AutoPostBack="True" />
                        改班级
                    </label>
                    <label class="stu-check-item">
                        <asp:CheckBox ID="Ckphoto" runat="server" ToolTip="允许学生修改个人资料中的相片" oncheckedchanged="Ckphoto_CheckedChanged" AutoPostBack="True" />
                        改相片
                    </label>
                    <label class="stu-check-item">
                        <asp:CheckBox ID="Cksex" runat="server" ToolTip="允许学生修改个人资料中的性别" oncheckedchanged="Cksex_CheckedChanged" AutoPostBack="True" />
                        改性别
                    </label>
                    <label class="stu-check-item">
                        <asp:CheckBox ID="Ckname" runat="server" ToolTip="允许学生修改个人资料中的姓名" oncheckedchanged="Ckname_CheckedChanged" AutoPostBack="True" />
                        改姓名
                    </label>
                </div>
            </div>

            <asp:Label ID="Labelmsg" runat="server" CssClass="stu-msg"></asp:Label>

        </div>
    </div>

    <script type="text/javascript" src="../js/student.js"></script>
</asp:Content>
