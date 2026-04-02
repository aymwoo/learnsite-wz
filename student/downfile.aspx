<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.master" StylesheetTheme="Student"
    AutoEventWireup="true" CodeFile="downfile.aspx.cs" Inherits="Student_downfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cphs" runat="Server">
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
        <!-- Main Content (Left Column) -->
        <div class="lg:col-span-3 space-y-6 overflow-hidden min-w-0">
            <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 p-6 sm:p-10">
                <div class="text-center pb-6 border-b border-slate-100">
                    <asp:Label ID="Labeltitle" runat="server" CssClass="text-2xl sm:text-3xl font-extrabold text-slate-800 tracking-tight"></asp:Label>
                </div>
                
                <div class="flex flex-wrap gap-4 items-center justify-center py-4 bg-slate-50 mt-4 rounded-xl border border-slate-100 text-sm text-slate-600 shadow-inner">
                    <div class="flex items-center gap-1.5"><span class="font-bold text-slate-500 text-xs uppercase tracking-wider">属性</span> <asp:Label ID="Labelclass" runat="server" CssClass="font-medium text-slate-800"></asp:Label></div>
                    <div class="w-px h-4 bg-slate-300 hidden sm:block"></div>
                    <div class="flex items-center gap-1.5"><span class="font-bold text-slate-500 text-xs uppercase tracking-wider">格式</span> <asp:Image ID="ImageType" runat="server" CssClass="w-4 h-4 inline-block" /> <asp:Label ID="Labelfiletype" runat="server" CssClass="font-medium text-slate-800"></asp:Label></div>
                    <div class="w-px h-4 bg-slate-300 hidden sm:block"></div>
                    <div class="flex items-center gap-1.5"><span class="font-bold text-slate-500 text-xs uppercase tracking-wider">点击率</span> <asp:Label ID="Labelhit" runat="server" CssClass="font-medium text-emerald-600"></asp:Label></div>
                    <div class="w-px h-4 bg-slate-300 hidden sm:block"></div>
                    <div class="flex items-center gap-1.5"><span class="font-bold text-slate-500 text-xs uppercase tracking-wider">更新日期</span> <asp:Label ID="Labeldate" runat="server" CssClass="font-medium text-slate-800"></asp:Label></div>
                    <div class="w-px h-4 bg-slate-300 hidden sm:block"></div>
                    <div class="flex items-center gap-1.5"><span class="font-bold text-slate-500 text-xs uppercase tracking-wider">学分</span> <asp:Label ID="Labelopen" runat="server" CssClass="font-bold text-orange-500"></asp:Label></div>
                    
                    <asp:Label ID="LabelFyid" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LabelFid" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LabelSid" runat="server" Visible="False"></asp:Label>
                </div>
                
                <div class="mt-8 text-slate-700 leading-loose text-[1.1rem]">
                    <div class="downcontent">
                        <asp:Literal ID="Labelcontent" runat="server"></asp:Literal>
                    </div>
                </div>
                
                <div class="mt-8 text-center border-t border-slate-100 pt-8 flex flex-col items-center gap-4">
                    <asp:Label ID="Labelmsg" runat="server" CssClass="text-red-500 font-bold block min-h-[1.5rem]"></asp:Label>
                    
                    <div class="bg-indigo-50 border border-indigo-100 p-6 rounded-2xl w-full max-w-sm flex flex-col items-center gap-4">
                        <asp:Image ID="ImageDown" runat="server" ImageUrl="~/images/down1.gif" CssClass="opacity-80" />
                        <asp:LinkButton ID="LBtnfile" runat="server" OnClick="LBtnfile_Click" Visible="False"
                            CssClass="px-8 py-3 bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-bold rounded-xl hover:from-blue-600 hover:to-indigo-700 transition duration-300 shadow-md drop-shadow max-w-[200px] w-full">点击下载</asp:LinkButton>
                        <asp:HyperLink ID="HLurl" runat="server" Visible="false" Target="_blank" CssClass="px-8 py-3 bg-gradient-to-r from-emerald-500 to-teal-600 text-white font-bold rounded-xl hover:from-emerald-600 hover:to-teal-700 transition duration-300 shadow-md max-w-[200px] w-full"></asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sidebar (Right Column) -->
        <div class="lg:col-span-1 space-y-6 self-start top-24 sticky">
            <div class="bg-slate-50 border border-slate-200 rounded-2xl p-5 shadow-sm overflow-hidden flex flex-col items-center">
                <h4 class="w-full text-slate-700 font-bold mb-3 flex items-center gap-2 border-b border-slate-200 pb-2">
                    <svg class="w-5 h-5 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
                    相关软件下载
                </h4>
                
                <div class="w-full overflow-x-auto min-w-0 mb-4 rounded border border-slate-200">
                    <asp:GridView ID="GVSoft" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        OnPageIndexChanging="GVSoft_PageIndexChanging" OnRowDataBound="GVSoft_RowDataBound"
                        Width="100%" SkinID="GridViewInfo" EnableModelValidation="True" CellPadding="4"
                        CssClass="w-full text-xs text-slate-700 min-w-min">
                        <AlternatingRowStyle BackColor="#f8fafc" />
                        <Columns>
                            <asp:TemplateField HeaderText="标题">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("fid", "downfile.aspx?Fid={0}") %>'
                                        Text='<%# strcut( Eval("Ftitle").ToString()) %>' ToolTip='<%# Eval("Ftitle")%>'
                                        CssClass="font-medium text-slate-800 hover:text-indigo-600 block truncate max-w-[200px]">
                                    </asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" CssClass="py-2 px-3 bg-slate-100 text-slate-600 font-semibold" />
                                <ItemStyle HorizontalAlign="Left" CssClass="py-2 px-3 border-b border-slate-100" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" CssClass="bg-slate-50 py-2 border-t border-slate-200" />
                        <PagerTemplate>
                            <div class="flex gap-2 justify-center py-1">
                                <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First"
                                    CommandName="Page" CssClass="px-2 py-1 text-[10px] border border-slate-300 rounded hover:bg-slate-200" Text="首页" />
                                <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev"
                                    CommandName="Page" CssClass="px-2 py-1 text-[10px] border border-slate-300 rounded hover:bg-slate-200" Text="上页" />
                                <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next"
                                    CommandName="Page" CssClass="px-2 py-1 text-[10px] border border-slate-300 rounded hover:bg-slate-200" Text="下页" />
                                <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last"
                                    CommandName="Page" CssClass="px-2 py-1 text-[10px] border border-slate-300 rounded hover:bg-slate-200" Text="尾页" />
                            </div>
                        </PagerTemplate>
                        <RowStyle CssClass="hover:bg-slate-50 transition" />
                    </asp:GridView>
                </div>
                
                <div class="w-full flex flex-col items-center gap-3">
                    <asp:Image runat="server" ID="upFileType" Visible="False" CssClass="w-8 h-8 object-contain" />
                    <asp:HyperLink ID="upFileUrl" runat="server" Visible="False" Target="_blank" CssClass="px-4 py-2 bg-blue-50 text-blue-600 border border-blue-200 font-bold rounded-lg hover:bg-blue-100 transition duration-300 shadow-sm text-center w-full truncate">[upFileUrl]</asp:HyperLink>
                    
                    <asp:Panel ID="Panelswfupload" runat="server" CssClass="w-full">
                        <link href="../kindeditor/themes/me/me.css" rel="stylesheet" type="text/css" />
                        <script type="text/javascript" charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                        <script type="text/javascript" charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                        <div id="swfu_container" class="w-full flex justify-center mt-2">
                                <script type="text/javascript">
                                    KindEditor.ready(function (K) {
                                        var uploadbutton = K.uploadbutton({
                                            button: K('#uploadButton')[0],
                                            fieldName: 'imgFile',
                                            url: 'autoupload.aspx?yid=<%=LabelFyid.Text %>&fid=<%=LabelFid.Text %>&sid=<%=LabelSid.Text %>',
                                            afterUpload: function (data) {
                                                if (data.error == 0) {
                                                    alert(data.message);
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
                                </script>                            
                                <input type="button" id="uploadButton" value="作品保存"  class="px-4 py-2 bg-emerald-500 text-white rounded hover:bg-emerald-600 transition duration-300 shadow-md border-0 w-full" />                   
                        </div>
                    </asp:Panel>
                    
                    <asp:HyperLink ID="Hltonomic" runat="server" ImageUrl="~/images/nomic.gif" NavigateUrl="~/student/autonomic.aspx"
                        Target="_blank" BorderStyle="None" CssClass="mt-4 transform hover:scale-105 transition duration-300 drop-shadow-md rounded-xl overflow-hidden block w-full flex justify-center"></asp:HyperLink>
                </div>
            </div>
            
            <div class="hidden">
                <link href="../js/tinybox.css" rel="stylesheet" type="text/css" />
                <script src="../js/tinybox.js" type="text/javascript"></script>
                <script type="text/javascript">
                    function showShare() {
                        var urlat = "../student/groupshare.aspx";
                        TINY.box.show({ iframe: urlat, boxid: 'frameless', width: 600, height: 400, fixed: false, maskopacity: 60, close: true })
                    }   
                </script>
            </div>
        </div>
    </div>
</asp:Content>
