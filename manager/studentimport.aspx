<%@ Page Title="" Language="C#" MasterPageFile="~/manager/Manage.master" AutoEventWireup="true" CodeFile="studentimport.aspx.cs" Inherits="Manager_studentimport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    
    <div class="mgr-page">
        <div class="mgr-shell">
            <div class="mgr-hero">
                <h1 class="mgr-hero__title"><i class="bi bi-file-earmark-arrow-up-fill" style="color:#6ee7b7;"></i> 新生导入</h1>
                <p class="mgr-hero__subtitle">通过Excel批量导入学生信息，请按步骤操作</p>
            </div>

            <div class="mgr-card">
                <div class="mgr-card__head"><h2 class="mgr-card__title">导入步骤</h2></div>
                <div class="mgr-card__body">
                    <div class="mgr-steps">
                        <div class="mgr-step">
                            <span class="mgr-step__num">1</span>
                            <div class="mgr-step__body">
                                <span class="mgr-step__label">选择Excel文件并上传</span>
                                
                                <div class="ls-upload" data-accept=".xls" data-label="点击或拖拽上传 Excel 文件" data-hint="支持 .xls 格式">
                                    <asp:FileUpload ID="FileUpExcel" runat="server" />
                                </div>
                                
                                <div style="display:flex;align-items:center;gap:12px;flex-wrap:wrap;margin-top:4px;">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="密码转换为姓名拼音缩写" ToolTip="是否在获取数据时自动将密码转换为学生姓名拼音缩写" />
                                </div>
                                <asp:Button ID="ButtonInsert" runat="server" Text="上传 Excel" OnClick="ButtonInsert_Click" CssClass="mgr-btn mgr-btn--primary" style="width:fit-content;" ToolTip="上传并导入临时学生表" />
                            </div>
                        </div>
                        <div class="mgr-step">
                            <span class="mgr-step__num">2</span>
                            <div class="mgr-step__body">
                                <span class="mgr-step__label">确认数据并导入平台</span>
                                <asp:Button ID="ButtonAppend" runat="server" Text="导入数据" OnClick="ButtonAppend_Click" Enabled="False" CssClass="mgr-btn mgr-btn--green" style="width:fit-content;" ToolTip="将上传的学生临时表数据导入平台学生表中" />
                            </div>
                        </div>
                    </div>

                    <div id="Loading" style="display:none;text-align:center;color:#dc2626;font-size:14px;">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/load2.gif" />
                        <input id="Textcmd" style="border:none;background:transparent;" type="text" />
                    </div>
                </div>
            </div>

            <div class="mgr-card">
                <div class="mgr-card__head"><h2 class="mgr-card__title">注意事项</h2></div>
                <div class="mgr-card__body">
                    <asp:Label ID="Labelmsg" runat="server" CssClass="mgr-msg">**导入Excel数据中必须要有学号、入学年度、年级、班级、姓名、密码、性别**<br />**入学年度、年级、班级必须为数字；学号必须为数字且尽量不超过12位**</asp:Label>
                    <div style="display:flex;flex-wrap:wrap;align-items:center;gap:12px;">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/说明必读/学生导入模板.xls" Target="_blank" CssClass="mgr-btn mgr-btn--link">下载学生信息Excel模板</asp:HyperLink>
                        <asp:Button ID="ButtonClear" runat="server" Text="清除最近导入数据" OnClick="ButtonClear_Click" CssClass="mgr-btn mgr-btn--danger" ToolTip="只删除刚才导入的数据，以方便重新导入！" />
                    </div>
                </div>
            </div>

            <div class="mgr-card">
                <div class="mgr-card__head"><h2 class="mgr-card__title">导入数据检验重复列表</h2></div>
                <div style="overflow-x:auto;">
                    <asp:GridView ID="GVrepeat" runat="server" CssClass="mgr-grid" GridLines="None" Width="100%"
                        Font-Size="13px" PageSize="25" EnableTheming="False" EnableViewState="False" AutoGenerateColumns="True">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    
    <script src="../js/fileupload.js"></script>
</asp:Content>
