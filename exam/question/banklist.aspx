<%@ Page Language="C#" AutoEventWireup="true" CodeFile="banklist.aspx.cs" Inherits="exam_question_banklist" MasterPageFile="~/teacher/Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- 使用绝对路径重新引用JS文件，覆盖Master中的相对路径 -->
    <script src="/js/MenuCookie.js" type="text/javascript"></script>
    <script src="/js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script src="/js/ruffle.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .bank-container { padding: 20px; }
        .bank-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .bank-header h2 { margin: 0; }
        .btn { display: inline-block; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; font-size: 14px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-default { background: #f0f0f0; color: #333; }
        .bank-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 15px; }
        .bank-card { background: #fff; border-radius: 8px; padding: 15px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); cursor: pointer; transition: all 0.3s; }
        .bank-card:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.15); transform: translateY(-2px); }
        .bank-card .name { font-size: 16px; font-weight: 600; margin-bottom: 10px; }
        .bank-card .info { font-size: 13px; color: #666; margin-bottom: 5px; }
        .bank-card .count { display: inline-block; background: #e6f7ff; color: #1890ff; padding: 2px 8px; border-radius: 10px; font-size: 12px; margin-top: 10px; }
        .bank-card .actions { margin-top: 10px; padding-top: 10px; border-top: 1px solid #f0f0f0; }
        .bank-card .actions a { color: #1890ff; text-decoration: none; margin-right: 10px; font-size: 13px; }
        .bank-card .actions a:hover { color: #40a9ff; }
        .bank-card .actions a.danger { color: #ff4d4f; }
        .bank-card.select-mode { border: 2px solid #52c41a; }
        .bank-card.select-mode .name::after { content: ' (点击选择题目)'; font-size: 12px; color: #52c41a; }
        .modal { display: none; position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.5); z-index: 1000; align-items: center; justify-content: center; }
        .modal.show { display: flex; }
        .modal-content { background: #fff; border-radius: 8px; padding: 20px; width: 400px; max-width: 90%; }
        .modal-header { margin-bottom: 15px; }
        .modal-header h3 { margin: 0; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: 600; }
        .form-control { width: 100%; padding: 8px 12px; border: 1px solid #d9d9d9; border-radius: 4px; box-sizing: border-box; }
        .modal-footer { margin-top: 20px; text-align: right; }
        .modal-footer .btn { margin-left: 10px; }
        .select-tip { background: #e6f7ff; padding: 10px 15px; border-radius: 4px; margin-bottom: 15px; border: 1px solid #91d5ff; color: #1890ff; }
    </style>

    <div class="bank-container">
        <div class="bank-header">
            <h2><asp:Literal ID="ltlPageTitle" runat="server" Text="题库管理"></asp:Literal></h2>
            <div>
                <asp:Panel ID="pnlNormalButtons" runat="server">
                    <button type="button" class="btn btn-primary" onclick="showAddModal()">+ 新建题库</button>
                    <button type="button" class="btn btn-primary" onclick="showImportModal()">从课堂测验导入</button>
                    <a href="../examlist.aspx" class="btn btn-default">返回考试</a>
                </asp:Panel>
                <asp:Panel ID="pnlSelectButtons" runat="server" Visible="false">
                    <a href="../paper/paperadd.aspx" class="btn btn-default">取消选择</a>
                </asp:Panel>
            </div>
        </div>

        <asp:Panel ID="pnlSelectTip" runat="server" Visible="false" CssClass="select-tip">
            请点击题库卡片，从中选择题目添加到试卷
        </asp:Panel>

        <div class="bank-grid">
            <asp:Repeater ID="rptBanks" runat="server" OnItemCommand="rptBanks_ItemCommand" OnItemDataBound="rptBanks_ItemDataBound">
                <ItemTemplate>
                    <div class="bank-card<%# IsSelectMode ? " select-mode" : "" %>" onclick="<%# GetCardClick(Eval("BankId")) %>">
                        <div class="name"><%# Eval("BankName") %></div>
                        <div class="info"><%# Eval("Description") %></div>
                        <div class="info">创建时间：<%# Eval("CreateTime", "{0:yyyy-MM-dd}") %></div>
                        <span class="count"><%# Eval("QuestionCount") %> 道题目</span>
                        <asp:Panel ID="pnlActions" runat="server" CssClass="actions" onclick="event.stopPropagation();">
                            <a href="questionlist.aspx?bankId=<%# Eval("BankId") %>">管理题目</a>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("BankId") %>'>编辑</asp:LinkButton>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("BankId") %>' CssClass="danger" OnClientClick="return confirm('确定删除此题库吗？');">删除</asp:LinkButton>
                        </asp:Panel>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false" style="text-align:center;padding:50px;color:#999;">
            暂无题库，请点击"新建题库"添加
        </asp:Panel>
    </div>

    <!-- 新建/编辑题库弹窗 -->
    <div id="bankModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3><asp:Literal ID="ltlModalTitle" runat="server">新建题库</asp:Literal></h3>
            </div>
            <asp:HiddenField ID="hfBankId" runat="server" />
            <div class="form-group">
                <label>题库名称 <span style="color:red">*</span></label>
                <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control" placeholder="请输入题库名称"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>题库编码 <span style="color:#999;font-weight:normal">(留空则自动生成)</span></label>
                <asp:TextBox ID="txtBankCode" runat="server" CssClass="form-control" placeholder="例如：BK_MATH_001，留空自动生成"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>描述</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="题库描述"></asp:TextBox>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="hideModal()">取消</button>
                <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            </div>
        </div>
    </div>

    <!-- 从课堂测验导入弹窗 -->
    <div id="importModal" class="modal">
        <div class="modal-content" style="width: 600px; max-height: 80vh; overflow-y: auto;">
            <div class="modal-header">
                <h3>从课堂测验导入题目</h3>
            </div>
            <div class="form-group">
                <label>选择课堂测验：</label>
                <select id="examSelect" class="form-control" onchange="loadExamQuestions(this.value)">
                    <option value="">-- 请选择课堂测验 --</option>
                </select>
            </div>
            <div class="form-group">
                <label>选择题库：</label>
                <select id="targetBankSelect" class="form-control">
                    <option value="">-- 请选择题库 --</option>
                </select>
            </div>
            <div class="form-group">
                <label>年级：</label>
                <select id="gradeSelect" class="form-control">
                    <option value="">-- 请选择年级 --</option>
                </select>
            </div>
            <div class="form-group">
                <label>难度：</label>
                <select id="difficultySelect" class="form-control">
                    <option value="1">简单</option>
                    <option value="2">中等</option>
                    <option value="3">困难</option>
                </select>
            </div>
            <div class="form-group">
                <label>标签（用逗号分隔）：</label>
                <input type="text" id="tagsInput" class="form-control" placeholder="例如：选择题,基础题">
            </div>
            <div class="form-group">
                <label>题目列表：</label>
                <div id="questionList" style="max-height: 200px; overflow-y: auto; border: 1px solid #d9d9d9; padding: 10px;">
                    <div style="color: #999; text-align: center;">请先选择课堂测验</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="hideImportModal()">取消</button>
                <button type="button" class="btn btn-primary" onclick="importQuestions()">导入题目</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        let currentExamQuestions = []; // 存储当前加载的题目列表
        
        function showAddModal() {
            document.getElementById('<%= hfBankId.ClientID %>').value = '';
            document.getElementById('<%= txtBankName.ClientID %>').value = '';
            document.getElementById('<%= txtBankCode.ClientID %>').value = '';
            document.getElementById('<%= txtDescription.ClientID %>').value = '';
            document.getElementById('bankModal').classList.add('show');
        }
        function hideModal() {
            document.getElementById('bankModal').classList.remove('show');
        }
        function showEditModal(id, name, code, desc) {
            document.getElementById('<%= hfBankId.ClientID %>').value = id;
            document.getElementById('<%= txtBankName.ClientID %>').value = name;
            document.getElementById('<%= txtBankCode.ClientID %>').value = code;
            document.getElementById('<%= txtDescription.ClientID %>').value = desc;
            document.getElementById('bankModal').classList.add('show');
        }
        
        // 导入功能
        function showImportModal() {
            document.getElementById('importModal').classList.add('show');
            loadExamList();
            loadBankList();
            loadGradeList();
        }
        
        function hideImportModal() {
            document.getElementById('importModal').classList.remove('show');
        }
        
        function loadExamList() {
            fetch('/exam/GetExamList.ashx')
                .then(response => response.json())
                .then(data => {
                    console.log('GetExamList返回数据:', data); // 调试信息
                    if (data.success && data.exams) {
                        const examSelect = document.getElementById('examSelect');
                        examSelect.innerHTML = '<option value="">-- 请选择课堂测验 --</option>';
                        data.exams.forEach(exam => {
                            const option = document.createElement('option');
                            option.value = exam.Vid; // 修改为Vid
                            option.textContent = exam.Vtitle; // 修改为Vtitle
                            examSelect.appendChild(option);
                        });
                    }
                })
                .catch(error => {
                    console.error('加载课堂测验列表失败:', error);
                    alert('加载课堂测验列表失败！');
                });
        }
        
        function loadBankList() {
            const targetBankSelect = document.getElementById('targetBankSelect');
            targetBankSelect.innerHTML = '<option value="">-- 请选择题库 --</option>';
            
            // 从Repeater中获取题库列表
            const bankCards = document.querySelectorAll('.bank-card');
            bankCards.forEach(card => {
                const bankName = card.querySelector('.name').textContent;
                const bankId = card.getAttribute('onclick').match(/bankId=(\d+)/)[1];
                const option = document.createElement('option');
                option.value = bankId;
                option.textContent = bankName;
                targetBankSelect.appendChild(option);
            });
        }
        
        function loadGradeList() {
            fetch('/exam/GetGradeList.ashx')
                .then(response => response.json())
                .then(data => {
                    if (data.success && data.grades) {
                        const gradeSelect = document.getElementById('gradeSelect');
                        gradeSelect.innerHTML = '<option value="">-- 请选择年级 --</option>';
                        data.grades.forEach(grade => {
                            const option = document.createElement('option');
                            option.value = grade.GradeId;
                            option.textContent = grade.GradeName;
                            gradeSelect.appendChild(option);
                        });
                    }
                })
                .catch(error => {
                    console.error('加载年级列表失败:', error);
                    alert('加载年级列表失败！');
                });
        }
        
        function loadExamQuestions(eid) {
            if (!eid) {
                document.getElementById('questionList').innerHTML = '<div style="color: #999; text-align: center;">请先选择课堂测验</div>';
                currentExamQuestions = [];
                return;
            }
            
            console.log('加载题目，eid:', eid);
            
            fetch('/exam/GetExamQuestions.ashx?eid=' + eid)
                .then(response => {
                    console.log('响应状态:', response.status);
                    return response.json();
                })
                .then(data => {
                    console.log('返回数据:', data);
                    
                    if (data.success && data.questions) {
                        currentExamQuestions = data.questions;
                        const questionListDiv = document.getElementById('questionList');
                        
                        if (data.questions.length === 0) {
                            questionListDiv.innerHTML = '<div style="color: #999; text-align: center;">该课堂测验暂无题目</div>';
                        } else {
                            let html = '';
                            data.questions.forEach((q, index) => {
                                html += `
                                    <div style="padding: 8px; border-bottom: 1px solid #f0f0f0;">
                                        <input type="checkbox" id="q_${index}" value="${index}" checked>
                                        <label for="q_${index}" style="margin-left: 5px;">
                                            ${index + 1}. ${q.typeText} - ${q.title.substring(0, 50)}${q.title.length > 50 ? '...' : ''}
                                        </label>
                                    </div>
                                `;
                            });
                            questionListDiv.innerHTML = html;
                        }
                    } else {
                        console.error('加载失败:', data);
                        document.getElementById('questionList').innerHTML = '<div style="color: red; text-align: center;">加载失败：' + (data.message || '未知错误') + '</div>';
                        currentExamQuestions = [];
                    }
                })
                .catch(error => {
                    console.error('加载题目列表失败:', error);
                    document.getElementById('questionList').innerHTML = '<div style="color: red; text-align: center;">加载题目列表失败：' + error.message + '</div>';
                    currentExamQuestions = [];
                });
        }
        
        function importQuestions() {
            const bankId = document.getElementById('targetBankSelect').value;
            const gradeId = document.getElementById('gradeSelect').value;
            const difficulty = document.getElementById('difficultySelect').value;
            const tags = document.getElementById('tagsInput').value;
            
            if (!bankId) {
                alert('请选择题库！');
                return;
            }
            
            if (!gradeId) {
                alert('请选择年级！');
                return;
            }
            
            if (currentExamQuestions.length === 0) {
                alert('请先选择课堂测验！');
                return;
            }
            
            // 获取选中的题目
            const selectedQuestions = [];
            const checkboxes = document.querySelectorAll('#questionList input[type="checkbox"]:checked');
            checkboxes.forEach(cb => {
                const index = parseInt(cb.value);
                const qData = currentExamQuestions[index].data;
                console.log('选中题目数据:', index, qData);
                selectedQuestions.push(qData);
            });
            
            console.log('准备导入的题目数量:', selectedQuestions.length);
            console.log('第一道题目:', selectedQuestions[0]);
            
            if (selectedQuestions.length === 0) {
                alert('请至少选择一道题目！');
                return;
            }
            
            // 构建请求数据
            const requestData = {
                bankId: parseInt(bankId),
                gradeId: parseInt(gradeId),
                difficulty: parseInt(difficulty),
                tags: tags,
                questions: selectedQuestions
            };
            
            // 发送到服务器
            fetch('/exam/ImportExamQuestionsToBank.ashx', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(requestData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(`成功导入 ${data.savedCount} 道题目到题库！`);
                    hideImportModal();
                    // 刷新页面以更新题库题目数量
                    location.reload();
                } else {
                    alert('导入失败：' + (data.message || '未知错误'));
                }
            })
            .catch(error => {
                console.error('导入题目失败:', error);
                alert('导入题目失败：' + error.message);
            });
        }
    </script>
</asp:Content>
