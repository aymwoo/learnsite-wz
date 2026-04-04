<%@ Page Title="" Language="C#" MasterPageFile="~/manager/Manage.master" AutoEventWireup="true" CodeFile="studentimport.aspx.cs" Inherits="Manager_studentimport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    <style type="text/css">
        .mgr-page { --ls-bg: linear-gradient(180deg,#f8fbff 0%,#f3f7ff 100%); --ls-border: #dbe6f5; --ls-text: #0f172a; --ls-muted: #64748b; padding: 28px; background: var(--ls-bg); min-height: calc(100vh - 8rem); box-sizing: border-box; width: 100%; }
        .mgr-page * { box-sizing: border-box; }
        .mgr-shell { display: flex; flex-direction: column; gap: 20px; }
        .mgr-hero { border: 1px solid #bbf7d0; border-radius: 1rem; padding: 24px 28px; background: linear-gradient(135deg,#f0fdf4 0%,#dcfce7 100%); color: #14532d; box-shadow: 0 4px 16px rgba(5,150,105,.08); }
        .mgr-hero__title { margin: 0; font-size: 22px; font-weight: 800; display: flex; align-items: center; gap: 10px; }
        .mgr-hero__subtitle { margin: 6px 0 0; font-size: 14px; color: rgba(236,253,245,.85); }
        .mgr-card { border: 1px solid var(--ls-border); border-radius: 1rem; background: rgba(255,255,255,.96); box-shadow: 0 12px 30px rgba(15,23,42,.05); overflow: hidden; }
        .mgr-card__head { padding: 20px 24px; border-bottom: 1px solid #f1f5f9; }
        .mgr-card__title { margin: 0; font-size: 16px; font-weight: 800; color: var(--ls-text); }
        .mgr-card__body { padding: 24px; display: flex; flex-direction: column; gap: 18px; }
        .mgr-steps { display: flex; flex-direction: column; gap: 14px; }
        .mgr-step { display: flex; align-items: center; gap: 14px; padding: 16px; border: 1px solid #e2e8f0; border-radius: 1rem; background: #f8fafc; }
        .mgr-step__num { display: inline-flex; align-items: center; justify-content: center; width: 32px; height: 32px; border-radius: .5rem; background: #dbeafe; color: #1d4ed8; font-weight: 800; font-size: 14px; flex-shrink: 0; }
        .mgr-step__body { display: flex; flex-direction: column; gap: 8px; flex: 1; }
        .mgr-step__label { font-size: 14px; font-weight: 700; color: #334155; }
        
        .mgr-btn { display: inline-flex; align-items: center; justify-content: center; min-height: 40px; padding: 0 18px; border-radius: 1rem; border: none; font-size: 14px; font-weight: 700; cursor: pointer; transition: transform .18s, box-shadow .18s; }
        .mgr-btn--primary { background: linear-gradient(135deg,#2563eb 0%,#1d4ed8 100%); color: #fff; box-shadow: 0 8px 16px rgba(37,99,235,.2); }
        .mgr-btn--primary:hover { transform: translateY(-1px); }
        .mgr-btn--green { background: linear-gradient(135deg,#16a34a 0%,#15803d 100%); color: #fff; box-shadow: 0 8px 16px rgba(22,163,74,.2); }
        .mgr-btn--green:hover { transform: translateY(-1px); }
        .mgr-btn--danger { background: #fee2e2; color: #b91c1c; border: 1px solid #fecaca; }
        .mgr-btn--danger:hover { background: #fecaca; }
        .mgr-btn--link { background: #f0fdf4; color: #15803d; border: 1px solid #bbf7d0; text-decoration: none; }
        .mgr-btn--link:hover { background: #dcfce7; color: #15803d; }
        .mgr-alert { padding: 14px 18px; border-radius: 1rem; background: #fefce8; border: 1px solid #fde68a; font-size: 14px; color: #78350f; line-height: 1.7; }
        .mgr-msg { font-size: 14px; color: #dc2626; line-height: 1.7; }
        .mgr-grid { width: 100%; border-collapse: collapse; }
        .mgr-grid th { background: #f8fafc; padding: 12px 14px; font-size: 14px; font-weight: 700; color: #64748b; text-align: center; border-bottom: 2px solid #f1f5f9; }
        .mgr-grid td { padding: 10px 14px; font-size: 14px; color: #334155; border-bottom: 1px solid #f1f5f9; text-align: center; }
    </style>
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
