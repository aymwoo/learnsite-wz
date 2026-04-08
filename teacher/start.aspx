<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="start.aspx.cs" Inherits="Teacher_start" ResponseEncoding="utf-8" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link rel="stylesheet" type="text/css" href="/App_Themes/Teacher/start.css" />

    <div class="placehold lesson-start">
        <div class="lesson-shell">
            <div class="lesson-hero">
                <div class="lesson-hero__content">
                    <div>
                        <h1 class="lesson-hero__title">课堂启动中心</h1>
                        <p class="lesson-hero__subtitle">选择班级与学案，启动课堂后实时查看学生进度与各项功能控制。</p>
                    </div>
                    <div class="lesson-hero-panel">
                        <div class="lesson-hero-panel__label">课堂状态</div>
                        <div class="lesson-hero-panel__grid">
                            <div class="lesson-hero-panel__item">
                                <span class="lesson-hero-panel__value"><%= Server.HtmlEncode(Labelsigin.Text) %></span>
                                <span class="lesson-hero-panel__text">已签到</span>
                            </div>
                            <div class="lesson-hero-panel__item">
                                <span class="lesson-hero-panel__value"><%= Server.HtmlEncode(Labelsigno.Text) %></span>
                                <span class="lesson-hero-panel__text">未签到</span>
                            </div>
                            <div class="lesson-hero-panel__item lesson-hero-panel__item--wide">
                                <span class="lesson-hero-panel__meta"><%= Server.HtmlEncode(LabelToday.Text) %></span>
                                <span class="lesson-hero-panel__text">服务器时间</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="lesson-grid">
                <section class="lesson-card lesson-card--span-8 lesson-theme--blue">
                    <div class="lesson-card__head">
                        <div>
                            <span class="lesson-section-kicker">Setup</span>
                            <h2 class="lesson-card__title">课堂准备</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-form-grid">
                            <div class="lesson-field">
                                <span class="lesson-label">年级</span>
                                <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLgrade_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field">
                                <span class="lesson-label">班级</span>
                                <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLclass_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field">
                                <span class="lesson-label">当前学案</span>
                                <asp:DropDownList ID="DDLCid" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLCid_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field lesson-field--actions">
                                <div class="lesson-actions">
                                    <asp:Button ID="Btnset" runat="server" Text="开始上课" ToolTip="设置上课班级登录密码" onclick="Btnset_Click" CssClass="lesson-btn" />
                                    <asp:Button ID="Btnstudent" runat="server" Text="模拟学生" ToolTip="模拟本班级学生角色登录学生平台" onclick="Btnstudent_Click" Enabled="False" CssClass="lesson-btn lesson-btn--secondary" />
                                    <div class="lesson-input-group" style="min-width: 200px; max-width: 240px;">
                                        <span class="lesson-input-group__label">班级口令</span>
                                        <asp:TextBox ID="TBpwd" runat="server" ReadOnly="True" CssClass="lesson-input-group__input"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-4 lesson-theme--purple">
                    <div class="lesson-card__head">
                        <div>
                            <span class="lesson-section-kicker">Overview</span>
                            <h2 class="lesson-card__title">课堂速览</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-status-grid">
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">已签到</p>
                                <span class="lesson-stat__value"><asp:Label ID="Labelsigin" runat="server"></asp:Label></span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">未签到</p>
                                <span class="lesson-stat__value"><asp:Label ID="Labelsigno" runat="server"></asp:Label></span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">作品提交</p>
                                <span class="lesson-stat__sub" style="margin-top: 10px;"><asp:Label ID="Labelcount" runat="server"></asp:Label></span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">课堂时钟</p>
                                <span class="lesson-stat__sub" style="margin-top: 10px;"><asp:Label ID="Labelfresh" runat="server"></asp:Label></span>
                                <span class="lesson-stat__sub"><asp:Label ID="LabelToday" runat="server" ToolTip="服务器日期校准：作品、签到日期以此为准"></asp:Label></span>
                            </div>
                        </div>

                        <div class="lesson-links" style="margin-top: 14px;">
                            <asp:HyperLink ID="HLrate" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">学习进度</asp:HyperLink>
                            <asp:HyperLink ID="HLworkshow" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">作品展示</asp:HyperLink>
                            <asp:HyperLink ID="HLtotal" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">学习汇总</asp:HyperLink>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12 lesson-theme--orange">
                    <div class="lesson-card__head">
                        <div>
                            <span class="lesson-section-kicker">Activity</span>
                            <h2 class="lesson-card__title">学案活动开关</h2>
                            <p class="lesson-card__desc">可逐项切换当前学案活动，也可使用快捷按钮一次全部打开或关闭。</p>
                        </div>
                        <div class="lesson-quick-actions">
                            <asp:Button ID="BtnMenuOpenAll" runat="server" Text="全部开启" OnClick="BtnMenuOpenAll_Click" CssClass="lesson-quick-btn" />
                            <asp:Button ID="BtnMenuCloseAll" runat="server" Text="全部关闭" OnClick="BtnMenuCloseAll_Click" CssClass="lesson-quick-btn" />
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <asp:DataList ID="DataListMenu" runat="server" CssClass="lesson-menu-list" RepeatLayout="Flow" RepeatDirection="Horizontal" DataKeyField="Lid" onitemdatabound="DataListMenu_ItemDataBound" onitemcommand="DataListMenu_ItemCommand">
                            <ItemTemplate>
                                <div class="lesson-menu-item">
                                    <asp:LinkButton ID="imgBtn" runat="server" CssClass="lesson-menu-card" CommandArgument='<%# Eval("Lid") %>' CommandName="P">
                                        <span class="lesson-menu-button">
                                            <asp:Image ID="ImageMenuIcon" runat="server" ImageUrl='<%# Eval("Limgurl") %>' AlternateText='<%# Eval("Ltitle") %>' />
                                        </span>
                                    </asp:LinkButton>
                                    <asp:Label ID="lableTitle" runat="server" CssClass="lesson-menu-title" Text='<%# Eval("Ltitle") %>'></asp:Label>
                                    <asp:CheckBox ID="CheckBoxShow" Checked='<%# Eval("Lshow") %>' runat="server" Visible="false" />
                                    <asp:LinkButton ID="BtnSwitchToggle" runat="server" CommandName="P" CommandArgument='<%# Eval("Lid") %>' CssClass='<%# Convert.ToBoolean(Eval("Lshow")) ? "lesson-switch lesson-switch--on" : "lesson-switch" %>'>
                                        <span class="lesson-switch-slider"></span>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12 lesson-theme--teal" id="ls-realtime-section">
                    <div class="lesson-card__head">
                        <div style="display:flex;align-items:center;gap:16px;width:100%;">
                            <div class="ls-tab-bar" id="ls-tab-bar">
                                <button type="button" class="ls-tab ls-tab--active" data-tab="online" onclick="lsSwitchTab('online')">在线学生</button>
                                <button type="button" class="ls-tab" data-tab="progress" onclick="lsSwitchTab('progress')">学案进度</button>
                                <button type="button" class="ls-tab" data-tab="realtime" onclick="lsSwitchTab('realtime')">实时动态</button>
                            </div>
                            <div id="ls-realtime-indicator" class="ls-realtime-indicator" style="display:none;">
                                <span class="ls-pulse"></span>
                                <span class="ls-indicator-text">实时监控中</span>
                            </div>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <!-- Tab 1: 在线学生 -->
                        <div class="ls-tab-panel" id="ls-panel-online" style="display:block;">
                            <div class="lesson-legend">
                                <span class="lesson-legend__item"><asp:Label ID="Labelnocolor" runat="server" BackColor="#E8E8E8" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="没有作品"></asp:Label>无作品</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labelone" runat="server" BackColor="#B1D2FE" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="单个作品"></asp:Label>1件</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labeltwo" runat="server" BackColor="#4F98FB" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="两个作品"></asp:Label>2件</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labelthree" runat="server" BackColor="#CDE7CF" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="三个作品"></asp:Label>3件</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labelfour" runat="server" BackColor="#9BC47D" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="四个作品"></asp:Label>4件</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labelmore" runat="server" BackColor="#BCADE4" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="多个作品"></asp:Label>5+</span>
                            </div>

                            <div style="margin-top: 14px; overflow-x: auto;">
                                <asp:DataList ID="DLonline" runat="server" CssClass="lesson-online-list" RepeatDirection="Horizontal" HorizontalAlign="Left" DataKeyField="Qid" onitemdatabound="DLonline_ItemDataBound" onitemcommand="DLonline_ItemCommand" RepeatLayout="Flow">
                                    <ItemTemplate>
                                        <div class="divonline student-card">
                                            <div class="student-card__num"><asp:Label ID="Labelqnum" runat="server" Text='<%# Eval("Qnum") %>'></asp:Label></div>
                                            <asp:Label ID="HyperSname" runat="server" Text='<%# Eval("Qname") %>' CssClass="labelname"></asp:Label>
                                            <div class="lesson-student-actions">
                                                <asp:HyperLink ID="Groupflag" runat="server" CssClass="lesson-group-flag">g</asp:HyperLink>
                                                <asp:Label ID="Labelcolor" runat="server" Text='<%# Eval("Qgscore") %>' ToolTip='<%# "组评语："+Eval("Qgroup") %>' CssClass="groupscore"></asp:Label>
                                                <asp:LinkButton ID="Lunlock" runat="server" CommandArgument="Qid" CommandName="UnLock" ToolTip="让该学生重新登录" CssClass="lockbtn"></asp:LinkButton>
                                            </div>
                                            <div class="student-card__machine"><asp:Label ID="LabelQmachine" runat="server" Text='<%# Eval("QmachineShort") %>' Visible="false"></asp:Label></div>
                                            <div style="display: none;">
                                                <asp:Label ID="Labelwork" runat="server" Text='<%# Eval("Qwork") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Labelattitude" runat="server" Text='<%# Eval("Qattitude") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Labelnote" runat="server" Text='<%# Eval("Qnote") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LabelSleader" runat="server" Text='<%# Eval("Sleader") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LabelSgroup" runat="server" Text='<%# Eval("Sgroup") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LabelSgtitle" runat="server" Text='<%# Eval("Sgtitle") %>' Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>

                        <!-- Tab 2: 学案进度 -->
                        <div class="ls-tab-panel" id="ls-panel-progress" style="display:none;">
                            <div>
                                <div class="lesson-label">已学学案</div>
                                <div style="margin-top: 10px;">
                                    <asp:DataList ID="DLdonekc" runat="server" CssClass="lesson-done-list" ForeColor="Black" RepeatDirection="Horizontal" RepeatLayout="Flow" CellPadding="0" CellSpacing="0" DataKeyField="Cid" onitemdatabound="DLdonekc_ItemDataBound">
                                        <ItemTemplate>
                                            <div class="doneksdiv">
                                                <div><asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="donekc"></asp:HyperLink></div>
                                                <div class="lesson-course-note"><asp:Label ID="wk" runat="server" ToolTip="作品总数"></asp:Label></div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>

                            <div style="margin-top: 18px;">
                                <div class="lesson-label">未学学案</div>
                                <div style="margin-top: 10px;">
                                    <asp:DataList ID="DLnewkc" runat="server" CssClass="lesson-new-list" ForeColor="Black" RepeatDirection="Horizontal" RepeatLayout="Flow" CellPadding="0" CellSpacing="0" DataKeyField="Cid" onitemdatabound="DLnewkc_ItemDataBound" onitemcommand="DLnewkc_ItemCommand">
                                        <ItemTemplate>
                                            <div class="doneksdiv">
                                                <div><asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="newkc"></asp:HyperLink></div>
                                                <div class="lesson-course-note"><asp:CheckBox ID="Ck" runat="server" Checked='<%# Eval("Cpublish") %>' Enabled="False" /></div>
                                                <div style="margin-top: 4px;"><asp:Button runat="server" ID="PubSet" CssClass="lesson-publish-toggle" CommandArgument="Cid" CommandName="P" Text="发布状态" /></div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>

                        <!-- Tab 3: 实时动态 -->
                        <div class="ls-tab-panel" id="ls-panel-realtime" style="display:none;">
                            <div class="ls-rt-summary" id="ls-rt-summary">
                                <div class="ls-rt-stat ls-rt-stat--working">
                                    <span class="ls-rt-stat__num" id="ls-rt-working">0</span>
                                    <span class="ls-rt-stat__label">学习中</span>
                                </div>
                                <div class="ls-rt-stat ls-rt-stat--viewing">
                                    <span class="ls-rt-stat__num" id="ls-rt-viewing">0</span>
                                    <span class="ls-rt-stat__label">浏览中</span>
                                </div>
                                <div class="ls-rt-stat ls-rt-stat--submitted">
                                    <span class="ls-rt-stat__num" id="ls-rt-submitted">0</span>
                                    <span class="ls-rt-stat__label">已提交</span>
                                </div>
                                <div class="ls-rt-stat ls-rt-stat--idle">
                                    <span class="ls-rt-stat__num" id="ls-rt-idle">0</span>
                                    <span class="ls-rt-stat__label">空闲</span>
                                </div>
                                <div class="ls-rt-stat ls-rt-stat--total">
                                    <span class="ls-rt-stat__num" id="ls-rt-total">0</span>
                                    <span class="ls-rt-stat__label">在线总数</span>
                                </div>
                            </div>

                            <div class="ls-rt-steps" id="ls-rt-steps" style="margin-top:16px;">
                                <div class="lesson-label">各环节学生分布</div>
                                <div id="ls-rt-steps-chart" style="margin-top:10px;"></div>
                            </div>

                            <div style="margin-top:16px;">
                                <div class="lesson-label">学生详细状态</div>
                                <div id="ls-rt-students" style="margin-top:10px;display:flex;flex-wrap:wrap;gap:8px;"></div>
                            </div>
    <div  class="placehold" >
    <div  class="startdiv">
        <div style="margin-bottom: 10px;">
            <asp:Label ID="lblScheduleInfo" runat="server" Font-Size="10pt" ForeColor="Blue"></asp:Label>
        </div>
        <div id="weekendSelector" style="margin-bottom: 10px; display: none;">
            周末上课，请选择按哪天的课表：
            <asp:DropDownList ID="DDLWeekendDay" runat="server" Font-Size="9pt" Width="100px">
                <asp:ListItem Value="1" Text="星期一"></asp:ListItem>
                <asp:ListItem Value="2" Text="星期二"></asp:ListItem>
                <asp:ListItem Value="3" Text="星期三"></asp:ListItem>
                <asp:ListItem Value="4" Text="星期四"></asp:ListItem>
                <asp:ListItem Value="5" Text="星期五" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="BtnWeekendSelect" runat="server" Text="确定" SkinID="BtnNormal"
                onclick="BtnWeekendSelect_Click" BackColor="#9BCBFF" />
        </div>
        上课选择<asp:DropDownList ID="DDLgrade"
            runat="server" Font-Size="9pt"
            Width="40px" EnableTheming="True" AutoPostBack="True"
            onselectedindexchanged="DDLgrade_SelectedIndexChanged">
        </asp:DropDownList>
        年级<asp:DropDownList ID="DDLclass" runat="server" Font-Size="9pt" Width="40px"
            AutoPostBack="True" onselectedindexchanged="DDLclass_SelectedIndexChanged">
        </asp:DropDownList>
        班 <asp:DropDownList ID="DDLCid" runat="server" Font-Size="9pt" Width="180px"
            AutoPostBack="True" onselectedindexchanged="DDLCid_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp; <asp:Button ID="Btnset" runat="server" Text="上课"  SkinID="BtnNormal"
            onclick="Btnset_Click" ToolTip="设置上课班级登录密码" BackColor="#9BCBFF"  />
            &nbsp;&nbsp; <asp:Button OnClientClick="return SuiJiChouWen();"  ID="BtnChouWen" runat="server"  SkinID="BtnNormal"  BackColor="#9BCBFF" Text="随机抽问" />&nbsp;&nbsp; <asp:Button ID="Btnstudent" runat="server" Text="模拟学生"  
            SkinID="BtnNormal" ToolTip="模拟本班级学生角色登录学生平台" 
            onclick="Btnstudent_Click" Enabled="False" BackColor="#9BCBFF" />
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TBpwd" runat="server"  ReadOnly="True" Width="60px" 
             SkinID="TextBoxNum"  BackColor="#E1FCE0" Height="20px" ></asp:TextBox>
        &nbsp;&nbsp;<asp:HyperLink ID="HLrate" runat="server" BorderStyle="None" 
            CssClass="textcenter20" Font-Underline="False" Target="_blank" 
            Height="20px">学习进度</asp:HyperLink>
        &nbsp;&nbsp;<asp:HyperLink ID="HLworkshow" runat="server" BorderStyle="None" 
            CssClass="textcenter20" Font-Underline="False" Target="_blank" 
            Height="20px">作品展示</asp:HyperLink>
                    &nbsp;
                    &nbsp;<asp:HyperLink ID="HLtotal" runat="server" BorderStyle="None" 
            CssClass="textcenter20" Font-Underline="False" Target="_blank" 
            Height="20px">学习汇总</asp:HyperLink>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" style="display:none;" />
    </div>     
    <div  class="startdiv">
        <br />
        <asp:DataList ID="DataListMenu" runat="server" RepeatLayout="Flow" 
            RepeatDirection="Horizontal"  onitemdatabound="DataListMenu_ItemDataBound" 
            DataKeyField="Lid" onitemcommand="DataListMenu_ItemCommand">
            <ItemTemplate>
                <asp:ImageButton ID="imgBtn" runat="server"  ImageUrl='<%# Eval("Limgurl") %>'  CommandArgument="Lid"   CommandName="P" />
                <asp:Label ID="lableTitle" runat="server" Text='<%# Eval("Ltitle") %>'></asp:Label>
                <asp:CheckBox ID="CheckBoxShow" Checked='<%# Eval("Lshow") %>' runat="server" Visible="false" />
            </ItemTemplate>
        </asp:DataList>
    </div>   
    <div  class="startdiv">
        <br />
     <div  >
        &nbsp;<asp:Label ID="Labelnocolor" runat="server" 
             BackColor="#E8E8E8" Width="12px" 
             Height="12px" EnableViewState="False" ToolTip="没有作品"></asp:Label>
         &nbsp; 
         <asp:Label ID="Labelone" runat="server" BackColor="#B1D2FE" Width="12px" 
             Height="12px" EnableViewState="False" ToolTip="单个作品"></asp:Label>
