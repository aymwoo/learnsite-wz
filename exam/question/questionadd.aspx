<%@ page language="C#" autoeventwireup="true" inherits="exam_question_questionadd, App_Web_zwyrddiy" masterpagefile="~/teacher/Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- 使用绝对路径重新引用JS文件，覆盖Master中的相对路径 -->
    <script src="/js/MenuCookie.js" type="text/javascript"></script>
    <script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script src="/js/ruffle.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .question-form { padding: 20px; max-width: 900px; margin: 0 auto; }
        .form-header { margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .form-header h2 { margin: 0; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: 600; color: #333; }
        .form-group label span.required { color: #ff4d4f; }
        .form-control { width: 100%; padding: 8px 12px; border: 1px solid #d9d9d9; border-radius: 4px; box-sizing: border-box; }
        .form-control:focus { border-color: #40a9ff; outline: none; }
        .form-row { display: flex; gap: 15px; }
        .form-row .form-group { flex: 1; }
        textarea.form-control { min-height: 120px; resize: vertical; }
        .options-container { border: 1px solid #e8e8e8; border-radius: 4px; padding: 15px; margin-top: 10px; }
        .option-item { display: flex; align-items: center; margin-bottom: 10px; gap: 10px; }
        .option-item .label { width: 30px; font-weight: 600; }
        .option-item input[type="text"] { flex: 1; padding: 8px; border: 1px solid #d9d9d9; border-radius: 4px; }
        .option-item input[type="checkbox"], .option-item input[type="radio"] { margin-right: 5px; }
        .btn { display: inline-block; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-default { background: #f0f0f0; color: #333; }
        .btn-success { background: #52c41a; color: #fff; }
        .btn-sm { padding: 4px 8px; font-size: 12px; }
        .form-actions { margin-top: 20px; padding-top: 15px; border-top: 1px solid #e8e8e8; text-align: center; }
        .form-actions .btn { min-width: 100px; margin: 0 5px; }
        .help-text { font-size: 12px; color: #999; margin-top: 5px; }
        .editor-toolbar { border: 1px solid #d9d9d9; border-bottom: none; border-radius: 4px 4px 0 0; padding: 5px; background: #fafafa; }
        .editor-toolbar button { padding: 4px 8px; margin-right: 5px; border: 1px solid #d9d9d9; background: #fff; cursor: pointer; border-radius: 3px; }
        .editor-toolbar button:hover { background: #e6f7ff; }
        .editor-content { border: 1px solid #d9d9d9; border-radius: 0 0 4px 4px; min-height: 150px; padding: 10px; }
        .editor-content:focus { outline: none; border-color: #40a9ff; }
    </style>

    <div class="question-form">
        <div class="form-header">
            <h2><asp:Literal ID="ltlTitle" runat="server">添加题目</asp:Literal></h2>
        </div>

        <asp:HiddenField ID="hfQuestionId" runat="server" />
        <asp:HiddenField ID="hfBankId" runat="server" />

        <div class="form-row">
            <div class="form-group">
                <label><span class="required">*</span> 题型</label>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    <asp:ListItem Value="1">单选题</asp:ListItem>
                    <asp:ListItem Value="2">多选题</asp:ListItem>
                    <asp:ListItem Value="3">判断题</asp:ListItem>
                    <asp:ListItem Value="4">填空题</asp:ListItem>
                    <asp:ListItem Value="5">简答题</asp:ListItem>
                    <asp:ListItem Value="6">连线题</asp:ListItem>
                    <asp:ListItem Value="7">分类题</asp:ListItem>
                    <asp:ListItem Value="9">多项填空</asp:ListItem>
                    <asp:ListItem Value="10">下拉选择</asp:ListItem>
                    <asp:ListItem Value="11">打分题</asp:ListItem>
                    <asp:ListItem Value="12">矩阵单选</asp:ListItem>
                    <asp:ListItem Value="14">NPS评分</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>难度</label>
                <asp:DropDownList ID="ddlDifficulty" runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">简单</asp:ListItem>
                    <asp:ListItem Value="2">中等</asp:ListItem>
                    <asp:ListItem Value="3">困难</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>默认分值</label>
                <asp:TextBox ID="txtScore" runat="server" CssClass="form-control" Text="1"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label><span class="required">*</span> 题目内容</label>
            <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="请输入题目内容..."></asp:TextBox>
        </div>

        <!-- 选项区域 -->
        <asp:Panel ID="pnlOptions" runat="server" CssClass="form-group">
            <label><span class="required">*</span> 选项设置</label>
            <p class="help-text">勾选正确答案</p>
            <div class="options-container">
                <asp:PlaceHolder ID="phOptions" runat="server"></asp:PlaceHolder>
                <asp:Button ID="btnAddOption" runat="server" Text="+ 添加选项" CssClass="btn btn-default btn-sm" OnClick="btnAddOption_Click" />
            </div>
        </asp:Panel>

        <!-- 判断题区域 -->
        <asp:Panel ID="pnlJudge" runat="server" CssClass="form-group" Visible="false">
            <label><span class="required">*</span> 正确答案</label>
            <div>
                <label style="margin-right: 20px;"><asp:RadioButton ID="rbTrue" runat="server" GroupName="judge" /> 正确</label>
                <label><asp:RadioButton ID="rbFalse" runat="server" GroupName="judge" /> 错误</label>
            </div>
        </asp:Panel>

        <!-- 填空题区域 -->
        <asp:Panel ID="pnlFillBlank" runat="server" CssClass="form-group" Visible="false">
            <label><span class="required">*</span> 填空答案</label>
            <p class="help-text">多个空用 | 分隔，例如：答案1|答案2|答案3</p>
            <asp:TextBox ID="txtFillAnswer" runat="server" CssClass="form-control" placeholder="请输入填空答案，多个空用 | 分隔"></asp:TextBox>
        </asp:Panel>

        <!-- 简答题区域 -->
        <asp:Panel ID="pnlTextAnswer" runat="server" CssClass="form-group" Visible="false">
            <label>参考答案</label>
            <asp:TextBox ID="txtRefAnswer" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="请输入参考答案..."></asp:TextBox>
        </asp:Panel>

        <!-- 多项填空区域 -->
        <asp:Panel ID="pnlMultipleBlank" runat="server" CssClass="form-group" Visible="false">
            <label><span class="required">*</span> 填空设置</label>
            <p class="help-text">每行一个填空，格式：答案（必填）|提示文本</p>
            <asp:TextBox ID="txtMultipleBlank" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="答案1|提示文本1&#10;答案2|提示文本2"></asp:TextBox>
        </asp:Panel>

        <!-- 打分题区域 -->
        <asp:Panel ID="pnlScore" runat="server" CssClass="form-group" Visible="false">
            <label>打分设置</label>
            <div class="form-row">
                <div class="form-group">
                    <label>最小值</label>
                    <asp:TextBox ID="txtScoreMin" runat="server" CssClass="form-control" Text="1"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>最大值</label>
                    <asp:TextBox ID="txtScoreMax" runat="server" CssClass="form-control" Text="5"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>默认值</label>
                    <asp:TextBox ID="txtScoreDefault" runat="server" CssClass="form-control" Text="3"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>

        <!-- NPS评分区域 -->
        <asp:Panel ID="pnlNps" runat="server" CssClass="form-group" Visible="false">
            <label>NPS评分设置</label>
            <div class="form-row">
                <div class="form-group">
                    <label>低分文案</label>
                    <asp:TextBox ID="txtNpsLow" runat="server" CssClass="form-control" Text="不满意"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>高分文案</label>
                    <asp:TextBox ID="txtNpsHigh" runat="server" CssClass="form-control" Text="非常满意"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>

        <!-- 矩阵题区域 -->
        <asp:Panel ID="pnlMatrix" runat="server" CssClass="form-group" Visible="false">
            <label><span class="required">*</span> 矩阵设置</label>
            <div class="form-row">
                <div class="form-group">
                    <label>行标题（逗号分隔）</label>
                    <asp:TextBox ID="txtMatrixRows" runat="server" CssClass="form-control" placeholder="项目1,项目2,项目3"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>列标题（逗号分隔）</label>
                    <asp:TextBox ID="txtMatrixCols" runat="server" CssClass="form-control" placeholder="选项A,选项B,选项C"></asp:TextBox>
                </div>
            </div>
            <div class="form-group" style="margin-top:10px;">
                <label>正确答案（JSON格式）</label>
                <p class="help-text">如：{"项目1":"选项A","项目2":"选项B"}</p>
                <asp:TextBox ID="txtMatrixAnswer" runat="server" CssClass="form-control" placeholder='{"行1":"列2","行2":"列1"}'></asp:TextBox>
            </div>
        </asp:Panel>

        <!-- 连线题区域 -->
        <asp:Panel ID="pnlMatching" runat="server" CssClass="form-group" Visible="false">
            <label><span class="required">*</span> 连线设置</label>
            <p class="help-text">每行一对，格式：左边项=右边项</p>
            <asp:TextBox ID="txtMatching" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Python=Guido van Rossum&#10;Java=James Gosling&#10;C++=Bjarne Stroustrup"></asp:TextBox>
        </asp:Panel>

        <!-- 分类题区域 -->
        <asp:Panel ID="pnlSorting" runat="server" CssClass="form-group" Visible="false">
            <label><span class="required">*</span> 分类设置</label>
            <p class="help-text">格式：类别名:选项1,选项2,选项3（每行一个类别）</p>
            <asp:TextBox ID="txtSorting" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="编程语言:Python,Java,C++&#10;数据库:MySQL,MongoDB,Redis"></asp:TextBox>
        </asp:Panel>

        <div class="form-group">
            <label>答案解析</label>
            <asp:TextBox ID="txtAnalysis" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="答案解析（可选）"></asp:TextBox>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>知识点</label>
                <asp:TextBox ID="txtKnowledge" runat="server" CssClass="form-control" placeholder="如：函数、循环"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>标签</label>
                <asp:TextBox ID="txtTags" runat="server" CssClass="form-control" placeholder="多个标签用逗号分隔"></asp:TextBox>
            </div>
        </div>

        <!-- 隐藏字段，用于存储JavaScript收集的正确答案 -->
        <asp:HiddenField ID="hfCorrectAnswers" runat="server" />

        <div class="form-actions">
            <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            <asp:Button ID="btnSaveAdd" runat="server" Text="保存并继续添加" CssClass="btn btn-success" OnClick="btnSaveAdd_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="btn btn-default" OnClick="btnCancel_Click" />
        </div>

        <script type="text/javascript">
            // 在表单提交前收集正确答案
            function collectCorrectAnswers() {
                // 获取所有单选和多选按钮
                var allRadios = document.querySelectorAll('input[type="radio"]');
                var allCheckboxes = document.querySelectorAll('input[type="checkbox"]');
                var correctAnswers = [];

                // 检查所有单选按钮
                allRadios.forEach(function(rb) {
                    if (rb.checked) {
                        // 从ID中提取选项标签（格式：xxx$rb_A）
                        var match = rb.id.match(/rb_([A-H])$/);
                        if (match) {
                            correctAnswers.push(match[1]);
                        }
                    }
                });

                // 检查所有复选框
                allCheckboxes.forEach(function(cb) {
                    if (cb.checked) {
                        // 从ID中提取选项标签（格式：xxx$cb_A）
                        var match = cb.id.match(/cb_([A-H])$/);
                        if (match) {
                            correctAnswers.push(match[1]);
                        }
                    }
                });

                // 将正确答案存入隐藏字段
                var hfCorrectAnswers = document.getElementById('<%= hfCorrectAnswers.ClientID %>');
                if (hfCorrectAnswers) {
                    hfCorrectAnswers.value = correctAnswers.join(',');
                } else {
                    console.error('找不到隐藏字段 hfCorrectAnswers!');
                }

                console.log('=== 收集完成 ===');
                return true;
            }

            // 绑定到保存按钮的点击事件
            document.addEventListener('DOMContentLoaded', function() {
                var btnSave = document.getElementById('<%= btnSave.ClientID %>');
                var btnSaveAdd = document.getElementById('<%= btnSaveAdd.ClientID %>');

                if (btnSave) {
                    btnSave.addEventListener('click', function(e) {
                        collectCorrectAnswers();
                    });
                }
                if (btnSaveAdd) {
                    btnSaveAdd.addEventListener('click', function(e) {
                        collectCorrectAnswers();
                    });
                }

                // 页面加载完成后输出所有选项的信息
                setTimeout(function() {
                    var optionsContainer = document.querySelector('.options-container');

                    if (optionsContainer) {
                        var optionItems = optionsContainer.querySelectorAll('.option-item');

                        optionItems.forEach(function(item, index) {
                            var rb = item.querySelector('input[type="radio"]');
                            var cb = item.querySelector('input[type="checkbox"]');
                            var txt = item.querySelector('input[type="text"]');

                            if (rb) {
                                console.log('选项 ' + index + ': 单选按钮 id=' + rb.id + ', checked=' + rb.checked);
                            }
                            if (cb) {
                                console.log('选项 ' + index + ': 复选框 id=' + cb.id + ', checked=' + cb.checked);
                            }
                            if (txt) {
                                console.log('选项 ' + index + ': 文本框 id=' + txt.id + ', value=' + txt.value);
                            }
                        });
                    }
                }, 1000);
            });
        </script>
    </div>
</asp:Content>
