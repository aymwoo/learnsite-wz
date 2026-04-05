<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="missionadd.aspx.cs" Inherits="Teacher_missionadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .mission-add-page {
            --content-add-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --content-add-hero-bg: linear-gradient(135deg, #312e81 0%, #4338ca 55%, #6366f1 100%);
            --content-add-primary-bg: #4f46e5;
            --content-add-primary-hover: #4338ca;
            --content-add-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
        }

        .mission-add-editor-stage textarea {
            width: 100%;
            height: 550px;
        }
        
        .editor-ai-layout {
            display: flex;
            gap: 1.5rem;
            align-items: flex-start;
        }
        
        .editor-container {
            flex: 1;
            min-width: 0;
        }
        
        .ai-assistant-panel {
            width: 350px;
            flex-shrink: 0;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
            display: flex;
            flex-direction: column;
            overflow: hidden;
            position: sticky;
            top: 20px;
        }
        
        .ai-panel-header {
            background: linear-gradient(135deg, #4f46e5 0%, #6366f1 100%);
            color: #ffffff;
            padding: 1rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .ai-panel-body {
            padding: 1rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        
        .ai-prompt-input {
            width: 100%;
            height: 80px;
            padding: 0.75rem;
            border: 1px solid #cbd5e1;
            border-radius: 0.5rem;
            resize: none;
            font-family: inherit;
            font-size: 0.9rem;
        }
        
        .ai-prompt-input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }
        
        .ai-generate-btn {
            background: #4f46e5;
            color: #ffffff;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .ai-generate-btn:hover {
            background: #4338ca;
        }
        
        .ai-generate-btn:disabled {
            background: #94a3b8;
            cursor: not-allowed;
        }
        
        .ai-result-area {
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            padding: 0.75rem;
            background: #f8fafc;
            min-height: 200px;
            max-height: 350px;
            overflow-y: auto;
            font-size: 0.9rem;
            line-height: 1.5;
            color: #334155;
            white-space: pre-wrap;
        }
        
        .ai-panel-footer {
            padding: 1rem;
            border-top: 1px solid #e2e8f0;
            display: flex;
            gap: 0.5rem;
        }
        
        .ai-action-btn {
            flex: 1;
            padding: 0.5rem;
            border-radius: 0.375rem;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            text-align: center;
            border: 1px solid #cbd5e1;
            background: #ffffff;
            color: #475569;
            transition: all 0.2s;
        }
        
        .ai-action-btn:hover {
            background: #f1f5f9;
            color: #0f172a;
        }
        
        .ai-action-btn.primary {
            background: #ecfdf5;
            border-color: #34d399;
            color: #059669;
        }
        
        .ai-action-btn.primary:hover {
            background: #d1fae5;
        }
        
        .ai-loading-spinner {
            display: none;
            width: 1rem;
            height: 1rem;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>

    <div class="content-add-page mission-add-page">
        <div class="content-add-shell is-medium">
            <section class="content-add-hero">
                <div class="content-add-hero-content">
                    <span class="content-add-eyebrow">Add Learning Activity</span>
                    <h1 class="content-add-title">添加学习活动</h1>
                    <p class="content-add-subtitle">保留活动标题、作品类型、提交方式、分组协作、远程图片和评价量规等原有业务逻辑，只重构页面布局与编辑体验。</p>
                </div>
            </section>

            <section class="content-add-panel">
                <h2 class="content-add-section-title">活动设置</h2>
                <p class="content-add-section-desc">以下字段仍沿用当前后台逻辑与提交方式，创建成功后继续返回当前学案页面。</p>
                <div class="content-add-grid">
                    <div class="content-add-field content-add-field-wide">
                        <label class="content-add-label" for="<%= Texttitle.ClientID %>">活动名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" Width="200px" CssClass="content-add-input"></asp:TextBox>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= DDLmfiletype.ClientID %>">作品类型</label>
                        <asp:DropDownList ID="DDLmfiletype" runat="server" Width="60px" Font-Names="Arial" CssClass="content-add-select"></asp:DropDownList>
                    </div>

                    <div class="content-add-field">
                        <label class="content-add-label" for="<%= DDLMgid.ClientID %>">评价标准</label>
                        <asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt" Width="160px" Font-Names="Arial" CssClass="content-add-select"></asp:DropDownList>
                    </div>

                    <div class="content-add-field content-add-field-wide">
                        <span class="content-add-label">活动选项</span>
                        <div class="content-add-checks">
                            <asp:CheckBox ID="CheckUpload" runat="server" Text="是否提交" Checked="True" />
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                            <asp:CheckBox ID="CheckGroup" runat="server" Text="小组合作" />
                            <asp:CheckBox ID="CheckRemote" runat="server" Text="远程图片" ToolTip="自动下载远程图片，有时失效！" />
                            <asp:CheckBox ID="CheckMicoWorld" runat="server" Text="上次作品" Checked="False" ToolTip="显示上一节课作品，适合项目学习" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-add-editor">
                <link href="https://cdn.jsdelivr.net/npm/@wangeditor/editor@5.1.23/dist/css/style.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vditor/dist/index.css" />
                <script src="https://cdn.jsdelivr.net/npm/vditor/dist/index.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@wangeditor/editor@5.1.23/dist/index.js"></script>

                <div class="content-add-editor-toolbar">
                    <div>
                        <h2 class="content-add-section-title">活动说明</h2>
                        <p class="content-add-section-desc">支持 KindEditor、WangEditor 和 Vditor 三种编辑方式切换，仍通过原有 `textareaItem` 完成内容提交。</p>
                    </div>
                    <div>
                        <label class="content-add-label" for="editorSelector">编辑器选择</label><br />
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="content-add-editor-select">
                            <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                            <option value="wangeditor">富文本编辑器 (WangEditor)</option>
                            <option value="vditor">Markdown编辑器 (Vditor)</option>
                        </select>
                    </div>
                </div>

                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
                <script>
                    var kindEditorObj;
                    var wangEditorObj;
                    var vditorObj;
                    var currentEditor = 'kindeditor';

                    var cid = <%=myCid() %>;
                    var ty = "Course";
                    var upjs = '../kindeditor/aspnet/upload_json.aspx?cid=' + cid + '&Ty=' + ty;
                    var fmjs = '../kindeditor/aspnet/file_manager_json.aspx?cid=' + cid + '&Ty=' + ty;

                    KindEditor.ready(function (K) {
                        kindEditorObj = K.create('textarea[name="textareaItem"]', {
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
                        var ta = document.getElementsByName('textareaItem')[0];
                        if (currentEditor === 'kindeditor') {
                            if (kindEditorObj) {
                                ta.value = kindEditorObj.html();
                            }
                        } else if (currentEditor === 'wangeditor') {
                            if (wangEditorObj) {
                                ta.value = wangEditorObj.getHtml();
                            }
                        } else if (currentEditor === 'vditor') {
                            if (vditorObj) {
                                ta.value = vditorObj.getHTML();
                            }
                        }
                        return true;
                    }
                </script>

                <div class="editor-ai-layout">
                    <div class="editor-container">
                        <div class="content-add-editor-stage mission-add-editor-stage custom-scrollbar" style="width: 100%; max-width: 830px;">
                            <div id="wangeditor-wrap" style="display:none; width: 100%; position:relative; border: 1px solid #ccc; z-index: 100;">
                                <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
                                <div id="wangeditor-text" style="height: 350px;"></div>
                            </div>

                            <div id="vditor-wrap" style="display:none; width: 100%; position:relative; margin-bottom: 10px;">
                                <div id="vditor-container"></div>
                            </div>

                            <textarea name="textareaItem"></textarea>
                        </div>
                    </div>
                    
                    <div class="ai-assistant-panel">
                        <div class="ai-panel-header">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2a2 2 0 0 1 2 2c-.11.89-.34 2.08-1.52 3.16C11.3 8.24 10.38 9 8 9a2 2 0 0 1-2-2c.11-.89.34-2.08 1.52-3.16C8.7 2.76 9.62 2 12 2Z"></path><path d="M12 10v12"></path><path d="M12 10a2 2 0 0 0-2 2c.11.89.34 2.08 1.52 3.16.89.8 1.81 1.56 4.19 1.56a2 2 0 0 0 2-2c-.11-.89-.34-2.08-1.52-3.16C15.3 10.76 14.38 10 12 10Z"></path></svg>
                            AI 教学助手
                        </div>
                        <div class="ai-panel-body">
                            <div>
                                <label style="font-size: 0.85rem; color: #64748b; margin-bottom: 0.5rem; display: block;">描述您需要的教学内容：</label>
                                <textarea id="ai-prompt" class="ai-prompt-input" placeholder="例如：帮我生成一份关于《Python条件判断》的学案，包含学习目标、示例代码和练习题。"></textarea>
                            </div>
                            <button type="button" id="ai-generate-btn" class="ai-generate-btn" onclick="generateAIContent()">
                                <div id="ai-loading" class="ai-loading-spinner"></div>
                                <span id="ai-btn-text">生成内容</span>
                            </button>
                            <div>
                                <label style="font-size: 0.85rem; color: #64748b; margin-bottom: 0.5rem; display: block;">生成结果：</label>
                                <div id="ai-result" class="ai-result-area"></div>
                            </div>
                        </div>
                        <div class="ai-panel-footer">
                            <button type="button" class="ai-action-btn" onclick="copyAIContent()">复制结果</button>
                            <button type="button" class="ai-action-btn primary" onclick="insertAIContent()">一键插入编辑器</button>
                        </div>
                    </div>
                </div>
                
                <script>
                    function generateAIContent() {
                        var prompt = document.getElementById('ai-prompt').value.trim();
                        if (!prompt) {
                            alert('请输入提示词');
                            return;
                        }
                        
                        var btn = document.getElementById('ai-generate-btn');
                        var btnText = document.getElementById('ai-btn-text');
                        var loading = document.getElementById('ai-loading');
                        var resultArea = document.getElementById('ai-result');
                        
                        btn.disabled = true;
                        btnText.innerText = '正在生成...';
                        loading.style.display = 'block';
                        resultArea.innerHTML = '<span style="color:#64748b;">AI 正在努力思考中，这可能需要一点时间...</span>';
                        
                        // Use jQuery ajax since it's likely available or fetch
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "aiprovider_api.ashx", true);
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        xhr.onreadystatechange = function() {
                            if (xhr.readyState === 4) {
                                btn.disabled = false;
                                btnText.innerText = '生成内容';
                                loading.style.display = 'none';
                                
                                if (xhr.status === 200) {
                                    try {
                                        var res = JSON.parse(xhr.responseText);
                                        if (res.success) {
                                            // Handle markdown slightly - convert some basic stuff or let vditor handle it
                                            var text = res.data;
                                            resultArea.innerText = text;
                                        } else {
                                            resultArea.innerHTML = '<span style="color:#ef4444;">错误：' + res.msg + '</span>';
                                        }
                                    } catch (e) {
                                        resultArea.innerHTML = '<span style="color:#ef4444;">解析响应失败</span>';
                                    }
                                } else {
                                    resultArea.innerHTML = '<span style="color:#ef4444;">请求失败，状态码：' + xhr.status + '</span>';
                                }
                            }
                        };
                        xhr.send("action=chat&prompt=" + encodeURIComponent(prompt));
                    }
                    
                    function copyAIContent() {
                        var resultArea = document.getElementById('ai-result');
                        var text = resultArea.innerText;
                        if (!text || text.indexOf('AI 正在努力思考中') !== -1) {
                            alert('没有可复制的内容');
                            return;
                        }
                        
                        navigator.clipboard.writeText(text).then(function() {
                            alert('已复制到剪贴板');
                        }, function(err) {
                            alert('复制失败: ' + err);
                        });
                    }
                    
                    function formatTextToHtml(text) {
                        return text.replace(/\n/g, '<br/>');
                    }
                    
                    function insertAIContent() {
                        var resultArea = document.getElementById('ai-result');
                        var text = resultArea.innerText;
                        if (!text || text.indexOf('AI 正在努力思考中') !== -1 || text.indexOf('错误：') === 0) {
                            alert('没有可插入的内容');
                            return;
                        }
                        
                        if (currentEditor === 'kindeditor') {
                            if (kindEditorObj) {
                                kindEditorObj.insertHtml(formatTextToHtml(text));
                            }
                        } else if (currentEditor === 'wangeditor') {
                            if (wangEditorObj) {
                                // WangEditor V5
                                wangEditorObj.dangerouslyInsertHtml(formatTextToHtml(text));
                            }
                        } else if (currentEditor === 'vditor') {
                            if (vditorObj) {
                                vditorObj.insertValue(text);
                            }
                        }
                        alert('已成功插入到编辑器');
                    }
                </script>
            </section>

            <section class="content-add-feedback">
                <h2 class="content-add-section-title">处理反馈</h2>
                <p class="content-add-section-desc">内容或标题为空时，错误信息仍按原逻辑显示。</p>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </section>

            <section class="content-add-actions">
                <asp:Button ID="Btnadd" runat="server" Text="添加活动" OnClick="Btnadd_Click" OnClientClick="return syncContent();" CssClass="content-add-primary" />
                <asp:Button ID="BtnCourse" runat="server" Text="返回学案" OnClick="BtnCourse_Click" CssClass="content-add-secondary" />
            </section>
        </div>
    </div>
</asp:Content>
