<%@ Page Language="C#" AutoEventWireup="true" CodeFile="groupshare.aspx.cs" Inherits="Student_groupshare" ResponseEncoding="utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <meta charset="utf-8" />
<title></title>
    <style type="text/css">
    .by {margin: 0;background:linear-gradient(180deg,#f8fafc 0%,#eef6f0 100%);font-family:Arial,"Microsoft YaHei",sans-serif;color:#0f172a;}
    .share-shell{max-width:1120px;margin:0 auto;padding:24px 18px 32px;}
    .share-card{background:#fff;border:1px solid rgba(148,163,184,.22);border-radius:24px;box-shadow:0 24px 48px -34px rgba(15,23,42,.22);overflow:hidden;}
    .share-hero{padding:24px 26px 18px;background:linear-gradient(135deg,rgba(37,99,235,.14),rgba(16,185,129,.12));border-bottom:1px solid rgba(148,163,184,.18);}
    .share-title{display:flex;align-items:center;gap:14px;font-size:28px;font-weight:800;color:#0f172a;line-height:1.2;}
    .share-title-icon{display:inline-flex;align-items:center;justify-content:center;width:52px;height:52px;border-radius:16px;background:linear-gradient(135deg,#2563eb 0%,#0f766e 100%);color:#fff;box-shadow:0 18px 30px -22px rgba(37,99,235,.68);font-size:24px;}
    .share-subtitle{margin-top:10px;color:#475569;font-size:14px;line-height:1.7;text-align:left;}
    .share-content{padding:22px 24px 24px;}
    .share-dropzone{margin:0 auto;padding:14px;height:420px;overflow-x:hidden;border:2px dashed #cbd5e1;border-radius:20px;background:linear-gradient(180deg,#f8fafc 0%,#fefce8 100%);box-shadow:inset 0 1px 0 rgba(255,255,255,.7);}
    .share-dropzone.can-upload{cursor:pointer;transition:border-color .2s ease, box-shadow .2s ease, transform .2s ease;}
    .share-dropzone.can-upload:hover{border-color:#2563eb;box-shadow:0 0 0 4px rgba(37,99,235,.08);transform:translateY(-1px);}
    .share-dropzone table{width:100%;border-collapse:separate;border-spacing:14px;}
    .share-dropzone td{width:50%;vertical-align:top;}
    .share-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:14px;}
    .share-file{height:100%;padding:14px 16px;border:1px solid rgba(148,163,184,.2);border-radius:18px;background:#fff;text-align:left;box-shadow:0 18px 30px -28px rgba(15,23,42,.28);transition:transform .2s ease, box-shadow .2s ease,border-color .2s ease;}
    .share-file:hover{transform:translateY(-2px);border-color:rgba(37,99,235,.35);box-shadow:0 22px 34px -28px rgba(37,99,235,.28);}
    .share-file__head{display:flex;align-items:center;gap:10px;min-width:0;}
    .share-file__icon{width:30px;height:30px;flex:0 0 auto;object-fit:contain;}
    .share-file__name{color:#0f172a;font-weight:700;text-decoration:none;line-height:1.5;word-break:break-all;}
    .share-file__name:hover{color:#2563eb;}
    .share-file__meta{margin-top:12px;display:flex;align-items:center;justify-content:space-between;gap:12px;font-size:12px;color:#64748b;}
    .share-file__date{display:flex;flex-wrap:wrap;gap:8px;line-height:1.5;}
    .share-delete{opacity:.3;transition:opacity .2s ease, transform .2s ease;}
    .share-delete:hover{opacity:1;transform:scale(1.06);}
    .share-footer{margin-top:18px;display:flex;align-items:flex-start;gap:14px;padding:18px 6px 0;}
    .share-footer__icon{display:inline-flex;align-items:center;justify-content:center;width:42px;height:42px;border-radius:14px;background:linear-gradient(135deg,#dbeafe 0%,#bbf7d0 100%);box-shadow:0 14px 28px -22px rgba(37,99,235,.45);}
    .share-footer__icon img{width:24px;height:24px;}
    .share-footer__body{flex:1;min-width:0;}
    .share-toolbar{display:flex;flex-wrap:wrap;align-items:center;gap:10px;}
    .share-toolbar__btn{display:inline-flex;align-items:center;justify-content:center;min-width:108px;height:40px;padding:0 16px;border:0;border-radius:12px;background:linear-gradient(135deg,#2563eb 0%,#1d4ed8 100%);color:#fff;font-size:14px;font-weight:700;white-space:nowrap;box-shadow:0 14px 28px -18px rgba(37,99,235,.78);cursor:pointer;transition:transform .2s ease, box-shadow .2s ease, filter .2s ease;}
    .share-toolbar__btn:hover{transform:translateY(-1px);box-shadow:0 18px 30px -18px rgba(37,99,235,.88);filter:brightness(1.03);}
    .share-toolbar__btn--secondary{background:linear-gradient(135deg,#475569 0%,#334155 100%);box-shadow:0 14px 28px -18px rgba(51,65,85,.72);}
    .share-toolbar__btn--active{background:linear-gradient(135deg,#0f766e 0%,#059669 100%);box-shadow:0 14px 28px -18px rgba(5,150,105,.78);}
    .share-toolbar__status{margin-top:10px;color:#475569;font-size:13px;line-height:1.6;text-align:left;}
    @media (max-width: 860px){.share-grid{grid-template-columns:1fr;}.share-dropzone td{display:block;width:100%;}.share-footer{flex-direction:column;}.share-footer__icon{display:none;}}
    @media (max-width: 640px){.share-shell{padding:16px 12px 24px;}.share-title{font-size:24px;}.share-hero,.share-content{padding-left:16px;padding-right:16px;}.share-dropzone{height:380px;}.share-toolbar__btn{flex:1 1 120px;min-width:0;}}
    </style>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/dropzone/dropzone-min.js" type="text/javascript"></script>
    <link href="../code/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <link href="../js/css/tailwind-utilities-2.2.19.min.css" rel="stylesheet">
</head>
<body  class="by">
    <form id="form1" class="dropzone" runat="server">
    <div class="share-shell">
    <div id="doc_area" class="share-card" >
    <div class="share-hero">
        <div class="share-title">
            <span class="share-title-icon"><i class="fa fa-folder-open" aria-hidden="true"></i></span>
            <asp:Label ID="Labeltitle" runat="server"></asp:Label>
        </div>
        <p class="share-subtitle">统一展示公共资源、我的网盘和小组网盘内容。支持点击或拖放上传文件，并保留原有删除与切换逻辑。</p>
        </div>
        <div class="share-content">
        <div id="file_area"  class="share-dropzone"  title="请点击或拖放文件到这里"> 
                <asp:DataList ID="Dlfilelist" runat="server" 
                    RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="3" 
                    CellSpacing="3" Width="99%" 
                    HorizontalAlign="Center" onitemcommand="Dlfilelist_ItemCommand" 
                    CssClass="share-grid"
                    onitemdatabound="Dlfilelist_ItemDataBound" >
                    <ItemTemplate>
                        <div class="share-file"> 
                           <div class="share-file__head">
                            <asp:Image ID="Imageext" runat="server" ImageUrl='<%# Eval("Kftpe") %>' CssClass="share-file__icon" />
                            <asp:HyperLink ID="HLfname" runat="server" NavigateUrl='<%# Eval("Kfurl") %>' Target="_blank" Text='<%# Eval("KfnameShort") %>' Font-Underline="False" CssClass="share-file__name"></asp:HyperLink>
                            </div>
                           <div class="share-file__meta">
                            <div class="share-file__date">
                            <asp:Label ID="Labelfsize" runat="server" Text='<%# Eval("Kfsize") %>' ToolTip='<%# Eval("Kfdate") %>'></asp:Label>
                            <asp:Label ID="Labelfdate" runat="server" Text='<%# Eval("Kfdate") %>'></asp:Label>
                            </div>
                            <asp:ImageButton ID="ImgBtnDelete" runat="server" CommandArgument='<%# Eval("Kfurl") %>' 
                                CommandName="D" ImageUrl="~/images/delete.gif" ToolTip="删除" CssClass="share-delete" />
                             </div>
                        </div>
                    </ItemTemplate>
                    <SeparatorStyle BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" />
                </asp:DataList>
         
        </div>
		<div class="share-footer">
        <div id="dleft" class="share-footer__icon">
            <asp:Image ID="Imagedisk" runat="server" Height="24px" Width="24px" 
                ImageUrl="~/images/diskgreen.gif" />
        </div>
        <div id="dright" class="share-footer__body">   
        <div class="share-toolbar">
         <asp:Button ID="BtnTea" runat="server" BackColor="#CFE4D0" BorderStyle="None" 
             Font-Bold="False" Font-Size="9pt" onclick="BtnTea_Click" Text="公共资源"  CssClass="share-toolbar__btn share-toolbar__btn--secondary" />
         <asp:Button ID="BtnStu" runat="server" BackColor="#CFE4D0" BorderStyle="None" 
             Font-Bold="False" Font-Size="9pt" onclick="BtnStu_Click" Text="我的网盘"  CssClass="share-toolbar__btn share-toolbar__btn--secondary" />
             <asp:Button ID="BtnGroup" runat="server" BackColor="#CFE4D0" BorderStyle="None" 
             Font-Bold="False" Font-Size="9pt" onclick="BtnGroup_Click" Text="小组网盘"  CssClass="share-toolbar__btn share-toolbar__btn--active" />
          <asp:CheckBox ID="CkIsGroup" runat="server" Enabled="False" Visible="False" />&nbsp;
        </div>
         <div class="share-toolbar__status">
           <asp:Label ID="Labeldisk" runat="server" Font-Size="9pt" ForeColor="#3F6159"></asp:Label>
         </div>
         </div>  
		</div>
    </div>
    </div>
    </div>
    </form>
    <script type="text/javascript" >
    //acceptedFiles: ".txt,.pdf,.doc,.docx,.xlsx,.xls,.ppt,.pptx,.png,.jpg,.jpeg,.gif,.mp4,.py,.wav,.mp3,.psd,.fla,.rar",
        var isgroup = "<%=isgroup %>";
        var iscommon = "<%=iscommon %>";
        var can = "<%=can %>";
        var urlstr = "share.ashx?isgroup=" + isgroup + "&iscommon=" + iscommon;
        if (can == "True") {
            $("#file_area").addClass("can-upload");
            $("#file_area").dropzone({
                url: urlstr,
                method: "POST",
                addRemoveLinks: true,
                maxFiles: 1, //一次性上传的文件数量上限
                maxFilesize: 30, //MB
                uploadMultiple: false,
                parallelUploads: 100,
                previewsContainer: false,
                success: function (file, response, e) {
                    alert(response);
                    location.reload();
                }
            });
        }
        else {
            $("#doc_area").attr("title", "");
            $("#file_area").removeClass("can-upload").attr("title", "");
        }

    </script>
</body>
</html>
