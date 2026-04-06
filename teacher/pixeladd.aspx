<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false"  AutoEventWireup="true" CodeFile="pixeladd.aspx.cs" Inherits="Teacher_pixeladd" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/vendors/wangeditor/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
    <style type="text/css">
        .pixel-add-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #1e293b 0%, #3730a3 55%, #4f46e5 100%);
            --content-add-hero-shadow: 0 22px 45px -28px rgba(79, 70, 229, 0.72);
            --content-add-primary-bg: #4f46e5;
            --content-add-primary-hover: #4338ca;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
        }

        .pixel-add-editor-stage textarea {
            width: 930px;
            height: 450px;
        }

        .pixel-add-editor-wrap {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 1rem;
            align-items: center;
            margin-bottom: 1rem;
        }

        .pixel-add-editor-select {
            min-height: 38px;
            padding: 0 32px 0 12px;
            border: 1px solid #c7d2fe;
            border-radius: .75rem;
            background: #eef2ff;
            color: #3730a3;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            appearance: none;
            -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%2364738b' stroke-width='2.5' stroke-linecap='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
        }

        .pixel-add-editor-stage #wangeditor-wrap,
        .pixel-add-editor-stage #vditor-wrap,
        .pixel-add-editor-stage textarea,
        .pixel-add-editor-stage .ke-container {
            width: 100% !important;
            max-width: 100%;
        }

        .pixel-add-device-list {
            padding: 0.9rem 1rem;
            border: 1px solid #dbeafe;
            border-radius: 0.9rem;
            background: #f8fbff;
            color: #334155;
        }

        .pixel-add-device-list table,
        .pixel-add-device-list tbody,
        .pixel-add-device-list tr,
        .pixel-add-device-list td {
            display: block;
        }

        .pixel-add-device-list input {
            margin-right: 0.35rem;
        }

        .pixel-add-device-list label {
            margin-right: 0.9rem;
            display: inline-flex;
            align-items: center;
            margin-bottom: 0.45rem;
        }
    </style>

    <div class="content-add-page pixel-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add Custom Theme</span>
                    <h1 class="content-add-title">添加主题应用</h1>
                    <p class="content-add-subtitle">保留应用类型切换、物联网设备选择、嵌入地址输入、发布状态与量规逻辑，仅重构页面层次和输入布局。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">基础设置</h2>
                <p class="content-add-section-desc">主题类型切换仍会触发原有 `DDLTitle_SelectedIndexChanged`，设备和地址输入显隐逻辑保持不变。</p>
                <div class="content-add-grid">
                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= DDLTitle.ClientID %>">应用类型</label>
                        <asp:DropDownList ID="DDLTitle" runat="server" Font-Size="Medium" onselectedindexchanged="DDLTitle_SelectedIndexChanged" AutoPostBack="True" CssClass="content-add-select">
                            <asp:ListItem Value="11">像素画</asp:ListItem>
                            <asp:ListItem Value="36">素材库</asp:ListItem>
                            <asp:ListItem Value="37">网站设计</asp:ListItem>
                            <asp:ListItem Value="17">二维码</asp:ListItem>
                            <asp:ListItem Value="18">在线文档</asp:ListItem>
                            <asp:ListItem Value="19">演示文稿</asp:ListItem>
                            <asp:ListItem Value="20">海报设计</asp:ListItem>
                            <asp:ListItem Value="21">风格迁移</asp:ListItem>
                            <asp:ListItem Value="22">图像分类</asp:ListItem>
                            <asp:ListItem Value="23">人脸识别</asp:ListItem>
                            <asp:ListItem Value="24">物联网MQTT</asp:ListItem>
                            <asp:ListItem Value="25">手绘画布</asp:ListItem>
                            <asp:ListItem Value="26">推箱子地图</asp:ListItem>
                            <asp:ListItem Value="27">人工智能对话</asp:ListItem>
                            <asp:ListItem Value="28">语音合成</asp:ListItem>
                            <asp:ListItem Value="29">文字识别</asp:ListItem>
                            <asp:ListItem Value="30">声音分析</asp:ListItem>
                            <asp:ListItem Value="31">井字棋</asp:ListItem>
                            <asp:ListItem Value="32">手写数字识别</asp:ListItem>
                            <asp:ListItem Value="33">Markdown写作</asp:ListItem>
                            <asp:ListItem Value="34">嵌入本地网页</asp:ListItem>
                            <asp:ListItem Value="35">文生图</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">主题名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="300px" CssClass="content-add-input"></asp:TextBox>
                    </div>

                    <div class="content-add-field">
                        <span class="content-add-label">发布设置</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                        </div>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= DDLMgid.ClientID %>">评价标准</label>
                        <asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt" Width="160px" Font-Names="Arial" CssClass="content-add-select"></asp:DropDownList>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <span class="content-add-label">设备选择</span>
                        <div class="pixel-add-device-list">
                            <asp:CheckBoxList ID="Ckdevice" runat="server" RepeatLayout="Flow" Visible="False" RepeatDirection="Horizontal" Font-Size="Small">
                                <asp:ListItem Value="led">小灯</asp:ListItem>
                                <asp:ListItem Value="fan">风扇</asp:ListItem>
                                <asp:ListItem Value="pump">水泵</asp:ListItem>
                                <asp:ListItem Value="temperature">温度</asp:ListItem>
                                <asp:ListItem Value="humidity">湿度</asp:ListItem>
                                <asp:ListItem Value="sound">声音</asp:ListItem>
                                <asp:ListItem Value="light">亮度</asp:ListItem>
                                <asp:ListItem Value="distance">距离</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texturl.ClientID %>">嵌入地址</label>
                        <asp:TextBox ID="Texturl" runat="server" SkinID="TextBoxNormal" Width="200px" Visible="False" CssClass="content-add-input">https://image.baidu.com</asp:TextBox>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <h2 class="content-add-section-title">主题说明</h2>
                <div class="pixel-add-editor-wrap">
                    <p class="content-add-section-desc" style="margin:0;">支持 KindEditor、WangEditor 和 Vditor 三种编辑方式切换。</p>
                    <div>
                        <label class="content-add-label" for="editorSelector">编辑器选择</label><br />
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="pixel-add-editor-select">
                            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                            <option value="wangeditor">WangEditor</option>
                            <option value="vditor">Vditor</option>
                        </select>
                    </div>
                </div>
                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script src="../js/vendors/vditor/index.min.js"></script>
                <script src="../js/vendors/wangeditor/index.js"></script>
                <script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
                <script>
                    var editor;
                    var wangEditorObj;
                    var vditorObj;
                    var currentEditor = 'kindeditor';
                    var vditorReady = false;
                    var pendingVditorHtml = null;
                    var cid = <%=myCid() %>;
                    var ty = "Course";
                    var upjs = '../kindeditor/aspnet/upload_json.aspx?cid=' + cid + '&ty=' + ty;
                    var fmjs = '../kindeditor/aspnet/file_manager_json.aspx?cid=' + cid + '&ty=' + ty;
                    KindEditor.ready(function (K) {
                        editor = K.create('textarea[name="textareaItem"]', {
                            resizeType: 1,
                            newlineTag: "br",
                            uploadJson: upjs,
                            fileManagerJson: fmjs,
                            allowFileManager: true,
                            filterMode: false,
                            afterCreate: function () {
                                this.loadPlugin('autoheight');
                            }
                        });
                    });

                    function initWangEditor() {
                        if (wangEditorObj) return;
                        const { createEditor, createToolbar } = window.wangEditor;
                        const ta = document.getElementsByName('textareaItem')[0];
                        wangEditorObj = createEditor({ selector: '#wangeditor-text', html: editor ? editor.html() : (ta ? ta.value : ''), config: { placeholder: '请输入内容...', MENU_CONF: { uploadImage: { server: upjs, customInsert(res, insertFn) { if (res.error === 0) insertFn(res.url); else alert(res.message || '图片上传失败'); } }, uploadAttachment: { server: upjs, customInsert(res) { if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res); else alert(res.message || '附件上传失败'); } }, uploadFile: { server: upjs, customInsert(res) { if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res); else alert(res.message || '文件上传失败'); } } } } });
                        createToolbar({ editor: wangEditorObj, selector: '#wangeditor-toolbar', config: {} });
                    }

                    function safeHtml2Md(html) {
                        try {
                            if (vditorObj && vditorObj.vditor && vditorObj.vditor.lute) return vditorObj.vditor.lute.HTML2Md(html);
                            var l = Lute.New();
                            return l.HTML2Md(html);
                        } catch (e) { return html; }
                    }

                    function initVditor() {
                        if (vditorObj) return;
                        const ta = document.getElementsByName('textareaItem')[0];
                        let initialContent = editor ? editor.html() : (ta ? ta.value : '');
                        vditorObj = new Vditor('vditor-container', { height: 400, mode: 'ir', upload: { handler: function (files) { LearnSiteEditorUploadHelper.handleVditorUpload(vditorObj, upjs, files); } }, preview: { mode: 'both' }, cache: { enable: false }, after: () => { vditorReady = true; let contentToSet = pendingVditorHtml !== null ? pendingVditorHtml : initialContent; if (contentToSet) vditorObj.setValue(safeHtml2Md(contentToSet)); pendingVditorHtml = null; } });
                    }

                    function switchEditor(type) {
                        currentEditor = type;
                        var kindContainer = document.querySelector('.ke-container');
                        var wangContainer = document.getElementById('wangeditor-wrap');
                        var vditorContainer = document.getElementById('vditor-wrap');
                        var currentHtml = '';
                        if (kindContainer && kindContainer.style.display !== 'none' && editor) currentHtml = editor.html();
                        else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) currentHtml = wangEditorObj.getHtml();
                        else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj && vditorReady) { try { currentHtml = vditorObj.getHTML(); } catch (e) { try { currentHtml = vditorObj.getValue(); } catch (e2) { currentHtml = ''; } } }
                        if (kindContainer) kindContainer.style.display = 'none';
                        if (wangContainer) wangContainer.style.display = 'none';
                        if (vditorContainer) vditorContainer.style.display = 'none';
                        if (type === 'kindeditor') { if (kindContainer) kindContainer.style.display = 'block'; if (editor && currentHtml) editor.html(currentHtml); }
                        else if (type === 'wangeditor') { if (wangContainer) wangContainer.style.display = 'block'; if (!wangEditorObj) initWangEditor(); if (wangEditorObj && currentHtml) wangEditorObj.setHtml(currentHtml); }
                        else if (type === 'vditor') { if (vditorContainer) vditorContainer.style.display = 'block'; if (!vditorObj) { pendingVditorHtml = currentHtml; initVditor(); } else if (vditorReady) vditorObj.setValue(safeHtml2Md(currentHtml)); else pendingVditorHtml = currentHtml; }
                    }

                    function syncContent() {
                        if (editor) editor.sync();
                        const ta = document.getElementsByName('textareaItem')[0];
                        if (!ta) return true;
                        if (currentEditor === 'wangeditor' && wangEditorObj) ta.value = wangEditorObj.getHtml();
                        else if (currentEditor === 'vditor' && vditorObj) {
                            try { ta.value = vditorObj.getHTML(); } catch (e) { try { ta.value = vditorObj.getValue(); } catch (e2) {} }
                        }
                        return true;
                    }
                </script>
                <div class="content-add-editor-stage pixel-add-editor-stage custom-scrollbar">
                    <div id="wangeditor-wrap" style="display:none; width:100%; position:relative; border:1px solid #ccc; z-index:100;">
                        <div id="wangeditor-toolbar" style="border-bottom:1px solid #ccc;"></div>
                        <div id="wangeditor-text" style="height:350px;"></div>
                    </div>
                    <div id="vditor-wrap" style="display:none; width:100%; position:relative; margin-bottom:10px;">
                        <div id="vditor-container"></div>
                    </div>
                    <textarea name="textareaItem"></textarea>
                </div>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">主题为空或说明不完整时，提示信息仍由原页面逻辑输出。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加主题" OnClick="Btnadd_Click" OnClientClick="return syncContent();" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="返回学案" OnClick="BtnCourse_Click" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
</asp:Content>
