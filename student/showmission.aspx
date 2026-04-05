<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true"  StylesheetTheme="Student"  CodeFile="showmission.aspx.cs" Inherits="Student_showmission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<style>
    .prog-wrap * { box-sizing: border-box; }
    .prog-grid { display: grid; grid-template-columns: 1fr 300px; gap: 20px; align-items: start; width: 100%; }
    @media (max-width: 1024px) { .prog-grid { grid-template-columns: 1fr; } .prog-sidebar { position: static !important; } }
    .prog-card { border: 1px solid #dbe6f5; border-radius: 0.75rem; background: rgba(255,255,255,0.97); box-shadow: 0 12px 30px rgba(15,23,42,0.05); min-width: 0; }
    .prog-sidebar { position: sticky; top: 116px; }
    .prog-sidebar-card { background: linear-gradient(160deg, #ffffff 0%, #eef2ff 100%); }
    .prog-card__head { display: flex; align-items: center; gap: 10px; padding: 16px 20px 0; }
    .prog-card__title { margin: 0; font-size: 15px; font-weight: 800; color: #0f172a; flex: 1; }
    .prog-sidebar-icon { display: inline-flex; align-items: center; justify-content: center; width: 30px; height: 30px; border-radius: 0.5rem; background: #e0e7ff; color: #4338ca; flex-shrink: 0; }
    .prog-sidebar-icon svg { width: 15px; height: 15px; }
    .prog-card__body { padding: 14px 20px 18px; }
    .prog-divider { border: none; border-top: 1px solid #e2e8f0; margin: 12px 0; }
    .prog-btn-stack { display: flex; flex-direction: column; gap: 8px; }
    .prog-btn-secondary { display: inline-flex; align-items: center; justify-content: center; width: 100%; min-height: 38px; padding: 0 14px; border-radius: 0.375rem; font-size: 13px; font-weight: 700; cursor: pointer; background: #eff6ff; color: #1d4ed8; border: 1px solid #bfdbfe; transition: transform 0.18s; }
    .prog-btn-secondary:hover { transform: translateY(-1px); background: #dbeafe; }
    .prog-btn-outline { display: inline-flex; align-items: center; justify-content: center; width: 100%; min-height: 38px; padding: 0 14px; border-radius: 0.375rem; font-size: 13px; font-weight: 700; text-decoration: none; cursor: pointer; background: #f0fdf4; color: #14532d; border: 1px solid #bbf7d0; transition: transform 0.18s; }
    .prog-btn-outline:hover { transform: translateY(-1px); background: #dcfce7; }
    /* skin overrides */
    .prog-card__body .prog-btn-stack a.prog-btn-outline { width: 100% !important; min-height: 38px !important; height: auto !important; font-size: 13px !important; font-weight: 700 !important; background: #f0fdf4 !important; color: #14532d !important; border: 1px solid #bbf7d0 !important; box-sizing: border-box !important; display: inline-flex !important; align-items: center !important; justify-content: center !important; }
    /* sub-panels */
    .prog-subpanel { background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 0.5rem; padding: 12px 14px; margin-top: 10px; }
    .prog-subpanel-title { font-size: 12px; font-weight: 700; color: #475569; margin-bottom: 10px; display: flex; align-items: center; gap: 6px; }
    .prog-subpanel-title svg { width: 13px; height: 13px; }
    .upload-btn { display: inline-flex; align-items: center; justify-content: center; padding: 6px 16px; background: #2563eb; color: #fff; border: none; border-radius: 0.375rem; font-size: 13px; font-weight: 700; cursor: pointer; transition: background 0.18s; }
    .upload-btn:hover { background: #1d4ed8; }
    .prog-filetype { font-size: 11px; color: #64748b; text-align: center; margin-top: 6px; }
    .prog-errmsg { font-size: 12px; font-weight: 700; color: #b91c1c; text-align: center; margin-top: 4px; }
</style>
<div class="prog-wrap">
<div id="showcontent" class="prog-grid">

    <!-- Main Mission Content -->
    <div class="prog-card" style="background:linear-gradient(160deg,#fff 0%,#f0f7ff 100%);">
        <div class="prog-card__body">
            <div style="text-align:center;padding-bottom:20px;border-bottom:1px solid #e2e8f0;margin-bottom:16px;">
                <asp:Label ID="LabelMtitle" runat="server" style="font-size:clamp(18px,2.5vw,24px);font-weight:800;color:#0f172a;letter-spacing:-0.02em;"></asp:Label>
            </div>
            <div class="hidden" style="display:none;">
                <asp:Label ID="LabelSnum" runat="server" Visible="False"></asp:Label>
                <asp:CheckBox ID="CkMupload" runat="server" Enabled="false" Visible="False" />
                <asp:CheckBox ID="CkMgroup" runat="server" Enabled="false" Visible="False" />
                <asp:Label ID="LabelMid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelUploadType" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMcid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMsort" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelLid" runat="server" Visible="False"></asp:Label>
            </div>
            <div id="Mcontent" style="color:#334155;line-height:1.85;font-size:1.05rem;word-wrap:break-word;word-break:break-word;" runat="server"></div>
        </div>
    </div>

    <!-- Right Sidebar -->
    <div class="prog-sidebar">
        <div class="prog-card prog-sidebar-card">
            <div class="prog-card__head">
                <div class="prog-sidebar-icon">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"></path></svg>
                </div>
                <h3 class="prog-card__title">操作面板</h3>
            </div>
            <div class="prog-card__body">
                <link href="../kindeditor/themes/me/me.css" rel="stylesheet" type="text/css" />
                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>

                <div class="prog-btn-stack">
                    <input type="button" class="prog-btn-secondary" id="share" value="我的网盘" onclick="showShare()" />
                    <asp:HyperLink ID="VoteLink" runat="server" Target="_blank"
                        CssClass="prog-btn-outline" SkinID="HyperLinkPink">作品互评</asp:HyperLink>
                </div>

                <asp:Panel ID="Panelworks" runat="server">
                    <hr class="prog-divider" />
                    <div class="prog-subpanel">
                        <div class="prog-subpanel-title">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"></path></svg>
                            作品提交区
                        </div>
                        <div style="display:flex;flex-direction:column;align-items:center;gap:8px;">
                            <asp:Image runat="server" ID="upFileType" Visible="False" style="width:28px;height:28px;object-fit:contain;" />
                            <asp:HyperLink ID="upFileUrl" runat="server" Visible="False" Target="_blank"
                                style="width:100%;padding:6px 10px;background:#f1f5f9;color:#2563eb;font-size:12px;font-weight:600;border-radius:0.375rem;border:1px solid #e2e8f0;text-align:center;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">[upFileUrl]</asp:HyperLink>
                            <asp:Panel ID="Panelswfupload" runat="server" style="width:100%;">
                                <div id="swfu_container" style="display:flex;justify-content:center;">
                                    <script type="text/javascript">
                                        var lid = "<%=LabelLid.Text %>";
                                        var urlstr = "uploadworkm.aspx?lid=" + lid;
                                        KindEditor.ready(function (K) {
                                            var uploadbutton = K.uploadbutton({
                                                button: K('#uploadButton')[0],
                                                fieldName: 'imgFile',
                                                url: urlstr,
                                                afterUpload: function (data) {
                                                    if (data.error === 0) { alert("作品已经提交成功！"); location.reload(); }
                                                    else { alert(data.message); }
                                                },
                                                afterError: function (str) { alert('出错信息: ' + str); }
                                            });
                                            uploadbutton.fileBox.change(function (e) { uploadbutton.submit(); });
                                        });
                                    </script>
                                    <input type="button" id="uploadButton" value="作品提交" class="upload-btn" />
                                </div>
                                <div class="prog-filetype">
                                    <asp:Image ID="ImageType" runat="server" style="width:14px;height:14px;display:inline-block;vertical-align:middle;" />
                                    限制格式 <asp:Label ID="LabelMfiletype" runat="server" style="font-weight:700;color:#334155;"></asp:Label>
                                </div>
                                <div class="prog-errmsg"><asp:Label ID="Labelmsg" runat="server" SkinID="LabelMsgRed"></asp:Label></div>
                            </asp:Panel>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="Panelgroup" runat="server">
                    <hr class="prog-divider" />
                    <div class="prog-subpanel">
                        <div class="prog-subpanel-title">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                            小组合作区
                        </div>
                        <div style="overflow-x:auto;">
                            <asp:GridView ID="GVgwork" runat="server"
                                AutoGenerateColumns="False" CellPadding="3" DataKeyNames="wid"
                                EnableModelValidation="True"
                                OnRowCommand="GVgwork_RowCommand"
                                onrowdatabound="GVgwork_RowDataBound" PageSize="15" SkinID="GridViewInfo"
                                Width="100%" CssClass="w-full text-xs text-slate-600 min-w-min">
                                <Columns>
                                    <asp:TemplateField HeaderText="组员">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLinkWurl" runat="server" Target="_blank" Text='<%# Eval("Sname") %>'
                                                ToolTip='<%# Eval("Wurl") %>' CssClass="font-bold text-blue-600 hover:text-blue-800 transition"></asp:HyperLink>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="px-2 py-1 bg-slate-50 border-b border-slate-200 text-left" />
                                        <ItemStyle CssClass="px-2 py-1 border-b border-slate-100 whitespace-nowrap" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Wlscore") %>' CssClass="text-orange-500 font-medium"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="px-1 py-1 border-b border-slate-100" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonA" runat="server" CausesValidation="false"
                                                CommandArgument='<%# Bind("wid") %>' CommandName="A" Text="A" CssClass="px-1.5 py-0.5 bg-green-100 text-green-700 rounded hover:bg-green-200 transition"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" CssClass="px-1 py-1 border-b border-slate-100" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonP" runat="server" CausesValidation="false"
                                                CommandArgument='<%# Bind("wid") %>' CommandName="P" Text="P" CssClass="px-1.5 py-0.5 bg-blue-100 text-blue-700 rounded hover:bg-blue-200 transition"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" CssClass="px-1 py-1 border-b border-slate-100" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonE" runat="server" CausesValidation="false"
                                                CommandArgument='<%# Bind("wid") %>' CommandName="E" Text="E" CssClass="px-1.5 py-0.5 bg-red-100 text-red-700 rounded hover:bg-red-200 transition"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" CssClass="px-1 py-1 border-b border-slate-100" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div style="display:flex;flex-direction:column;align-items:center;gap:8px;margin-top:10px;padding-top:10px;border-top:1px solid #e2e8f0;">
                            <asp:Image ID="upFileTypeGroup" runat="server" Visible="False" style="width:28px;height:28px;object-fit:contain;" />
                            <asp:HyperLink ID="upFileUrlGroup" runat="server" Target="_blank" Visible="False"
                                style="width:100%;padding:6px 10px;background:#f1f5f9;color:#2563eb;font-size:12px;font-weight:600;border-radius:0.375rem;border:1px solid #e2e8f0;text-align:center;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">[upFileUrlGroup]</asp:HyperLink>
                            <asp:Panel ID="PanelGroupUp" runat="server" style="width:100%;">
                                <div id="swfu_containerTwo" style="display:flex;justify-content:center;">
                                    <script type="text/javascript">
                                        var lid = "<%=LabelLid.Text %>";
                                        var gurlstr = "uploadgroupm.aspx?lid=" + lid;
                                        KindEditor.ready(function (K) {
                                            var uploadgroupbutton = K.uploadbutton({
                                                button: K('#uploadgroupButton')[0],
                                                fieldName: 'imgFilegroup',
                                                url: gurlstr,
                                                afterUpload: function (data) {
                                                    if (data.error === 0) { alert("小组作品已经提交成功！"); location.reload(true); }
                                                    else { alert(data.message); }
                                                },
                                                afterError: function (str) { alert('出错信息: ' + str); }
                                            });
                                            uploadgroupbutton.fileBox.change(function (e) { uploadgroupbutton.submit(); });
                                        });
                                    </script>
                                    <input type="button" id="uploadgroupButton" value="小组合作" class="upload-btn" />
                                </div>
                            </asp:Panel>
                            <div class="prog-errmsg"><asp:Label ID="Labelgroupmsg" runat="server" SkinID="LabelMsgRed"></asp:Label></div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

</div>
</div>
<script type="text/javascript">
    function jsCopy(contentid) {
        var e = document.getElementById(contentid);
        e.select();
        document.execCommand("Copy");
    }
</script>
</asp:Content>
