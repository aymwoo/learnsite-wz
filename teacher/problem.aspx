<%@ Page Title="" Language="C#"  Validaterequest="false"  AutoEventWireup="true" CodeFile="problem.aspx.cs" Inherits="Teacher_problem" ResponseEncoding="utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="../App_Themes/Teacher/StyleSheet.css" />
    <link href="../js/vendors/wangeditor/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
    <script src="../js/MenuCookie.js" type="text/javascript"></script>
    <script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <style type="text/css">

#editor{
  top:  8px;
  left: 0px;
  height:320px;
  background-color: #fef8e4;
  max-width:980px;
}

.btn{
  border: 1px solid #e0dbcb; 
  text-decoration: none;
  background-color: #f1ebd4;
   width:80px;
}

#savemsg
{  
  bottom: 60px;
  margin: 10px;
  z-index: 999;
  color:#ed7d31; 
  font-size:32px; 
  width: 100%;
  text-align:center;  
}
#result{ 
  top:  0px;
  left: 600px;
  height:160px;
  min-width:550px;  
  background-color: #666;
  color:#ccc;
  max-width:980px;
}
#output{ 
    text-align:left;
    padding:10px;
}

.input
{
	font-size:14px;
    height:20px;
	border:1px solid #ccc;
}
.input:focus{
    height:20px;
	outline: none;
	border:1px solid #ccc;
}
#centerbar{
  position: absolute;
  margin: 10px;
  z-index: 999;
  top: 250px;  
  width: 800px;
  text-align:right;
}

.problem-editor-switch {
  display:flex;
  align-items:center;
  gap:8px;
  margin:8px 0;
}

.problem-editor-switch select {
  min-height:36px;
  padding:0 28px 0 10px;
  border:1px solid #cbd5e1;
  border-radius:8px;
  background:#fff;
  color:#0f172a;
}

#problem-wangeditor-wrap,
#problem-vditor-wrap,
#mcontent,
.ke-container {
  max-width:980px;
  width:980px !important;
}
</style>

    <link href="../js/css/tailwind-utilities-2.2.19.min.css" rel="stylesheet">
</head>
<body >
       <form id="form1" runat="server" > 
       <div  >
        <div  class="mainhead" onclick="ShowMenu()">  
            <asp:Image ID="Imagelogo" runat="server" ImageUrl="~/images/learnsite.gif"  ToolTip = "信息技术学习平台 LearnSite &#13;Powered By Asp.net2.0+Sql2005Express &#13;温州水乡设计编写" Height="24px" />
        </div>
        <div class="mainarea">
        <div  id="MenuDiv"  class="mainleft" >
            <div id="navig">
            <ul id="navigul">
            <li class="navmenuhead"></li>
            <li class="navigli"><a href="../teacher/start.aspx">上课</a></li>
            <li class="navigli"><a href="../teacher/course.aspx">备课</a></li>
            <li class="navigli"><a href="../teacher/gauge.aspx">量规</a></li>
            <li class="navigli"><a href="../teacher/works.aspx">作品</a></li>
            <li class="navigli"><a href="../teacher/signin.aspx">签到</a></li>
            <li class="navigli"><a href="../teacher/student.aspx">学生</a></li>
            <li class="navigli"><a href="../quiz/quiz.aspx">测验</a></li>
            <li class="navigli"><a href="../teacher/typer.aspx">中文</a></li>
            <li class="navigli"><a href="../teacher/typechinese.aspx">拼音</a></li>
            <li class="navigli"><a href="../teacher/soft.aspx">资源</a></li>
            <li class="navigli"><a href="../teacher/infomation.aspx">信息</a></li>
            <li class="navigli"><a href="../teacher/systeminfo.aspx">状态</a></li>
            <li class="navigli"><a href="../teacher/helper.aspx">帮助</a></li>
            <li class="navmenu">            
            <div onclick="HideMenu()">
                <asp:Label ID="LabelVer" runat="server" Font-Size="8pt"></asp:Label>
            </div>
            </li>
            </ul>
            </div>
        </div>  
        <div class="mainright">
        <div  class="mainrighttop"></div>
        <div class="mainrightcontent">
    <div style="margin: 10px;  ">
        <div style="margin: auto; text-align: left; min-width:800px;">
            <b>试题内容：&nbsp; </b><asp:DropDownList ID="ddscore" runat="server" Height="16px" 
                Width="40px">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Selected="True">2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>分<br />
<div class="problem-editor-switch">
    <span style="font-size:13px;font-weight:700;color:#334155;">编辑器：</span>
    <select id="editorSelector" onchange="switchProblemEditor(this.value)">
        <option value="kindeditor" selected>KindEditor</option>
        <option value="wangeditor">WangEditor</option>
        <option value="vditor">Vditor</option>
    </select>
