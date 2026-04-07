<%@ page title="" language="C#" masterpagefile="~/teacher/Teach.master" stylesheettheme="Teacher" autoeventwireup="true" inherits="Teacher_check, App_Web_fwgio5h2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div  class=" ">
    
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <style>
        .filter-box { margin:20px; padding:15px; border:1px solid #ddd; }
        .filter-row { margin-bottom:10px;  text-align: left; }
        .filter-label { display:inline-block; width:100px;  margin-left: 10px; text-align: right;}
        .filter-label1 { display:inline-block; width:100px;  margin-left: 10px;}
        
        .grid-view { margin:20px; width:98%; }
        .grid-view a{ text-decoration-line: none;}
        .batch-box { margin:10px; text-align: left;}

        .sort-arrow {
    color: #007bff;
    font-weight: bold;
    margin-left: 5px;
}
    </style>
       
        <!-- 筛选区域 -->
        <div class="filter-box">
            <!-- 班级和姓名筛选 -->
            <div class="filter-row">
                <span class="filter-label">提交者班级：</span>
                <asp:DropDownList ID="ddlClass" runat="server"></asp:DropDownList>
                <span class="filter-label" style="margin-left:30px">使用学生：</span>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            

            <!-- 时间筛选 -->
                <span>   </span>
                <span class="filter-label">提交时间：</span>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="datepicker"></asp:TextBox>
                <span> 至 </span>
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="datepicker"></asp:TextBox>
            </div>

            <!-- 检查项多选 -->
            <div class="filter-row">
                <span class="filter-label1">检查项：</span>
                <asp:CheckBoxList ID="cblChecks" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="有垃圾" Value="HasRubbish"></asp:ListItem>
                    <asp:ListItem Text="地面污渍" Value="DrawerClean"></asp:ListItem>
                    <asp:ListItem Text="设备未摆放" Value="EquipmentArranged"></asp:ListItem>
                    <asp:ListItem Text="椅子未归位" Value="ChairAdjusted"></asp:ListItem>
                    <asp:ListItem Text="键鼠损坏" Value="KeyboardMouseDamaged"></asp:ListItem>
                    <asp:ListItem Text="线缆拔掉" Value="CableUnplugged"></asp:ListItem>
                    <asp:ListItem Text="外设拔掉" Value="PeripheralUnplugged"></asp:ListItem>
                    <asp:ListItem Text="屏幕涂画" Value="ScreenMarked"></asp:ListItem>
                </asp:CheckBoxList>
            </div>

            <asp:Button ID="btnFilter" runat="server" Text="筛选" OnClick="btnFilter_Click" />
            <asp:Button ID="btnReturn" runat="server" Text="返回" OnClick="btnReturn_Click" ToolTip="返回管理页面" />
        </div>

        <!-- 批量操作 -->
        <div class="batch-box">
            <asp:Button ID="btnExport" runat="server" Text="导出Excel" OnClick="btnExport_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="批量删除" OnClick="btnDelete_Click" />
            <asp:Button ID="btnResetSort" runat="server" Text="复原排序" OnClick="btnResetSort_Click" />
        </div>

        <!-- 数据展示 -->
        <asp:GridView ID="gvRecords" runat="server" CssClass="grid-view" 
            AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True" OnSorting="gvRecords_Sorting" OnRowDataBound="gvRecords_RowDataBound"
            AllowPaging="True" PageSize="50" OnPageIndexChanging="gvRecords_PageIndexChanging"
            OnRowEditing="gvRecords_RowEditing" OnRowUpdating="gvRecords_RowUpdating"  OnRowCancelingEdit="gvRecords_RowCancelingEdit">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <!-- 全选按钮 -->
                        <asp:CheckBox ID="chkSelectAll" runat="server" 
                            AutoPostBack="true" 
                            OnCheckedChanged="chkSelectAll_CheckedChanged" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PcName" HeaderText="设备号" ReadOnly="true" SortExpression="PcName" />
                <asp:BoundField DataField="IpAddress" HeaderText="IP地址" ReadOnly="true"  SortExpression="IpAddress"/>
                <asp:BoundField DataField="ClassName" HeaderText="提交学生班级" ReadOnly="true" SortExpression="ClassName" />
                <asp:BoundField DataField="sname" HeaderText="提交学生" ReadOnly="true" SortExpression="sname" />
               
                <asp:TemplateField HeaderText="使用学生" SortExpression="suser">
                    <ItemTemplate><%# Eval("suser") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="suser" runat="server" Text='<%# Bind("suser") %>' TextMode="MultiLine" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="有垃圾">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkHasRubbish" runat="server" 
                            Checked='<%# Eval("HasRubbish") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkHasRubbish" runat="server" 
                            Checked='<%# Bind("HasRubbish") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="有污渍">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkDrawerClean" runat="server" 
                            Checked='<%# Eval("DrawerClean") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkDrawerClean" runat="server" 
                            Checked='<%# Bind("DrawerClean") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="设备乱">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkEquipmentArranged" runat="server" 
                            Checked='<%# Eval("EquipmentArranged") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkEquipmentArranged" runat="server" 
                            Checked='<%# Bind("EquipmentArranged") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="椅乱">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkChairAdjusted" runat="server" 
                            Checked='<%# Eval("ChairAdjusted") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkChairAdjusted" runat="server" 
                            Checked='<%# Bind("ChairAdjusted") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="键鼠损">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkKeyboardMouseDamaged" runat="server" 
                            Checked='<%# Eval("KeyboardMouseDamaged") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkKeyboardMouseDamaged" runat="server" 
                            Checked='<%# Bind("KeyboardMouseDamaged") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="拔线缆">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkCableUnplugged" runat="server" 
                            Checked='<%# Eval("CableUnplugged") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkCableUnplugged" runat="server" 
                            Checked='<%# Bind("CableUnplugged") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="拔键鼠">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPeripheralUnplugged" runat="server" 
                            Checked='<%# Eval("PeripheralUnplugged") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkPeripheralUnplugged" runat="server" 
                            Checked='<%# Bind("PeripheralUnplugged") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="涂屏">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkScreenMarked" runat="server" 
                            Checked='<%# Eval("ScreenMarked") %>' Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkScreenMarked" runat="server" 
                            Checked='<%# Bind("ScreenMarked") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="SubmitTime" HeaderText="提交时间" DataFormatString="{0:yyyy-MM-dd HH:mm}" ReadOnly="true" SortExpression="SubmitTime" />
                <asp:TemplateField HeaderText="备注">
                    <ItemTemplate><%# Eval("Comment") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtComment" runat="server" Text='<%# Bind("Comment") %>' TextMode="MultiLine" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowCancelButton="True" /> 
            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
        </asp:GridView>
   
    <!-- 初始化日期选择器 -->
    <script>
        $(function () {
            $(".datepicker").datepicker({
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                changeYear: true
            });
        });
    </script>

</div>
</asp:Content>