&nbsp;
        <asp:Label ID="Labeltwo" runat="server" BackColor="#4F98FB" Width="12px" 
             Height="12px" EnableViewState="False" ToolTip="两个作品"></asp:Label>
&nbsp;
        <asp:Label ID="Labelthree" runat="server" BackColor="#CDE7CF" Width="12px" 
             Height="12px" EnableViewState="False" ToolTip="三个作品"></asp:Label>
             &nbsp;
        <asp:Label ID="Labelfour" runat="server" BackColor="#9BC47D" Width="12px" 
             Height="12px" EnableViewState="False" ToolTip="四个作品"></asp:Label>
             &nbsp;
        <asp:Label ID="Labelmore" runat="server" BackColor="#BCADE4" Width="12px" 
             Height="12px" EnableViewState="False" ToolTip="多个作品"></asp:Label>
         &nbsp;<asp:Label ID="Labelcount" runat="server" Width="290px" 
             Font-Names="Arial" Font-Size="9pt" EnableViewState="False"></asp:Label>
         今天已签到情况：<asp:Label ID="Labelsigin" runat="server" Width="60px"></asp:Label>位
</div>
        <br />
        <asp:DataList ID="DLonline" runat="server" RepeatColumns="20" onitemdatabound="DLonline_ItemDataBound" 
            DataKeyField="Qid" onitemcommand="DLonline_ItemCommand" 
            HorizontalAlign="Center" CellSpacing="5">
                    <ItemTemplate>
                        <div  class="divonline">
                            <div><asp:Label ID="Labelqnum"  runat="server"  Text='<%# Eval("Qnum") %>' Font-Size="8pt" ></asp:Label></div>  
                            <div><asp:Label ID="HyperSname" runat="server" Text='<%# Eval("Qname") %>' CssClass="labelname"></asp:Label>
                            </div> 
                            <div><asp:Label ID="LabelQmachine" runat="server"  Text='<%# Eval("QmachineShort") %>'  Font-Size="12pt"  ToolTip="座位号" ForeColor='<%# string.IsNullOrEmpty(Eval("Qname").ToString()) ? System.Drawing.Color.Black : System.Drawing.Color.Red %>' ></asp:Label>
                            </div>                            
                            <div><asp:HyperLink ID="Groupflag" runat="server" >g</asp:HyperLink>
                            <asp:Label ID="Labelcolor" runat="server" Text='<%# Eval("Qgscore") %>' ToolTip='<%# "组评语："+Eval("Qgroup") %>'   CssClass="groupscore"></asp:Label>
                            <asp:LinkButton ID="Lunlock" runat="server" CommandArgument="Qid" CommandName="UnLock" ToolTip="单击执行：让该学生重新登录！" CssClass="lockbtn"></asp:LinkButton>
                            <div>                            
                            <asp:Label ID="Labelwork" runat="server" Text='<%# Eval("Qwork") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="Labelattitude" runat="server" Text='<%# Eval("Qattitude") %>' Font-Size="8pt" ToolTip="表现分" CssClass="groupscore"></asp:Label>
                            <asp:Label ID="LabelWscore" runat="server" Text="" Font-Size="8pt" ToolTip="作业得分" CssClass="groupscore"></asp:Label>
                            <asp:Label ID="Labelnote" runat="server" Text='<%# Eval("Qnote") %>'></asp:Label>
                            <asp:Label ID="LabelSleader" runat="server" Text='<%# Eval("Sleader") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="LabelSgroup" runat="server" Text='<%# Eval("Sgroup") %>' Visible="false" ></asp:Label>
                            <asp:Label ID="LabelSgtitle" runat="server" Text='<%# Eval("Sgtitle") %>' Visible="false" ></asp:Label>
                        </div>
                    </ItemTemplate>

                </asp:DataList>
                <asp:Label ID="lblNoData" runat="server" Text="暂无学生登录,不能排序" Visible="false" style="color:Red"></asp:Label>   
        <br />
        <anthem:RadioButtonList ID="RBsort" runat="server" AutoPostBack="True" 
            Font-Size="9pt" onselectedindexchanged="RBsort_SelectedIndexChanged" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <Items>
            <asp:ListItem Value="3" Selected="True">机房视图</asp:ListItem>
            <asp:ListItem Value="0">主机排序</asp:ListItem>
            <asp:ListItem Value="1">学号排序</asp:ListItem>
            <asp:ListItem Value="2">小组排序</asp:ListItem>
            </Items>
        </anthem:RadioButtonList>&nbsp;
        &nbsp;&nbsp; <asp:ImageButton ID="Btnrefresh" runat="server" onclick="Btnrefresh_Click" Enabled="False"
            ImageUrl="~/images/refresh.gif" />
     <br />
     <anthem:CheckBox ID="CheckBoxScratch" runat="server" 
            Text="编程控制" AutoPostBack="True" 
            ToolTip="提示：编程开关控制，选中表示可以进入编程页面" 
            oncheckedchanged="CheckBoxScratch_CheckedChanged" />
     <anthem:CheckBox ID="CheckBoxRgauge" runat="server" 
            Text="作品互评" AutoPostBack="True" 
            oncheckedchanged="CheckBoxRgauge_CheckedChanged" 
            ToolTip="提示：作品互评控制，选中表示开启" />
        <anthem:CheckBox ID="CheckBoxip" runat="server" 
            Text="固定IP登录" AutoPostBack="True" 
            oncheckedchanged="CheckBoxip_CheckedChanged" 
            ToolTip="提示：学生首次登录后锁定当前IP，后续只能从该IP登录。可通过座位管理功能调整固定IP。" />
     <anthem:CheckBox ID="CheckBoxPass" runat="server" 
            Text="闯关模式" AutoPostBack="True" 
            oncheckedchanged="CheckBoxPass_CheckedChanged" 
            ToolTip="提示：当前学案活动依次完成后解锁下一个活动！" />
     <anthem:CheckBox ID="CheckBoxOpen" runat="server" 
            Text="快速模式" AutoPostBack="True" 
            oncheckedchanged="CheckBoxOpen_CheckedChanged" 
            ToolTip="提示：本班学生登录后，直接进入当前学案学案导航！" />
        <anthem:CheckBox ID="CheckBoxPwd" runat="server" 
            Text="班级密码" AutoPostBack="True" 
            oncheckedchanged="CheckBoxPwd_CheckedChanged" 
            ToolTip="提示：选中表示公开显示班级密码，未选表示隐藏班级密码！" />
        <anthem:CheckBox ID="CheckBoxLogin" runat="server" 
            Text="个人模式" AutoPostBack="True" 
            ToolTip="提示：选中表示允许本班单独个人模式登录，未选表示使用后台统一模式登录！" 
            oncheckedchanged="CheckBoxLogin_CheckedChanged" />
        <anthem:CheckBox ID="CheckBoxPreClassCheck" runat="server" 
            Text="课前检查" AutoPostBack="True" 
            oncheckedchanged="CheckBoxPreClassCheck_CheckedChanged" 
            ToolTip="提示：选中表示启用课前检查模式，学生登录后直接进入sub.aspx页面，不跳转到课程页面！" />
        <anthem:CheckBox ID="chkTypingEnabled" runat="server" Text="打字宝典" 
            AutoPostBack="true" OnCheckedChanged="chkTypingEnabled_CheckedChanged" 
            ToolTip="提示：选中表示学生导航中显示打字宝典链接，未选表示隐藏打字宝典链接！" />
        <anthem:CheckBox ID="CheckBoxGames" runat="server" 
            Text="游戏开关" AutoPostBack="True" 
            oncheckedchanged="CheckBoxGames_CheckedChanged" 
            ToolTip="提示：选中表示启用游戏功能，未选表示禁用游戏功能！" />
        <anthem:CheckBox ID="CheckBoxGroupChat" runat="server" 
            Text="小组讨论" AutoPostBack="True" 
            oncheckedchanged="CheckBoxGroupChat_CheckedChanged" 
            ToolTip="提示：选中表示启用小组讨论功能，未选表示禁用小组讨论功能！" />
        <anthem:CheckBox ID="chkSummaryEnabled" runat="server" Text="学习汇总" 
            AutoPostBack="true" OnCheckedChanged="chkSummaryEnabled_CheckedChanged" 
            ToolTip="提示：选中表示学生导航中显示学习汇总链接，未选表示隐藏该链接！" />
        <anthem:CheckBox ID="chkHonorsEnabled" runat="server" Text="荣誉榜" 
            AutoPostBack="true" OnCheckedChanged="chkHonorsEnabled_CheckedChanged" 
            ToolTip="提示：选中表示学生导航中显示荣誉榜链接，未选表示隐藏该链接！" />


     </div>
        <div  class="startdiv">
            <br />
            <asp:Label ID="Label2" runat="server" Width="450px" Height="16px"
                ForeColor="White" ></asp:Label>
            今天未签到情况：<asp:Label ID="Labelsigno" runat="server" Width="60px"></asp:Label>位
            <br />
            <br />
        <asp:DataList ID="DLnotline" runat="server" RepeatColumns="8" 
            RepeatDirection="Horizontal" onitemdatabound="DLnotline_ItemDataBound" 
                HorizontalAlign="Center">
                    <ItemTemplate>
                        <div class="divunline"> 
                            <div><asp:Label ID="LabelNnum"  runat="server" Text='<%# Eval("Snum") %>' Font-Size="8pt" ></asp:Label></div>                                                  
                            <div><asp:Label ID="lbQname" runat="server" Text='<%# Eval("Sname") %>' CssClass="labelname"></asp:Label>                            
                             </div>  
                            <div>
                            <asp:Label ID="LabelSscore" runat="server" Text='<%# Eval("Sscore") %>' Font-Size="8pt" Width="66px" ToolTip="总学分"></asp:Label>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
        </div>
        <asp:Label ID="Labelfresh" runat="server" Font-Names="Arial" Font-Size="9pt"></asp:Label> 
        <br />
        <asp:DropDownList ID="DDLhouse" runat="server" Font-Size="9pt" Width="100px" 
            AutoPostBack="True" onselectedindexchanged="DDLhouse_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:HyperLink ID="HyperLinkSeat" runat="server" Target="_blank" >座位表</asp:HyperLink>
        &nbsp;

        &nbsp;&nbsp;<asp:CheckBox ID="CheckBoxShare" runat="server"
            Text="网盘开关" AutoPostBack="True" 
            oncheckedchanged="CheckBoxShare_CheckedChanged" 
            ToolTip="提示：选中表示网盘启用，未选表示网盘禁用！" />
       <asp:CheckBox ID="CheckBoxGroupShare" runat="server"
            Text="小组网盘" AutoPostBack="True"
            oncheckedchanged="CheckBoxGroupShare_CheckedChanged"
            ToolTip="提示：选中表示小组网盘启用（前提为前面的网盘开关启用），未选表示小组网盘禁用！" />

        <anthem:CheckBox ID="CheckBoxRegister" runat="server"
            Text="登记确认" Checked="false" AutoPostBack="True"
            oncheckedchanged="CheckBoxRegister_CheckedChanged"
            ToolTip="提示：选中表示弹出登记确认窗口，未选表示不弹出确认窗口但仍记录上课内容！" />

        &nbsp;&nbsp; <asp:HyperLink ID="HylkDiskstu" runat="server" 
            ImageUrl="~/images/disksmallstu.gif" Target="_blank" 
            ToolTip="查看学生网盘存档情况"></asp:HyperLink>
        &nbsp;&nbsp; <asp:HyperLink ID="HylkDiskGroup" runat="server" 
            ImageUrl="~/images/disksmall.gif" Target="_blank" ToolTip="查看小组网盘存档情况"></asp:HyperLink>
        <br />     
        <div  class="startdiv">
        <div style="margin:auto; text-align:left; position: relative;">           
            已学学案：<br />
            <asp:DataList ID="DLdonekc" runat="server" ForeColor="Black"
                    RepeatDirection="Horizontal" RepeatLayout="Flow" CellPadding="0"  
                CellSpacing="0" DataKeyField="Cid" 
                onitemdatabound="DLdonekc_ItemDataBound" >
                    <ItemTemplate>
                    <div class="doneksdiv"> 
                        <div><asp:HyperLink ID="ks" runat="server"  Text='<%# Eval("Cks") %>' 
                         ToolTip='<%# Eval("Ctitle") %>' CssClass="donekc"></asp:HyperLink></div>
                        <div><asp:Label ID="wk" runat="server" ToolTip="作品总数"></asp:Label></div>
                        </div>

                        <div id="lsStudentModal" class="ls-rt-modal" aria-hidden="true">
                            <div class="ls-rt-modal__dialog" role="dialog" aria-modal="true" aria-labelledby="lsStudentModalTitle">
                                <div class="ls-rt-modal__head">
                                    <h3 id="lsStudentModalTitle" class="ls-rt-modal__title">学生学习详情</h3>
                                    <button type="button" class="ls-rt-modal__close" onclick="lsCloseStudentModal();">×</button>
                                </div>
                                <div id="lsStudentModalBody" class="ls-rt-modal__content">正在加载...</div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-6 lesson-theme--indigo">
                    <div class="lesson-card__head">
                        <div>
                            <span class="lesson-section-kicker">Control</span>
                            <h2 class="lesson-card__title">课堂控制</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-sort">
                            <span class="lesson-label">视图排序</span>
                            <anthem:RadioButtonList ID="RBsort" runat="server" AutoPostBack="True" CssClass="lesson-radio-list" RepeatDirection="Horizontal" RepeatLayout="Flow" onselectedindexchanged="RBsort_SelectedIndexChanged">
                                <Items>
                                    <asp:ListItem Value="3">机房视图</asp:ListItem>
                                    <asp:ListItem Value="0">主机排序</asp:ListItem>
                                    <asp:ListItem Value="1" Selected="True">学号排序</asp:ListItem>
                                    <asp:ListItem Value="2">小组排序</asp:ListItem>
                                </Items>
                            </anthem:RadioButtonList>
                        </div>

                        <div class="lesson-toggle-group" style="margin-top: 14px;">
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxScratch" runat="server" Text="编程控制" AutoPostBack="True" ToolTip="编程开关控制，选中表示可以进入编程页面" oncheckedchanged="CheckBoxScratch_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxRgauge" runat="server" Text="作品互评" AutoPostBack="True" ToolTip="作品互评控制，选中表示开启" oncheckedchanged="CheckBoxRgauge_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxip" runat="server" Text="IP锁定登录" AutoPostBack="True" ToolTip="根据上次登录的IP进行锁定登录" oncheckedchanged="CheckBoxip_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxPass" runat="server" Text="闯关模式" AutoPostBack="True" ToolTip="当前学案活动依次完成后解锁下一个活动" oncheckedchanged="CheckBoxPass_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxOpen" runat="server" Text="快速模式" AutoPostBack="True" ToolTip="本班学生登录后，直接进入当前学案导航" oncheckedchanged="CheckBoxOpen_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxPwd" runat="server" Text="班级密码" AutoPostBack="True" ToolTip="选中表示公开显示班级密码，未选表示隐藏" oncheckedchanged="CheckBoxPwd_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxLogin" runat="server" Text="个人模式" AutoPostBack="True" ToolTip="选中表示允许本班单独个人模式登录" oncheckedchanged="CheckBoxLogin_CheckedChanged" /></div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-6 lesson-theme--cyan">
                    <div class="lesson-card__head">
                        <div>
                            <span class="lesson-section-kicker">Lab</span>
                            <h2 class="lesson-card__title">机房与资源</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-room-meta">
                            <div class="lesson-field">
                                <span class="lesson-label">机房 / 座位配置</span>
                                <asp:DropDownList ID="DDLhouse" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLhouse_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-room-tools">
                                <asp:HyperLink ID="HyperLinkSeat" runat="server" Target="_blank" CssClass="lesson-link">座位表</asp:HyperLink>
                                <asp:Button ID="Btnrefresh" runat="server" Text="刷新座位" OnClick="Btnrefresh_Click" Enabled="False" CssClass="lesson-refresh" />
                                <asp:HyperLink ID="HylkDiskstu" runat="server" ImageUrl="~/images/disksmallstu.gif" Target="_blank" ToolTip="查看学生网盘存档情况" CssClass="lesson-icon-link"></asp:HyperLink>
                                <asp:HyperLink ID="HylkDiskGroup" runat="server" ImageUrl="~/images/disksmall.gif" Target="_blank" ToolTip="查看小组网盘存档情况" CssClass="lesson-icon-link"></asp:HyperLink>
                            </div>
                        </div>

                        <div class="lesson-toggle-group" style="margin-top: 14px;">
                            <div class="ls-ck-switch"><asp:CheckBox ID="CheckBoxShare" runat="server" Text="网盘开关" AutoPostBack="True" ToolTip="选中表示网盘启用，未选表示网盘禁用" oncheckedchanged="CheckBoxShare_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><asp:CheckBox ID="CheckBoxGroupShare" runat="server" Text="小组网盘" AutoPostBack="True" ToolTip="选中表示小组网盘启用（需先启用网盘开关）" oncheckedchanged="CheckBoxGroupShare_CheckedChanged" /></div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12 lesson-theme--slate">
                    <div class="lesson-card__head">
                        <div>
                            <span class="lesson-section-kicker">Attendance</span>
                            <h2 class="lesson-card__title">未签到学生</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <div style="overflow-x: auto;">
                            <asp:DataList ID="DLnotline" runat="server" CssClass="lesson-offline-list" RepeatDirection="Horizontal" onitemdatabound="DLnotline_ItemDataBound" RepeatLayout="Flow">
                                <ItemTemplate>
                                    <div class="student-card student-card--offline">
                                        <div class="student-card__num"><asp:Label ID="LabelNnum" runat="server" Text='<%# Eval("Snum") %>'></asp:Label></div>
                                        <asp:Label ID="lbQname" runat="server" Text='<%# Eval("Sname") %>' CssClass="labelname"></asp:Label>
                                        <div class="student-card__score"><asp:Label ID="LabelSscore" runat="server" Text='<%# Eval("Sscore") %>' ToolTip="总学分"></asp:Label></div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12 lesson-theme--red">
                    <div class="lesson-card__head">
                        <div>
                            <span class="lesson-section-kicker">Finish</span>
                            <h2 class="lesson-card__title">课堂收尾</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-footer" id="LessonQuitFooter" runat="server" visible="false">
                            <asp:Button ID="BtnaAllQuit" runat="server" Text="全班下线" Visible="False" EnableViewState="False" onclick="BtnaAllQuit_Click" CssClass="lesson-btn lesson-btn--danger" />
                            <div class="lesson-footer__meta">
                                <span>该操作会让当前上课班级学生全部退出登录，建议仅在下课时使用。</span>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
                    </ItemTemplate>
                </asp:DataList>
        </div>
        </div>       
        <br />
        <br />
        <div class="startdiv">
         <br />
        <asp:Button ID="BtnaAllQuit" runat="server" Text="全班下线"  SkinID="BtnSmall"
            onclick="BtnaAllQuit_Click" Visible="True" EnableViewState="False" />
        <br />
        <asp:Label ID="LabelToday" runat="server" Font-Size="9pt" 
            ToolTip="*服务器日期校准：作品、签到日期以此为准*" Font-Bold="False"  ></asp:Label>
        <br />
        </div>

        <script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <link href="../js/tooltip.css" rel="stylesheet" type="text/css" />
        <script src="../js/spanToolTip.js" type="text/javascript"></script>
        <script type="text/javascript">
            window.__startConfig = {
                btnRefreshId: '<%= Btnrefresh.ClientID %>',
                lsGrade: '<%= LsGrade %>',
                lsClass: '<%= LsClass %>',
                lsCid: '<%= LsCid %>'
            };
        <link href="../js/tinybox.css" rel="stylesheet" type="text/css" />
        <script src="../js/tinybox.js" type="text/javascript"></script>
        
        <script type ="text/javascript" >
            function myrefresh() {
                document.getElementById("<%= Btnrefresh.ClientID %>").click();
            }
            setTimeout("myrefresh()", 120000); //指定120秒刷新一次            

             function notsg(n, g, m) {
                var urlsg ="../teacher/notsign.aspx?nnum=" +n + "&ngrade=" +g + "&qname=" + m;
                TINY.box.show({ iframe: urlsg, boxid: 'frameless', width: 360, height: 260, fixed: false, maskopacity: 60, close: true })
            }
            function attitude(q, m, a,c) {
                var urlat = "../teacher/attitude.aspx?qid=" + q + "&qname=" + m + "&qattitude=" + a + "&qcid=" + c;
                TINY.box.show({ iframe: urlat, boxid: 'frameless', width: 360, height: 320, fixed: false, maskopacity: 60, close: true })
            }
            function attitudegroup(g, m, q, c) {
                var urlat = "../teacher/attitudegroup.aspx?sg=" + g + "&ld=" + m + "&qd=" + q + "&qcid=" + c;
                TINY.box.show({ iframe: urlat, boxid: 'frameless', width: 360, height: 200, fixed: false, maskopacity: 60, close:true })
            }
            //随机抽问
            function SuiJiChouWen() {
           
                // 获取所有在线学生的div元素
                var studentDivs = Array.from(document.getElementsByClassName('divonline')).filter(container => container.querySelector(`.labelname`))
                if (studentDivs.length > 0) {
                    
                    // 随机选择一个学生
                    var randomIndex = Math.floor(Math.random() * studentDivs.length);
                    var selectedStudent = studentDivs[randomIndex];
                    
                    // 移除之前的选中样式
                    for (var i = 0; i < studentDivs.length; i++) {
                        studentDivs[i].style.backgroundColor = '';
                    }
                   
                    // 高亮显示选中的学生
                    selectedStudent.style.backgroundColor = '#FFFF99';

                    // 获取学生姓名
                    var labelName=selectedStudent.querySelector('.labelname');
                    if(labelName){
                        alert(labelName.innerText)
                    }                 
   
                } else {
                    alert('当前没有在线学生可以抽问！');
                }
                return false;
            }
        </script>
        <script src="../js/start.js" type="text/javascript"></script>
    </div>
</asp:Content>
