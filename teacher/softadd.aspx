<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher"  Validaterequest="false" AutoEventWireup="true" CodeFile="softadd.aspx.cs" Inherits="Teacher_softadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
  <div class="max-w-6xl mx-auto p-6 bg-white rounded-lg shadow-md mt-6">
    <div class="flex flex-wrap items-center gap-4 mb-6 p-4 bg-gray-50 rounded-md border border-gray-200">
        <div class="flex items-center gap-2">
            <span class="font-medium text-gray-700">资源名称：</span>
            <asp:TextBox ID="Texttitle" runat="server" Width="500px" SkinID="TextBoxNormal" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300"></asp:TextBox>
        </div>

        <div class="flex items-center gap-2">
            <span class="font-medium text-gray-700">资源分类：</span>
            <asp:DropDownList ID="ddlcategory" runat="server" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300 bg-white"></asp:DropDownList>
        </div>

        <div class="flex items-center gap-2">
            <span class="font-medium text-gray-700">资源属性：</span>
            <asp:DropDownList ID="DDLclass" runat="server" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300 bg-white">
                <asp:ListItem Selected="True">教程</asp:ListItem>
                <asp:ListItem>微课</asp:ListItem>
                <asp:ListItem>资料</asp:ListItem>
                <asp:ListItem>软件</asp:ListItem>
                <asp:ListItem>游戏</asp:ListItem>
                <asp:ListItem>课程</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="flex items-center gap-2">
            <span class="font-medium text-gray-700">学分限制：</span>
            <asp:DropDownList ID="DDLopen" runat="server" CssClass="px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-300 bg-white">
                <asp:ListItem Value="10">A</asp:ListItem>
                <asp:ListItem Value="8">B</asp:ListItem>
                <asp:ListItem Value="6">C</asp:ListItem>
                <asp:ListItem Value="4">D</asp:ListItem>
                <asp:ListItem Value="2">E</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="flex items-center gap-4 ml-2">
            <label class="flex items-center gap-1 cursor-pointer">
                <asp:CheckBox ID="CheckBoxFhide" runat="server" Text="是否隐藏" CssClass="mr-1" />
            </label>
            <label class="flex items-center gap-1 cursor-pointer">
                <asp:CheckBox ID="CheckBoxFhid" runat="server" Text="是否共享" CssClass="mr-1" />
            </label>
        </div>
    </div>

    <div class="mb-6 w-full">
           <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
		<script>
		    var editor;
            var cid= '-1';
            var ty="Soft";
            var upjs= '../kindeditor/aspnet/upload_json.aspx?cid='+cid+'&ty='+ty;
            var fmjs='../kindeditor/aspnet/file_manager_json.aspx?cid='+cid+'&ty='+ty;
		    KindEditor.ready(function (K) {
		        editor = K.create('textarea[name="textareaItem"]', {
		            resizeType: 1,
		            newlineTag: "br",                    
				uploadJson : upjs,
				fileManagerJson : fmjs,
				allowFileManager: true,
				filterMode: false	            
		        });
		    });
		</script>
    <textarea name="textareaItem" style="width: 100%; height:400px;"></textarea>
    </div>

    <div class="flex flex-col items-center gap-6 mt-6 p-6 bg-gray-50 rounded-md border border-gray-200">
        <div class="flex items-center gap-2">
            <span class="font-medium text-gray-700">上传可限制资源：</span>
            <asp:FileUpload ID="FUsoft" runat="server" CssClass="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 transition duration-300" />
        </div>

        <asp:Label ID="Labelmsg" runat="server" CssClass="text-red-500 text-sm font-medium"></asp:Label>

        <div class="flex gap-4">
            <asp:Button ID="Btnadd" runat="server" Text="添加" OnClick="Btnadd_Click" SkinID="BtnNormal" CssClass="px-6 py-2 bg-blue-600 text-white font-medium rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition duration-300 shadow-sm border-0" />
            <asp:Button ID="Btnreturn" runat="server" Text="返回" OnClick="Btnreturn_Click" SkinID="BtnNormal" CssClass="px-6 py-2 bg-gray-500 text-white font-medium rounded-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-400 focus:ring-offset-2 transition duration-300 shadow-sm border-0" />
        </div>
    </div>

    <div class="mt-4 p-4 bg-yellow-50 border-l-4 border-yellow-400 text-yellow-800 text-sm rounded-r-md">
        <p class="font-medium">注明：</p>
        <p>资源属性为教程和微课，则学生在浏览学习时能提交自学作品！</p>
    </div>
  </div>
</asp:Content>

