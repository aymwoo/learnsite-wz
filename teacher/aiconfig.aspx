<%@ Page Title="AI 配置中心" Language="C#" MasterPageFile="~/teacher/Teach.master" AutoEventWireup="true" CodeFile="aiconfig.aspx.cs" Inherits="Teacher_aiconfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .ai-config {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
        }

        .ai-config * {
            box-sizing: border-box;
        }

        .lesson-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .lesson-hero {
            position: relative;
            overflow: hidden;
            border: 1px solid #1e3a8a;
            border-radius: 0.75rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(99, 102, 241, 0.22), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #312e81 52%, #4f46e5 100%);
            color: #eff6ff;
            box-shadow: 0 28px 60px rgba(79, 70, 229, 0.22);
        }

        .lesson-hero__content {
            position: relative;
            z-index: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 16px;
            align-items: center;
        }

        .lesson-hero__title {
            margin: 0;
            font-size: 28px;
            line-height: 1.15;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .lesson-hero__subtitle {
            max-width: 760px;
            margin: 8px 0 0;
            font-size: 14px;
            line-height: 1.8;
            color: rgba(239, 246, 255, 0.88);
        }

        .lesson-card {
            min-width: 0;
            border: 1px solid var(--ls-border);
            border-radius: 0.75rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
        }

        .lesson-theme--blue   { background: linear-gradient(160deg, #ffffff 0%, #f0f7ff 100%); }
        .lesson-theme--purple { background: linear-gradient(160deg, #ffffff 0%, #f5f3ff 100%); }
        .lesson-theme--teal   { background: linear-gradient(160deg, #ffffff 0%, #f0fdfa 100%); }

        .lesson-card__head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 12px;
            align-items: center;
            padding: 20px 24px 0;
        }

        .lesson-card__title {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.02em;
            color: var(--ls-text);
        }

        .lesson-card__desc {
            margin: 4px 0 0;
            font-size: 13px;
            color: var(--ls-muted);
        }

        .lesson-card__body {
            padding: 18px 24px 24px;
        }

        /* Action buttons in card headers */
        .ai-head-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            align-items: center;
        }

        .ai-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            min-height: 36px;
            padding: 0 14px;
            border-radius: 0.375rem;
            border: none;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.15s ease, box-shadow 0.15s ease, background-color 0.15s ease;
            text-decoration: none;
        }

        .ai-btn:hover { transform: translateY(-1px); }

        .ai-btn--primary {
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25);
        }

        .ai-btn--primary:hover { box-shadow: 0 6px 16px rgba(37, 99, 235, 0.35); }

        .ai-btn--green {
            background: linear-gradient(135deg, #16a34a 0%, #15803d 100%);
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(22, 163, 74, 0.25);
        }

        .ai-btn--green:hover { box-shadow: 0 6px 16px rgba(22, 163, 74, 0.35); }

        .ai-btn--teal {
            background: linear-gradient(135deg, #0d9488 0%, #0f766e 100%);
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(13, 148, 136, 0.25);
        }

        .ai-btn--teal:hover { box-shadow: 0 6px 16px rgba(13, 148, 136, 0.35); }

        .ai-btn--purple {
            background: linear-gradient(135deg, #7c3aed 0%, #6d28d9 100%);
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(124, 58, 237, 0.25);
        }

        .ai-btn--purple:hover { box-shadow: 0 6px 16px rgba(124, 58, 237, 0.35); }

        /* Provider cards grid */
        .ai-providers-grid {
            display: grid;
            gap: 16px;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        }

        .ai-provider-card {
            border-radius: 0.625rem;
            border: 1px solid #e2e8f0;
            background: #ffffff;
            box-shadow: 0 4px 12px rgba(15, 23, 42, 0.05);
            overflow: hidden;
            transition: box-shadow 0.2s ease, transform 0.15s ease;
        }

        .ai-provider-card:hover {
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.1);
            transform: translateY(-2px);
        }

        .ai-provider-card--default {
            border-color: #22c55e;
            box-shadow: 0 4px 12px rgba(34, 197, 94, 0.15), 0 0 0 1px #22c55e;
        }

        .ai-provider-card__body { padding: 18px 18px 0; }
        .ai-provider-card__foot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 18px 14px;
            margin-top: 14px;
            border-top: 1px solid #f1f5f9;
        }

        .ai-provider-card__name {
            font-size: 17px;
            font-weight: 800;
            color: #0f172a;
            margin: 0 0 2px;
        }

        .ai-provider-card__sub {
            font-size: 12px;
            color: #64748b;
        }

        .ai-provider-card__meta {
            margin-top: 12px;
            font-size: 13px;
            color: #334155;
        }

        .ai-badge {
            display: inline-flex;
            align-items: center;
            padding: 2px 10px;
            border-radius: 9999px;
            font-size: 11px;
            font-weight: 700;
            border: 1px solid;
        }

        .ai-badge--green  { background: #dcfce7; color: #15803d; border-color: #bbf7d0; }
        .ai-badge--gray   { background: #f1f5f9; color: #475569; border-color: #cbd5e1; }
        .ai-badge--active { background: #dbeafe; color: #1e40af; border-color: #bfdbfe; }

        .ai-card-action-btn {
            display: inline-flex;
            align-items: center;
            padding: 4px 12px;
            border-radius: 0.25rem;
            border: none;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

        .ai-card-action-btn--edit  { background: #eff6ff; color: #2563eb; }
        .ai-card-action-btn--edit:hover  { background: #dbeafe; }
        .ai-card-action-btn--del   { background: #fff1f2; color: #dc2626; }
        .ai-card-action-btn--del:hover   { background: #fee2e2; }
        .ai-card-action-btn--def   { background: #f0fdf4; color: #16a34a; border: 1px solid #bbf7d0; }
        .ai-card-action-btn--def:hover   { background: #dcfce7; }

        /* Skills grid */
        .ai-skills-grid {
            display: grid;
            gap: 16px;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
        }

        .ai-skill-card {
            border-radius: 0.625rem;
            border: 1px solid #e2e8f0;
            background: #ffffff;
            box-shadow: 0 4px 12px rgba(15, 23, 42, 0.05);
            display: flex;
            flex-direction: column;
            transition: box-shadow 0.2s ease, transform 0.15s ease;
        }

        .ai-skill-card:hover {
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.1);
            transform: translateY(-2px);
        }

        .ai-skill-card__body { padding: 18px 18px 12px; flex: 1; }
        .ai-skill-card__foot {
            display: flex;
            justify-content: flex-end;
            gap: 8px;
            padding: 10px 18px 14px;
            border-top: 1px solid #f1f5f9;
            background: #fafafa;
            border-radius: 0 0 0.625rem 0.625rem;
        }

        .ai-skill-card__name {
            font-size: 16px;
            font-weight: 800;
            color: #0f172a;
            margin: 0 0 10px;
        }

        .ai-skill-card__prompt {
            font-size: 13px;
            color: #475569;
            line-height: 1.7;
            white-space: pre-wrap;
            word-break: break-word;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical;
            overflow: hidden;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            padding: 10px 12px;
        }

        /* Empty states */
        .ai-empty {
            padding: 40px 20px;
            text-align: center;
            color: #94a3b8;
            font-size: 14px;
        }

        /* Scope tags */
        .ai-scope-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            margin-top: 10px;
        }

        .ai-scope-tag {
            display: inline-flex;
            align-items: center;
            padding: 2px 10px;
            border-radius: 9999px;
            font-size: 11px;
            font-weight: 700;
            background: #ede9fe;
            color: #5b21b6;
            border: 1px solid #ddd6fe;
        }

        @media (max-width: 768px) {
            .ai-config { padding: 16px; }
            .lesson-hero { padding: 18px 16px; }
            .lesson-hero__title { font-size: 22px; }
            .lesson-card__head { padding: 16px 16px 0; }
            .lesson-card__body { padding: 14px 16px 18px; }
            .ai-providers-grid,
            .ai-skills-grid { grid-template-columns: 1fr; }
        }
    </style>

    <div class="ai-config">
        <div class="lesson-shell">

            <!-- Hero Banner -->
            <div class="lesson-hero">
                <div class="lesson-hero__content">
                    <div>
                        <h1 class="lesson-hero__title">AI 配置中心</h1>
                        <p class="lesson-hero__subtitle">管理 AI 服务提供商、系统提示词与技能配置，为课堂 AI 功能提供支撑。</p>
                    </div>
                </div>
            </div>

            <!-- Section 1: AI Provider -->
            <section class="lesson-card lesson-theme--blue">
                <div class="lesson-card__head">
                    <div>
                        <h2 class="lesson-card__title">AI 提供商</h2>
                        <p class="lesson-card__desc">配置连接到不同 AI 服务的 API 参数，可设置默认提供商。</p>
                    </div>
                    <div class="ai-head-actions">
                        <button type="button" onclick="openImportModal()" class="ai-btn ai-btn--green">
                            <svg width="14" height="14" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"></path></svg>
                            导入 JSON 配置
                        </button>
                        <button type="button" onclick="openModal()" class="ai-btn ai-btn--primary">
                            <svg width="14" height="14" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
                            添加 AI 提供商
                        </button>
                    </div>
                </div>
                <div class="lesson-card__body">
                    <div id="providersList" class="ai-providers-grid">
                        <div class="ai-empty">正在加载...</div>
                    </div>
                </div>
            </section>

            <!-- Section 2: AI 提示词 (fixed-area prompts) -->
            <section class="lesson-card lesson-theme--teal">
                <div class="lesson-card__head">
                    <div>
                        <h2 class="lesson-card__title">AI 提示词</h2>
                        <p class="lesson-card__desc">管理各固定功能区域的系统提示词（System Prompt），用于定义 AI 角色与行为规范。</p>
                    </div>
                    <div class="ai-head-actions">
                        <button type="button" onclick="openSkillModal()" class="ai-btn ai-btn--teal">
                            <svg width="14" height="14" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
                            添加提示词
                        </button>
                    </div>
                </div>
                <div class="lesson-card__body">
                    <div id="skillsList" class="ai-skills-grid">
                        <div class="ai-empty">正在加载...</div>
                    </div>
                </div>
            </section>

            <!-- Section 3: AI Skills 管理 (custom user-defined skills) -->
            <section class="lesson-card lesson-theme--purple">
                <div class="lesson-card__head">
                    <div>
                        <h2 class="lesson-card__title">AI Skills 管理</h2>
                        <p class="lesson-card__desc">自定义技能库，为每个技能设置提示词并指定应用场景，供学生在对应功能中调用。</p>
                    </div>
                    <div class="ai-head-actions">
                        <button type="button" onclick="openCustomSkillModal()" class="ai-btn ai-btn--purple">
                            <svg width="14" height="14" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
                            添加技能
                        </button>
                    </div>
                </div>
                <div class="lesson-card__body">
                    <div id="customSkillsList" class="ai-skills-grid">
                        <div class="ai-empty">正在加载...</div>
                    </div>
                </div>
            </section>

        </div>
    </div>

    <!-- Add/Edit Provider Modal -->
    <div id="providerModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 backdrop-blur-sm hidden overflow-y-auto h-full w-full z-50 flex items-center justify-center p-4" onclick="closeModalOnOutsideClick(event, 'providerModalContent')">
        <div id="providerModalContent" class="relative w-full max-w-lg shadow-2xl rounded-2xl bg-white border border-gray-100 p-6 md:p-8" onclick="event.stopPropagation()">
            <div>
                <div class="flex justify-between items-center mb-6">
                    <h3 class="text-xl font-bold text-gray-800" id="modalTitle">添加 AI 提供商</h3>
                    <button type="button" onclick="closeModal()" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
                <div id="providerForm" class="space-y-5">
                    <input type="hidden" id="providerId" value="0">
                    
                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="displayName">显示名称 <span class="text-red-500">*</span></label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="displayName" type="text" placeholder="例如: 通义千问" required>
                    </div>
                    
                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="providerName">提供商名称 <span class="text-red-500">*</span></label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="providerName" type="text" placeholder="例如: Aliyun" required>
                    </div>

                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="modelName">模型名称 <span class="text-red-500">*</span></label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="modelName" type="text" placeholder="例如: qwen-max" required>
                    </div>

                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="apiKey">API Key</label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="apiKey" type="password" placeholder="填写对应的 API Key">
                    </div>

                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="baseUrl">Base URL</label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="baseUrl" type="text" placeholder="https://api.openai.com/v1">
                    </div>

                    <div class="flex flex-col sm:flex-row items-center justify-between gap-3 sm:gap-0 mt-8 pt-6 border-t border-gray-100">
                        <div class="w-full sm:w-auto flex flex-col items-start gap-1">
                            <div id="testResultMsg" class="text-sm font-medium hidden"></div>
                            <button type="button" onclick="testConnection(event)" class="w-full sm:w-auto bg-green-500 hover:bg-green-600 text-white border-0 border-transparent font-semibold py-2.5 px-5 rounded-lg shadow-sm transition-all duration-200 flex items-center justify-center focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-1 whitespace-nowrap disabled:opacity-50 disabled:cursor-not-allowed">
                                <svg class="w-4 h-4 mr-2 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
                                <span>测试连接</span>
                            </button>
                        </div>
                        <div class="flex gap-3 w-full sm:w-auto">
                            <button type="button" onclick="closeModal()" class="flex-1 sm:flex-none bg-white border border-gray-300 hover:bg-gray-50 hover:border-gray-400 text-gray-700 font-semibold py-2.5 px-6 rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-gray-200 focus:ring-offset-1">
                                取消
                            </button>
                            <button type="button" onclick="saveProvider(event)" class="flex-1 sm:flex-none bg-blue-600 hover:bg-blue-700 text-white border-0 border-transparent font-semibold py-2.5 px-8 rounded-lg shadow-sm transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-1">
                                保存
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Import JSON Modal -->
    <div id="importModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 backdrop-blur-sm hidden overflow-y-auto h-full w-full z-50 flex items-center justify-center p-4" onclick="closeModalOnOutsideClick(event, 'importModalContent')">
        <div id="importModalContent" class="relative w-full max-w-2xl shadow-2xl rounded-2xl bg-white border border-gray-100 p-6 md:p-8" onclick="event.stopPropagation()">
            <div>
                <div class="flex justify-between items-center mb-6">
                    <h3 class="text-xl font-bold text-gray-800">导入 JSON 配置</h3>
                    <button type="button" onclick="closeImportModal()" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
                <div class="mb-6">
                    <p class="text-sm font-semibold text-gray-700 mb-3">格式示例:</p>
                    <pre class="bg-gray-50 border border-gray-200 p-4 rounded-lg text-xs font-mono text-gray-700 mb-4 overflow-x-auto shadow-inner">
[
  {
    "DisplayName": "通义千问",
    "ProviderName": "Aliyun",
    "ModelName": "qwen-max",
    "ApiKey": "YOUR_API_KEY",
    "BaseUrl": "https://dashscope.aliyuncs.com/compatible-mode/v1"
  }
]
                    </pre>
                    <textarea id="jsonConfigInput" rows="10" class="box-border w-full max-w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none font-mono text-sm" placeholder="粘贴 JSON 配置..."></textarea>
                </div>
                <div class="flex flex-col-reverse sm:flex-row items-center justify-end gap-3 mt-6 pt-6 border-t border-gray-100">
                    <button type="button" onclick="closeImportModal()" class="w-full sm:w-auto bg-white border border-gray-300 hover:bg-gray-50 text-gray-700 font-semibold py-2.5 px-6 rounded-lg transition-colors duration-200">
                        取消
                    </button>
                    <button type="button" onclick="importJsonConfig()" class="w-full sm:w-auto bg-green-600 hover:bg-green-700 text-white font-semibold py-2.5 px-6 rounded-lg shadow-sm transition-colors duration-200 flex items-center justify-center">
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"></path></svg>
                        导入
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Add/Edit Skill Modal -->
    <div id="skillModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 backdrop-blur-sm hidden overflow-y-auto h-full w-full z-50 flex items-center justify-center p-4" onclick="closeModalOnOutsideClick(event, 'skillModalContent')">
        <div id="skillModalContent" class="relative w-full max-w-lg shadow-2xl rounded-2xl bg-white border border-gray-100 p-6 md:p-8" onclick="event.stopPropagation()">
            <div>
                <div class="flex justify-between items-center mb-6">
                    <h3 class="text-xl font-bold text-gray-800" id="skillModalTitle">添加提示词</h3>
                    <button type="button" onclick="closeSkillModal()" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
                <div id="skillForm" class="space-y-5">
                    <input type="hidden" id="skillId" value="0">

                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="skillName">提示词名称 <span class="text-red-500">*</span></label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="skillName" type="text" placeholder="例如: Python 编程助手" required>
                    </div>

                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="promptContent">提示词内容 <span class="text-red-500">*</span></label>
                        <textarea class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="promptContent" rows="6" placeholder="请在这里输入系统提示词内容..." required></textarea>
                    </div>

                    <div>
                        <label class="flex items-center space-x-3 cursor-pointer">
                            <input type="checkbox" id="skillIsActive" class="form-checkbox h-5 w-5 text-blue-600 rounded border-gray-300 focus:ring-blue-500" checked>
                            <span class="text-gray-700 text-sm font-semibold">是否启用</span>
                        </label>
                    </div>

                    <div class="flex gap-3 justify-end mt-8 pt-6 border-t border-gray-100">
                        <button type="button" onclick="closeSkillModal()" class="w-full sm:w-auto bg-white border border-gray-300 hover:bg-gray-50 hover:border-gray-400 text-gray-700 font-semibold py-2.5 px-6 rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-gray-200 focus:ring-offset-1">
                            取消
                        </button>
                        <button type="button" onclick="saveSkill(event)" class="w-full sm:w-auto bg-blue-600 hover:bg-blue-700 text-white border-0 border-transparent font-semibold py-2.5 px-8 rounded-lg shadow-sm transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-1">
                            保存
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            loadProviders();
            loadSkills();
            loadCustomSkills();
        });

        // ── Providers ──────────────────────────────────────────────────

        function loadProviders() {
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: { action: 'list' },
                success: function(res) {
                    if (res.success) {
                        renderProviders(res.data);
                    } else {
                        $('#providersList').html('<div class="ai-empty">加载失败: ' + res.msg + '</div>');
                    }
                },
                error: function() {
                    $('#providersList').html('<div class="ai-empty">网络错误，无法加载数据。</div>');
                }
            });
        }

        function renderProviders(data) {
            if (data.length === 0) {
                $('#providersList').html('<div class="ai-empty">暂无 AI 提供商配置，请点击右上角"添加 AI 提供商"。</div>');
                return;
            }
            var html = '';
            $.each(data, function(i, item) {
                var cardClass = 'ai-provider-card' + (item.IsDefault ? ' ai-provider-card--default' : '');
                var badge = item.IsDefault
                    ? '<span class="ai-badge ai-badge--green">默认</span>'
                    : '';
                var setDefaultBtn = !item.IsDefault
                    ? '<button type="button" onclick="setDefault(' + item.Id + ')" class="ai-card-action-btn ai-card-action-btn--def">设为默认</button>'
                    : '';

                html += '<div class="' + cardClass + '">';
                html += '  <div class="ai-provider-card__body">';
                html += '    <div style="display:flex;justify-content:space-between;align-items:flex-start;gap:8px;">';
                html += '      <div>';
                html += '        <p class="ai-provider-card__name">' + escapeHtml(item.DisplayName) + '</p>';
                html += '        <span class="ai-provider-card__sub">' + escapeHtml(item.ProviderName) + '</span>';
                html += '      </div>';
                html += '      <div>' + badge + '</div>';
                html += '    </div>';
                html += '    <div class="ai-provider-card__meta">模型：<strong>' + escapeHtml(item.ModelName) + '</strong></div>';
                html += '  </div>';
                html += '  <div class="ai-provider-card__foot">';
                html += '    <div>' + setDefaultBtn + '</div>';
                html += '    <div style="display:flex;gap:6px;">';
                html += '      <button type="button" onclick=\'editProvider(' + JSON.stringify(item).replace(/'/g, "\\'") + ')\' class="ai-card-action-btn ai-card-action-btn--edit">编辑</button>';
                html += '      <button type="button" onclick="deleteProvider(' + item.Id + ')" class="ai-card-action-btn ai-card-action-btn--del">删除</button>';
                html += '    </div>';
                html += '  </div>';
                html += '</div>';
            });
            $('#providersList').html(html);
        }

        function openModal() {
            $('#modalTitle').text('添加 AI 提供商');
            $('#providerId').val('0');
            $('#displayName').val('');
            $('#providerName').val('');
            $('#modelName').val('');
            $('#apiKey').val('');
            $('#baseUrl').val('https://api.openai.com/v1');
            $('#testResultMsg').addClass('hidden').text('');
            $('#providerModal').removeClass('hidden').addClass('flex');
        }

        function editProvider(item) {
            $('#modalTitle').text('编辑 AI 提供商');
            $('#providerId').val(item.Id);
            $('#displayName').val(item.DisplayName);
            $('#providerName').val(item.ProviderName);
            $('#modelName').val(item.ModelName);
            $('#apiKey').val(item.ApiKey);
            $('#baseUrl').val(item.BaseUrl);
            $('#testResultMsg').addClass('hidden').text('');
            $('#providerModal').removeClass('hidden').addClass('flex');
        }

        function closeModal() {
            $('#providerModal').addClass('hidden').removeClass('flex');
        }

        function openImportModal() {
            $('#jsonConfigInput').val('');
            $('#importModal').removeClass('hidden').addClass('flex');
        }

        function closeImportModal() {
            $('#importModal').addClass('hidden').removeClass('flex');
        }

        function saveProvider(e) {
            e.preventDefault();
            var data = {
                action: 'save',
                id: $('#providerId').val(),
                displayName: $('#displayName').val(),
                providerName: $('#providerName').val(),
                modelName: $('#modelName').val(),
                apiKey: $('#apiKey').val(),
                baseUrl: $('#baseUrl').val()
            };
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res.success) {
                        closeModal();
                        loadProviders();
                    } else {
                        alert("保存失败: " + res.msg);
                    }
                },
                error: function() { alert("网络错误，保存失败。"); }
            });
        }

        function deleteProvider(id) {
            if (confirm("确定要删除此配置吗？")) {
                $.ajax({
                    url: 'aiprovider_api.ashx',
                    type: 'POST',
                    data: { action: 'delete', id: id },
                    success: function(res) {
                        if (res.success) { loadProviders(); }
                        else { alert("删除失败: " + res.msg); }
                    },
                    error: function() { alert("网络错误，删除失败。"); }
                });
            }
        }

        function setDefault(id) {
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: { action: 'setdefault', id: id },
                success: function(res) {
                    if (res.success) { loadProviders(); }
                    else { alert("设置失败: " + res.msg); }
                },
                error: function() { alert("网络错误，设置失败。"); }
            });
        }

        function testConnection(e) {
            var btn = $(e.currentTarget);
            var span = btn.find('span');
            var originalText = span.text();
            var resultMsg = $('#testResultMsg');

            resultMsg.removeClass('hidden text-green-600 text-red-600').addClass('text-gray-500').text('正在测试中，请稍候...');
            span.text('测试中...');
            btn.prop('disabled', true);

            var data = {
                action: 'test',
                id: $('#providerId').val(),
                modelName: $('#modelName').val(),
                apiKey: $('#apiKey').val(),
                baseUrl: $('#baseUrl').val()
            };

            if (!data.baseUrl || !data.modelName) {
                resultMsg.removeClass('text-gray-500').addClass('text-red-600').text('请至少填写 Base URL 和 模型名称');
                span.text(originalText);
                btn.prop('disabled', false);
                return;
            }

            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res.success) {
                        resultMsg.removeClass('text-gray-500 text-red-600').addClass('text-green-600').text('测试成功！' + res.msg);
                    } else {
                        resultMsg.removeClass('text-gray-500 text-green-600').addClass('text-red-600').text('测试失败: ' + res.msg);
                    }
                },
                error: function() {
                    resultMsg.removeClass('text-gray-500 text-green-600').addClass('text-red-600').text('网络错误，测试请求发送失败。');
                },
                complete: function() {
                    span.text(originalText);
                    btn.prop('disabled', false);
                }
            });
        }

        function importJsonConfig() {
            var jsonStr = $('#jsonConfigInput').val().trim();
            if (!jsonStr) { alert("请输入 JSON 配置。"); return; }
            try { JSON.parse(jsonStr); } catch (e) { alert("JSON 格式不正确: " + e.message); return; }
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: { action: 'import', config: jsonStr },
                success: function(res) {
                    if (res.success) {
                        alert(res.msg);
                        closeImportModal();
                        loadProviders();
                    } else {
                        alert("导入失败: " + res.msg);
                    }
                },
                error: function() { alert("网络错误，导入失败。"); }
            });
        }

        // ── Skills / 提示词 ────────────────────────────────────────────

        function loadSkills() {
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: { action: 'listSkills' },
                success: function(res) {
                    if (res.success) {
                        renderSkills(res.data);
                    } else {
                        $('#skillsList').html('<div class="ai-empty">加载失败: ' + res.msg + '</div>');
                    }
                },
                error: function() {
                    $('#skillsList').html('<div class="ai-empty">网络错误，无法加载数据。</div>');
                }
            });
        }

        function renderSkills(data) {
            if (data.length === 0) {
                $('#skillsList').html('<div class="ai-empty">暂无提示词配置，请点击右上角"添加提示词"。</div>');
                return;
            }
            var html = '';
            $.each(data, function(i, item) {
                var badge = item.IsActive
                    ? '<span class="ai-badge ai-badge--active">已启用</span>'
                    : '<span class="ai-badge ai-badge--gray">已停用</span>';
                var safePrompt = escapeHtml(item.PromptContent);
                var jsonStr = JSON.stringify(item).replace(/'/g, "&#39;").replace(/"/g, "&quot;");

                html += '<div class="ai-skill-card">';
                html += '  <div class="ai-skill-card__body">';
                html += '    <div style="display:flex;justify-content:space-between;align-items:flex-start;gap:8px;margin-bottom:10px;">';
                html += '      <h3 class="ai-skill-card__name">' + escapeHtml(item.SkillName) + '</h3>';
                html += '      <div>' + badge + '</div>';
                html += '    </div>';
                html += '    <p class="ai-skill-card__prompt" title="' + safePrompt + '">' + safePrompt + '</p>';
                html += '  </div>';
                html += '  <div class="ai-skill-card__foot">';
                html += '    <button type="button" onclick="editSkill(' + jsonStr + ')" class="ai-card-action-btn ai-card-action-btn--edit">编辑</button>';
                html += '    <button type="button" onclick="deleteSkill(' + item.Id + ')" class="ai-card-action-btn ai-card-action-btn--del">删除</button>';
                html += '  </div>';
                html += '</div>';
            });
            $('#skillsList').html(html);
        }

        function openSkillModal() {
            $('#skillModalTitle').text('添加提示词');
            $('#skillId').val('0');
            $('#skillName').val('');
            $('#promptContent').val('');
            $('#skillIsActive').prop('checked', true);
            $('#skillModal').removeClass('hidden').addClass('flex');
        }

        function editSkill(item) {
            $('#skillModalTitle').text('编辑提示词');
            $('#skillId').val(item.Id);
            $('#skillName').val(item.SkillName);
            $('#promptContent').val(item.PromptContent);
            $('#skillIsActive').prop('checked', item.IsActive);
            $('#skillModal').removeClass('hidden').addClass('flex');
        }

        function closeSkillModal() {
            $('#skillModal').addClass('hidden').removeClass('flex');
        }

        function saveSkill(e) {
            e.preventDefault();
            var data = {
                action: 'saveSkill',
                id: $('#skillId').val(),
                skillName: $('#skillName').val(),
                promptContent: $('#promptContent').val(),
                isActive: $('#skillIsActive').is(':checked')
            };
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res.success) {
                        closeSkillModal();
                        loadSkills();
                    } else {
                        alert("保存失败: " + res.msg);
                    }
                },
                error: function() { alert("网络错误，保存失败。"); }
            });
        }

        function deleteSkill(id) {
            if (confirm("确定要删除此提示词吗？")) {
                $.ajax({
                    url: 'aiprovider_api.ashx',
                    type: 'POST',
                    data: { action: 'deleteSkill', id: id },
                    success: function(res) {
                        if (res.success) { loadSkills(); }
                        else { alert("删除失败: " + res.msg); }
                    },
                    error: function() { alert("网络错误，删除失败。"); }
                });
            }
        }

        // ── Utilities ──────────────────────────────────────────────────

        function escapeHtml(unsafe) {
            if (!unsafe) return '';
            return unsafe
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;")
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#039;");
        }

        function closeModalOnOutsideClick(event, contentId) {
            var modalContent = document.getElementById(contentId);
            if (modalContent && !modalContent.contains(event.target)) {
                if (contentId === 'providerModalContent') closeModal();
                else if (contentId === 'importModalContent') closeImportModal();
                else if (contentId === 'skillModalContent') closeSkillModal();
                else if (contentId === 'customSkillModalContent') closeCustomSkillModal();
            }
        }

        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                if (!$('#providerModal').hasClass('hidden')) closeModal();
                if (!$('#importModal').hasClass('hidden')) closeImportModal();
                if (!$('#skillModal').hasClass('hidden')) closeSkillModal();
                if (!$('#customSkillModal').hasClass('hidden')) closeCustomSkillModal();
            }
        });
    </script>

    <!-- Add/Edit Custom Skill Modal -->
    <div id="customSkillModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 backdrop-blur-sm hidden overflow-y-auto h-full w-full z-50 flex items-center justify-center p-4" onclick="closeModalOnOutsideClick(event, 'customSkillModalContent')">
        <div id="customSkillModalContent" class="relative w-full max-w-lg shadow-2xl rounded-2xl bg-white border border-gray-100 p-6 md:p-8" onclick="event.stopPropagation()">
            <div class="flex justify-between items-center mb-6">
                <h3 class="text-xl font-bold text-gray-800" id="customSkillModalTitle">添加技能</h3>
                <button type="button" onclick="closeCustomSkillModal()" class="text-gray-400 hover:text-gray-600 transition-colors">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                </button>
            </div>
            <div class="space-y-5">
                <input type="hidden" id="customSkillId" value="0">

                <div>
                    <label class="block text-gray-700 text-sm font-semibold mb-2" for="customSkillName">技能名称 <span class="text-red-500">*</span></label>
                    <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-purple-500 focus:border-transparent transition-all duration-200 outline-none" id="customSkillName" type="text" placeholder="例如: 代码审查助手">
                </div>

                <div>
                    <label class="block text-gray-700 text-sm font-semibold mb-2" for="customPromptContent">提示词内容 <span class="text-red-500">*</span></label>
                    <textarea class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-purple-500 focus:border-transparent transition-all duration-200 outline-none" id="customPromptContent" rows="5" placeholder="请输入该技能的系统提示词..."></textarea>
                </div>

                <div>
                    <label class="block text-gray-700 text-sm font-semibold mb-2">应用场景 <span class="text-gray-400 font-normal">（可多选）</span></label>
                    <div class="grid grid-cols-2 gap-2 p-3 bg-gray-50 border border-gray-200 rounded-lg">
                        <label class="flex items-center gap-2 cursor-pointer text-sm text-gray-700 font-medium">
                            <input type="checkbox" class="custom-scope-cb h-4 w-4 text-purple-600 rounded border-gray-300" value="chat"> AI 对话
                        </label>
                        <label class="flex items-center gap-2 cursor-pointer text-sm text-gray-700 font-medium">
                            <input type="checkbox" class="custom-scope-cb h-4 w-4 text-purple-600 rounded border-gray-300" value="console"> 编程控制台
                        </label>
                        <label class="flex items-center gap-2 cursor-pointer text-sm text-gray-700 font-medium">
                            <input type="checkbox" class="custom-scope-cb h-4 w-4 text-purple-600 rounded border-gray-300" value="mission"> 任务辅助
                        </label>
                        <label class="flex items-center gap-2 cursor-pointer text-sm text-gray-700 font-medium">
                            <input type="checkbox" class="custom-scope-cb h-4 w-4 text-purple-600 rounded border-gray-300" value="writing"> 写作助手
                        </label>
                        <label class="flex items-center gap-2 cursor-pointer text-sm text-gray-700 font-medium">
                            <input type="checkbox" class="custom-scope-cb h-4 w-4 text-purple-600 rounded border-gray-300" value="quiz"> 习题解析
                        </label>
                        <label class="flex items-center gap-2 cursor-pointer text-sm text-gray-700 font-medium">
                            <input type="checkbox" class="custom-scope-cb h-4 w-4 text-purple-600 rounded border-gray-300" value="review"> 作品点评
                        </label>
                    </div>
                </div>

                <div>
                    <label class="flex items-center space-x-3 cursor-pointer">
                        <input type="checkbox" id="customSkillIsActive" class="form-checkbox h-5 w-5 text-purple-600 rounded border-gray-300" checked>
                        <span class="text-gray-700 text-sm font-semibold">是否启用</span>
                    </label>
                </div>

                <div class="flex gap-3 justify-end pt-6 border-t border-gray-100">
                    <button type="button" onclick="closeCustomSkillModal()" class="bg-white border border-gray-300 hover:bg-gray-50 text-gray-700 font-semibold py-2.5 px-6 rounded-lg transition-all duration-200">
                        取消
                    </button>
                    <button type="button" onclick="saveCustomSkill(event)" class="bg-purple-600 hover:bg-purple-700 text-white border-0 font-semibold py-2.5 px-8 rounded-lg shadow-sm transition-all duration-200">
                        保存
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        // ── Custom Skills ──────────────────────────────────────────────

        function loadCustomSkills() {
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: { action: 'listCustomSkills' },
                success: function(res) {
                    if (res.success) {
                        renderCustomSkills(res.data);
                    } else {
                        $('#customSkillsList').html('<div class="ai-empty">加载失败: ' + res.msg + '</div>');
                    }
                },
                error: function() {
                    $('#customSkillsList').html('<div class="ai-empty">网络错误，无法加载数据。</div>');
                }
            });
        }

        var scopeLabels = {
            'chat':    'AI 对话',
            'console': '编程控制台',
            'mission': '任务辅助',
            'writing': '写作助手',
            'quiz':    '习题解析',
            'review':  '作品点评'
        };

        function renderCustomSkills(data) {
            if (data.length === 0) {
                $('#customSkillsList').html('<div class="ai-empty">暂无自定义技能，请点击右上角"添加技能"。</div>');
                return;
            }
            var html = '';
            $.each(data, function(i, item) {
                var badge = item.IsActive
                    ? '<span class="ai-badge ai-badge--active">已启用</span>'
                    : '<span class="ai-badge ai-badge--gray">已停用</span>';
                var safePrompt = escapeHtml(item.PromptContent);
                var jsonStr = JSON.stringify(item).replace(/'/g, "&#39;").replace(/"/g, "&quot;");

                // Scope tags
                var scopeHtml = '';
                if (item.SkillScope && item.SkillScope.trim() !== '') {
                    var scopes = item.SkillScope.split(',');
                    $.each(scopes, function(j, s) {
                        s = s.trim();
                        if (s && scopeLabels[s]) {
                            scopeHtml += '<span class="ai-scope-tag">' + scopeLabels[s] + '</span>';
                        }
                    });
                }
                var scopeBlock = scopeHtml
                    ? '<div class="ai-scope-tags">' + scopeHtml + '</div>'
                    : '<div class="ai-scope-tags"><span style="font-size:12px;color:#94a3b8;">未指定应用场景</span></div>';

                html += '<div class="ai-skill-card">';
                html += '  <div class="ai-skill-card__body">';
                html += '    <div style="display:flex;justify-content:space-between;align-items:flex-start;gap:8px;margin-bottom:10px;">';
                html += '      <h3 class="ai-skill-card__name">' + escapeHtml(item.SkillName) + '</h3>';
                html += '      <div>' + badge + '</div>';
                html += '    </div>';
                html += '    <p class="ai-skill-card__prompt" title="' + safePrompt + '">' + safePrompt + '</p>';
                html += scopeBlock;
                html += '  </div>';
                html += '  <div class="ai-skill-card__foot">';
                html += '    <button type="button" onclick="editCustomSkill(' + jsonStr + ')" class="ai-card-action-btn ai-card-action-btn--edit">编辑</button>';
                html += '    <button type="button" onclick="deleteCustomSkill(' + item.Id + ')" class="ai-card-action-btn ai-card-action-btn--del">删除</button>';
                html += '  </div>';
                html += '</div>';
            });
            $('#customSkillsList').html(html);
        }

        function openCustomSkillModal() {
            $('#customSkillModalTitle').text('添加技能');
            $('#customSkillId').val('0');
            $('#customSkillName').val('');
            $('#customPromptContent').val('');
            $('#customSkillIsActive').prop('checked', true);
            $('.custom-scope-cb').prop('checked', false);
            $('#customSkillModal').removeClass('hidden').addClass('flex');
        }

        function editCustomSkill(item) {
            $('#customSkillModalTitle').text('编辑技能');
            $('#customSkillId').val(item.Id);
            $('#customSkillName').val(item.SkillName);
            $('#customPromptContent').val(item.PromptContent);
            $('#customSkillIsActive').prop('checked', item.IsActive);
            // Restore scope checkboxes
            $('.custom-scope-cb').prop('checked', false);
            if (item.SkillScope) {
                var scopes = item.SkillScope.split(',');
                $.each(scopes, function(i, s) {
                    $('.custom-scope-cb[value="' + s.trim() + '"]').prop('checked', true);
                });
            }
            $('#customSkillModal').removeClass('hidden').addClass('flex');
        }

        function closeCustomSkillModal() {
            $('#customSkillModal').addClass('hidden').removeClass('flex');
        }

        function saveCustomSkill(e) {
            e.preventDefault();
            var scopes = [];
            $('.custom-scope-cb:checked').each(function() {
                scopes.push($(this).val());
            });
            var data = {
                action: 'saveCustomSkill',
                id: $('#customSkillId').val(),
                skillName: $('#customSkillName').val(),
                promptContent: $('#customPromptContent').val(),
                skillScope: scopes.join(','),
                isActive: $('#customSkillIsActive').is(':checked')
            };
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res.success) {
                        closeCustomSkillModal();
                        loadCustomSkills();
                    } else {
                        alert("保存失败: " + res.msg);
                    }
                },
                error: function() { alert("网络错误，保存失败。"); }
            });
        }

        function deleteCustomSkill(id) {
            if (confirm("确定要删除此技能吗？")) {
                $.ajax({
                    url: 'aiprovider_api.ashx',
                    type: 'POST',
                    data: { action: 'deleteCustomSkill', id: id },
                    success: function(res) {
                        if (res.success) { loadCustomSkills(); }
                        else { alert("删除失败: " + res.msg); }
                    },
                    error: function() { alert("网络错误，删除失败。"); }
                });
            }
        }
    </script>
</asp:Content>
