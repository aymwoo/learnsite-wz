<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" AutoEventWireup="true" CodeFile="exam.aspx.cs" Inherits="webform_exam" %>

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

    <div class="container">
        <!-- 编辑区域 -->
        <div class="panel edit-area" id="editArea">
        </div>
        
        <!-- 右侧悬浮按钮栏 -->
        <div class="floating-action-bar" title="当前分值">
            <label class="floating-score-editor">
                <span class="btn-icon">💰</span>
                <span id="examScore" class="btn-text">00 分</span>
            </label>
            <button type="button" class="floating-btn floating-btn-preview-modal" id="previewModalBtn" title="模态预览">
                <span class="btn-icon">👁</span>
                <span class="btn-text">模态预览</span>
            </button>
            <button type="button" class="floating-btn floating-btn-save" id="saveExamBtn" title="保存为JSON文件">
                <span class="btn-icon">💾</span>
                <span class="btn-text">保存</span>
            </button>
            <button type="button" class="floating-btn floating-btn-import" id="importBtn" title="导入JSON文件">
                <span class="btn-icon">📁</span>
                <span class="btn-text">导入</span>
            </button>
            <button type="button" class="floating-btn floating-btn-clear" id="clearExamBtn" title="清空所有试题">
                <span class="btn-icon">🗑️</span>
                <span class="btn-text">清空</span>
            </button>
            <a href="#" class="floating-btn floating-btn-single-editor" onclick ="returnurl();" title="返回学案">
                <span class="btn-icon">📝</span>
                <span class="btn-text">返回</span>
            </a>
            <input type="file" id="importFileInput" accept=".json" style="display: none;">
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
            if (confirm('是否要离开此页面？') == true) {
                window.location.href = "<%=Fpage %>"
            }
        }

</script>
    <!-- 引入外部JavaScript文件 -->
    <script src="exam.js"></script> 

</asp:Content>

