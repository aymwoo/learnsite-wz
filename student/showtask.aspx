<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true"  StylesheetTheme="Student"  CodeFile="showtask.aspx.cs" Inherits="Student_showtask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<div id="showcontent" class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
    
    <!-- Main Task Content -->
    <div class="lg:col-span-3 space-y-6">
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200/60 p-6 sm:p-10">
            <div class="text-center pb-8 border-b border-slate-100">
                <asp:Label ID="LabelMtitle" runat="server" CssClass="text-2xl sm:text-3xl font-extrabold text-slate-800 tracking-tight"></asp:Label>
            </div>
            
            <div class="hidden">
                <asp:Label ID="LabelSnum"  runat="server" Visible="False"></asp:Label>
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
            <script src="../Plupload/plupload.full.min.js" type="text/javascript"></script>
            
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
                        <asp:HyperLink ID="oldUrl" runat="server" Visible="False" 
                            Target="_blank" CssClass="w-full px-4 py-2 bg-slate-100 text-slate-600 font-medium rounded-lg hover:bg-slate-200 transition duration-300 flex items-center justify-center gap-2 border border-slate-200 text-sm truncate"></asp:HyperLink>
                        
                        <asp:HyperLink ID="upFileUrl" runat="server" Visible="False" 
                            Target="_blank" CssClass="w-full px-4 py-2 bg-slate-100 text-blue-600 font-medium rounded-lg hover:bg-slate-200 transition duration-300 flex items-center justify-center gap-2 border border-slate-200 text-sm truncate"></asp:HyperLink>
                        
                        <asp:Panel ID="Panelswfupload" runat="server" CssClass="w-full mt-2">
                            <div id="swfu_container" class="w-full flex flex-col items-center">
                                <div id="container" class="text-center w-full"> 
                                    <a id="pickfiles" href="javascript:;" class="px-6 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition duration-300 shadow-md inline-block font-medium">提交作品</a>
                                    <div id="filelist" class="mt-2 text-sm text-slate-600 space-y-1"></div>
                                </div>
                 <script type="text/javascript">
                     var isup = false;
                     var mid = "<%=LabelMid.Text %>";
                     var lid = "<%=LabelLid.Text %>";
                     var num = "<%=LabelSnum.Text %>";
                     var urlstr = "uploadworkm.aspx?lid=" + lid;
                     var uploader = new plupload.Uploader({
                         runtimes: 'html5,html4',
                         browse_button: 'pickfiles', // you can pass an id...
                         container: document.getElementById('container'), // ... or DOM Element itself
                         url: urlstr,
                         multi_selection: false,
                         filters: {
                             max_file_size: '100mb',
                             mime_types: [
			                            { title: "work files", extensions: "<%=LabelUploadType.Text %>" }
		                            ]
                         },

                         init: {
                             PostInit: function () {
                                 document.getElementById('filelist').innerHTML = '';

                             },

                             FilesAdded: function (up, files) {
                                 plupload.each(files, function (file) {
                                     document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
                                 });
                                 uploader.start();
                             },

                             UploadProgress: function (up, file) {
                                 document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
                                 if (file.percent == 100 && !isup) {
                                     isup = true;
                                     OfficeToPng();
                                     alert("作品已经提交成功！");
                                 }
                             },

                             UploadComplete: function (up, file) {
                                 location.reload();
                             },
                             Error: function (up, err) {
                                 document.getElementById('console').appendChild(document.createTextNode("\nError #" + err.code + ": " + err.message));
                             }
                         }
                     });

                     uploader.init();

                     //自动保存成绩
                     function OfficeToPng() {
                         console.log("文档转图片调用开始");                     
                         var formData = new FormData();
                         formData.append('mid', mid);
                         formData.append('num', num);
                         var saveurl = "spire.ashx";
                         $.ajax({
                             url: saveurl,
                             type: "POST",
                             cache: false,
                             data: formData,
                             dataType: "html",
                             processData: false,
                             contentType: false
                         }).done(function (res) {
                             console.log(res);
                         }).fail(function (res) {
                             console.log("保存失败");
                         });
                     }


	                </script>
                            </div>
                        </asp:Panel>
                        <div class="text-center mt-3">
                            <asp:Image ID="ImageType" runat="server" CssClass="w-4 h-4 inline-block align-middle" />
                            <span class="text-xs text-slate-500 font-medium align-middle">限制格式 <asp:Label ID="LabelMfiletype" runat="server" CssClass="text-slate-700 font-bold mx-1"></asp:Label> </span>
                        </div>
                        <div class="text-center mt-2 font-bold text-sm">
                            <asp:Label ID="Labelmsg" runat="server" SkinID="LabelMsgRed" CssClass="text-red-500"></asp:Label>
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

