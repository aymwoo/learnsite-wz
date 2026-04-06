<%@ Page Language="C#"  StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="workcheck.aspx.cs" Inherits="Teacher_workcheck" ResponseEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <meta charset="utf-8" />
<title>作品展示</title>
    <link href="../js/css/tailwind-utilities-2.2.19.min.css" rel="stylesheet">
    <style type="text/css">
        body { background: #f1f5f9; font-family: Arial, sans-serif; }

        /* ===== Page Shell ===== */
        .ws-shell {
            max-width: 1400px;
            margin: 0 auto;
            padding: 1.5rem 1rem 3rem;
        }

        /* ===== Control Bar ===== */
        .ws-control-bar {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            border: 1px solid #e2e8f0;
            padding: 1.25rem 1.5rem;
            margin-bottom: 1.5rem;
        }
        .ws-control-title {
            font-size: 1.15rem;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 1rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid #f1f5f9;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 0.4rem;
        }
        .ws-control-row {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 0.75rem 1.25rem;
            font-size: 0.9rem;
            color: #475569;
            margin-bottom: 0.75rem;
        }
        .ws-control-row:last-child { margin-bottom: 0; }
        .ws-control-label { font-weight: 600; color: #64748b; white-space: nowrap; }

        .ws-legend {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            font-size: 0.8rem;
            color: #64748b;
        }
        .ws-legend-dot {
            display: inline-block;
            width: 14px;
            height: 14px;
            border-radius: 3px;
            flex-shrink: 0;
        }
        .ws-stat-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            background: #f0f9ff;
            color: #0369a1;
            border: 1px solid #bae6fd;
            border-radius: 8px;
            padding: 0.25rem 0.75rem;
            font-size: 0.85rem;
            font-weight: 600;
        }
        .ws-grade-dist {
            font-size: 0.8rem;
            color: #64748b;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 0.35rem 0.75rem;
        }
        .ws-sort-group { display: flex; flex-wrap: wrap; gap: 0.4rem; align-items: center; }
        .ws-actions { display: flex; flex-wrap: wrap; gap: 0.5rem; align-items: center; }

        /* ===== Work Cards ===== */
        .ws-section-title {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #94a3b8;
            margin-bottom: 0.75rem;
            padding-left: 0.25rem;
        }
        .ws-cards-grid { display: flex; flex-wrap: wrap; gap: 0.5rem; }

        .divscore {
            border: 1px solid #dbeafe !important;
            background: #fffaee !important;
            border-radius: 10px !important;
            width: 106px !important;
            padding: 6px 4px !important;
            text-align: center !important;
            transition: box-shadow 0.15s;
        }
        .divscore:hover { box-shadow: 0 2px 8px rgba(59,130,246,0.12); }
        .workname {
            display: inline-block !important;
            background: #dbeafe !important;
            color: #1e40af !important;
            border-radius: 5px !important;
            padding: 1px 4px !important;
            font-size: 10pt !important;
            width: auto !important;
            max-width: 90px !important;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-decoration: none !important;
            height: auto !important;
            line-height: 1.4 !important;
        }
        .wscored {
            display: inline-block !important;
            background: #e0f2fe !important;
            color: #0369a1 !important;
            border-radius: 4px !important;
            font-size: 10pt !important;
            width: 18px !important;
            height: 18px !important;
            line-height: 18px !important;
            text-align: center;
            text-decoration: none !important;
            cursor: pointer;
            transition: background 0.1s;
        }
        .wscored:hover { background: #bae6fd !important; }

        .ws-group-section { margin-top: 1.5rem; }
        .divgroupscore {
            border: 1px solid #d1fae5 !important;
            background: #f0fdf4 !important;
            border-radius: 10px !important;
            width: 110px !important;
            padding: 6px 4px !important;
            text-align: center !important;
            transition: box-shadow 0.15s;
        }
        .divgroupscore:hover { box-shadow: 0 2px 8px rgba(16,185,129,0.12); }
        .groupname {
            display: inline-block !important;
            background: #bbf7d0 !important;
            color: #065f46 !important;
            border-radius: 5px !important;
            padding: 1px 4px !important;
            font-size: 10pt !important;
            width: auto !important;
            max-width: 96px !important;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-decoration: none !important;
            height: auto !important;
            line-height: 1.4 !important;
        }

        .ws-nowork-section {
            background: #fff7ed;
            border: 1px solid #fed7aa;
            border-radius: 12px;
            padding: 1rem 1.25rem;
            margin-top: 1.5rem;
        }
        .ws-nowork-title {
            font-size: 0.75rem;
            font-weight: 700;
            color: #9a3412;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            margin-bottom: 0.5rem;
        }
        .ws-nowork-grid { display: flex; flex-wrap: wrap; gap: 0.4rem; }
        .ws-refresh-note { text-align: center; font-size: 0.75rem; color: #94a3b8; margin-top: 1rem; }

        select { border: 1px solid #cbd5e1; border-radius: 6px; padding: 3px 6px; font-size: 0.88rem; color: #1e293b; background: #f8fafc; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Image ID="Imagelogo" runat="server" ImageUrl="~/images/learnsite.gif" Height="1px" style="display:none" />

    <div class="ws-shell">
        <!-- Control Bar -->
        <div class="ws-control-bar">
            <div class="ws-control-title">
                <asp:Label ID="Labelshow" runat="server"></asp:Label>
                <asp:DropDownList ID="DDLclass" runat="server" Font-Size="9pt"
                    Width="60px" AutoPostBack="True" Font-Bold="True"
                    onselectedindexchanged="DDLclass_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Label ID="Labeltxt" runat="server"></asp:Label>
            </div>

            <!-- Course & Activity selectors -->
            <div class="ws-control-row">
                <span class="ws-control-label">学案名称：</span>
                <asp:Label ID="Labeltitle" runat="server" Font-Bold="False"></asp:Label>
                <span class="ws-control-label">活动选择：</span>
                <asp:DropDownList ID="DDLmid" runat="server" AutoPostBack="True"
                    onselectedindexchanged="DDLmid_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <!-- Stats & Legend -->
            <div class="ws-control-row">
                <span class="ws-legend">
                    <asp:Label ID="Labelcolor" runat="server" BackColor="#CDE2FE" Width="12px" Height="12px" CssClass="ws-legend-dot"></asp:Label>
                    作品标志
                </span>
                <span class="ws-legend">
                    <asp:Label ID="Labelscore" runat="server" BackColor="#FFCC99" Width="12px" Height="12px" CssClass="ws-legend-dot"></asp:Label>
                    评价等级
                </span>
                <span class="ws-stat-badge">
                    作品总数：<asp:Label ID="Labelcounts" runat="server"></asp:Label>
                </span>
                <asp:Label ID="Labelmsg" runat="server" CssClass="ws-grade-dist"></asp:Label>
                <asp:Image ID="ImageType" runat="server" style="height:20px" />
                <asp:Button ID="ImgBtnFlasherror" runat="server"
                    Text="清除异常" OnClick="ImgBtnFlasherror_Click"
                    ToolTip="Office文档转换异常标志清除重新转换" CssClass="px-3 py-1 bg-rose-600 text-white rounded hover:bg-rose-700 transition shadow-sm border-0 text-sm" />
            </div>

            <!-- Actions -->
            <div class="ws-control-row">
                <div class="ws-actions">
                    <asp:Button ID="BtnCheck" runat="server" Text="批量设为已评" OnClick="BtnCheck_Click"
                        ToolTip="将本班自动得分作品全部设置为已评"
                        CssClass="px-3 py-1 bg-amber-500 text-white rounded hover:bg-amber-600 transition shadow-sm border-0 text-sm" />
                    <asp:Button ID="BtnA" runat="server" Text="一键评A" SkinID="BtnSmall"
                        onclick="BtnA_Click" ToolTip="将本班该活动未评的作品，全部评为A"
                        CssClass="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600 transition shadow-sm border-0 text-sm" />
                    <asp:Button ID="BtnB" runat="server" Text="一键评B" SkinID="BtnSmall"
                        onclick="BtnB_Click" ToolTip="将本班该活动未评的作品，全部评为B"
                        CssClass="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600 transition shadow-sm border-0 text-sm" />
                    <asp:Button ID="BtnCk" runat="server" Text="一键已评" SkinID="BtnSmall"
                        onclick="BtnCk_Click" ToolTip="不用给分的作品，一健全评为０"
                        CssClass="px-3 py-1 bg-slate-500 text-white rounded hover:bg-slate-600 transition shadow-sm border-0 text-sm" />
                    <asp:Button ID="BtnWp" runat="server" Text="一键未评" SkinID="BtnSmall"
                        onclick="BtnWp_Click" ToolTip="所有作品一键未评"
                        CssClass="px-3 py-1 bg-slate-500 text-white rounded hover:bg-slate-600 transition shadow-sm border-0 text-sm" />
                    <asp:HyperLink ID="HLautoplay" runat="server" Target="_blank"
                        ToolTip="个人作品自动展播"
                        CssClass="px-3 py-1 bg-emerald-500 text-white rounded hover:bg-emerald-600 transition shadow-sm text-sm inline-flex items-center gap-1">[HLautoplay]</asp:HyperLink>
                    <asp:HyperLink ID="HLgroupplay" runat="server" Target="_blank"
                        ToolTip="小组作品自动展播"
                        CssClass="px-3 py-1 bg-teal-500 text-white rounded hover:bg-teal-600 transition shadow-sm text-sm inline-flex items-center gap-1">[HLgroupplay]</asp:HyperLink>
                    <asp:Button ID="Btnreturn" runat="server" Text="关闭窗口" SkinID="BtnSmall"
                        CssClass="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600 transition shadow-sm border-0 text-sm" />
                </div>
            </div>

            <!-- Sort -->
            <div class="ws-control-row">
                <span class="ws-control-label">排序：</span>
                <div class="ws-sort-group">
                    <asp:RadioButtonList ID="RBsort" runat="server" AutoPostBack="True"
                        Font-Size="9pt" onselectedindexchanged="RBsort_SelectedIndexChanged"
                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <Items>
                            <asp:ListItem Value="0" Selected="True">时间排序</asp:ListItem>
                            <asp:ListItem Value="1">学号排序</asp:ListItem>
                            <asp:ListItem Value="2">IP 排序</asp:ListItem>
                            <asp:ListItem Value="3">小组排序</asp:ListItem>
                            <asp:ListItem Value="4">投票排序</asp:ListItem>
                        </Items>
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>

        <!-- Individual Works -->
        <div class="ws-section-title">个人作品</div>
        <div class="ws-cards-grid">
            <asp:DataList ID="DataListworks" runat="server" RepeatDirection="Horizontal"
                RepeatColumns="8" DataKeyField="Wid" CellPadding="0" CellSpacing="0"
                onitemdatabound="DataListworks_ItemDataBound"
                onitemcommand="DataListworks_ItemCommand">
                <ItemStyle CssClass="m-1" />
                <ItemTemplate>
                    <div class="divscore">
                        <div>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Sname") %>'
                                ToolTip='<%# HttpUtility.HtmlDecode(Eval("Wself").ToString()) %>'
                                Target="_blank" CssClass="workname"></asp:HyperLink>
                            <asp:CheckBox ID="CB" runat="server" Checked='<%# Eval("Wcheck") %>'
                                EnableTheming="True"
                                ToolTip="评价状态：取消则评分为0并可重新提交，选中则初始评分为0并不可重新提交"
                                oncheckedchanged="CB_CheckedChanged" AutoPostBack="True" BorderStyle="None" />
                        </div>
                        <div>
                            <asp:Label ID="Wv" runat="server" Text='<%# Eval("Wvote") %>' ToolTip="票数"></asp:Label>&nbsp;
                            <asp:Label ID="Wf" runat="server" Text='<%# Eval("Wfscore") %>' ToolTip="互评"></asp:Label>&nbsp;
                            <asp:Label ID="Wl" runat="server" Text='<%# Eval("Wlscore") %>' ToolTip="组评" ForeColor="#0066FF"></asp:Label>
                            <asp:HyperLink ID="Hlflash" runat="server" Height="12px" Target="_blank"
                                ImageUrl="~/images/flashview.png" ToolTip="Flash格式预览" Visible="False"></asp:HyperLink>
                        </div>
                        <div>
                            <asp:LinkButton ID="LG" runat="server" CommandArgument="Wid" CommandName="G" ToolTip="收藏12分" CssClass="wscored">G</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LA" runat="server" CommandArgument="Wid" CommandName="A" ToolTip="优秀10分" CssClass="wscored">A</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LB" runat="server" CommandArgument="Wid" CommandName="B" ToolTip="良好8分" CssClass="wscored">B</asp:LinkButton>
                        </div>
                        <div>
                            <asp:LinkButton ID="LC" runat="server" CommandArgument="Wid" CommandName="C" ToolTip="一般6分" CssClass="wscored">C</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LD" runat="server" CommandArgument="Wid" CommandName="D" ToolTip="落后4分" CssClass="wscored">D</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LE" runat="server" CommandArgument="Wid" CommandName="E" ToolTip="不及格2分" CssClass="wscored">E</asp:LinkButton>
                        </div>
                        <asp:Label ID="Labelscore" runat="server" Text='<%# Eval("Wscore") %>' Visible="False"></asp:Label>
                        <asp:Label ID="Labelurl" runat="server" Text='<%# Eval("Wurl") %>' Visible="False"></asp:Label>
                        <asp:Label ID="Labelwid" runat="server" Text='<%# Eval("Wid") %>' Visible="False"></asp:Label>
                        <asp:CheckBox ID="Checkwflash" runat="server" Checked='<%# Eval("Wflash") %>' Visible="False" />
                        <asp:CheckBox ID="Checkwerror" runat="server" Checked='<%# Eval("Werror") %>' Visible="False" />
                        <asp:Label ID="Labelwlemotion" runat="server" Text='<%# Eval("Wlemotion") %>' Visible="False"></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <!-- Group Works -->
        <div class="ws-group-section">
            <div class="ws-section-title">小组作品</div>
            <div class="ws-cards-grid">
                <asp:DataList ID="DataListgroup" runat="server" RepeatDirection="Horizontal"
                    RepeatColumns="6" DataKeyField="Gid" CellPadding="0" CellSpacing="0"
                    onitemcommand="DataListgroup_ItemCommand"
                    onitemdatabound="DataListgroup_ItemDataBound" Caption="小组作品">
                    <ItemStyle CssClass="m-1" />
                    <ItemTemplate>
                        <div class="divgroupscore">
                            <div>
                                <asp:HyperLink ID="HyperLinkg1" runat="server" Text='<%# Eval("Sgtitle") %>'
                                    ToolTip='<%# Eval("Gnote") %>' Target="_blank" CssClass="groupname"></asp:HyperLink>
                            </div>
                            <asp:Label ID="Wvg" runat="server" Text='<%# Eval("Gvote") %>' ToolTip="票数"></asp:Label>
                            <asp:CheckBox ID="CBg" runat="server" AutoPostBack="True" BorderStyle="None"
                                Checked='<%# Eval("Gcheck") %>' EnableTheming="True"
                                oncheckedchanged="CBg_CheckedChanged"
                                ToolTip="评价状态：取消则评分为0并可重新提交，选中则初始评分为0并不可重新提交" />
                            <div>
                                <asp:LinkButton ID="L20" runat="server" CommandArgument="Gid" CommandName="20" ToolTip="20学分" CssClass="wscored">A+</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="L19" runat="server" CommandArgument="Gid" CommandName="19" ToolTip="19学分" CssClass="wscored">A</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="L18" runat="server" CommandArgument="Gid" CommandName="18" ToolTip="18学分" CssClass="wscored">A-</asp:LinkButton>
                            </div>
                            <div>
                                <asp:LinkButton ID="L17" runat="server" CommandArgument="Gid" CommandName="17" ToolTip="17学分" CssClass="wscored">B+</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="L16" runat="server" CommandArgument="Gid" CommandName="16" ToolTip="16学分" CssClass="wscored">B</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="L15" runat="server" CommandArgument="Gid" CommandName="15" ToolTip="15学分" CssClass="wscored">B-</asp:LinkButton>
                            </div>
                            <div>
                                <asp:LinkButton ID="L14" runat="server" CommandArgument="Gid" CommandName="14" ToolTip="14学分" CssClass="wscored">C+</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="L13" runat="server" CommandArgument="Gid" CommandName="13" ToolTip="13学分" CssClass="wscored">C</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="L12" runat="server" CommandArgument="Gid" CommandName="12" ToolTip="12学分" CssClass="wscored">C-</asp:LinkButton>
                            </div>
                            <asp:Label ID="Labelgscore" runat="server" Text='<%# Eval("Gscore") %>' Visible="False"></asp:Label>
                            <asp:Label ID="Labelgurl" runat="server" Text='<%# Eval("Gurl") %>' Visible="False"></asp:Label>
                            <asp:Label ID="Labelgid" runat="server" Text='<%# Eval("Gid") %>' Visible="False"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>

        <!-- Not Submitted -->
        <div class="ws-nowork-section">
            <div class="ws-nowork-title">未提交作品学生列表</div>
            <div class="ws-nowork-grid">
                <asp:DataList ID="DataListNoworks" runat="server" RepeatDirection="Horizontal"
                    RepeatColumns="8" CellPadding="0" CellSpacing="0">
                    <ItemTemplate>
                        <span style="display:inline-block;background:#fef3c7;border:1px solid #fde68a;border-radius:6px;padding:2px 8px;font-size:0.8rem;color:#92400e;margin:2px;"
                            title='<%# Eval("Sscore") %>'><%# Eval("Sname") %></span>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>

        <!-- Refresh -->
        <div class="ws-refresh-note">
            <asp:Button ID="Btnreflash" runat="server" Text="立即刷新"
                OnClick="Btnreflash_Click"
                CssClass="px-3 py-1 bg-slate-600 text-white rounded hover:bg-slate-700 transition shadow-sm border-0 text-sm" />
            每30秒自动刷新
        </div>
    </div>

    <script type="text/javascript">
        function myrefresh() {
            document.getElementById("<%= Btnreflash.ClientID %>").click();
        }
        setTimeout("myrefresh()", 30000);
    </script>
    </form>
</body>
</html>
