<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="missionedit.aspx.cs" Inherits="Teacher_missionedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<div class="cplace">
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
        </div>
    <div >
    <!-- 引入编辑器CDN -->
    <link href="https://cdn.jsdelivr.net/npm/@wangeditor/editor@5.1.23/dist/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vditor/dist/index.css" />
    <script src="https://cdn.jsdelivr.net/npm/vditor/dist/index.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@wangeditor/editor@5.1.23/dist/index.js"></script>

    <div style="margin-bottom: 10px; margin-left: 10px;">
        <label>编辑器：</label>
        <select id="editorSelector" onchange="switchEditor(this.value)" style="padding: 4px 8px; border: 1px solid #d1d5db; border-radius: 4px; font-size: 14px;">
            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
            <option value="wangeditor">富文本编辑器 (WangEditor)</option>
            <option value="vditor">Markdown编辑器 (Vditor)</option>
        </select>
    </div>

		<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
		<script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
		<script>
		    var kindEditorObj;
            var wangEditorObj;
            var vditorObj;
            var currentEditor = 'kindeditor';

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
					}		            
		        });
		    });

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
                let initialContent = kindEditorObj ? kindEditorObj.html() : mcontent.value;

                vditorObj = new Vditor('vditor-container', {
                    height: 400,
                    width: '830px',
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
                        let contentToSet = pendingVditorHtml !== null ? pendingVditorHtml : initialContent;
                        if (contentToSet) {
                            vditorObj.setValue(safeHtml2Md(contentToSet));
                        }
                        pendingVditorHtml = null;
                    }
                });
            }

            function switchEditor(type) {
                currentEditor = type;
                var kindContainer = document.querySelector('.ke-container');
                var wangContainer = document.getElementById('wangeditor-wrap');
                var vditorContainer = document.getElementById('vditor-wrap');

                // Sync current content before switching
                var currentHtml = '';
                if (kindContainer && kindContainer.style.display !== 'none' && kindEditorObj) {
                    currentHtml = kindEditorObj.html();
                } else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) {
                    currentHtml = wangEditorObj.getHtml();
                } else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj) {
                    currentHtml = vditorObj.getHTML();
                }

                // Hide all
                if (kindContainer) kindContainer.style.display = 'none';
                if (wangContainer) wangContainer.style.display = 'none';
                if (vditorContainer) vditorContainer.style.display = 'none';

                // Show and update selected
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
                    if (!vditorObj) {
                        pendingVditorHtml = currentHtml;
                        initVditor();
                    } else if (vditorReady) {
                        if (currentHtml) {
                            vditorObj.setValue(safeHtml2Md(currentHtml));
                        }
                    } else {
                        pendingVditorHtml = currentHtml;
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
                        mcontent.value = vditorObj.getHTML();
                    }
                }
                return true;
            }
		</script>
    <div id="wangeditor-wrap" style="display:none; width: 830px; left:10px; position:relative; border: 1px solid #ccc; z-index: 100;">
        <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
        <div id="wangeditor-text" style="height: 350px;"></div>
    </div>

    <div id="vditor-wrap" style="display:none; width: 830px; left:10px; position:relative; margin-bottom: 10px;">
        <div id="vditor-container"></div>
    </div>

    <textarea  id ="mcontent" runat ="server" style="width: 830px; height:550px;" ></textarea>  
    </div>
     <div class="placehold">
               <asp:Label ID="Labelmsg" runat="server" Width="300px"></asp:Label>
               <br />
               选择自定义评价标准：<asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt"
            Width="120px" Font-Names="Arial">
        </asp:DropDownList>
               <br />
         <br />
              <asp:Button ID="Btnedit" runat="server"  Text="修改活动" OnClick="Btnedit_Click" OnClientClick="return syncContent();" SkinID="BtnNormal"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />&nbsp;&nbsp;&nbsp;
              <asp:Button ID="BtnCourse" runat="server" Text="学案返回" OnClick="BtnCourse_Click" SkinID="BtnNormal"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
              <br />
         <br />
         </div>           
        </div>
</asp:Content>
