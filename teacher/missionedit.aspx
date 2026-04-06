<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="missionedit.aspx.cs" Inherits="Teacher_missionedit" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<style>
    /* 让本页编辑器宽度自适应屏幕 */
    .missionedit-page.cplace {
        width: 100%;
        max-width: 100%;
        box-sizing: border-box;
        padding: 0 1.2rem;
    }
    .missionedit-page .cleft {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 0.5rem 1rem;
        padding: 1rem 0;
    }
    .missionedit-editor-wrap {
        width: 100%;
        box-sizing: border-box;
    }
    .missionedit-editor-wrap .ke-container {
        width: 100% !important;
        max-width: 100% !important;
        box-sizing: border-box;
    }
    .missionedit-editor-wrap #wangeditor-wrap,
    .missionedit-editor-wrap #vditor-wrap,
    .missionedit-editor-wrap textarea {
        width: 100% !important;
        max-width: 100% !important;
        box-sizing: border-box;
    }
    .missionedit-editor-wrap .vditor {
        width: 100% !important;
        max-width: 100% !important;
    }
</style>
<div class="cplace missionedit-page">
    <div class="cleft">
        活动名称：<asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal"  Width="200px"  CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
        作品类型<asp:DropDownList ID="DDLmfiletype" runat="server"  Width="60px" Font-Names="Arial">
        </asp:DropDownList>
        <asp:CheckBox ID="CheckUpload" runat="server" Text="是否提交" Checked="True" />
        &nbsp;<asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
        &nbsp;<asp:CheckBox ID="CheckGroup" runat="server" Text="小组合作" />
        <asp:CheckBox ID="CheckRemote" runat="server" Text="远程图片" ToolTip="自动下载远程图片，有时失效！" />
        <asp:CheckBox ID="CheckMicoWorld" runat="server" Text="上次作品"  Checked="False" 
            ToolTip="显示上一节课作品提供下载，适合项目学习连续制作"  />
        <span style="display:inline-flex; align-items:center; gap:4px;">
            <label>编辑器：</label>
            <select id="editorSelector" onchange="switchEditor(this.value)" style="padding: 4px 8px; border: 1px solid #d1d5db; border-radius: 4px; font-size: 14px;">
                <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                <option value="wangeditor">富文本编辑器 (WangEditor)</option>
                <option value="vditor">Markdown编辑器 (Vditor)</option>
            </select>
        </span>
        </div>
    <div class="missionedit-editor-wrap">
    <!-- 引入编辑器CDN -->
    <link href="../js/vendors/wangeditor/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
    <script src="../js/vendors/vditor/index.min.js"></script>
    <script src="../js/vendors/wangeditor/index.js"></script>

		<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
		<script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
		<script>
		    var kindEditorObj;
            var wangEditorObj;
            var vditorObj;
            var currentEditor = 'kindeditor';
            var lastVditorMarkdown = null;
            var lastVditorHtml = '';

            var cid= <%=myCid() %>;
            var ty="Course";
            var upjs= '../kindeditor/aspnet/upload_json.aspx?cid='+cid+'&Ty='+ty;
            var fmjs='../kindeditor/aspnet/file_manager_json.aspx?cid='+cid+'&Ty='+ty;

		    KindEditor.ready(function (K) {
		        kindEditorObj = K.create('textarea[name="ctl00$Content$mcontent"]', {
		            resizeType: 1,
		            newlineTag: "br", 
				uploadJson : upjs,
				fileManagerJson : fmjs,
				allowFileManager : true,
				filterMode : false,
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
                var mcontent = document.getElementById('<%= mcontent.ClientID %>');
                if (!selector || !mcontent) return;
                if (isLikelyMarkdown(mcontent.value)) {
                    selector.value = 'vditor';
                    switchEditor('vditor');
                }
            }

            function initWangEditor() {
                if (wangEditorObj) return;
                const { createEditor, createToolbar } = window.wangEditor;
                const mcontent = document.getElementById('<%= mcontent.ClientID %>');

                wangEditorObj = createEditor({
                    selector: '#wangeditor-text',
                    html: kindEditorObj ? kindEditorObj.html() : mcontent.value,
                        config: {
                            placeholder: '请输入内容...',
                            MENU_CONF: {
                                uploadImage: {
                                    server: upjs,
                                    customInsert(res, insertFn) {
                                        if (res.error === 0) {
                                            insertFn(res.url);
                                        } else {
                                            alert(res.message || '图片上传失败');
                                        }
                                    }
                                },
                                uploadAttachment: {
                                    server: upjs,
                                    customInsert(res, insertFn) {
                                        if (res.error === 0) {
                                            if (wangEditorObj) {
                                                LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res);
                                            }
                                        } else {
                                            alert(res.message || '附件上传失败');
                                        }
                                    }
                                },
                                uploadFile: {
                                    server: upjs,
                                    customInsert(res, insertFn) {
                                        if (res.error === 0) {
                                            if (wangEditorObj) {
                                                LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res);
                                            }
                                        } else {
                                            alert(res.message || '文件上传失败');
                                        }
                                    }
                                }
                            }
                    }
                });

                createToolbar({
                    editor: wangEditorObj,
                    selector: '#wangeditor-toolbar',
                    config: {}
                });
            }

            let pendingVditorHtml = null;
            let vditorReady = false;

            function safeHtml2Md(html) {
                try {
                    if (vditorObj && vditorObj.vditor && vditorObj.vditor.lute) {
                        return vditorObj.vditor.lute.HTML2Md(html);
                    }
                    var l = Lute.New();
                    return l.HTML2Md(html);
                } catch(e) {
                    return html;
                }
            }

            function initVditor() {
                if (vditorObj) return;
                const mcontent = document.getElementById('<%= mcontent.ClientID %>');
                let initialContent = getPreferredVditorValue(lastVditorMarkdown !== null ? lastVditorMarkdown : mcontent.value);

                vditorObj = new Vditor('vditor-container', {
                    height: 400,
                    width: '100%',
                    mode: 'ir',
                    upload: {
                        handler: function (files) {
                            LearnSiteEditorUploadHelper.handleVditorUpload(vditorObj, upjs, files);
                        }
                    },
                    preview: {
                        mode: 'both'
                    },
                    cache: {
                        enable: false
                    },
                    after: () => {
                        vditorReady = true;
                        let contentToSet = pendingVditorHtml !== null ? getPreferredVditorValue(pendingVditorHtml) : initialContent;
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
                if (kindContainer && kindContainer.style.display !== 'none' && kindEditorObj) {
                    currentHtml = kindEditorObj.html();
                } else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) {
                    currentHtml = wangEditorObj.getHtml();
                } else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj) {
                    rememberVditorState();
                    currentHtml = lastVditorHtml;
                }

                if (kindContainer) kindContainer.style.display = 'none';
                if (wangContainer) wangContainer.style.display = 'none';
                if (vditorContainer) vditorContainer.style.display = 'none';

                if (type === 'kindeditor') {
                    if (kindContainer) kindContainer.style.display = 'block';
                    if (kindEditorObj && currentHtml) kindEditorObj.html(currentHtml);
                } else if (type === 'wangeditor') {
                    if (wangContainer) {
                        wangContainer.style.display = 'block';
                    }
                    initWangEditor();
                    if (wangEditorObj && currentHtml) {
                        wangEditorObj.setHtml(currentHtml);
                    }
                } else if (type === 'vditor') {
                    if (vditorContainer) {
                        vditorContainer.style.display = 'block';
                    }
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
                var mcontent = document.getElementById('<%= mcontent.ClientID %>');
                if (currentEditor === 'kindeditor') {
                    if (kindEditorObj) {
                        mcontent.value = kindEditorObj.html();
                    }
                } else if (currentEditor === 'wangeditor') {
                    if (wangEditorObj) {
                        mcontent.value = wangEditorObj.getHtml();
                    }
                } else if (currentEditor === 'vditor') {
                    if (vditorObj) {
                        rememberVditorState();
                        mcontent.value = lastVditorMarkdown || '';
                    }
                }
                return true;
            }
		</script>
    <div id="wangeditor-wrap" style="display:none; width: 100%; position:relative; border: 1px solid #ccc; z-index: 100;">
        <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
        <div id="wangeditor-text" style="height: 350px;"></div>
    </div>

    <div id="vditor-wrap" style="display:none; width: 100%; position:relative; margin-bottom: 10px;">
        <div id="vditor-container"></div>
    </div>

    <textarea  id ="mcontent" runat ="server" style="width: 100%; height:550px; box-sizing:border-box;" ></textarea>  
    </div>
     <div class="placehold">
               <asp:Label ID="Labelmsg" runat="server" Width="300px"></asp:Label>
               <br />
               选择自定义评价标准：<asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt"
            Width="120px" Font-Names="Arial">
        </asp:DropDownList>
               <br />
         <br />
              <asp:Button ID="Btnedit" runat="server"  Text="修改活动" OnClick="Btnedit_Click" OnClientClick="return syncContent();" CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />&nbsp;&nbsp;&nbsp;
              <asp:Button ID="BtnCourse" runat="server" Text="返回学案" OnClick="BtnCourse_Click" CssClass="admin-form-btn admin-form-btn--secondary" />
              <br />
         <br />
         </div>           
        </div>
</asp:Content>