</div>
<div id="problem-wangeditor-wrap" style="display:none; position:relative; border:1px solid #ccc; z-index:100; margin-bottom:10px;">
    <div id="problem-wangeditor-toolbar" style="border-bottom:1px solid #ccc;"></div>
    <div id="problem-wangeditor-text" style="height:220px;"></div>
</div>
<div id="problem-vditor-wrap" style="display:none; position:relative; margin-bottom:10px;">
    <div id="problem-vditor-container"></div>
</div>
&nbsp;<textarea id ="mcontent" runat ="server" ClientIDMode="Static" name="textareaWord" style="width: 980px; height:120px;" ></textarea>
        </div>

<div id="editor"></div>
<div id="result">
<pre id="output" > </pre>
</div>
<div style="margin: auto; ">
    <br />
    &nbsp;&nbsp;
    <asp:Button ID="Btnadd" runat="server" OnClick="Btnadd_Click" OnClientClick="return syncProblemContent();"
        Text="添加题目"  CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
    &nbsp; &nbsp;<asp:Button ID="Btnreturn" runat="server" OnClick="Btnreturn_Click"
        Text="返回测评"   CssClass="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0" />
    <br />
    <br />
</div>     
    <asp:HiddenField ID="code" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="print" runat="server" ClientIDMode="Static" />
<div id="centerbar">
<button  onclick="runit()" type="button"  class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0"> 
<i class="fa fa-play" aria-hidden="true"></i>运行
</button>
&nbsp; &nbsp;
<button  onclick="clearit()" type="button"  class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0"> 
<i class="fa fa-play" aria-hidden="true"></i>清空
</button>
</div>
    </div>
  <!-- 主要文件 -->
  <script src="../code/build/src/ace.js" type="text/javascript"></script>
  <!-- 用来提供代码提示和自动补全的插件 -->
  <script src="../code/build/src/ext-language_tools.js" type="text/javascript"></script>
  <script src="../code/build/src/ext-beautify.js" type="text/javascript"></script>
  <script type="text/javascript">
    // ace.require("ace/ext/language_tools");
    // 初始化editor(）
    var aeditor = ace.edit("editor");
    aeditor.setOptions({
      // 默认:false
      wrap: true, // 换行
      // autoScrollEditorIntoView: false, // 自动滚动编辑器视图
      enableLiveAutocompletion: true, // 智能补全
      enableSnippets: true, // 启用代码段
      //enableBasicAutocompletion: true, // 启用基本完成 不推荐使用
    });
    // 设置主题  cobalt monokai vscode xcode textmate sqlserver  twilight
    aeditor.setTheme("ace/theme/textmate");
    // 设置编辑语言
    aeditor.getSession().setMode("ace/mode/python");
    aeditor.setFontSize(24);
    aeditor.setReadOnly(false)
    aeditor.getSession().setTabSize(4);

  </script>


<script src="../code/skulpt.min.js" type="text/javascript"></script>
<script src="../code/skulpt-stdlib.js" type="text/javascript"></script>
<script src="../code/html2canvas.min.js" type="text/javascript"></script>
<script src="../code/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">
    var mycode = document.getElementById("code");
    var pprint = document.getElementById("print");

    var mypre = document.getElementById("output");
    var result = document.getElementById("result");
    var savemsg = document.getElementById("savemsg");

    function outf(text) {
        mypre.innerText = mypre.innerText + text;
    }
    function builtinRead(x) {
        if (Sk.builtinFiles === undefined || Sk.builtinFiles["files"][x] === undefined)
            throw "File not found: '" + x + "'";
        return Sk.builtinFiles["files"][x];
    }

    result.onclick = function () {
        output.focus();
    }

    function initedit() {
        var cc = mycode.value;
        var pp = pprint.value;
        if (cc.length > 0) {
            aeditor.setValue(cc);
            mypre.innerText = pp;
        }
    }

    window.addEventListener('load', function () {
        mycode = document.getElementById("code");
        pprint = document.getElementById("print");
        console.log(mycode);
        console.log(pprint);
        initedit();
    });

    function myfun() {
        return new Promise(function (resolve, reject) {
            var myinput = document.createElement("input");
            myinput.setAttribute("type", "text");
            myinput.setAttribute("class", "input");
            mypre.appendChild(myinput);
            myinput.focus();
            result.onclick = function () {
                myinput.focus();
            }

            myinput.onkeypress = function () {
                if (event.keyCode == 13) {
                    args = myinput.value;
                    console.log(args);
                    resolve(args);
                    mypre.removeChild(myinput);
                    temp = mypre.innerText;
                    temp = temp + args;
                    mypre.innerHTML = temp + "\n";
                }
            }
        })
    }
    function clearit() {
        output.innerHTML = '';
        mypre.innerHTML = '';
        pprint.value = '';
    }
    function runit() {
        var prog = aeditor.getValue();
        mypre.innerHTML = '';
        output.innerHTML = '';
        Sk.pre = "output";
        Sk.configure({ output: outf, read: builtinRead, __future__: Sk.python3, inputfun: myfun });

        var myPromise = Sk.misceval.asyncToPromise(function () {
            return Sk.importMainWithBody("<stdin>", false, prog, true);
        });

        myPromise.then(function (mod) {
            console.log('运行成功!');
            mycode.value = prog;
            pprint.value = output.innerText;
            console.log('代码：');
            console.log(mycode.value);
            console.log('输出结果：');
            console.log(pprint.value);
            //getsvg();
        },
    function (err) {
        var msg = err.toString();
        console.log(msg);
        mypre.innerHTML = msg;
    });
    }

    function getsvg() {
        var op = output.innerHTML;
        if (op == '') {
            var canvas = document.createElement("canvas");
            if (canvas != null) {
                var dataUrl = canvas.toDataURL('image/jpeg');
                pprint.value = dataUrl;
                console.log(dataUrl);
            }
        }
    }

    document.onkeyup = keyUp;
    function keyUp() {
        var prog = aeditor.getValue();
        mycode.value = prog;
        voice();
    }
    function voice() {
        var audio = document.createElement("audio");
        audio.src = '../code/code.ogg';
        audio.play();
    }
