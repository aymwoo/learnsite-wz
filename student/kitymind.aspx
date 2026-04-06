<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" EnableViewStateMac="false"  CodeFile="kitymind.aspx.cs" Inherits="student_kitymind" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    	<meta charset=utf-8>
	<!-- bower:css -->
	<link rel="stylesheet" href="../../Plugins/km/bower_components/bootstrap/dist/css/bootstrap.css" />
	<link rel="stylesheet" href="../../Plugins/km/bower_components/codemirror/lib/codemirror.css" />
	<link rel="stylesheet" href="../../Plugins/km/bower_components/hotbox/hotbox.css" />
	<link rel="stylesheet" href="../../Plugins/km/bower_components/kityminder-core/dist/kityminder.core.css" />
	<link rel="stylesheet" href="../../Plugins/km/bower_components/color-picker/dist/color-picker.min.css" />
	<!-- endbower -->

	<link rel="stylesheet" href="../../Plugins/km/kityminder.editor.css">
		<style>
		div.minder-editor-container {
			top: 0px;
		}
	</style>

    <link href="../js/css/tailwind-utilities.css" rel="stylesheet">
</head>

<body ng-app="kityminderDemo" >
    <form id="form1" runat="server">
       <div id="mcontext" style="display: none; background: #fffdea; overflow-y: auto; overflow-x: hidden;
            position: absolute;  width: 500px; height: 50%; z-index: 999;opacity:0.9; font-size: 16px;
            right: 0px; bottom: 0px; padding: 2px;">
            <div style="margin:10px; ">
            <h4><%=Titles%></h4>
            <%=Mcontents %>
            </div>
        </div>
    </form>
<div class="fixed top-3 right-6 z-[9999] flex items-center gap-3">
    <a href="#" onclick="return downfile(this);" class="px-5 py-2 bg-gradient-to-r from-emerald-500 to-teal-500 text-white text-sm font-bold rounded-lg shadow-md hover:from-emerald-600 hover:to-teal-600 hover:shadow-lg transition-all duration-300 flex items-center gap-2 border border-emerald-400">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3m-1 4l-3 3m0 0l-3-3m3 3V4"></path></svg>
        保存作品
    </a>
    <a href="#" onclick="returnurl();" class="px-5 py-2 bg-gradient-to-r from-slate-600 to-slate-700 text-white text-sm font-bold rounded-lg shadow-md hover:from-slate-700 hover:to-slate-800 hover:shadow-lg transition-all duration-300 flex items-center gap-2 border border-slate-500">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
        返回
    </a>
</div>
<kityminder-editor on-init="initEditor(editor, minder)" data-theme="fresh-green"></kityminder-editor>

<!-- bower:js -->
<script src="../../Plugins/km/bower_components/jquery/dist/jquery.js"></script>
<script src="../../Plugins/km/bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script src="../../Plugins/km/bower_components/angular/angular.js"></script>
<script src="../../Plugins/km/bower_components/angular-bootstrap/ui-bootstrap-tpls.js"></script>
<script src="../../Plugins/km/bower_components/codemirror/lib/codemirror.js"></script>
<script src="../../Plugins/km/bower_components/codemirror/mode/xml/xml.js"></script>
<script src="../../Plugins/km/bower_components/codemirror/mode/javascript/javascript.js"></script>
<script src="../../Plugins/km/bower_components/codemirror/mode/css/css.js"></script>
<script src="../../Plugins/km/bower_components/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="../../Plugins/km/bower_components/codemirror/mode/markdown/markdown.js"></script>
<script src="../../Plugins/km/bower_components/codemirror/addon/mode/overlay.js"></script>
<script src="../../Plugins/km/bower_components/codemirror/mode/gfm/gfm.js"></script>
<script src="../../Plugins/km/bower_components/angular-ui-codemirror/ui-codemirror.js"></script>
<script src="../../Plugins/km/bower_components/marked/lib/marked.js"></script>
<script src="../../Plugins/km/bower_components/kity/dist/kity.min.js"></script>
<script src="../../Plugins/km/bower_components/hotbox/hotbox.js"></script>
<script src="../../Plugins/km/bower_components/json-diff/json-diff.js"></script>
<script src="../../Plugins/km/bower_components/kityminder-core/dist/kityminder.core.min.js"></script>
<script src="../../Plugins/km/bower_components/color-picker/dist/color-picker.min.js"></script>
<!-- endbower -->

<script src="../../Plugins/km/kityminder.editor.js"></script>
<script >
    window.__learnStatus = {
        snum: "<%= Snum %>",
        sname: "<%= LsSname %>",
        sgrade: "<%= LsSgrade %>",
        sclass: "<%= LsSclass %>",
        sid: "<%= LsSid %>",
        cid: "<%= LsCid %>",
        lid: "<%= LsLid %>",
        ltitle: "<%= LsLtitle %>",
        ltype: "<%= LsLtype %>"
    };

    window.addEventListener('load', function () {
        var codefile = "<%=codefile %>";
        if (codefile != "") {
            codefile = decodeURIComponent(codefile);
            console.log(codefile);
            var fileType = 'json'
            editor.minder.importData(fileType, codefile).then(function (data) {
                console.log(data)
            });
        }
    });
    var fpage = "<%=Fpage %>";
    function returnurl() {
        if (confirm('是否要离开此页面？') == true) {
            window.location.href = "<%=Fpage %>"
        }
    }
    //点击导出链接自动下载
    function downfile(link) {
        var title = editor.minder.getRoot().getData("text");
        exportType = 'json';
        console.log("保存信息");

        var content = editor.minder.exportData(exportType);
        var strJson = content.fulfillValue;

        exportType = 'png';
        editor.minder.exportData(exportType).then(function (content) {
            var blob = new Blob();
            blob = dataURLtoBlob(content); //将base64编码转换为blob对象

            var id = "<%=Id %>";
            var urls = 'uploadkitymind.ashx?id=' + id;
            var formData = new FormData();
            //console.log("编码信息");
            var km = encodeURIComponent(strJson);

            formData.append('title', title);
            formData.append('km', km);
            formData.append('thumb', blob);
            //console.log(km);
            //console.log(blob);

            $.ajax({
                url: urls,
                type: 'POST',
                cache: false,
                data: formData,
                processData: false,
                contentType: false
            }).done(function (res) {
                if (window.LearnStatus && typeof window.LearnStatus.submitted === "function") {
                    window.LearnStatus.submitted();
                }
                alert("保存成功！");
                $(".export").attr("disabled", "false");
                console.log(res)
            }).fail(function (res) {
                alert("保存失败！");
                console.log(res)
            });

        });
    }

    //base64转换为图片blob
    function dataURLtoBlob(dataurl) {
        var arr = dataurl.split(',');
        //注意base64的最后面中括号和引号是不转译的
        var _arr = arr[1].substring(0, arr[1].length - 2);
        var mime = arr[0].match(/:(.*?);/)[1],
    bstr = atob(_arr),
    n = bstr.length,
    u8arr = new Uint8Array(n);
        while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new Blob([u8arr], {
            type: mime
        });
    }

</script>

<script src="../js/learnstatus.js" type="text/javascript"></script>

<script>
    angular.module('kityminderDemo', ['kityminderEditor'])
	.controller('MainController', function ($scope) {
	    $scope.initEditor = function (editor, minder) {
	        window.editor = editor;
	        window.minder = minder;
	    };
	});
</script>


</body>
</html>
