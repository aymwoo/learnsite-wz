<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" AutoEventWireup="true" CodeFile="exam.aspx.cs" Inherits="webform_exam" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="bootstrap.min.css" rel="stylesheet">   
    <link href="summernote-bs5.min.css" rel="stylesheet">  
    <link rel="stylesheet" href="github.min.css">   
    <script src="jquery-3.6.0.min.js"></script>    
    <script src="bootstrap.bundle.min.js"></script>   
    <script src="summernote-bs5.min.js"></script>   
    <script src="summernote-zh-CN.min.js"></script>   
    <script src="highlight.min.js"></script>    
    <link href="paper.css" rel="stylesheet">

    <style type="text/css">
        .exam-editor-page {
            width: min(1440px, calc(100% - 32px));
            padding: 20px 0 40px;
        }

        .exam-editor-shell {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 280px;
            gap: 24px;
            align-items: start;
        }

        .exam-editor-main,
        .exam-editor-sidebar {
            min-width: 0;
        }

        .exam-editor-sidebar {
            position: relative;
            min-height: 1px;
        }

        .exam-editor-sidebar .floating-action-bar {
            position: fixed;
            top: 116px;
            right: max(32px, calc((100vw - 1440px) / 2 + 16px));
            width: 280px;
            max-height: calc(100vh - 140px);
            overflow-y: auto;
            transform: none;
            z-index: 30;
            scrollbar-width: thin;
            scrollbar-color: #cbd5e1 transparent;
            display: flex;
            flex-direction: column;
            align-items: stretch;
            gap: 22px;
            padding: 28px 26px;
            border-radius: 28px;
            background: linear-gradient(180deg, rgba(255, 255, 255, 0.98) 0%, rgba(248, 250, 252, 0.96) 100%);
            border: 1px solid rgba(226, 232, 240, 0.95);
            box-shadow: 0 22px 50px rgba(15, 23, 42, 0.1);
        }

        .exam-editor-sidebar .floating-action-bar::-webkit-scrollbar {
            width: 8px;
        }

        .exam-editor-sidebar .floating-action-bar::-webkit-scrollbar-track {
            background: transparent;
        }

        .exam-editor-sidebar .floating-action-bar::-webkit-scrollbar-thumb {
            background: linear-gradient(180deg, #dbe4ee 0%, #cbd5e1 100%);
            border-radius: 999px;
            border: 2px solid transparent;
            background-clip: padding-box;
        }

        .exam-editor-sidebar .floating-action-bar::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(180deg, #cbd5e1 0%, #94a3b8 100%);
            background-clip: padding-box;
        }

        .exam-editor-sidebar .toolbar-group {
            width: 100%;
        }

        .exam-editor-sidebar .toolbar-group-status,
        .exam-editor-sidebar .toolbar-group-actions {
            flex: none;
            justify-content: flex-start;
        }

        .exam-editor-sidebar .toolbar-group-status {
            flex-direction: column;
            align-items: stretch;
            gap: 16px;
            padding-bottom: 6px;
        }

        .exam-editor-sidebar .toolbar-group-actions {
            display: flex;
            flex-direction: column;
            align-items: stretch;
            gap: 16px;
        }

        .exam-editor-sidebar .exam-page-heading {
            gap: 6px;
        }

        .exam-editor-sidebar .exam-page-title {
            font-size: 1.75rem;
            font-weight: 800;
        }

        .exam-editor-sidebar .exam-page-meta {
            font-size: 0.95rem;
            line-height: 1.75;
        }

        .exam-editor-sidebar .floating-score-editor {
            justify-content: flex-start;
            width: fit-content;
            min-width: 140px;
            padding: 12px 18px;
            border-radius: 999px;
            background: linear-gradient(135deg, #e7d88f 0%, #d7c36c 100%);
            color: #6b5b12;
            box-shadow: 0 10px 22px rgba(196, 170, 67, 0.18);
        }

        .exam-side-ai-setting {
            margin-top: 18px;
            padding: 16px 18px;
            border-radius: 20px;
            border: 1px solid #dbe7f3;
            background: linear-gradient(180deg, #f8fbff 0%, #f3f7fb 100%);
        }

        .exam-side-ai-setting.is-enabled {
            border-color: #b7d7ff;
            background: linear-gradient(180deg, #eff6ff 0%, #f8fbff 100%);
        }

        .exam-side-ai-setting__header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }

        .exam-side-ai-setting__title {
            font-size: 0.95rem;
            font-weight: 700;
            color: #0f172a;
        }

        .exam-side-ai-setting__status {
            font-size: 0.82rem;
            font-weight: 700;
            color: #2563eb;
        }

        .exam-side-ai-setting__toggle {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            margin-top: 14px;
        }

        .exam-side-ai-setting__toggle-text {
            font-size: 0.92rem;
            color: #475569;
            line-height: 1.6;
        }

        .exam-side-ai-setting__toggle input {
            width: 18px;
            height: 18px;
            accent-color: #2563eb;
            flex-shrink: 0;
        }

        .exam-editor-sidebar .floating-btn {
            width: 100%;
            min-width: 0;
            justify-content: flex-start;
            padding: 12px 18px;
            border-radius: 999px;
            border: 1px solid rgba(255, 255, 255, 0.45);
            box-shadow: 0 16px 30px rgba(15, 23, 42, 0.12);
            color: #334155;
        }

        .exam-editor-sidebar .floating-btn .btn-text,
        .exam-editor-sidebar .floating-btn .btn-icon {
            color: inherit;
        }

        .exam-editor-sidebar .floating-btn-preview-modal {
            background: linear-gradient(135deg, #c8f1d8 0%, #afe7c5 100%);
            color: #17603a;
        }

        .exam-editor-sidebar .floating-btn-save {
            background: linear-gradient(135deg, #ffe0b5 0%, #ffd19a 100%);
            color: #9a4d00;
        }

        .exam-editor-sidebar .floating-btn-import {
            background: linear-gradient(135deg, #cfe7fb 0%, #b9dbf8 100%);
            color: #0f5d97;
        }

        .exam-editor-sidebar .floating-btn-clear {
            background: linear-gradient(135deg, #ffd1c9 0%, #ffc0b5 100%);
            color: #a33c2d;
        }

        .exam-editor-sidebar .floating-btn-single-editor {
            background: linear-gradient(135deg, #f8bfd4 0%, #f3a7c5 100%);
            color: #a01956;
        }

        .exam-editor-sidebar .floating-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 28px rgba(15, 23, 42, 0.1);
        }

        .exam-editor-main .edit-area {
            max-width: none;
            min-height: calc(100vh - 140px);
            padding: 24px;
            border: 1px solid rgba(148, 163, 184, 0.2);
            border-radius: 28px;
            background: linear-gradient(180deg, #f8fbff 0%, #eef4fb 100%);
            box-shadow: 0 24px 48px rgba(15, 23, 42, 0.08);
        }

        .exam-editor-main .exam-info-edit {
            padding: 28px;
            margin-bottom: 24px;
            border-left: 5px solid #22c55e;
            border-radius: 24px;
            box-shadow: 0 16px 36px rgba(15, 23, 42, 0.08);
        }

        .exam-editor-main .exam-title-edit {
            padding: 18px 22px;
            border-radius: 18px;
            font-size: 2.2rem;
            line-height: 1.2;
        }

        .exam-editor-main .exam-desc-edit {
            min-height: 110px;
            padding: 18px 20px;
            border-radius: 18px;
            font-size: 1.02rem;
        }

        .exam-editor-main .exam-info-label {
            margin-bottom: 10px;
            font-size: 0.95rem;
            color: #64748b;
        }

        .exam-editor-main .exam-ai-setting {
            margin-top: 18px;
            padding: 18px 20px;
            border-radius: 18px;
        }

        .exam-editor-main .question-item {
            margin-bottom: 20px;
            border: 1px solid rgba(148, 163, 184, 0.16);
            border-left: 0;
            border-radius: 24px;
            box-shadow: 0 16px 34px rgba(15, 23, 42, 0.08);
            overflow: hidden;
        }

        .exam-editor-main .question-content-new {
            padding-top: 22px;
            padding-right: 22px;
            padding-bottom: 22px;
            min-height: 220px;
        }

        .exam-editor-main .question-options-container {
            border-radius: 18px;
            padding: 18px;
            background: linear-gradient(180deg, #f8fbff 0%, #f8fafc 100%);
        }

        .exam-editor-main .empty-message,
        .exam-editor-main .quick-add-section {
            border-radius: 24px;
        }

        @media (max-width: 1200px) {
            .exam-editor-shell {
                grid-template-columns: 1fr;
            }

            .exam-editor-sidebar {
                order: -1;
                position: static;
            }

            .exam-editor-sidebar .floating-action-bar {
                position: static;
                top: auto;
                right: auto;
                width: auto;
                max-height: none;
                overflow-y: visible;
                transform: none;
                z-index: auto;
            }

            .exam-editor-sidebar .toolbar-group-actions {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
                gap: 14px;
            }
        }

        @media (max-width: 768px) {
            .exam-editor-page {
                width: calc(100% - 20px);
                padding-top: 16px;
            }

            .exam-editor-shell {
                gap: 16px;
            }

            .exam-editor-sidebar .floating-action-bar,
            .exam-editor-main .edit-area,
            .exam-editor-main .exam-info-edit,
            .exam-editor-main .question-item {
                border-radius: 20px;
            }

            .exam-editor-main .edit-area {
                padding: 16px;
                min-height: auto;
            }

            .exam-editor-main .exam-title-edit {
                font-size: 1.7rem;
            }

            .exam-editor-sidebar .toolbar-group-actions {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <div class="container exam-editor-page">
        <div class="exam-editor-shell">
            <div class="exam-editor-main">
                <div class="panel edit-area" id="editArea">
                </div>
            </div>
            <aside class="exam-editor-sidebar">
                <div class="floating-action-bar" title="测验工具栏">
                    <div class="toolbar-group toolbar-group-status">
                        <div class="exam-page-heading">
                            <div class="exam-page-eyebrow">课堂测验</div>
                            <div class="exam-page-title">测验编辑器</div>
                            <div class="exam-page-meta">统一设置标题、描述、题目内容与 AI 评价方式。</div>
                        </div>
                        <label class="floating-score-editor">
                            <span class="btn-icon">💰</span>
                            <span id="examScore" class="btn-text">00 分</span>
                        </label>
                        <div class="exam-side-ai-setting" id="examSideAiSetting">
                            <div class="exam-side-ai-setting__header">
                                <span class="exam-side-ai-setting__title">AI 评测</span>
                                <span class="exam-side-ai-setting__status" id="examSideAiStatus">当前试卷未启用</span>
                            </div>
                            <label class="exam-side-ai-setting__toggle">
                                <span class="exam-side-ai-setting__toggle-text">启用 AI 评测，提交后生成 AI 测验评估。</span>
                                <input type="checkbox" id="examSideAiToggle" onchange="updateExamAiAssessment(this.checked)">
                            </label>
                        </div>
                    </div>
                    <div class="toolbar-group toolbar-group-actions">
                        <button type="button" class="floating-btn floating-btn-preview-modal" id="previewModalBtn" title="模态预览">
                            <span class="btn-icon">👁</span>
                            <span class="btn-text">模态预览</span>
                        </button>
                        <button type="button" class="floating-btn floating-btn-save" id="saveExamBtn" title="保存为JSON文件">
                            <span class="btn-icon">💾</span>
                            <span class="btn-text">保存作品</span>
                        </button>
                        <button type="button" class="floating-btn floating-btn-import" id="importBtn" title="导入JSON文件">
                            <span class="btn-icon">📁</span>
                            <span class="btn-text">导入题库</span>
                        </button>
                        <button type="button" class="floating-btn floating-btn-clear" id="clearExamBtn" title="清空所有试题">
                            <span class="btn-icon">🗑️</span>
                            <span class="btn-text">清空题目</span>
                        </button>
                        <a href="#" class="floating-btn floating-btn-single-editor" onclick ="returnurl();" title="返回学案">
                            <span class="btn-icon">↩</span>
                            <span class="btn-text">返回学案</span>
                        </a>
                    </div>
                    <input type="file" id="importFileInput" accept=".json" style="display: none;">
                </div>
            </aside>
        </div>
    </div>
    
    <!-- 预览模态框 -->
    <div class="preview-modal" id="previewModal">
        <div class="preview-content">
            <span class="close">&times;</span>
            <div id="previewArea">
                <!-- 预览内容将在这里动态生成 -->
            </div>
        </div>
    </div>
    <input id="HiddenCid" type="hidden" value="<%=Cid %>" />
    <input id="HiddenEid" type="hidden" value="<%=Eid %>" />
    <input id="HiddenExamjson" type="hidden" value="<%=Examjson %>" />
    <script type="text/javascript" >
        function returnurl() {
            if (confirm('是否离开当前活动页面？请先保存作品。') == true) {
                window.location.href = "<%=Fpage %>"
            }
        }

</script>
    <!-- 引入外部JavaScript文件 -->
    <script src="exam.js"></script> 

</asp:Content>
