<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" AutoEventWireup="true" CodeFile="myexam.aspx.cs" Inherits="student_myexam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<div class="w-full max-w-5xl mx-auto space-y-6">
    <!-- Exam Header Card -->
    <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6">
        <div class="flex items-center gap-3 mb-4">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/clock.gif" CssClass="w-8 h-8" />
            <asp:Label runat="server" ID="Lbtitle" CssClass="text-xl font-extrabold text-slate-800 tracking-tight"></asp:Label>
        </div>
        
        <div class="flex flex-wrap gap-x-6 gap-y-2 items-center py-3 px-4 bg-slate-50 rounded-xl border border-slate-100 text-sm text-slate-600">
            <div class="flex items-center gap-1.5">
                <svg class="w-4 h-4 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                <span class="text-slate-500">姓名</span>
                <asp:Label runat="server" ID="Lbsname" CssClass="font-semibold text-slate-800"></asp:Label>
            </div>
            <div class="flex items-center gap-1.5">
                <svg class="w-4 h-4 text-indigo-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0"></path></svg>
                <span class="text-slate-500">学号</span>
                <asp:Label runat="server" ID="Lbsnum" CssClass="font-semibold text-slate-800"></asp:Label>
            </div>
            <div class="flex items-center gap-1.5">
                <svg class="w-4 h-4 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <span class="text-slate-500">得分</span>
                <asp:Label runat="server" ID="Lbfscore" CssClass="font-bold text-emerald-600"></asp:Label>
            </div>
            <div class="flex items-center gap-1.5">
                <svg class="w-4 h-4 text-amber-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path></svg>
                <span class="text-slate-500">类型</span>
                <asp:Label runat="server" ID="Lbtypecn" CssClass="font-semibold text-slate-800"></asp:Label>
            </div>
            <asp:Label runat="server" ID="Lbtype" Visible="False"></asp:Label>
            <asp:Label runat="server" ID="Lbcheck" ></asp:Label>
			<asp:Label ID="LabelCid" runat="server" Visible="False"></asp:Label>
			<asp:Label ID="LabelLid" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="LabelVid" runat="server" Visible="False"></asp:Label> 
            <asp:Label ID="LabelVtotal" runat="server" Visible="False"></asp:Label>
            <asp:HyperLink ID="Hkscore" runat="server" Target="_blank" Visible="False" 
                CssClass="inline-flex items-center gap-1.5 px-3 py-1.5 bg-emerald-50 text-emerald-700 font-semibold rounded-lg hover:bg-emerald-100 transition text-sm border border-emerald-200" ImageUrl="~/images/vote.png" ToolTip="成绩分析"></asp:HyperLink>
        </div>
    </div>
    
    <!-- Rich Content Area -->
    <div id="vcontent" runat="server" class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6 text-slate-700 leading-relaxed" ></div>
    
    <!-- Quiz Questions Area -->
    <div class="quizarea">   
        <div id="questionPage"></div>
        <div class="btnsubmit">
            <input id="btnupload" class="px-6 py-2.5 bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-bold rounded-xl hover:from-blue-600 hover:to-indigo-700 transition duration-300 shadow-md border-0 cursor-pointer" type="submit" value="提交" /> 
        </div>   
    </div>
</div>

