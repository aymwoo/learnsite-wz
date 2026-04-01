<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="start.aspx.cs" Inherits="Teacher_start" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="w-full flex flex-col gap-6">
    <!-- Top Action Bar -->
    <div class="bg-white p-4 rounded-lg shadow-sm border border-gray-100 flex flex-wrap items-center gap-4">
        <div class="flex items-center gap-2 text-sm text-gray-700">
            <span class="font-medium">上课选择</span>
            <asp:DropDownList ID="DDLgrade"
                runat="server" CssClass="border border-gray-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                EnableTheming="True" AutoPostBack="True"
                onselectedindexchanged="DDLgrade_SelectedIndexChanged">
            </asp:DropDownList>
            <span>年级</span>
            <asp:DropDownList ID="DDLclass" runat="server" CssClass="border border-gray-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                AutoPostBack="True" onselectedindexchanged="DDLclass_SelectedIndexChanged">
            </asp:DropDownList>
            <span>班</span>
            <asp:DropDownList ID="DDLCid" runat="server" CssClass="border border-gray-300 rounded px-2 py-1 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                AutoPostBack="True" onselectedindexchanged="DDLCid_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <div class="flex items-center gap-2">
            <asp:Button ID="Btnset" runat="server" Text="开始上课"
                CssClass="bg-blue-500 hover:bg-blue-600 text-white font-medium py-1 px-4 rounded text-sm transition-colors cursor-pointer"
                onclick="Btnset_Click" ToolTip="设置上课班级登录密码" />

            <asp:Button ID="Btnstudent" runat="server" Text="模拟学生"
                CssClass="bg-green-500 hover:bg-green-600 text-white font-medium py-1 px-4 rounded text-sm transition-colors disabled:opacity-50 disabled:cursor-not-allowed cursor-pointer"
                ToolTip="模拟本班级学生角色登录学生平台"
                onclick="Btnstudent_Click" Enabled="False" />
        </div>

        <div class="flex items-center gap-3 ml-auto">
            <asp:TextBox ID="TBpwd" runat="server" ReadOnly="True"
                CssClass="bg-green-50 border border-green-200 text-green-800 font-mono px-2 py-1 rounded text-center w-16"
                ToolTip="班级密码"></asp:TextBox>

            <div class="flex gap-3 text-sm">
                <asp:HyperLink ID="HLrate" runat="server" CssClass="text-blue-600 hover:text-blue-800 hover:underline" Target="_blank">学习进度</asp:HyperLink>
                <asp:HyperLink ID="HLworkshow" runat="server" CssClass="text-blue-600 hover:text-blue-800 hover:underline" Target="_blank">作品展示</asp:HyperLink>
                <asp:HyperLink ID="HLtotal" runat="server" CssClass="text-blue-600 hover:text-blue-800 hover:underline" Target="_blank">学习汇总</asp:HyperLink>
            </div>
        </div>
    </div>     

    <!-- Menu DataList -->
    <div class="bg-white p-4 rounded-lg shadow-sm border border-gray-100 flex flex-wrap gap-4 items-center justify-center">
        <asp:DataList ID="DataListMenu" runat="server" RepeatLayout="Flow" 
            RepeatDirection="Horizontal" onitemdatabound="DataListMenu_ItemDataBound"
            DataKeyField="Lid" onitemcommand="DataListMenu_ItemCommand" CssClass="flex flex-wrap gap-4">
            <ItemTemplate>
                <div class="flex flex-col items-center gap-1 p-2 hover:bg-gray-50 rounded cursor-pointer transition-colors">
                    <asp:ImageButton ID="imgBtn" runat="server" ImageUrl='<%# Eval("Limgurl") %>' CommandArgument="Lid" CommandName="P" CssClass="w-10 h-10 object-contain" />
                    <asp:Label ID="lableTitle" runat="server" Text='<%# Eval("Ltitle") %>' CssClass="text-xs text-gray-600"></asp:Label>
                    <asp:CheckBox ID="CheckBoxShow" Checked='<%# Eval("Lshow") %>' runat="server" Visible="false" />
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>   
    <!-- Online Students Area -->
    <div class="bg-white p-4 rounded-lg shadow-sm border border-gray-100 flex flex-col gap-4">
        <div class="flex flex-wrap items-center justify-between text-sm text-gray-600 bg-gray-50 p-3 rounded-md">
            <div class="flex items-center gap-4">
                <div class="flex items-center gap-1" title="没有作品"><asp:Label ID="Labelnocolor" runat="server" CssClass="w-3 h-3 rounded-full inline-block" BackColor="#E8E8E8" EnableViewState="False"></asp:Label><span>无</span></div>
                <div class="flex items-center gap-1" title="单个作品"><asp:Label ID="Labelone" runat="server" CssClass="w-3 h-3 rounded-full inline-block" BackColor="#B1D2FE" EnableViewState="False"></asp:Label><span>单</span></div>
                <div class="flex items-center gap-1" title="两个作品"><asp:Label ID="Labeltwo" runat="server" CssClass="w-3 h-3 rounded-full inline-block" BackColor="#4F98FB" EnableViewState="False"></asp:Label><span>双</span></div>
                <div class="flex items-center gap-1" title="三个作品"><asp:Label ID="Labelthree" runat="server" CssClass="w-3 h-3 rounded-full inline-block" BackColor="#CDE7CF" EnableViewState="False"></asp:Label><span>三</span></div>
                <div class="flex items-center gap-1" title="四个作品"><asp:Label ID="Labelfour" runat="server" CssClass="w-3 h-3 rounded-full inline-block" BackColor="#9BC47D" EnableViewState="False"></asp:Label><span>四</span></div>
                <div class="flex items-center gap-1" title="多个作品"><asp:Label ID="Labelmore" runat="server" CssClass="w-3 h-3 rounded-full inline-block" BackColor="#BCADE4" EnableViewState="False"></asp:Label><span>多</span></div>
            </div>
            <div class="flex items-center gap-4">
                <asp:Label ID="Labelcount" runat="server" EnableViewState="False" CssClass="font-medium text-gray-700"></asp:Label>
                <div class="text-blue-600 font-semibold">今天已签到：<asp:Label ID="Labelsigin" runat="server" CssClass="px-1"></asp:Label>位</div>
            </div>
        </div>

        <div class="flex justify-center">
            <asp:DataList ID="DLonline" runat="server" RepeatColumns="8" onitemdatabound="DLonline_ItemDataBound"
                DataKeyField="Qid" onitemcommand="DLonline_ItemCommand" RepeatDirection="Horizontal" CssClass="mx-auto" CellSpacing="4">
                <ItemTemplate>
                    <div class="flex flex-col items-center justify-center p-2 border border-gray-200 rounded-md bg-white hover:shadow-md transition-shadow m-1 w-24">
                        <div class="text-xs text-gray-500 mb-1"><asp:Label ID="Labelqnum" runat="server" Text='<%# Eval("Qnum") %>'></asp:Label></div>
                        <div class="mb-1 w-full text-center">
                            <asp:Label ID="HyperSname" runat="server" Text='<%# Eval("Qname") %>' CssClass="inline-block w-full py-1 bg-gray-100 rounded text-sm text-gray-800 font-medium truncate"></asp:Label>
                        </div>
                        <div class="text-xs text-gray-400"><asp:Label ID="LabelQmachine" runat="server" Text='<%# Eval("QmachineShort") %>' Visible="false"></asp:Label></div>
                        <div class="flex items-center justify-center gap-1 w-full mt-1">
                            <asp:HyperLink ID="Groupflag" runat="server" CssClass="text-xs text-gray-400 hover:text-blue-500">g</asp:HyperLink>
                            <asp:Label ID="Labelcolor" runat="server" Text='<%# Eval("Qgscore") %>' ToolTip='<%# "组评语："+Eval("Qgroup") %>' CssClass="text-xs font-bold w-4 text-center"></asp:Label>
                            <asp:LinkButton ID="Lunlock" runat="server" CommandArgument="Qid" CommandName="UnLock" ToolTip="单击执行：让该学生重新登录！" CssClass="w-4 h-4 bg-red-100 hover:bg-red-200 rounded flex items-center justify-center text-red-600 text-xs" Text="x"></asp:LinkButton>
                        </div>
                        <div class="hidden">
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
        <div class="mt-4 flex flex-wrap gap-4 items-center justify-center text-sm border-t border-gray-100 pt-4">
            <div class="bg-gray-50 px-3 py-1.5 rounded flex items-center">
                <anthem:RadioButtonList ID="RBsort" runat="server" AutoPostBack="True"
                    onselectedindexchanged="RBsort_SelectedIndexChanged"
                    RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="flex gap-3 [&>span]:flex [&>span]:items-center [&>span]:gap-1">
                    <Items>
                        <asp:ListItem Value="3">机房视图</asp:ListItem>
                        <asp:ListItem Value="0">主机排序</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">学号排序</asp:ListItem>
                        <asp:ListItem Value="2">小组排序</asp:ListItem>
                    </Items>
                </anthem:RadioButtonList>
            </div>
            <div class="flex flex-wrap gap-3">
                <anthem:CheckBox ID="CheckBoxScratch" runat="server" Text="编程控制" AutoPostBack="True" ToolTip="提示：编程开关控制，选中表示可以进入编程页面" oncheckedchanged="CheckBoxScratch_CheckedChanged" CssClass="flex items-center gap-1 bg-white border border-gray-200 px-2 py-1 rounded" />
                <anthem:CheckBox ID="CheckBoxRgauge" runat="server" Text="作品互评" AutoPostBack="True" oncheckedchanged="CheckBoxRgauge_CheckedChanged" ToolTip="提示：作品互评控制，选中表示开启" CssClass="flex items-center gap-1 bg-white border border-gray-200 px-2 py-1 rounded" />
                <anthem:CheckBox ID="CheckBoxip" runat="server" Text="IP锁定登录" AutoPostBack="True" oncheckedchanged="CheckBoxip_CheckedChanged" ToolTip="提示：根据上次登录的IP进行锁定登录" CssClass="flex items-center gap-1 bg-white border border-gray-200 px-2 py-1 rounded" />
                <anthem:CheckBox ID="CheckBoxPass" runat="server" Text="闯关模式" AutoPostBack="True" oncheckedchanged="CheckBoxPass_CheckedChanged" ToolTip="提示：当前学案活动依次完成后解锁下一个活动！" CssClass="flex items-center gap-1 bg-white border border-gray-200 px-2 py-1 rounded" />
                <anthem:CheckBox ID="CheckBoxOpen" runat="server" Text="快速模式" AutoPostBack="True" oncheckedchanged="CheckBoxOpen_CheckedChanged" ToolTip="提示：本班学生登录后，直接进入当前学案学案导航！" CssClass="flex items-center gap-1 bg-white border border-gray-200 px-2 py-1 rounded" />
                <anthem:CheckBox ID="CheckBoxPwd" runat="server" Text="班级密码" AutoPostBack="True" oncheckedchanged="CheckBoxPwd_CheckedChanged" ToolTip="提示：选中表示公开显示班级密码，未选表示隐藏班级密码！" CssClass="flex items-center gap-1 bg-white border border-gray-200 px-2 py-1 rounded" />
                <anthem:CheckBox ID="CheckBoxLogin" runat="server" Text="个人模式" AutoPostBack="True" ToolTip="提示：选中表示允许本班单独个人模式登录，未选表示使用后台统一模式登录！" oncheckedchanged="CheckBoxLogin_CheckedChanged" CssClass="flex items-center gap-1 bg-white border border-gray-200 px-2 py-1 rounded" />
            </div>
        </div>
    </div>

    <!-- Offline Students Area -->
    <div class="bg-white p-4 rounded-lg shadow-sm border border-gray-100 flex flex-col gap-4">
        <div class="flex items-center justify-between text-sm text-gray-600 bg-gray-50 p-3 rounded-md">
            <asp:Label ID="Label2" runat="server" CssClass="hidden"></asp:Label>
            <div class="text-red-500 font-semibold">今天未签到情况：<asp:Label ID="Labelsigno" runat="server" CssClass="px-1"></asp:Label>位</div>
        </div>

        <div class="flex justify-center">
            <asp:DataList ID="DLnotline" runat="server" RepeatColumns="8" RepeatDirection="Horizontal" onitemdatabound="DLnotline_ItemDataBound" HorizontalAlign="Center" CellSpacing="4" CssClass="mx-auto">
                <ItemTemplate>
                    <div class="flex flex-col items-center justify-center p-2 border border-dashed border-gray-300 rounded-md bg-gray-50 m-1 w-24 opacity-75">
                        <div class="text-xs text-gray-400 mb-1"><asp:Label ID="LabelNnum" runat="server" Text='<%# Eval("Snum") %>'></asp:Label></div>
                        <div class="mb-1 w-full text-center">
                            <asp:Label ID="lbQname" runat="server" Text='<%# Eval("Sname") %>' CssClass="inline-block w-full py-1 bg-gray-200 rounded text-sm text-gray-500 truncate"></asp:Label>
                        </div>
                        <div class="text-xs text-gray-400">
                            学分: <asp:Label ID="LabelSscore" runat="server" Text='<%# Eval("Sscore") %>' ToolTip="总学分"></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <!-- Footer Controls -->
    <div class="bg-white p-4 rounded-lg shadow-sm border border-gray-100 flex flex-col gap-4">
        <div class="flex flex-wrap items-center gap-4 text-sm bg-gray-50 p-3 rounded">
            <asp:Label ID="Labelfresh" runat="server" CssClass="text-gray-500"></asp:Label>
            <div class="flex items-center gap-2">
                <asp:DropDownList ID="DDLhouse" runat="server" CssClass="border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500" AutoPostBack="True" onselectedindexchanged="DDLhouse_SelectedIndexChanged"></asp:DropDownList>
                <asp:HyperLink ID="HyperLinkSeat" runat="server" Target="_blank" CssClass="text-blue-600 hover:text-blue-800 hover:underline">座位表</asp:HyperLink>
                <asp:ImageButton ID="Btnrefresh" runat="server" onclick="Btnrefresh_Click" Enabled="False" ImageUrl="~/images/refresh.gif" CssClass="ml-2 hover:opacity-80" />
            </div>
            <div class="flex items-center gap-4 ml-auto">
                <asp:CheckBox ID="CheckBoxShare" runat="server" Text="网盘开关" AutoPostBack="True" oncheckedchanged="CheckBoxShare_CheckedChanged" ToolTip="提示：选中表示网盘启用，未选表示网盘禁用！" CssClass="flex items-center gap-1" />
                <asp:CheckBox ID="CheckBoxGroupShare" runat="server" Text="小组网盘" AutoPostBack="True" oncheckedchanged="CheckBoxGroupShare_CheckedChanged" ToolTip="提示：选中表示小组网盘启用（前提为前面的网盘开关启用），未选表示小组网盘禁用！" CssClass="flex items-center gap-1" />
                <asp:HyperLink ID="HylkDiskstu" runat="server" ImageUrl="~/images/disksmallstu.gif" Target="_blank" ToolTip="查看学生网盘存档情况" CssClass="hover:opacity-80"></asp:HyperLink>
                <asp:HyperLink ID="HylkDiskGroup" runat="server" ImageUrl="~/images/disksmall.gif" Target="_blank" ToolTip="查看小组网盘存档情况" CssClass="hover:opacity-80"></asp:HyperLink>
            </div>
        </div>

        <div class="flex flex-col gap-6">
            <div>
                <h3 class="font-semibold text-gray-700 mb-3 border-b pb-2">已学学案</h3>
                <asp:DataList ID="DLdonekc" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" DataKeyField="Cid" onitemdatabound="DLdonekc_ItemDataBound" CssClass="flex flex-wrap gap-2">
                    <ItemTemplate>
                        <div class="flex flex-col items-center p-2 bg-green-50 border border-green-200 rounded min-w-[3rem]">
                            <asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="font-bold text-green-700 hover:text-green-900"></asp:HyperLink>
                            <asp:Label ID="wk" runat="server" ToolTip="作品总数" CssClass="text-xs text-gray-500 mt-1"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div>
                <h3 class="font-semibold text-gray-700 mb-3 border-b pb-2">未学学案</h3>
                <asp:DataList ID="DLnewkc" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" onitemdatabound="DLnewkc_ItemDataBound" onitemcommand="DLnewkc_ItemCommand" DataKeyField="Cid" CssClass="flex flex-wrap gap-2">
                    <ItemTemplate>
                        <div class="flex flex-col items-center p-2 bg-orange-50 border border-orange-200 rounded min-w-[3rem]">
                            <asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="font-bold text-orange-700 hover:text-orange-900"></asp:HyperLink>
                            <div class="mt-1 flex items-center justify-center gap-1">
                                <asp:CheckBox ID="Ck" runat="server" Checked='<%# Eval("Cpublish") %>' Enabled="False" CssClass="scale-75" />
                                <asp:ImageButton runat="server" ID="PubSet" CommandArgument="Cid" CommandName="P" ImageUrl="~/images/cardsmall.gif" CssClass="w-3 h-3 hover:opacity-80" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>       

        <div class="flex flex-col items-center mt-6 pt-4 border-t border-gray-100 text-center gap-2">
            <asp:Button ID="BtnaAllQuit" runat="server" Text="全班下线" onclick="BtnaAllQuit_Click" Visible="False" EnableViewState="False" CssClass="bg-red-500 hover:bg-red-600 text-white py-1 px-4 rounded text-sm cursor-pointer" />
            <asp:Label ID="LabelToday" runat="server" CssClass="text-xs text-gray-400" ToolTip="*服务器日期校准：作品、签到日期以此为准*"></asp:Label>
        </div>
    </div>
        <script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <link href="../js/tooltip.css" rel="stylesheet" type="text/css" />
        <script src="../js/spanToolTip.js" type="text/javascript"></script>
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
        </script>
</div>
</asp:Content>

