<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher" Validaterequest="false"   AutoEventWireup="true" CodeFile="txtformedit.aspx.cs" Inherits="Teacher_txtformedit" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<link href="../js/vendors/wangeditor/style.css" rel="stylesheet" />
<link rel="stylesheet" href="../js/vendors/vditor/index.css" />
<div  class="cplace">
    <div  class="cleft">
        &nbsp;表格名称：<asp:TextBox ID="Texttitle" runat="server"  SkinID="TextBoxNormal" 
            Width="200px"  CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
        <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布"  Checked="True" />
        <asp:CheckBox ID="CheckCollabo" runat="server" Text="是否协同"  Checked="True" />
        </div>
    <div  >
        <div style="margin:0 0 10px 0; display:flex; align-items:center; gap:8px; flex-wrap:wrap;">
            <span style="font-size:13px;font-weight:700;color:#334155;">编辑器：</span>
            <select id="editorSelector" onchange="switchEditor(this.value)" style="min-height:36px;padding:0 28px 0 10px;border:1px solid #cbd5e1;border-radius:8px;background:#fff;color:#0f172a;">
                <option value="kindeditor" selected>KindEditor</option>
                <option value="wangeditor">WangEditor</option>
                <option value="vditor">Vditor</option>
            </select>
        </div>
        <script type="text/javascript" charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
		<script type="text/javascript"  charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
		<script src="../js/vendors/vditor/index.min.js"></script>
		<script src="../js/vendors/wangeditor/index.js"></script>
		<script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
		<script type="text/javascript">
		    var editor;
            var wangEditorObj;
            var vditorObj;
            var currentEditor = 'kindeditor';
                    var lastVditorMarkdown = null;
                    var lastVditorHtml = '';
                    var vditorReady = false;
            var pendingVditorHtml = null;
            var cid= <%=myCid() %>;
            var ty="Course";
            var upjs= '../kindeditor/aspnet/upload_json.aspx?cid='+cid+'&ty='+ty;
            var fmjs='../kindeditor/aspnet/file_manager_json.aspx?cid='+cid+'&ty='+ty;
		    KindEditor.ready(function (K) {
		        editor = K.create('textarea[name="ctl00$Content$mcontent"]', {
		            resizeType: 1,
		            newlineTag: "br", 
				uploadJson : upjs,
				fileManagerJson : fmjs,
				allowFileManager : true,
                filterMode : false,
                autoHeightMode : true,
					afterCreate : function() {
						this.loadPlugin('autoheight');
                                window.setTimeout(autoSelectInitialEditor, 0);
					}
			        });
		    });
             function isProbablyHtml(content) {
                 return /<\/?[a-z][\s\S]*>/i.test(content || '');
             }

             function isLikelyMarkdown(content) {
                 if (!content) return false;
                 return /```/.test(content)
                     || /^#{1,6}\s/m.test(content)
                     || /^\s*[-*+]\s/m.test(content)
                     || /^\s*\d+\.\s/m.test(content)
                     || /\[[^\]]+\]\([^)]+\)/.test(content);
             }

             function normalizeEditorContent(content) {
                 return (content || '').replace(/\s+/g, ' ').trim();
             }

             function getPreferredVditorValue(content) {
                 if (!content) return '';
                 return isProbablyHtml(content) ? safeHtml2Md(content) : content;
             }

             function rememberVditorState() {
                 if (!vditorObj) return;
                 lastVditorMarkdown = vditorObj.getValue();
                 lastVditorHtml = vditorObj.getHTML();
             }

             function shouldRestoreSavedMarkdown(currentHtml) {
                 if (lastVditorMarkdown === null) return false;
                 var currentNormalized = normalizeEditorContent(currentHtml);
                 var savedNormalized = normalizeEditorContent(lastVditorHtml);
                 return currentNormalized === '' || currentNormalized === savedNormalized;
             }

             function autoSelectInitialEditor() {
                 var selector = document.getElementById('editorSelector');
                 var field = document.getElementById('<%= mcontent.ClientID %>');
                 if (!selector || !field) return;
                 if (isLikelyMarkdown(field.value)) {
                     selector.value = 'vditor';
                     switchEditor('vditor');
                 }
             }

             function initWangEditor() {
                 if (wangEditorObj) return;
                 const { createEditor, createToolbar } = window.wangEditor;
                 const field = document.getElementById('<%= mcontent.ClientID %>');
                 wangEditorObj = createEditor({
                     selector: '#wangeditor-text',
                     html: editor ? editor.html() : (field ? field.value : ''),
                     config: {
                         placeholder: '请输入内容...',
                         MENU_CONF: {
                             uploadImage: {
                                 server: upjs,
                                 customInsert(res, insertFn) {
                                     if (res.error === 0) insertFn(res.url);
                                     else alert(res.message || '图片上传失败');
                                 }
                             },
                             uploadAttachment: {
                                 server: upjs,
                                 customInsert(res) {
                                     if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res);
                                     else alert(res.message || '附件上传失败');
                                 }
                             },
                             uploadFile: {
                                 server: upjs,
                                 customInsert(res) {
                                     if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res);
                                     else alert(res.message || '文件上传失败');
                                 }
                             }
                         }
                     }
                 });
                 createToolbar({ editor: wangEditorObj, selector: '#wangeditor-toolbar', config: {} });
             }

             function safeHtml2Md(html) {
                 try {
                     if (vditorObj && vditorObj.vditor && vditorObj.vditor.lute) return vditorObj.vditor.lute.HTML2Md(html);
                     var l = Lute.New();
                     return l.HTML2Md(html);
                 } catch (e) {
                     return html;
                 }
             }

             function initVditor() {
                 if (vditorObj) return;
                 const field = document.getElementById('<%= mcontent.ClientID %>');
                 let initialContent = getPreferredVditorValue(lastVditorMarkdown !== null ? lastVditorMarkdown : (editor ? editor.html() : (field ? field.value : '')));
                 vditorObj = new Vditor('vditor-container', {
                     height: 420,
                     mode: 'ir',
                     upload: { handler: function (files) { LearnSiteEditorUploadHelper.handleVditorUpload(vditorObj, upjs, files); } },
                     preview: { mode: 'both' },
                     cache: { enable: false },
                     after: () => {
                         vditorReady = true;
                         let contentToSet = pendingVditorHtml !== null ? pendingVditorHtml : initialContent;
                         vditorObj.setValue(contentToSet || '');
                         rememberVditorState();
                         pendingVditorHtml = null;
                     }
                 });
             }

             function switchEditor(type) {
                 currentEditor = type;
                 var kindContainer = document.querySelector('.ke-container');
                 var wangContainer = document.getElementById('wangeditor-wrap');
                 var vditorContainer = document.getElementById('vditor-wrap');
                 var currentHtml = '';
                 if (kindContainer && kindContainer.style.display !== 'none' && editor) currentHtml = editor.html();
                 else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) currentHtml = wangEditorObj.getHtml();
                 else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj && vditorReady) {
                     rememberVditorState();
                     currentHtml = lastVditorHtml;
                 }
                 if (kindContainer) kindContainer.style.display = 'none';
                 if (wangContainer) wangContainer.style.display = 'none';
                 if (vditorContainer) vditorContainer.style.display = 'none';
                 if (type === 'kindeditor') {
                     if (kindContainer) kindContainer.style.display = 'block';
                     if (editor && currentHtml) editor.html(currentHtml);
                 } else if (type === 'wangeditor') {
                     if (wangContainer) wangContainer.style.display = 'block';
                     initWangEditor();
                     if (wangEditorObj && currentHtml) wangEditorObj.setHtml(currentHtml);
                 } else if (type === 'vditor') {
                     if (vditorContainer) vditorContainer.style.display = 'block';
                     var vditorContent = shouldRestoreSavedMarkdown(currentHtml) ? lastVditorMarkdown : getPreferredVditorValue(currentHtml);
                     if (!vditorObj) {
                         pendingVditorHtml = vditorContent;
                         initVditor();
                     } else if (vditorReady) {
                         vditorObj.setValue(vditorContent || '');
                         rememberVditorState();
                     } else {
                         pendingVditorHtml = vditorContent;
                     }
                 }
             }

             function syncContent() {
                 var field = document.getElementById('<%= mcontent.ClientID %>');
                 if (!field) return true;
                 if (currentEditor === 'kindeditor') {
                     if (editor) field.value = editor.html();
                 } else if (currentEditor === 'wangeditor') {
                     if (wangEditorObj) field.value = wangEditorObj.getHtml();
                 } else if (currentEditor === 'vditor') {
                     if (vditorObj) {
                         rememberVditorState();
                         field.value = lastVditorMarkdown || '';
                     }
                 }
                 return true;
             }
		</script>
    <div id="wangeditor-wrap" style="display:none; width: 780px; position:relative; border:1px solid #ccc; z-index:100; margin-bottom:10px;">
        <div id="wangeditor-toolbar" style="border-bottom:1px solid #ccc;"></div>
        <div id="wangeditor-text" style="height:360px;"></div>
    </div>
    <div id="vditor-wrap" style="display:none; width: 780px; position:relative; margin-bottom:10px;">
        <div id="vditor-container"></div>
    </div>
    <textarea  id ="mcontent" runat ="server" style="width: 780px; height:450px;" ></textarea>
    </div>
     <div  class="placehold">
               <asp:Label ID="Labelmsg" runat="server" ></asp:Label>
               <br />
               <br />
         <br />
              <asp:Button ID="Btnedit" runat="server"  Text="修改表单" OnClick="Btnedit_Click" OnClientClick="return syncContent();"
                   CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />&nbsp;&nbsp;&nbsp;
              <asp:Button ID="BtnCourse" runat="server"  Text="返回学案" OnClick="BtnCourse_Click" CssClass="admin-form-btn admin-form-btn--secondary" /><br />
         <br />
         </div>
           
        </div>
</asp:Content>
