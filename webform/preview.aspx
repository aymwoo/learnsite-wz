<%@ page title="" language="C#" masterpagefile="~/student/Scm.master" autoeventwireup="true" inherits="webform_preview, App_Web_szqk0oi5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
    <link rel="stylesheet" href="github.min.css">    
    <script src="highlight.min.js"></script>    
    <link href="preview.css" rel="stylesheet">
    
    <input id="HiddenDone" type="hidden" value="<%=Done %>" />
    <input id="HiddenLid" type="hidden" value="<%=Lid %>" />
    <input id="HiddenCid" type="hidden" value="<%=Cid %>" />
    <input id="HiddenEid" type="hidden" value="<%=Eid %>" />
    <input id="HiddenExamjson" type="hidden" value="<%=Examjson %>" />

    <div class="preview-container">
        <!-- 右侧悬浮按钮 -->
        <div class="floating-buttons">
            <img id="submitImg" src="../images/passed.png" alt="提交状态" style="display: none;" />
            <span  id="submitScore" class="score-submit" style="display: none;"> 💰 <%=Score %>分</span>
            <asp:HyperLink ID="HyperLinkAnalysis"  class="score-analysis" runat="server" Target="_blank">查看统计</asp:HyperLink>

            <button type="button"  class="floating-btn btn-submit" id="submitBtn" title="提交试卷">
                <span class="btn-icon">✔</span>
                <span class="btn-text">提交</span>
            </button>
        </div>

        <!-- 试卷内容区域 -->
            <div class="exam-paper" id="examPaper">
                <!-- 试卷头部信息 -->
                <div class="exam-info">
                    <p class="exam-desc" id="examDescription">试卷描述</p>
                </div>

                <!-- 题目列表 -->
                <div class="questions-container" id="questionsContainer">
                    <!-- 题目将在这里动态生成 -->
                </div>

                <!-- 空状态提示 -->
                <div class="empty-state" id="emptyState" style="display: none;">
                    <p>暂无题目，请先添加题目</p>
                </div>
            </div>
    </div>
    
    <!-- 预览页面脚本 -->
    <script src="preview.js"></script>

</asp:Content>

