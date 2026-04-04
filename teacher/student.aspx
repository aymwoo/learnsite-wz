<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="Teacher_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .stu-page {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255,255,255,0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
            min-height: calc(100vh - 8rem);
        }
        .stu-page * { box-sizing: border-box; }
        .stu-shell { display: flex; flex-direction: column; gap: 20px; max-width: 1400px; margin: 0 auto; }

        .stu-hero {
            position: relative; overflow: hidden;
            border: 1px solid var(--ls-border); border-radius: 1rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(59,130,246,0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(14,165,233,0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #1d4ed8 52%, #38bdf8 100%);
            color: #eff6ff;
            box-shadow: 0 20px 40px rgba(37,99,235,0.15);
        }
        .stu-hero__content { display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 20px; }
        .stu-hero__title { margin: 0; font-size: 24px; font-weight: 800; letter-spacing: -0.02em; display: flex; align-items: center; gap: 12px; }
        .stu-hero__subtitle { margin: 6px 0 0; font-size: 14px; color: rgba(239,246,255,0.88); }

        .filter-group {
            display: flex; align-items: center; gap: 12px;
            background: rgba(255,255,255,0.12); padding: 8px 16px;
            border-radius: 0.5rem; backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
        }
        .filter-item { display: flex; align-items: center; gap: 6px; }
        .filter-label { font-size: 12px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: rgba(255,255,255,0.7); }
        .filter-select { background: transparent; border: none; color: #fff; font-weight: 800; font-size: 15px; cursor: pointer; outline: none; padding: 2px 4px; }
        .filter-select option { color: #334155; }

        .stu-card { border: 1px solid var(--ls-border); border-radius: 1rem; background: var(--ls-card); box-shadow: 0 12px 30px rgba(15,23,42,0.05); overflow: hidden; }
        .stu-card__head { display: flex; flex-wrap: wrap; justify-content: space-between; gap: 12px; align-items: center; padding: 20px 24px; border-bottom: 1px solid #f1f5f9; }
        .stu-card__title { margin: 0; font-size: 18px; font-weight: 800; color: var(--ls-text); }
        .stu-card__desc { margin: 4px 0 0; font-size: 13px; color: var(--ls-muted); }

        /* Student List */
        .stu-list { width: 100%; }
        .stu-list-header, .stu-list-row {
            display: grid;
            grid-template-columns: 50px 70px 70px 28px 50px 50px 80px 44px 28px 36px 60px 50px 60px 50px;
            align-items: center;
        }
        .stu-list-header {
            background: #f8fafc;
            border-bottom: 2px solid #f1f5f9;
            padding: 0;
        }
        .stu-list-header-cell {
            padding: 12px 8px;
            font-size: 12px; font-weight: 700; color: #64748b;
            text-align: center;
        }
        .stu-list-row {
            border-bottom: 1px solid #f1f5f9;
            transition: background 0.15s;
        }
        .stu-list-row:hover { background: #f8fafc; }
        .stu-list-cell {
            padding: 10px 8px;
            font-size: 13px; color: #334155;
            text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
        }

        .stu-link { color: #4f46e5; font-weight: 700; text-decoration: none; }
        .stu-link:hover { color: #3730a3; text-decoration: underline; }
        .stu-name-link { color: #0f172a; font-weight: 700; text-decoration: none; }
        .stu-name-link:hover { color: #4f46e5; }

        /* Pager */
        .pager-container { padding: 14px 20px; background: #f8fafc; display: flex; align-items: center; justify-content: space-between; font-size: 13px; font-weight: 600; color: #64748b; border-top: 1px solid #f1f5f9; }
        .pager-buttons { display: flex; gap: 8px; }
        .pager-btn { padding: 6px 14px; background: #fff; border: 1px solid #e2e8f0; border-radius: 6px; color: #475569; text-decoration: none; transition: all 0.2s; cursor: pointer; }
        .pager-btn:hover { background: #f1f5f9; border-color: #cbd5e1; color: #0f172a; }

        /* Action bar */
        .stu-action-bar { display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 16px; padding: 20px 24px; }
        .stu-action-group { display: flex; flex-wrap: wrap; align-items: center; gap: 10px; }

        .stu-btn {
            display: inline-flex; align-items: center; justify-content: center;
            min-height: 40px; padding: 0 18px; border-radius: 0.5rem; border: none;
            font-size: 13px; font-weight: 700; cursor: pointer;
            transition: transform 0.18s, box-shadow 0.18s;
        }
        .stu-btn:hover { transform: translateY(-1px); }
        .stu-btn--primary { background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%); color: #fff; box-shadow: 0 8px 16px rgba(79,70,229,0.2); }
        .stu-btn--primary:hover { box-shadow: 0 10px 20px rgba(79,70,229,0.3); }
        .stu-btn--green { background: linear-gradient(135deg, #16a34a 0%, #15803d 100%); color: #fff; box-shadow: 0 8px 16px rgba(22,163,74,0.2); }
        .stu-btn--amber { background: #f59e0b; color: #fff; box-shadow: 0 8px 16px rgba(245,158,11,0.2); }
        .stu-btn--outline { background: #fff; color: #475569; border: 1px solid #e2e8f0; box-shadow: none; }
        .stu-btn--outline:hover { background: #f8fafc; border-color: #cbd5e1; }
        .stu-btn--danger { background: #fee2e2; color: #b91c1c; border: 1px solid #fecaca; box-shadow: none; }
        .stu-btn--danger:hover { background: #fecaca; }
        .stu-btn--blue { background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%); color: #fff; box-shadow: 0 8px 16px rgba(37,99,235,0.2); }

        .stu-add-link {
            display: inline-flex; align-items: center; gap: 6px;
            min-height: 40px; padding: 0 18px; border-radius: 1rem;
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            color: #fff; font-size: 13px; font-weight: 700; text-decoration: none;
            box-shadow: 0 8px 16px rgba(79,70,229,0.2);
            transition: transform 0.18s, box-shadow 0.18s;
        }
        .stu-add-link:hover { transform: translateY(-1px); box-shadow: 0 10px 20px rgba(79,70,229,0.3); color: #fff; }

        .stu-input-group { display: inline-flex; align-items: stretch; min-height: 40px; border: 1px solid #cbd5e1; border-radius: 0.5rem; background: #fff; overflow: hidden; }
        .stu-input-group__label { display: inline-flex; align-items: center; padding: 0 12px; background: #f8fafc; color: #475569; font-size: 12px; font-weight: 700; border-right: 1px solid #cbd5e1; white-space: nowrap; }
        .stu-input-group__input { flex: 1; min-width: 60px; border: none; padding: 0 10px; background: transparent; font-weight: 800; text-align: center; color: #0f172a; font-size: 14px; }
        .stu-input-group__input:focus { outline: none; }

        /* Permission card */
        .stu-perm-card { border: 1px solid var(--ls-border); border-radius: 1rem; background: linear-gradient(160deg, #fff 0%, #f5f3ff 100%); box-shadow: 0 12px 30px rgba(15,23,42,0.05); padding: 20px 24px; }
        .stu-perm-row { display: flex; flex-wrap: wrap; align-items: center; gap: 20px; }
        .stu-perm-label { font-size: 13px; font-weight: 700; color: #334155; white-space: nowrap; }
        .stu-perm-divider { width: 1px; height: 20px; background: #e2e8f0; }
        .stu-check-item { display: inline-flex; align-items: center; gap: 6px; font-size: 13px; font-weight: 600; color: #475569; cursor: pointer; }
        .stu-check-item:hover { color: #4f46e5; }

        .stu-msg { text-align: center; font-size: 13px; font-weight: 700; color: #16a34a; padding: 8px 0; }

        .stu-select-sm { min-height: 36px; padding: 0 10px; border: 1px solid #cbd5e1; border-radius: 0.4rem; background: #f8fafc; color: #0f172a; font-size: 13px; font-weight: 700; }

        @media (max-width: 768px) {
            .stu-page { padding: 16px; }
            .stu-hero__content { flex-direction: column; align-items: flex-start; }
            .stu-action-bar { flex-direction: column; align-items: flex-start; }
        }
    </style>

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
                                <div class="stu-list-cell" style="font-weight:700;color:#4f46e5;font-family:monospace;"><%# Eval("Snum") %></div>
                                <div class="stu-list-cell" style="color:#94a3b8;">
                                    <asp:Label ID="Labelpwd" runat="server" Text="******" ToolTip='<%# Eval("Spwd") %>'></asp:Label>
                                </div>
                                <div class="stu-list-cell">
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False"
                                        CommandArgument='<%# Eval("Sid") %>' CommandName="ChangePwd"
                                        ImageUrl="~/images/refresh.gif" ToolTip="自动更新密码" />
                                </div>
                                <div class="stu-list-cell"><%# Eval("Sgrade") %></div>
                                <div class="stu-list-cell" style="font-weight:600;"><%# Eval("Sclass") %></div>
                                <div class="stu-list-cell" style="text-align:left;">
                                    <asp:HyperLink ID="Hlname" runat="server" Text='<%# Eval("Sname") %>' ToolTip='<%# Eval("Sid") %>' CssClass="stu-name-link"></asp:HyperLink>
                                </div>
                                <div class="stu-list-cell"><%# Eval("Sex") %></div>
                                <div class="stu-list-cell">
                                    <asp:ImageButton ID="ImageBtnGroup" runat="server" CausesValidation="False"
                                        CommandArgument='<%# Eval("Sid") %>' CommandName="ChangeGroup"
                                        ImageUrl="~/images/gcard.gif" />
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

    <script type="text/javascript">
        function stuShow(d, g, c) {
            var urlat = "../teacher/studentshow.aspx?sid=" + d + "&sgrade=" + g + "&sclass=" + c;
            openLessonModal(urlat, "学生详情", 700);
        }
        function stuAdd(g, c) {
            var urlad = "../teacher/studentadd.aspx?sgrade=" + g + "&sclass=" + c;
            openLessonModal(urlad, "添加学生", 700);
        }
    </script>
</asp:Content>
