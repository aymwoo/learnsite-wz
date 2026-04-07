<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" Validaterequest="false" AutoEventWireup="true" CodeFile="missionedit.aspx.cs" Inherits="Teacher_missionedit" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">

<div class="cplace missionedit-page">
    <div class="cleft">
        活动名称：<asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal"  Width="200px"  CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
        作品类型<asp:DropDownList ID="DDLmfiletype" runat="server"  Width="60px" Font-Names="Arial">
        </asp:DropDownList>
        <asp:CheckBox ID="CheckUpload" runat="server" Text="是否提交" Checked="True" />
        &nbsp;<asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
        &nbsp;<asp:CheckBox ID="CheckGroup" runat="server" Text="小组合作" />
        <asp:CheckBox ID="CheckRemote" runat="server" Text="远程图片" ToolTip="自动下载远程图片，有时失效！" />
        <asp:CheckBox ID="CheckMicoWorld" runat="server" Text="上次作品"  Checked="False" 
            ToolTip="显示上一节课作品提供下载，适合项目学习连续制作"  />
        <span style="display:inline-flex; align-items:center; gap:4px;">
            <label>编辑器：</label>
            <select id="editorSelector" onchange="switchEditor(this.value)" style="padding: 4px 8px; border: 1px solid #d1d5db; border-radius: 4px; font-size: 14px;">
                <option value="kindeditor" selected>原生编辑器 (KindEditor)</option>
                <option value="wangeditor">富文本编辑器 (WangEditor)</option>
                <option value="vditor">Markdown编辑器 (Vditor)</option>
            </select>
        </span>
        </div>
    <div class="missionedit-editor-wrap">
    <!-- 引入编辑器CDN -->
    <link href="../js/vendors/wangeditor/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
    <script src="../js/vendors/vditor/index.min.js"></script>
    <script src="../js/vendors/wangeditor/index.js"></script>

		<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
		<script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
		
    <div id="wangeditor-wrap" style="display:none; width: 100%; position:relative; border: 1px solid #ccc; z-index: 100;">
        <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
        <div id="wangeditor-text" style="height: 350px;"></div>
    </div>

    <div id="vditor-wrap" style="display:none; width: 100%; position:relative; margin-bottom: 10px;">
        <div id="vditor-container"></div>
    </div>

    <textarea  id ="mcontent" runat ="server" style="width: 100%; height:550px; box-sizing:border-box;" ></textarea>  
    </div>
     <div class="placehold">
               <asp:Label ID="Labelmsg" runat="server" Width="300px"></asp:Label>
               <br />
               选择自定义评价标准：<asp:DropDownList ID="DDLMgid" runat="server" Font-Size="9pt"
            Width="120px" Font-Names="Arial">
        </asp:DropDownList>
               <br />
         <br />
              <asp:Button ID="Btnedit" runat="server"  Text="修改活动" OnClick="Btnedit_Click" OnClientClick="return syncContent();" CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />&nbsp;&nbsp;&nbsp;
              <asp:Button ID="BtnCourse" runat="server" Text="返回学案" OnClick="BtnCourse_Click" CssClass="admin-form-btn admin-form-btn--secondary" />
              <br />
         <br />
         </div>           
        </div>
    <script type="text/javascript">
        window.__missioneditConfig = {
            myCid: '<%=myCid() %>',
            mcontentId: '<%= mcontent.ClientID %>'
        };
    </script>
    <script type="text/javascript" src="../js/missionedit.js"></script>
</asp:Content>
