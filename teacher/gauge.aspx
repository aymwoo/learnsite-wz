<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="gauge.aspx.cs" Inherits="Teacher_gauge" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .gauge-page {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            --ls-primary-soft: #dbeafe;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
            min-height: calc(100vh - 8rem);
        }

        .gauge-page * {
            box-sizing: border-box;
        }

        .gauge-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin: 0 auto;
        }

        .gauge-hero {
            position: relative;
            overflow: hidden;
            border: 1px solid var(--ls-border);
            border-radius: 1rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(99, 102, 241, 0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(139, 92, 246, 0.16), transparent 26%),
                linear-gradient(135deg, #312e81 0%, #6366f1 52%, #a78bfa 100%);
            color: #eef2ff;
            box-shadow: 0 20px 40px rgba(99, 102, 241, 0.15);
        }

        .gauge-hero__title {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.02em;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .gauge-hero__subtitle {
            margin: 6px 0 0;
            font-size: 14px;
            color: rgba(238, 242, 255, 0.88);
        }

        .gauge-card {
            border: 1px solid var(--ls-border);
            border-radius: 1rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
            overflow: hidden;
        }

        .gauge-card__head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 12px;
            align-items: flex-start;
            padding: 22px 24px 0;
        }

        .gauge-card__title {
            margin: 0;
            font-size: 20px;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.02em;
            color: var(--ls-text);
        }

        .gauge-card__desc {
            margin: 8px 0 0;
            font-size: 13px;
            line-height: 1.7;
            color: var(--ls-muted);
        }

        .gauge-card__body {
            padding: 22px 24px 24px;
        }

        .gauge-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .gauge-grid th {
            background: #f8fafc;
            padding: 16px;
            font-size: 13px;
            font-weight: 700;
            color: #64748b;
            text-align: center;
            border-bottom: 2px solid #f1f5f9;
        }

        .gauge-grid td {
            padding: 14px 16px;
            font-size: 14px;
            color: #334155;
            border-bottom: 1px solid #f1f5f9;
            text-align: center;
        }

        .gauge-grid tbody tr:hover {
            background-color: #f1f5f9;
        }

        .gauge-grid tbody tr:hover td {
            background-color: transparent;
        }

        .gauge-link {
            color: #4f46e5;
            font-weight: 700;
            text-decoration: none;
        }

        .gauge-link:hover {
            color: #3730a3;
            text-decoration: underline;
        }

        .gauge-delete-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 0.375rem;
            background: #fee2e2;
            color: #b91c1c;
            font-size: 14px;
            font-weight: 800;
            text-decoration: none;
            border: 1px solid #fecaca;
            cursor: pointer;
            transition: all 0.2s;
        }

        .gauge-delete-btn:hover {
            background: #b91c1c;
            color: #ffffff;
        }

        .gauge-form {
            display: grid;
            gap: 16px;
            grid-template-columns: 1fr 2fr auto;
            align-items: end;
        }

        .gauge-field {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .gauge-label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .gauge-select,
        .gauge-input {
            width: 100% !important;
            min-height: 48px;
            padding: 0 14px;
            border: 1px solid #cbd5e1;
            border-radius: 1rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 14px;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
        }

        .gauge-select:focus,
        .gauge-input:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(96, 165, 250, 0.18);
        }

        .gauge-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 48px;
            padding: 0 20px;
            border-radius: 0.375rem;
            border: none;
            font-size: 14px;
            font-weight: 700;
            color: #ffffff;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            box-shadow: 0 10px 24px rgba(16, 185, 129, 0.2);
            cursor: pointer;
            transition: transform 0.18s ease, box-shadow 0.18s ease;
        }

        .gauge-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 28px rgba(16, 185, 129, 0.3);
        }

        .gauge-alert {
            display: flex;
            flex-direction: column;
            gap: 12px;
            padding: 18px 20px;
            border-radius: 1rem;
            background: linear-gradient(135deg, #fffbeb 0%, #fefce8 100%);
            border: 1px solid #fde68a;
        }

        .gauge-alert__item {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            font-size: 13px;
            line-height: 1.7;
        }

        .gauge-alert__icon {
            flex-shrink: 0;
            margin-top: 2px;
        }

        .gauge-alert__text {
            color: #78350f;
        }

        .gauge-alert__text strong {
            color: #92400e;
        }

        .gauge-loading {
            position: fixed;
            inset: 0;
            z-index: 9999;
            display: none;
            align-items: center;
            justify-content: center;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(3px);
        }

        .gauge-loading.is-active {
            display: flex;
        }

        .gauge-loading__card {
            width: min(92vw, 420px);
            padding: 28px 24px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.98);
            box-shadow: 0 24px 50px rgba(15, 23, 42, 0.22);
            text-align: center;
        }

        .gauge-loading__spinner {
            width: 56px;
            height: 56px;
            margin: 0 auto 16px;
            border-radius: 999px;
            border: 5px solid #dbeafe;
            border-top-color: #2563eb;
            animation: gauge-spin 0.9s linear infinite;
        }

        .gauge-loading__title {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            color: #0f172a;
        }

        .gauge-loading__desc {
            margin: 10px 0 0;
            font-size: 14px;
            line-height: 1.7;
            color: #64748b;
        }

        .gauge-loading__steps {
            margin: 18px 0 0;
            padding: 0;
            list-style: none;
            text-align: left;
            display: grid;
            gap: 10px;
        }

        .gauge-loading__step {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 12px;
            border-radius: 12px;
            background: #f8fafc;
            color: #64748b;
            font-size: 13px;
            transition: all 0.25s ease;
        }

        .gauge-loading__step-index {
            width: 24px;
            height: 24px;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #e2e8f0;
            color: #475569;
            font-size: 12px;
            font-weight: 800;
            flex-shrink: 0;
        }

        .gauge-loading__step.is-active {
            background: #eff6ff;
            color: #1d4ed8;
            box-shadow: inset 0 0 0 1px #bfdbfe;
        }

        .gauge-loading__step.is-active .gauge-loading__step-index {
            background: #2563eb;
            color: #ffffff;
        }

        .gauge-loading__step.is-done {
            background: #ecfdf5;
            color: #047857;
            box-shadow: inset 0 0 0 1px #a7f3d0;
        }

        .gauge-loading__step.is-done .gauge-loading__step-index {
            background: #10b981;
            color: #ffffff;
        }

        @keyframes gauge-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        @media (max-width: 768px) {
            .gauge-page { padding: 16px; }
            .gauge-form { grid-template-columns: 1fr; }
            .gauge-btn { width: 100%; }
        }
    </style>

    <div class="gauge-page">
        <div class="gauge-shell">
            <div class="gauge-hero">
                <h1 class="gauge-hero__title">
                    <i class="bi bi-ui-checks-grid" style="color: #c7d2fe;"></i> 自定义量化评价标准
                </h1>
                <p class="gauge-hero__subtitle">创建和管理作品互评的量化指标库，支持多种作品类型的评价维度配置</p>
            </div>

            <div class="gauge-card">
                <div class="gauge-card__head">
                    <div>
                        <h2 class="gauge-card__title">量规列表</h2>
                        <p class="gauge-card__desc">点击标题可编辑具体评价项目，已使用的量规无法删除</p>
                    </div>
                </div>
                <div class="gauge-card__body">
                    <asp:GridView ID="GVGauge" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="Gid" Width="100%" 
                        CssClass="gauge-grid" 
                        onrowcommand="GVGauge_RowCommand" EnableModelValidation="True" 
                        onrowdatabound="GVGauge_RowDataBound" GridLines="None">
                        <Columns>
                            <asp:BoundField HeaderText="序号">
                                <ItemStyle CssClass="font-mono text-slate-400" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gtype" HeaderText="分类">
                                <ItemStyle CssClass="font-semibold text-slate-700" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="Gid"  
                                DataNavigateUrlFormatString="~/teacher/gaugeitem.aspx?gid={0}" 
                                DataTextField="Gtitle" HeaderText="标题">
                                <ItemStyle CssClass="gauge-link text-left" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="Gcount" HeaderText="使用次数">
                                <ItemStyle CssClass="font-mono text-emerald-600 font-semibold" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gdate" HeaderText="日期">
                                <ItemStyle CssClass="text-slate-500 text-xs" Width="120px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton ID="BtnEdit" runat="server" CausesValidation="false" 
                                        CommandArgument='<%# Eval("Gid") %>' CommandName="Del" 
                                        Text="✖" ToolTip="删除" CssClass="gauge-delete-btn"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="gauge-card">
                <div class="gauge-card__head">
                    <div>
                        <h2 class="gauge-card__title">添加量规</h2>
                        <p class="gauge-card__desc">选择作品类型并填写量规标题，创建新的评价标准</p>
                    </div>
                </div>
                <div class="gauge-card__body">
                    <div class="gauge-form">
                        <div class="gauge-field">
                            <span class="gauge-label">作品类型</span>
                            <asp:DropDownList ID="DDLtype" runat="server" CssClass="gauge-select"></asp:DropDownList>
                        </div>
                        <div class="gauge-field">
                            <span class="gauge-label">量规标题</span>
                            <asp:TextBox ID="TextBoxGtitle" runat="server" CssClass="gauge-input" placeholder="例如：Scratch游戏作品互评表"></asp:TextBox>
                        </div>
                        <asp:Button ID="Btnadd" runat="server" Text="添加量规" onclick="Btnadd_Click" UseSubmitBehavior="false" OnClientClick="return startGaugeSseGenerate();" CssClass="gauge-btn" />
                    </div>
                </div>
            </div>

            <div class="gauge-alert">
                <div class="gauge-alert__item">
                    <i class="bi bi-exclamation-triangle-fill text-amber-500 gauge-alert__icon"></i>
                    <span class="gauge-alert__text"><strong>注意：</strong>评价标准一旦被使用后，将无法删除，请慎重填写！</span>
                </div>
                <div class="gauge-alert__item">
                    <i class="bi bi-info-circle-fill text-blue-500 gauge-alert__icon"></i>
                    <span class="gauge-alert__text">当活动中未指定互评评价标准时，系统将自动选取相应作品类型中的第一条评价标准。</span>
                </div>
            </div>
        </div>
    </div>

    <div id="gaugeLoading" class="gauge-loading" aria-live="polite" aria-busy="true">
        <div class="gauge-loading__card">
            <div class="gauge-loading__spinner"></div>
            <p class="gauge-loading__title">正在生成量规</p>
            <p id="gaugeLoadingDesc" class="gauge-loading__desc">系统正在创建量规并调用 AI 自动生成评价项，请稍候，不要关闭当前页面。</p>
            <ul id="gaugeLoadingSteps" class="gauge-loading__steps">
                <li class="gauge-loading__step is-active" data-step="0">
                    <span class="gauge-loading__step-index">1</span>
                    <span>正在创建量规记录</span>
                </li>
                <li class="gauge-loading__step" data-step="1">
                    <span class="gauge-loading__step-index">2</span>
                    <span>正在调用 AI 生成评价项</span>
                </li>
                <li class="gauge-loading__step" data-step="2">
                    <span class="gauge-loading__step-index">3</span>
                    <span>正在写入量规项并准备跳转</span>
                </li>
            </ul>
        </div>
    </div>

    <script type="text/javascript">
        var gaugeEventSource = null;
        var gaugeStreamFinished = false;

        function setGaugeProgressStep(index) {
            var steps = document.querySelectorAll('#gaugeLoadingSteps .gauge-loading__step');
            for (var i = 0; i < steps.length; i++) {
                steps[i].className = 'gauge-loading__step';
                if (i < index) {
                    steps[i].className += ' is-done';
                }
                else if (i === index) {
                    steps[i].className += ' is-active';
                }
            }

            var desc = document.getElementById('gaugeLoadingDesc');
            if (!desc) {
                return;
            }

            if (index === 0) {
                desc.innerHTML = '系统正在创建量规基础记录，请稍候。';
            }
            else if (index === 1) {
                desc.innerHTML = '系统正在调用 AI 生成评价项，如果当前使用默认模板，也会自动继续处理。';
            }
            else {
                desc.innerHTML = '系统正在写入评价项并跳转到编辑页，请不要关闭当前页面。';
            }
        }

        function setGaugeProgressMessage(message) {
            var desc = document.getElementById('gaugeLoadingDesc');
            if (desc && message) {
                desc.innerHTML = message;
            }
        }

        function openGaugeLoading() {
            var button = document.getElementById('<%= Btnadd.ClientID %>');
            var loading = document.getElementById('gaugeLoading');
            if (button) {
                button.disabled = true;
                button.value = '正在生成...';
            }
            if (loading && loading.className.indexOf('is-active') < 0) {
                loading.className += ' is-active';
            }
        }

        function resetGaugeButton() {
            var button = document.getElementById('<%= Btnadd.ClientID %>');
            if (button) {
                button.disabled = false;
                button.value = '添加量规';
            }
        }

        function closeGaugeEventSource() {
            if (gaugeEventSource) {
                gaugeEventSource.close();
                gaugeEventSource = null;
            }
        }

        function parseGaugeSseData(data) {
            try {
                return JSON.parse(data);
            }
            catch (e) {
                return null;
            }
        }

        function startGaugeSseGenerate() {
            var titleInput = document.getElementById('<%= TextBoxGtitle.ClientID %>');
            if (!titleInput || !titleInput.value || !titleInput.value.trim()) {
                return __doPostBack('<%= Btnadd.UniqueID %>', '');
            }

            var typeInput = document.getElementById('<%= DDLtype.ClientID %>');
            var gaugeType = typeInput ? typeInput.value : '';
            var gaugeTitle = titleInput.value.trim();
            var requestUrl = '<%= ResolveUrl("~/teacher/gauge_generate.ashx") %>' + '?gtype=' + encodeURIComponent(gaugeType) + '&gtitle=' + encodeURIComponent(gaugeTitle);

            if (!window.EventSource) {
                return __doPostBack('<%= Btnadd.UniqueID %>', '');
            }

            openGaugeLoading();
            gaugeStreamFinished = false;
            setGaugeProgressStep(0);
            setGaugeProgressMessage('系统正在创建量规基础记录，请稍候。');
            closeGaugeEventSource();

            gaugeEventSource = new EventSource(requestUrl);
            gaugeEventSource.addEventListener('progress', function (event) {
                var payload = parseGaugeSseData(event.data);
                if (!payload) {
                    return;
                }
                var step = parseInt(payload.step, 10);
                if (!isNaN(step)) {
                    setGaugeProgressStep(Math.max(0, Math.min(2, step - 1)));
                }
                setGaugeProgressMessage(payload.message || '系统正在处理，请稍候。');
            });

            gaugeEventSource.addEventListener('done', function (event) {
                var payload = parseGaugeSseData(event.data);
                gaugeStreamFinished = true;
                closeGaugeEventSource();
                setGaugeProgressStep(2);
                setGaugeProgressMessage(payload && payload.message ? payload.message : '量规已创建，正在跳转。');
                window.setTimeout(function () {
                    if (payload && payload.redirectUrl) {
                        window.location.href = payload.redirectUrl;
                    }
                    else {
                        window.location.reload();
                    }
                }, 350);
            });

            gaugeEventSource.addEventListener('failed', function (event) {
                var payload = event && event.data ? parseGaugeSseData(event.data) : null;
                gaugeStreamFinished = true;
                closeGaugeEventSource();
                resetGaugeButton();
                alert(payload && payload.message ? payload.message : '量规生成失败，请稍后重试。');
                window.location.reload();
            });

            gaugeEventSource.onerror = function () {
                if (!gaugeEventSource || gaugeStreamFinished) {
                    return;
                }
                closeGaugeEventSource();
                resetGaugeButton();
                alert('量规生成连接已中断，请稍后重试。');
                window.location.reload();
            };

            return false;
        }
    </script>
</asp:Content>