</script>
<script charset="utf-8" src="../kindeditor/kindeditor-min.js" type="text/javascript"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js" type="text/javascript"></script>
<script src="../js/vendors/vditor/index.min.js"></script>
<script src="../js/vendors/wangeditor/index.js"></script>
<script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
<script>
	var keditor;
	var wangEditorObj;
	var vditorObj;
	var currentEditor = 'kindeditor';
	var lastVditorMarkdown = null;
	var lastVditorHtml = '';
	var vditorReady = false;
	var pendingVditorHtml = null;
	var cid= <%=myCid() %>;
	var ty="Course";
	var upjs= '../kindeditor/aspnet/upload_json.aspx?cid='+cid+'&ty='+ty;
	var fmjs='../kindeditor/aspnet/file_manager_json.aspx?cid='+cid+'&ty='+ty;
	KindEditor.ready(function (K) {
		keditor = K.create('#mcontent', {
		    resizeType: 1,
		    pasteType: 1,
		    newlineTag: "br",				
			uploadJson : upjs,
			fileManagerJson : fmjs,
			allowFileManager : true,
			filterMode : false,
		    allowImageUpload: true,
		    items: ['fontname', 'fontsize', '|', 'bold', 'italic','removeformat','image','about'] ,
		    afterCreate: function () {
		        window.setTimeout(autoSelectInitialProblemEditor, 0);
		    }
		});
	});
  function isProblemHtml(content) {
      return /<\/?[a-z][\s\S]*>/i.test(content || '');
  }

  function isLikelyProblemMarkdown(content) {
      if (!content) return false;
      return /```/.test(content)
          || /^#{1,6}\s/m.test(content)
          || /^\s*[-*+]\s/m.test(content)
          || /^\s*\d+\.\s/m.test(content)
          || /\[[^\]]+\]\([^)]+\)/.test(content);
  }

  function normalizeProblemContent(content) {
      return (content || '').replace(/\s+/g, ' ').trim();
  }

  function getPreferredProblemVditorValue(content) {
      if (!content) return '';
      return isProblemHtml(content) ? safeProblemHtml2Md(content) : content;
  }

  function rememberProblemVditorState() {
      if (!vditorObj) return;
      lastVditorMarkdown = vditorObj.getValue();
      lastVditorHtml = vditorObj.getHTML();
  }

  function shouldRestoreProblemMarkdown(currentHtml) {
      if (lastVditorMarkdown === null) return false;
      var currentNormalized = normalizeProblemContent(currentHtml);
      var savedNormalized = normalizeProblemContent(lastVditorHtml);
      return currentNormalized === '' || currentNormalized === savedNormalized;
  }

  function autoSelectInitialProblemEditor() {
      var selector = document.getElementById('editorSelector');
      var mcontent = document.getElementById('mcontent');
      if (!selector || !mcontent) return;
      if (isLikelyProblemMarkdown(mcontent.value)) {
          selector.value = 'vditor';
          switchProblemEditor('vditor');
      }
  }

  function initProblemWangEditor() {
      if (wangEditorObj) return;
      const { createEditor, createToolbar } = window.wangEditor;
      const mcontent = document.getElementById('mcontent');
      wangEditorObj = createEditor({
          selector: '#problem-wangeditor-text',
          html: keditor ? keditor.html() : mcontent.value,
          config: {
              placeholder: '请输入试题内容...',
              MENU_CONF: {
                  uploadImage: { server: upjs, customInsert(res, insertFn) { if (res.error === 0) insertFn(res.url); else alert(res.message || '图片上传失败'); } },
                  uploadAttachment: { server: upjs, customInsert(res) { if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res); else alert(res.message || '附件上传失败'); } },
                  uploadFile: { server: upjs, customInsert(res) { if (res.error === 0) LearnSiteEditorUploadHelper.insertUploadedLinkToWangEditor(wangEditorObj, res); else alert(res.message || '文件上传失败'); } }
              }
          }
      });
      createToolbar({ editor: wangEditorObj, selector: '#problem-wangeditor-toolbar', config: {} });
  }

  function safeProblemHtml2Md(html) {
      try {
          if (vditorObj && vditorObj.vditor && vditorObj.vditor.lute) return vditorObj.vditor.lute.HTML2Md(html);
          var l = Lute.New();
          return l.HTML2Md(html);
      } catch (e) {
          return html;
      }
  }

  function initProblemVditor() {
      if (vditorObj) return;
      const mcontent = document.getElementById('mcontent');
      var initialContent = getPreferredProblemVditorValue(lastVditorMarkdown !== null ? lastVditorMarkdown : (keditor ? keditor.html() : mcontent.value));
      vditorObj = new Vditor('problem-vditor-container', {
          height: 260,
          mode: 'ir',
          upload: { handler: function (files) { LearnSiteEditorUploadHelper.handleVditorUpload(vditorObj, upjs, files); } },
          preview: { mode: 'both' },
          cache: { enable: false },
          after: function () {
              vditorReady = true;
              var contentToSet = pendingVditorHtml !== null ? pendingVditorHtml : initialContent;
              vditorObj.setValue(contentToSet || '');
              rememberProblemVditorState();
              pendingVditorHtml = null;
          }
      });
  }

  function syncProblemContent() {
      var mcontent = document.getElementById('mcontent');
      if (!mcontent) return true;
      if (currentEditor === 'kindeditor' && keditor) mcontent.value = keditor.html();
      else if (currentEditor === 'wangeditor' && wangEditorObj) mcontent.value = wangEditorObj.getHtml();
      else if (currentEditor === 'vditor' && vditorObj) {
          rememberProblemVditorState();
          mcontent.value = lastVditorMarkdown || '';
      }
      return true;
  }

  function switchProblemEditor(type) {
      currentEditor = type;
      var kindContainer = document.querySelector('.ke-container');
      var wangContainer = document.getElementById('problem-wangeditor-wrap');
      var vditorContainer = document.getElementById('problem-vditor-wrap');
      var currentHtml = '';
      if (kindContainer && kindContainer.style.display !== 'none' && keditor) currentHtml = keditor.html();
      else if (wangContainer && wangContainer.style.display !== 'none' && wangEditorObj) currentHtml = wangEditorObj.getHtml();
      else if (vditorContainer && vditorContainer.style.display !== 'none' && vditorObj && vditorReady) {
          rememberProblemVditorState();
          currentHtml = lastVditorHtml;
      }
      if (kindContainer) kindContainer.style.display = 'none';
      if (wangContainer) wangContainer.style.display = 'none';
      if (vditorContainer) vditorContainer.style.display = 'none';
      if (type === 'kindeditor') {
          if (kindContainer) kindContainer.style.display = 'block';
          if (keditor && currentHtml) keditor.html(currentHtml);
      } else if (type === 'wangeditor') {
          if (wangContainer) wangContainer.style.display = 'block';
          initProblemWangEditor();
          if (wangEditorObj && currentHtml) wangEditorObj.setHtml(currentHtml);
      } else if (type === 'vditor') {
          if (vditorContainer) vditorContainer.style.display = 'block';
          var vditorContent = shouldRestoreProblemMarkdown(currentHtml) ? lastVditorMarkdown : getPreferredProblemVditorValue(currentHtml);
          if (!vditorObj) {
              pendingVditorHtml = vditorContent;
              initProblemVditor();
          } else if (vditorReady) {
              vditorObj.setValue(vditorContent || '');
              rememberProblemVditorState();
          } else {
              pendingVditorHtml = vditorContent;
          }
      }
  }
</script> 
        </div>         
        </div>   
        </div>
    </div>    
    </form>
</body>
</html>
