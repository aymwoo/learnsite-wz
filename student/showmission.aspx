<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true"  StylesheetTheme="Student"  CodeFile="showmission.aspx.cs" Inherits="Student_showmission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<div id="showcontent" class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
    
    <!-- Main Mission Content -->
    <div class="lg:col-span-3 space-y-6">
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 p-6 sm:p-10">
            <div class="text-center pb-8 border-b border-slate-100">
                <asp:Label ID="LabelMtitle" runat="server" CssClass="text-2xl sm:text-3xl font-extrabold text-slate-800 tracking-tight"></asp:Label>
            </div>
            
            <div class="hidden">
                <asp:Label ID="LabelSnum" runat="server" Visible="False"></asp:Label>
                <asp:CheckBox ID="CkMupload" runat="server" Enabled="false" Visible="False" />
                <asp:CheckBox ID="CkMgroup" runat="server" Enabled="false" Visible="False" />
                <asp:Label ID="LabelMid" runat="server" Visible="False"></asp:Label>            
                <asp:Label ID="LabelUploadType" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMcid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelMsort"  runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelLid"  runat="server" Visible="False"></asp:Label>
            </div>   
            
            <div id="Mcontent" class="mt-8 text-slate-700 leading-loose text-[1.1rem]" style="word-wrap:break-word; word-break:break-word;" runat="server">	
            </div>
        </div>
    </div>

    <!-- Right Action Sidebar -->
    <div class="lg:col-span-1 flex flex-col gap-6">
        <div class="bg-slate-50/80 rounded-2xl border border-slate-200/60 p-5 shadow-sm sticky top-24">

            <link href="../kindeditor/themes/me/me.css" rel="stylesheet" type="text/css" />
            <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
            <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
            
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-slate-800 flex items-center gap-2 border-b border-slate-200/60 pb-3">
                    <svg class="w-5 h-5 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"></path></svg>
                    操作面板
                </h3>
                
                <div class="flex flex-col sm:flex-row lg:flex-col gap-3 w-full">
                    <input type="button" class="w-full flex justify-center py-2.5 px-4 border border-indigo-200 rounded-xl text-sm font-semibold text-indigo-700 bg-indigo-50 hover:bg-indigo-100 transition-all duration-300 shadow-sm cursor-pointer" id="share" value="我的网盘" onclick="showShare()" />
                    <asp:HyperLink ID="VoteLink" runat="server" Target="_blank" 
                        CssClass="w-full flex justify-center py-2.5 px-4 rounded-xl text-sm font-semibold text-white bg-green-500 hover:bg-green-600 focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-all duration-300 shadow-md border-0 text-center" SkinID="HyperLinkPink">作品互评</asp:HyperLink>        
                </div>
                
                <asp:Panel ID="Panelworks" runat="server" CssClass="mt-6 bg-white p-4 rounded-xl border border-slate-200 shadow-sm">
                    <h4 class="text-sm font-semibold text-slate-700 mb-3 flex items-center gap-1.5">
                        <svg class="w-4 h-4 text-emerald-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"></path></svg>
                        作品提交区
                    </h4>
                    
                    <div class="flex flex-col items-center gap-3">
                        <asp:Image runat="server" ID="upFileType" Visible="False" CssClass="w-8 h-8 object-contain" />
                        <asp:HyperLink ID="upFileUrl" runat="server" Visible="False" 
                            Target="_blank" CssClass="w-full px-4 py-2 bg-slate-100 text-blue-600 font-medium rounded-lg hover:bg-slate-200 transition duration-300 flex items-center justify-center gap-2 border border-slate-200 text-sm truncate">[upFileUrl]</asp:HyperLink>
                        
                        <asp:Panel ID="Panelswfupload" runat="server" CssClass="w-full mt-2">
                            <div id="swfu_container" class="w-full flex justify-center">
        <script type="text/javascript">
                var lid = "<%=LabelLid.Text %>";
                var urlstr = "uploadworkm.aspx?lid=" + lid;
                KindEditor.ready(function (K) {

                    var uploadbutton = K.uploadbutton({
                        button: K('#uploadButton')[0],
                        fieldName: 'imgFile',
                        url: urlstr,
                        afterUpload: function (data) {
                            if (data.error === 0) {
                                alert("作品已经提交成功！");
                                location.reload();
                            } else {
                                alert(data.message);
                            }
                        },
                        afterError: function (str) {
                            alert('出错信息: ' + str);
                        }
                    });
                    uploadbutton.fileBox.change(function (e) {
                        uploadbutton.submit();
                    });
                });


                //自动保存成绩

	        </script>
				<input type="button" id="uploadButton" value="作品提交"  class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
                            <div class="text-center mt-3">
                                <asp:Image ID="ImageType" runat="server" CssClass="w-4 h-4 inline-block align-middle" />
                                <span class="text-xs text-slate-500 font-medium align-middle">限制格式 <asp:Label ID="LabelMfiletype" runat="server" CssClass="text-slate-700 font-bold mx-1"></asp:Label> </span>
                            </div>
                            <div class="text-center mt-2 font-bold text-sm">
                                <asp:Label ID="Labelmsg" runat="server" SkinID="LabelMsgRed" CssClass="text-red-500"></asp:Label>
                            </div>
                        </asp:Panel>
                    </div>       
                </asp:Panel>

                <asp:Panel ID="Panelgroup" runat="server" CssClass="mt-6 bg-white p-4 rounded-xl border border-slate-200 shadow-sm overflow-hidden">     
                    <h4 class="text-sm font-semibold text-slate-700 mb-3 flex items-center gap-1.5">
                        <svg class="w-4 h-4 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                        小组合作区
                    </h4>
                    <div class="overflow-x-auto">
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

                    <div class="flex flex-col items-center gap-3 mt-4 border-t border-slate-100 pt-4">
                        <asp:Image ID="upFileTypeGroup" runat="server" Visible="False" CssClass="w-8 h-8 object-contain" />
                        <asp:HyperLink ID="upFileUrlGroup" runat="server" Target="_blank" 
                            Visible="False" CssClass="w-full px-4 py-2 bg-slate-100 text-blue-600 font-medium rounded-lg hover:bg-slate-200 transition duration-300 flex items-center justify-center gap-2 border border-slate-200 text-sm truncate">[upFileUrlGroup]</asp:HyperLink>
                        
                        <asp:Panel ID="PanelGroupUp" runat="server" CssClass="w-full">
                            <div id="swfu_containerTwo" class="w-full flex justify-center">
            <script type="text/javascript">
                var lid = "<%=LabelLid.Text %>";
                var gurlstr = "uploadgroupm.aspx?lid=" + lid;
                KindEditor.ready(function (K) {
                    var uploadgroupbutton = K.uploadbutton({
                        button: K('#uploadgroupButton')[0],
                        fieldName: 'imgFilegroup',
                        url: gurlstr,
                        afterUpload: function (data) {
                            if (data.error === 0) {
                                alert("小组作品已经提交成功！");
                                location.reload(true);//重新刷新ctrl+F5
                            } else {
                                alert(data.message);
                            }
                        },
                        afterError: function (str) {
                            alert('出错信息: ' + str);
                        }
                    });
                    uploadgroupbutton.fileBox.change(function (e) {
                        uploadgroupbutton.submit();
                    });
                });
	        </script>
				<input type="button" id="uploadgroupButton" value="小组合作"  class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
                            </div>
                        </asp:Panel>
                        <div class="text-center font-bold text-sm mt-1">
                            <asp:Label ID="Labelgroupmsg" runat="server" SkinID="LabelMsgRed" CssClass="text-red-500"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</div>   
    <br />
    <script type="text/javascript">
        function jsCopy(contentid) {
            var e = document.getElementById(contentid); //对象是content 
            e.select(); //选择对象 
            document.execCommand("Copy"); //执行浏览器复制命令 
        }  
    </script>
</div>
</asp:Content>