<script type="text/javascript" > 
	var jsonstr = "<%=questionList %>";    
	var isclose = "<%=isClose %>";   
	var lidstr = "<%=Lidstr %>";   
	var cidstr = "<%=Cidstr %>";   
	var vidstr = "<%=Vidstr %>";
	var vtypestr = "<%=Vtypestr %>";   
	var isdone = "<%=isDone %>";   

	//console.log(jsonstr);//获取所有试题数据
	var jsonquestion=JSON.parse(Decode64(jsonstr));//base64解码
	var qcount =parseInt(jsonquestion.length);//试题数量，取整
	var div = document.getElementById('questionPage');//渲染区域
    var btnupload = document.getElementById('btnupload');
	var htmlstr="";//渲染内容

	var idList = [];
	var scoreList = [];

	function toBool(str) {
	  if (str === "true" || str === "1" || str.toLowerCase() === "true") {
		return true;
	  } else if (str === "false" || str === "0" || str.toLowerCase() === "false") {
		return false;
	  }
	  return null; // 如果字符串不是 "true" 或 "false"，返回 null 或者抛出错误
	}

    if(toBool(isclose)||toBool(isdone)){    
        btnupload.disabled = true;
    }

	$(document).ready(function(){
		$('#aspnetForm').on('submit', function(event){
			event.preventDefault(); // 阻止默认提交
			console.log("数据列表：",idList);
			console.log("成绩列表：",scoreList);

			var formData = $(this).serializeArray(); // 获取表单数据
			var myData =[];
				
			formData.forEach(function(item,key){
				var itemkey =item.name;	
				
				if(itemkey.indexOf("__")>-1){
					delete formData[key];//清除数组内无效数据
				}
				else{
					myData.push(formData[key]);
				}
			})			
			
			checkquestion(myData);
			
		});
	});

	function checkquestion(dict){
		console.log("参数列表：",dict);
		var answer=[];
		var isright=0;
		var allscore=0;
		var wrongList=[];//错误标签id列表
		
		var idcount=parseInt(idList.length);
		var fdcount=parseInt(Object.keys(dict).length);	
		//核对答案
		console.log("数量对比：",idcount,fdcount);
		var isok=idcount - fdcount;//
		console.log("核对数量："+isok);
		if(isok>0){
			alert("您还有"+isok+"道题目未完成？")
		}
		else{
			for(var i=0;i<fdcount;i++){
			   var item = dict[i];//错位了
			   if(item){
				   if(item.name.indexOf('选')>0){
					   if(idList[i]==item.value){
						   isright++;
						   allscore += scoreList[i];
					   }	
					   else{
						   wrongList.push(item.name);//记录错误标签id
					   }
					   answer.push(item.value);
				   }
				   if(item.name.indexOf('空')>0){
					   if(idList[i]==item.value.trim()){
						   var getid=item.name.split('-')[2];
						   answer.push(getid);
						   isright++;
						   allscore += scoreList[i];
					   }
					   else{
						   wrongList.push(item.name);//记录错误标签id
					   }
					   
				   }
			   }			   
			}
		}
		var iswrong =fdcount-isright;
		console.log("答案核对结果：正确"+isright+"道，错误"+iswrong+"处,成绩为："+allscore+"分");
		//console.log("提交答案："+answer);
		//console.log("错误标签列表：",wrongList);
        if(toBool(isclose)){
            alert("调查测验还未开始！");
        }
        else{
		    noticewrong(wrongList);//提示错误题目
            //提交答案
            btnupload.disabled = true;
			uploadscore(answer.toString(),allscore);
        }
	}

    function uploadscore(selectstr,score){
        var urls = 'uploadexam.ashx' ;
        var formData = new FormData();
        formData.append('selectstr', selectstr);
        formData.append('score', score);
        formData.append('lidstr', lidstr);
        formData.append('cidstr', cidstr);
        formData.append('vidstr', vidstr);
        formData.append('vtypestr', vtypestr);

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
            alert("提交成功！");
			location.reload();
        });
    
    }


	function noticewrong(wrongList){
		var wcount=parseInt(wrongList.length);
		wrongList.forEach(function(wrong){
			var elemid="q"+wrong.split('-')[1];
			var element = document.getElementById(elemid);
			//console.log(element);
			element.style.boxShadow = '0px 0px 6px red';
		})
	}


	var HtmlUtil = {
		// 1.用浏览器内部转换器实现html编码
		htmlEncode: function(html) {
			// 创建一个元素容器
			var tempDiv = document.createElement('div');
			// 把需要编码的字符串赋值给该元素的innerText(ie支持)或者textContent(火狐、谷歌等) 
			(tempDiv.textContent != undefined) ? (tempDiv.textContent = html) : (tempDiv.innerText = html);
			var output = tempDiv.innerHTML;
			tempDiv = null;
			return output;
		},
		
		// 2.用浏览器内部转换器实现html解码
		htmlDecode: function(text) {
			// 创建一个元素容器
			var tempDiv = document.createElement('div');
			// 把解码字符串赋值给元素innerHTML
			tempDiv.innerHTML = text;
			// 最后返回这个元素的innerText(ie支持)或者textContent(火狐、谷歌等支持)
			var output = tempDiv.innerText || tempDiv.textContent;
			tempDiv = null;
			return output;
		}
	}
    
	if(qcount>0){
		console.log("试题数量：",qcount);
		for (var i=0;i<qcount;i++){
			var question = jsonquestion[i];
			//console.log(i,question["Qtitle"]);//调试输出题目
			htmlstr=htmlstr+"<div class='quizquestion' id='q"+question["Qid"]+"' >"+ creatquestion(i,question["Qid"],question["Qtitle"],question["Qblack"],question["Qitem"])+"</div>";
		}	
		div.innerHTML =htmlstr;
	}
			

	function creatquestion(qnum,qid,qtitle,qblack,qitem){
		var title = "";
		var item= "";
		var number =qnum+1;
		if(qblack){
			qtitle = replaceSpanValues(HtmlUtil.htmlDecode(qtitle),qid,qitem);
			title="<div class='quiztitle'>第"+number+"题  "+qtitle+"</div>";
		}
		else{
			var jsonitem = JSON.parse(qitem);
			var itemlen=parseInt(jsonitem.length);
			for(var i=0;i<itemlen;i++){
				var itemstr =HtmlUtil.htmlDecode(jsonitem[i].Mitem);
				var itemscore = parseInt(jsonitem[i].Mscore);
				if(itemscore>0) {
					//console.log(jsonitem[i].Mid);
					idList.push(jsonitem[i].Mid);
					scoreList.push(itemscore);
				}
				//console.log(itemstr)//调试输出试题选项
				item= item+ '<div class="quizraido" ><input type="radio" name="单选-'+qid+'" value="'+jsonitem[i].Mid+'"> '+itemstr+"</div>";
			}
			title="<div class='quiztitle'>第"+number+"题  "+HtmlUtil.htmlDecode(qtitle)+"</div>";
		}
		
		return title+item;
	}

	function replaceSpanValues(htmlString,qid,qitem) {	
	  // 创建一个正则表达式，使用全局搜索标志'g'来找到所有匹配
	  const regex = new RegExp(`<input[^>]+class="[^"]*blackword[^"]*"[^>]*>`, 'g'); 
	  const inputs = htmlString.match(regex);
	  //console.log(spans);
	  const count = inputs.length;
	  var jsonitem = JSON.parse(qitem);
	  if(count>0){
		  for(var i=0;i<count;i++){
			  var sp = ' <input name="填空-'+qid+'-'+jsonitem[i].Mid+'"  class="blackword"  /> ';
			  htmlString = htmlString.replace(inputs[i],sp);
			  
			  var itemstr =HtmlUtil.htmlDecode(jsonitem[i].Mitem);
			  var itemscore = parseInt(jsonitem[i].Mscore);
			  idList.push(itemstr)
			  scoreList.push(itemscore);
		  }
	  }
		
	  return htmlString;
	}
		
	/**
	  * 编码base64
	  */
	 function Encode64(str) {
		 return btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g,
			 function toSolidBytes(match, p1) {
				 return String.fromCharCode('0x' + p1);
			 }));
	 }
	 /**
	  * 解码base64
	  */
	 function Decode64(str) {
		 return decodeURIComponent(atob(str).split('').map(function (c) {
			 return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		 }).join(''));
	 }

</script>

</asp:Content>
