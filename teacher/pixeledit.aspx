<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"  StylesheetTheme="Teacher" Validaterequest="false"  AutoEventWireup="true" CodeFile="pixeledit.aspx.cs" Inherits="Teacher_pixeledit" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../App_Themes/Teacher/admin-form.css" rel="stylesheet" />
    <link href="../js/vendors/wangeditor/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
    <style type="text/css">
        .pixel-edit-page {
            --admin-form-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --admin-form-hero-bg: linear-gradient(135deg, #0f172a 0%, #1d4ed8 58%, #38bdf8 100%);
            --admin-form-hero-shadow: 0 22px 45px -28px rgba(37, 99, 235, 0.78);
            --admin-form-primary-bg: #2563eb;
            --admin-form-primary-hover: #1d4ed8;
            --admin-form-primary-shadow: 0 14px 24px -18px rgba(37, 99, 235, 0.85);
            --admin-form-secondary-border: #bfdbfe;
            --admin-form-secondary-bg: #eff6ff;
            --admin-form-secondary-hover: #dbeafe;
            --admin-form-secondary-fg: #1d4ed8;
        }

        .pixel-edit-page .admin-form-grid {
            align-items: start;
        }

        .pixel-edit-page .admin-form-checks {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            min-height: 2.95rem;
            padding: 0.85rem 0.95rem;
            border: 1px solid #cbd5e1;
            border-radius: 0.9rem;
            background: #ffffff;
            box-sizing: border-box;
            align-items: center;
        }

        .pixel-edit-page .admin-form-checks input {
            margin-right: 0.35rem;
        }

        .pixel-edit-page .admin-form-checks label {
            display: inline-flex;
            align-items: center;
            min-height: 1.4rem;
            margin: 0;
            color: #0f172a;
            font-weight: 600;
        }

        .pixel-edit-page .admin-form-type-note {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            align-items: center;
            margin-top: 1rem;
            padding: 1rem 1.1rem;
            border: 1px solid #dbeafe;
            border-radius: 1rem;
            background: linear-gradient(135deg, #eff6ff 0%, #f8fbff 100%);
        }

        .pixel-edit-page .admin-form-chip {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            min-height: 2rem;
            padding: 0.2rem 0.8rem;
            border-radius: 9999px;
            font-size: 0.82rem;
            font-weight: 700;
        }

        .pixel-edit-page .admin-form-chip-icon {
            width: 1.15rem;
            height: 1.15rem;
            object-fit: contain;
            flex-shrink: 0;
        }

        .pixel-edit-page .admin-form-type-copy {
            flex: 1;
            min-width: 220px;
            color: #334155;
            line-height: 1.75;
        }

        .pixel-edit-page .admin-form-hint {
            margin: 0;
            color: #64748b;
            font-size: 0.88rem;
            line-height: 1.7;
        }

        .pixel-edit-page .admin-form-list-item strong {
            display: block;
            margin-bottom: 0.35rem;
            color: #0f172a;
        }

        .pixel-edit-page .admin-form-device-list {
            padding: 1rem 1.05rem;
            border: 1px solid #dbeafe;
            border-radius: 1rem;
            background: #f8fbff;
        }

        .pixel-edit-page .admin-form-device-list table,
        .pixel-edit-page .admin-form-device-list tbody,
        .pixel-edit-page .admin-form-device-list tr,
        .pixel-edit-page .admin-form-device-list td {
            display: block;
        }

        .pixel-edit-page .admin-form-device-list label {
            display: inline-flex;
            align-items: center;
            margin-right: 1rem;
            margin-bottom: 0.55rem;
            color: #334155;
        }

        .pixel-edit-page .admin-form-device-list input {
            margin-right: 0.35rem;
        }

        .pixel-edit-page .admin-form-editor-toolbar {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 1rem;
            align-items: center;
            margin-bottom: 1rem;
        }

        .pixel-edit-page .admin-form-editor-select {
            min-height: 2.6rem;
            padding: 0 2rem 0 0.9rem;
            border: 1px solid #bfdbfe;
            border-radius: 0.9rem;
            background: #eff6ff;
            color: #1d4ed8;
            font-size: 0.88rem;
            font-weight: 700;
            cursor: pointer;
            appearance: none;
            -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%23475569' stroke-width='2.5' stroke-linecap='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 0.8rem center;
        }

        .pixel-edit-page .admin-form-editor-stage #wangeditor-wrap,
        .pixel-edit-page .admin-form-editor-stage #vditor-wrap,
        .pixel-edit-page .admin-form-editor-stage textarea,
        .pixel-edit-page .admin-form-editor-stage .ke-container {
            width: 100% !important;
            max-width: 100%;
        }

        .pixel-edit-page .admin-form-editor-stage textarea {
            min-height: 520px;
        }

        .pixel-edit-page .admin-form-link-inline {
            color: #2563eb;
            font-weight: 700;
            text-decoration: none;
            word-break: break-all;
        }

        .pixel-edit-page .admin-form-link-inline:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .pixel-edit-page .admin-form-editor-select {
                width: 100%;
            }
        }
    </style>

    <div class="admin-form-page pixel-edit-page">
        <div class="admin-form-shell">
            <section class="admin-form-hero">
                <div class="admin-form-hero-content">
                    <div class="admin-form-eyebrow">Edit Custom Activity</div>
                    <h1 class="admin-form-title">编辑在线活动</h1>
                    <p class="admin-form-subtitle">保留当前活动类型、保存逻辑和学生端入口，只优化页面层次、活动说明和专属配置展示，方便教师快速完成修改。</p>
                </div>
            </section>

            <section class="admin-form-panel">
                <div class="admin-form-toolbar">
                    <div>
                        <h2 class="admin-form-section-title">活动设置</h2>
                        <p class="admin-form-section-desc">当前类型由活动创建时决定。这里继续沿用原有业务字段，只调整输入布局与说明文案。</p>
                    </div>
                </div>

                <div class="admin-form-grid">
                    <div class="admin-form-field admin-form-field-wide">
                        <label class="admin-form-label" for="<%= Texttitle.ClientID %>">活动名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" CssClass="admin-form-input"></asp:TextBox>
                    </div>

                    <div class="admin-form-field">
                        <label class="admin-form-label" for="<%= DDLTitle.ClientID %>">当前活动类型</label>
                        <asp:DropDownList ID="DDLTitle" runat="server" Font-Size="Medium" Enabled="False" AutoPostBack="True" CssClass="admin-form-select admin-form-readonly">
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

                    <div class="admin-form-field">
                        <label class="admin-form-label" for="<%= DDLMgid.ClientID %>">评价标准</label>
                        <asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt" Font-Names="Arial" CssClass="admin-form-select"></asp:DropDownList>
                    </div>

                    <div class="admin-form-field">
                        <span class="admin-form-label">发布设置</span>
                        <div class="admin-form-checks">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                        </div>
                    </div>

                    <div class="admin-form-field admin-form-field-wide">
                        <div class="admin-form-type-note">
                            <span class="admin-form-chip" style='background:<%= GetActivityBadgeBackground() %>;color:<%= GetActivityBadgeForeground() %>;'>
                                <img src="<%= GetActivityIconUrl() %>" alt="" class="admin-form-chip-icon" />
                                <%= GetActivityDisplayName() %>
                            </span>
                            <div class="admin-form-type-copy"><%= GetActivityDescription() %></div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="admin-form-list">
                <h2 class="admin-form-section-title">开展方式</h2>
                <p class="admin-form-section-desc">当前活动会在教师端统一进入说明预览页，再由学生端按照类型跳转到对应工具页面开展学习任务。</p>
                <div class="admin-form-list-items">
                    <div class="admin-form-list-item">
                        <strong>教师端预览入口</strong>
                        当前活动修改后，课程列表仍从 `pixelshow.aspx` 进入预览和再次编辑。
                    </div>
                    <div class="admin-form-list-item">
                        <strong>学生端实际入口</strong>
                        <span class="admin-form-link-inline"><%= GetStudentEntryUrl() %></span>
                    </div>
                    <div class="admin-form-list-item">
                        <strong>本页编辑重点</strong>
                        <%= GetEditFocusText() %>
                    </div>
                </div>
            </section>

            <asp:Panel ID="PanelDeviceConfig" runat="server" CssClass="admin-form-panel" Visible="False">
                <h2 class="admin-form-section-title">物联网设备设置</h2>
                <p class="admin-form-section-desc">学生端会根据这里勾选的设备项展示可用的控制或采集能力，建议只保留本课需要的设备。</p>
                <div class="admin-form-device-list">
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
            </asp:Panel>

            <asp:Panel ID="PanelIframeConfig" runat="server" CssClass="admin-form-panel" Visible="False">
                <h2 class="admin-form-section-title">嵌入网页设置</h2>
                <p class="admin-form-section-desc">学生端会直接加载该地址开展操作。建议优先使用站内页面或可信链接，避免失效地址影响课堂使用。</p>
                <div class="admin-form-grid">
                    <div class="admin-form-field admin-form-field-wide">
                        <label class="admin-form-label" for="<%= Texturl.ClientID %>">嵌入地址</label>
                        <asp:TextBox ID="Texturl" runat="server" SkinID="TextBoxNormal" Visible="False" CssClass="admin-form-input">https://image.baidu.com</asp:TextBox>
                        <p class="admin-form-hint">当前地址会保存到活动扩展参数中，学生打开活动时直接加载。</p>
                    </div>
                </div>
            </asp:Panel>

            <section class="admin-form-panel">
                <div class="admin-form-editor-toolbar">
                    <div>
                        <h2 class="admin-form-section-title">活动说明</h2>
                        <p class="admin-form-section-desc">支持 KindEditor、WangEditor 和 Vditor 三种编辑方式切换，提交前会自动同步到原有 `mcontent` 字段。</p>
                    </div>
                    <div>
                        <label class="admin-form-label" for="editorSelector">编辑器</label><br />
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="admin-form-editor-select">
                            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                            <option value="wangeditor">富文本编辑器 (WangEditor)</option>
                            <option value="vditor">Markdown 编辑器 (Vditor)</option>
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
                    var lastVditorMarkdown = null;
                    var lastVditorHtml = '';
                    var vditorReady = false;
                    var pendingVditorHtml = null;
                    var cid = <%=myCid() %>;
                    var ty = 'Course';
                    var upjs = '../kindeditor/aspnet/upload_json.aspx?cid=' + cid + '&ty=' + ty;
                    var fmjs = '../kindeditor/aspnet/file_manager_json.aspx?cid=' + cid + '&ty=' + ty;

                    KindEditor.ready(function (K) {
                        editor = K.create('textarea[name="ctl00$Content$mcontent"]', {
                            resizeType: 1,
                            newlineTag: 'br',
                            uploadJson: upjs,
                            fileManagerJson: fmjs,
                            allowFileManager: true,
                            filterMode: false,
                            afterCreate: function () {
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

                <div class="admin-form-editor-stage">
                    <div id="wangeditor-wrap" style="display:none; width:100%; position:relative; border:1px solid #cbd5e1; z-index:100; margin-bottom:10px; border-radius:14px; overflow:hidden;">
                        <div id="wangeditor-toolbar" style="border-bottom:1px solid #cbd5e1;"></div>
                        <div id="wangeditor-text" style="height:360px;"></div>
                    </div>
                    <div id="vditor-wrap" style="display:none; width:100%; position:relative; margin-bottom:10px;">
                        <div id="vditor-container"></div>
                    </div>
                    <textarea id="mcontent" runat="server"></textarea>
                </div>
            </section>

            <section class="admin-form-feedback">
                <h2 class="admin-form-section-title">处理反馈</h2>
                <p class="admin-form-section-desc">标题或说明为空时，系统仍沿用原有提示逻辑输出反馈信息。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="admin-form-actions">
                <div class="admin-form-action-row">
                    <asp:Button ID="Btnedit" runat="server" Text="保存修改" OnClick="Btnedit_Click" OnClientClick="return syncContent();" CssClass="admin-form-btn admin-form-btn--primary" />
                    <asp:Button ID="BtnCourse" runat="server" Text="返回学案" OnClick="BtnCourse_Click" CssClass="admin-form-btn admin-form-btn--secondary" />
                </div>
            </section>
        </div>
    </div>
</asp:Content>
