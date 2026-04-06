<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher"  Validaterequest="false" AutoEventWireup="true" CodeFile="softadd.aspx.cs" Inherits="Teacher_softadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    <style type="text/css">
        .soft-add-page {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
            min-height: calc(100vh - 8rem);
        }
        .soft-add-page * { box-sizing: border-box; }
        .lesson-shell { display: flex; flex-direction: column; gap: 20px; max-width: 1200px; margin: 0 auto; }
        .lesson-hero {
            padding: 24px 28px;
            border-radius: 1rem;
            background: linear-gradient(135deg, #0f172a 0%, #4338ca 52%, #6366f1 100%);
            color: #eff6ff;
            box-shadow: 0 20px 40px rgba(79, 70, 229, 0.15);
        }
        .lesson-hero__title { font-size: 24px; font-weight: 800; margin: 0; display: flex; align-items: center; gap: 12px; }
        .lesson-hero__subtitle { margin: 6px 0 0; font-size: 14px; color: rgba(239, 246, 255, 0.88); }
        .lesson-card { border: 1px solid var(--ls-border); border-radius: 1rem; background: var(--ls-card); padding: 24px; box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05); }
        .lesson-card__title { margin: 0 0 16px 0; font-size: 18px; font-weight: 800; color: var(--ls-text); }
        
        .form-grid { display: grid; grid-template-columns: repeat(12, 1fr); gap: 20px; }
        .form-field { display: flex; flex-direction: column; gap: 8px; }
        .form-field--4 { grid-column: span 4; }
        .form-field--3 { grid-column: span 3; }
        .form-field--2 { grid-column: span 2; }
        .form-field--12 { grid-column: span 12; }
        
        .form-label { font-size: 14px; font-weight: 700; color: #334155; }
        .form-input, .form-select {
            width: 100%; height: 44px; padding: 0 14px; border: 1px solid #cbd5e1; border-radius: 0.85rem;
            background: #ffffff; color: #0f172a; font-size: 14px; font-weight: 600;
            transition: all 0.2s ease;
        }
        .form-input:focus, .form-select:focus { border-color: #2563eb; outline: none; box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1); }
        
        .editor-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; flex-wrap: wrap; gap: 10px; }
        
        .soft-actions { display: flex; gap: 16px; margin-top: 24px; align-items: center; }
        .soft-btn { height: 44px; padding: 0 24px; border-radius: 0.375rem; font-weight: 700; cursor: pointer; border: none; transition: all 0.2s; font-size: 14px; }
        .soft-btn--primary { background: #2563eb; color: #fff; box-shadow: 0 8px 20px rgba(37, 99, 235, 0.2); }
        .soft-btn--primary:hover { background: #1d4ed8; transform: translateY(-1px); }
        .soft-btn--secondary { background: #f1f5f9; color: #475569; border: 1px solid #cbd5e1; }
        .soft-btn--secondary:hover { background: #e2e8f0; }

        .editor-stage { margin-top: 10px; width: 100%; border-radius: 0.85rem; overflow: hidden; border: 1px solid #cbd5e1; }
        .editor-stage textarea { width: 100%; height: 400px; border: none; }
        
        .info-note { margin-top: 20px; padding: 16px; background: #fffbeb; border-left: 4px solid #fbbf24; border-radius: 0 0.85rem 0.85rem 0; color: #92400e; font-size: 13px; line-height: 1.6; }

        @media (max-width: 768px) {
            .soft-add-page { padding: 16px; }
            .form-field--4, .form-field--3, .form-field--2 { grid-column: span 12; }
            .editor-header { flex-direction: column; align-items: flex-start; }
        }
    </style>

    <div class="soft-add-page">
        <div class="lesson-shell">
            <div class="lesson-hero">
                <h1 class="lesson-hero__title"><i class="bi bi-plus-square" style="color: #a5b4fc;"></i> 添加学习资源</h1>
                <p class="lesson-hero__subtitle">在此处添加教程、微课、软件等资源，并可设置学习后的学分奖励。</p>
            </div>
            
            <div class="lesson-card">
                <h2 class="lesson-card__title">基础设置</h2>
                <div class="form-grid">
                    <div class="form-field form-field--4">
                        <label class="form-label">资源名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" CssClass="form-input"></asp:TextBox>
                    </div>
                    <div class="form-field form-field--3">
                        <label class="form-label">资源分类</label>
                        <asp:DropDownList ID="ddlcategory" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="form-field form-field--3">
                        <label class="form-label">资源属性</label>
                        <asp:DropDownList ID="DDLclass" runat="server" CssClass="form-select">
                            <asp:ListItem Selected="True">教程</asp:ListItem>
                            <asp:ListItem>微课</asp:ListItem>
                            <asp:ListItem>资料</asp:ListItem>
                            <asp:ListItem>软件</asp:ListItem>
                            <asp:ListItem>游戏</asp:ListItem>
                            <asp:ListItem>课程</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-field form-field--2">
                        <label class="form-label">学分限制</label>
                        <asp:DropDownList ID="DDLopen" runat="server" CssClass="form-select">
                            <asp:ListItem Value="10">A</asp:ListItem>
                            <asp:ListItem Value="8">B</asp:ListItem>
                            <asp:ListItem Value="6">C</asp:ListItem>
                            <asp:ListItem Value="4">D</asp:ListItem>
                            <asp:ListItem Value="2">E</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-field form-field--12" style="flex-direction: row; gap: 20px; align-items: center; margin-top: 10px;">
                        <label style="display: flex; align-items: center; gap: 8px; font-size: 14px; font-weight: 600; color: #334155; cursor: pointer;">
                            <asp:CheckBox ID="CheckBoxFhide" runat="server" Text="是否隐藏" />
                        </label>
                        <label style="display: flex; align-items: center; gap: 8px; font-size: 14px; font-weight: 600; color: #334155; cursor: pointer;">
                            <asp:CheckBox ID="CheckBoxFhid" runat="server" Text="是否共享" />
                        </label>
                    </div>
                </div>
            </div>

            <div class="lesson-card">
                <div class="editor-header">
                    <h2 class="lesson-card__title" style="margin:0;">资源详情内容</h2>
                    <div>
                        <label class="form-label" style="margin-right: 8px;">编辑器选择:</label>
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="form-select" style="width: auto; height: 36px; padding: 0 30px 0 10px; display: inline-block;">
                            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                            <option value="wangeditor">富文本编辑器 (WangEditor)</option>
                            <option value="vditor">Markdown编辑器 (Vditor)</option>
                        </select>
                    </div>
                </div>
                
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

                    var cid = '-1';
                    var ty = "Soft";
                    var upjs = '../kindeditor/aspnet/upload_json.aspx?cid='+cid+'&ty='+ty;
                    var fmjs = '../kindeditor/aspnet/file_manager_json.aspx?cid='+cid+'&ty='+ty;

                    KindEditor.ready(function (K) {
                        kindEditorObj = K.create('textarea[name="textareaItem"]', {
                            resizeType: 1,
                            newlineTag: "br",                    
                            uploadJson : upjs,
                            fileManagerJson : fmjs,
                            allowFileManager: true,
                            filterMode: false,
                            width: '100%',
                            afterCreate: function () {
                                this.loadPlugin('autoheight');
                            }
                        });
                    });

                    function initWangEditor() {
                        if (wangEditorObj) return;
                        const { createEditor, createToolbar } = window.wangEditor;
                        const ta = document.getElementsByName('textareaItem')[0];

                        wangEditorObj = createEditor({
                            selector: '#wangeditor-text',
                            html: kindEditorObj ? kindEditorObj.html() : (ta ? ta.value : ''),
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
                        } catch (e) {
                            return html;
                        }
                    }

                    function initVditor() {
                        if (vditorObj) return;
                        const ta = document.getElementsByName('textareaItem')[0];
                        let initialContent = kindEditorObj ? kindEditorObj.html() : (ta ? ta.value : '');

                        vditorObj = new Vditor('vditor-container', {
                            height: 400,
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

                        var currentHtml = '';
                        if (kindContainer && kindContainer.style.display !== 'none' && kindEditorObj) {
                            currentHtml = kindEditorObj.html();
                        } else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) {
                            currentHtml = wangEditorObj.getHtml();
                        } else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj) {
                            currentHtml = vditorObj.getHTML();
                        }

                        if (kindContainer) kindContainer.style.display = 'none';
                        if (wangContainer) wangContainer.style.display = 'none';
                        if (vditorContainer) vditorContainer.style.display = 'none';

                        if (type === 'kindeditor') {
                            if (kindContainer) kindContainer.style.display = 'block';
                            if (kindEditorObj && currentHtml) kindEditorObj.html(currentHtml);
                        } else if (type === 'wangeditor') {
                            if (wangContainer) wangContainer.style.display = 'block';
                            initWangEditor();
                            if (wangEditorObj && currentHtml) wangEditorObj.setHtml(currentHtml);
                        } else if (type === 'vditor') {
                            if (vditorContainer) vditorContainer.style.display = 'block';
                            if (!vditorObj) {
                                pendingVditorHtml = currentHtml;
                                initVditor();
                            } else if (vditorReady) {
                                if (currentHtml) vditorObj.setValue(safeHtml2Md(currentHtml));
                            } else {
                                pendingVditorHtml = currentHtml;
                            }
                        }
                    }

                    function syncContent() {
                        var ta = document.getElementsByName('textareaItem')[0];
                        if (currentEditor === 'kindeditor') {
                            if (kindEditorObj) ta.value = kindEditorObj.html();
                        } else if (currentEditor === 'wangeditor') {
                            if (wangEditorObj) ta.value = wangEditorObj.getHtml();
                        } else if (currentEditor === 'vditor') {
                            if (vditorObj) ta.value = vditorObj.getHTML();
                        }
                        return true;
                    }
                </script>
                
                <div class="editor-stage">
                    <div id="wangeditor-wrap" style="display:none; width: 100%; border-bottom: 1px solid #ccc; z-index: 100;">
                        <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
                        <div id="wangeditor-text" style="height: 350px;"></div>
                    </div>

                    <div id="vditor-wrap" style="display:none; width: 100%; margin-bottom: 10px;">
                        <div id="vditor-container"></div>
                    </div>

                    <textarea name="textareaItem" style="width: 100%; height:400px; border:none; padding:10px;"></textarea>
                </div>
            </div>

            <div class="lesson-card">
                <h2 class="lesson-card__title">附件及操作</h2>
                <div class="form-grid">
                    <div class="form-field form-field--12">
                        <label class="form-label">上传可限制资源（如软件包、配套素材）</label>
                        <div class="ls-upload" data-label="点击或拖拽上传资源文件" data-hint="支持任意文件类型">
                            <asp:FileUpload ID="FUsoft" runat="server" />
                        </div>
                    </div>
                </div>
                
                <asp:Label ID="Labelmsg" runat="server" style="display: block; margin-top: 12px; color: #dc2626; font-weight: 600; font-size: 14px;"></asp:Label>
                
                <div class="soft-actions">
                    <asp:Button ID="Btnadd" runat="server" Text="添加资源" OnClick="Btnadd_Click" OnClientClick="return syncContent();" CssClass="soft-btn soft-btn--primary" />
                    <asp:Button ID="Btnreturn" runat="server" Text="返回列表" OnClick="Btnreturn_Click" CssClass="soft-btn soft-btn--secondary" />
                </div>
                
                <div class="info-note">
                    <strong><i class="bi bi-info-circle-fill mr-1"></i> 注明：</strong>
                    如果资源属性为【教程】或【微课】，则学生在浏览该资源学习时，能够提交自学作品！
                </div>
            </div>
        </div>
    </div>
    <script src="../js/fileupload.js"></script>
</asp:Content>
