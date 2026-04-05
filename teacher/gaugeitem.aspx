<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master"   StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="gaugeitem.aspx.cs" Inherits="Teacher_gaugeitem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<style type="text/css">
    .gaugeitem-toolbar {
        margin: 0 auto 16px;
        width: 680px;
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }

    .gaugeitem-ai-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 10px 16px;
        border-radius: 10px;
        border: 1px solid #c7d2fe;
        background: linear-gradient(135deg, #eef2ff 0%, #e0e7ff 100%);
        color: #4338ca;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
    }

    .gaugeitem-ai-btn:hover {
        background: linear-gradient(135deg, #dbeafe 0%, #c7d2fe 100%);
    }

    .gauge-ai-notice {
        margin: 18px auto 14px;
        width: 680px;
        border: 1px solid #bfdbfe;
        border-radius: 12px;
        background: linear-gradient(135deg, #eff6ff 0%, #f8fbff 100%);
        box-shadow: 0 10px 24px rgba(37, 99, 235, 0.08);
        padding: 16px 18px;
        text-align: left;
        color: #1e3a8a;
    }

    .gauge-ai-notice__title {
        margin: 0 0 8px;
        font-size: 15px;
        font-weight: 700;
    }

    .gauge-ai-notice__msg {
        margin: 0;
        font-size: 13px;
        line-height: 1.7;
        color: #1d4ed8;
    }

    .gauge-ai-notice__list {
        margin: 10px 0 0;
        padding-left: 18px;
        color: #334155;
        font-size: 13px;
        line-height: 1.7;
    }

    .gauge-ai-notice--fallback {
        border-color: #fcd34d;
        background: linear-gradient(135deg, #fffbeb 0%, #fffdf5 100%);
    }

    .gauge-ai-notice--fallback .gauge-ai-notice__title {
        color: #92400e;
    }

    .gauge-ai-notice--fallback .gauge-ai-notice__msg {
        color: #b45309;
    }

    .gauge-ai-loading {
        position: fixed;
        inset: 0;
        z-index: 9999;
        display: none;
        align-items: center;
        justify-content: center;
        background: rgba(15, 23, 42, 0.45);
        backdrop-filter: blur(3px);
    }

    .gauge-ai-loading.is-active {
        display: flex;
    }

    .gauge-ai-loading__card {
        width: min(92vw, 420px);
        padding: 28px 24px;
        border-radius: 20px;
        background: rgba(255, 255, 255, 0.98);
        box-shadow: 0 24px 50px rgba(15, 23, 42, 0.22);
        text-align: center;
    }

    .gauge-ai-loading__spinner {
        width: 56px;
        height: 56px;
        margin: 0 auto 16px;
        border-radius: 999px;
        border: 5px solid #dbeafe;
        border-top-color: #2563eb;
        animation: gaugeitem-spin 0.9s linear infinite;
    }

    .gauge-ai-loading__title {
        margin: 0;
        font-size: 18px;
        font-weight: 800;
        color: #0f172a;
    }

    .gauge-ai-loading__desc {
        margin: 10px 0 0;
        font-size: 14px;
        line-height: 1.7;
        color: #64748b;
    }

    .gauge-ai-loading__steps {
        margin: 18px 0 0;
        padding: 0;
        list-style: none;
        text-align: left;
        display: grid;
        gap: 10px;
    }

    .gauge-ai-loading__step {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px 12px;
        border-radius: 12px;
        background: #f8fafc;
        color: #64748b;
        font-size: 13px;
    }

    .gauge-ai-loading__step-index {
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

    .gauge-ai-loading__step.is-active {
        background: #eff6ff;
        color: #1d4ed8;
        box-shadow: inset 0 0 0 1px #bfdbfe;
    }

    .gauge-ai-loading__step.is-active .gauge-ai-loading__step-index {
        background: #2563eb;
        color: #ffffff;
    }

    .gauge-ai-loading__step.is-done {
        background: #ecfdf5;
        color: #047857;
        box-shadow: inset 0 0 0 1px #a7f3d0;
    }

    .gauge-ai-loading__step.is-done .gauge-ai-loading__step-index {
        background: #10b981;
        color: #ffffff;
    }

    @keyframes gaugeitem-spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }
</style>
<div>
<div class="centerdiv">
<div style=" margin: auto; width: 680px; font-size:11pt; text-align:center">
                    <div class="gaugeitem-toolbar">
                        <input id="BtnRegenerateAI" type="button" value="重新用AI生成一次" class="gaugeitem-ai-btn" onclick="return startGaugeRegenerate();" />
                    </div>
                    <asp:Panel ID="PanelAIGenerated" runat="server" Visible="false" CssClass="gauge-ai-notice">
                        <p class="gauge-ai-notice__title"><asp:Label ID="LabelAIGeneratedTitle" runat="server"></asp:Label></p>
                        <asp:Label ID="LabelAIGeneratedMsg" runat="server" CssClass="gauge-ai-notice__msg"></asp:Label>
                        <asp:BulletedList ID="BulletedListAIItems" runat="server" CssClass="gauge-ai-notice__list"></asp:BulletedList>
                    </asp:Panel>
                    <br />
                    自定义评价标准：<asp:Label ID="LabelGtitle" runat="server" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:GridView ID="GVGaugeItem" runat="server"  SkinID="GridViewInfo"
                            AutoGenerateColumns="False"  DataKeyNames="Mid"  Width="100%" CellPadding="6" 
                            Font-Size="9pt"  onrowcommand="GVGaugeItem_RowCommand" 
                        EnableModelValidation="True" onrowdatabound="GVGaugeItem_RowDataBound" 
                        onrowcancelingedit="GVGaugeItem_RowCancelingEdit" 
                        onrowediting="GVGaugeItem_RowEditing" 
                        onrowupdating="GVGaugeItem_RowUpdating" >
                            <Columns>
                                <asp:TemplateField HeaderText="序号">
                                <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("Msort") %>'></asp:Label> 
                                </ItemTemplate>
                                    <ItemStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="评价描述">
								<ItemTemplate>
                                   <asp:Label ID="LabelMitem" runat="server" Text='<%# Bind("Mitem") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxMitem" runat="server" Text='<%# Bind("Mitem") %>'     Font-Size="9pt"  Width="200px" Height="12px" BackColor="#FFFFCC"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Left"  Width="200px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="分值">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelMscore" runat="server" Text='<%# Bind("Mscore") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxMscore" runat="server" Text='<%# Bind("Mscore") %>'     Font-Size="9pt"  Width="20px" Height="12px" BackColor="#FFFFCC"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" >
								<ItemStyle Width="70px" />
                                </asp:CommandField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnDel" runat="server" CausesValidation="false" 
                                          CommandArgument='<%# Eval("Mid") %>'   CommandName="Del" Text="删除"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="30px" />
                                </asp:TemplateField>
                            </Columns>               
                        </asp:GridView>
                    <br />
                    <div >
                            <br />
                        评价描述：<asp:TextBox ID="TextBoxMitem" runat="server" SkinID="TextBoxNormal" 
                        Width="180px" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
                        分值<asp:DropDownList ID="DDLscore" runat="server"  Font-Size="9pt">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem Selected="True">2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>-1</asp:ListItem>
                            <asp:ListItem>-2</asp:ListItem>
                            <asp:ListItem>-3</asp:ListItem>
                            <asp:ListItem>-4</asp:ListItem>
                            <asp:ListItem>-5</asp:ListItem>
            </asp:DropDownList>
                        顺序<asp:DropDownList ID="DDLsort" runat="server"  Font-Size="9pt">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
                        &nbsp;<asp:Button ID="Btnadd" runat="server"  Text="添加量规项"  onclick="Btnadd_Click"
                            CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
                    &nbsp;<asp:Button ID="Btnreturn" runat="server"  Text="返回列表"  onclick="Btnreturn_Click"
                            Width="60px"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
                    <br />
                    </div>
                         </div>
                         
                         </div>
    <div id="gaugeItemLoading" class="gauge-ai-loading" aria-live="polite" aria-busy="true">
        <div class="gauge-ai-loading__card">
            <div class="gauge-ai-loading__spinner"></div>
            <p class="gauge-ai-loading__title">正在重新生成量规项</p>
            <p id="gaugeItemLoadingDesc" class="gauge-ai-loading__desc">系统正在读取当前量规并调用 AI 重新生成，请稍候。</p>
            <ul id="gaugeItemLoadingSteps" class="gauge-ai-loading__steps">
                <li class="gauge-ai-loading__step is-active"><span class="gauge-ai-loading__step-index">1</span><span>正在读取当前量规</span></li>
                <li class="gauge-ai-loading__step"><span class="gauge-ai-loading__step-index">2</span><span>正在调用 AI 生成评价项</span></li>
                <li class="gauge-ai-loading__step"><span class="gauge-ai-loading__step-index">3</span><span>正在覆盖旧量规项并写入新内容</span></li>
            </ul>
        </div>
    </div>
    <br />
<br />
</div>

<script type="text/javascript">
    var gaugeItemEventSource = null;
    var gaugeItemStreamFinished = false;

    function setGaugeItemProgressStep(index) {
        var steps = document.querySelectorAll('#gaugeItemLoadingSteps .gauge-ai-loading__step');
        for (var i = 0; i < steps.length; i++) {
            steps[i].className = 'gauge-ai-loading__step';
            if (i < index) {
                steps[i].className += ' is-done';
            }
            else if (i === index) {
                steps[i].className += ' is-active';
            }
        }
    }

    function setGaugeItemProgressMessage(message) {
        var desc = document.getElementById('gaugeItemLoadingDesc');
        if (desc && message) {
            desc.innerHTML = message;
        }
    }

    function openGaugeItemLoading() {
        var loading = document.getElementById('gaugeItemLoading');
        var button = document.getElementById('BtnRegenerateAI');
        if (button) {
            button.disabled = true;
            button.value = '正在重新生成...';
        }
        if (loading && loading.className.indexOf('is-active') < 0) {
            loading.className += ' is-active';
        }
    }

    function resetGaugeItemButton() {
        var button = document.getElementById('BtnRegenerateAI');
        if (button) {
            button.disabled = false;
            button.value = '重新用AI生成一次';
        }
    }

    function closeGaugeItemEventSource() {
        if (gaugeItemEventSource) {
            gaugeItemEventSource.close();
            gaugeItemEventSource = null;
        }
    }

    function parseGaugeItemSseData(data) {
        try {
            return JSON.parse(data);
        }
        catch (e) {
            return null;
        }
    }

    function startGaugeRegenerate() {
        if (!confirm('重新生成会清空当前已有量规项，并使用 AI 重新写入，是否继续？')) {
            return false;
        }

        if (!window.EventSource) {
            alert('当前浏览器不支持实时进度，请更换浏览器后再试。');
            return false;
        }

        var requestUrl = '<%= ResolveUrl("~/teacher/gauge_generate.ashx") %>' + '?mode=regen&gid=<%= Request.QueryString["gid"] %>';
        openGaugeItemLoading();
        gaugeItemStreamFinished = false;
        setGaugeItemProgressStep(0);
        setGaugeItemProgressMessage('系统正在读取当前量规并准备重新生成。');
        closeGaugeItemEventSource();

        gaugeItemEventSource = new EventSource(requestUrl);
        gaugeItemEventSource.addEventListener('progress', function (event) {
            var payload = parseGaugeItemSseData(event.data);
            if (!payload) {
                return;
            }
            var step = parseInt(payload.step, 10);
            if (!isNaN(step)) {
                setGaugeItemProgressStep(Math.max(0, Math.min(2, step - 1)));
            }
            setGaugeItemProgressMessage(payload.message || '系统正在处理，请稍候。');
        });

        gaugeItemEventSource.addEventListener('done', function (event) {
            var payload = parseGaugeItemSseData(event.data);
            gaugeItemStreamFinished = true;
            closeGaugeItemEventSource();
            setGaugeItemProgressStep(2);
            setGaugeItemProgressMessage(payload && payload.message ? payload.message : '量规项已重新生成，正在刷新页面。');
            window.setTimeout(function () {
                if (payload && payload.redirectUrl) {
                    window.location.href = payload.redirectUrl;
                }
                else {
                    window.location.reload();
                }
            }, 350);
        });

        gaugeItemEventSource.addEventListener('failed', function (event) {
            var payload = event && event.data ? parseGaugeItemSseData(event.data) : null;
            gaugeItemStreamFinished = true;
            closeGaugeItemEventSource();
            resetGaugeItemButton();
            alert(payload && payload.message ? payload.message : '重新生成失败，请稍后重试。');
            window.location.reload();
        });

        gaugeItemEventSource.onerror = function () {
            if (!gaugeItemEventSource || gaugeItemStreamFinished) {
                return;
            }
            closeGaugeItemEventSource();
            resetGaugeItemButton();
            alert('重新生成连接已中断，请稍后重试。');
            window.location.reload();
        };

        return false;
    }
</script>

</asp:Content>
