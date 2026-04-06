<%@ Page Language="C#" AutoEventWireup="true" CodeFile="style.aspx.cs" Inherits="student_style" ResponseEncoding="utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
  <meta charset="UTF-8">
  <title>图像风格迁移</title>
  <link rel="stylesheet" type="text/css" href="../ai/styleml5/style.css">
  <script src="../code/jquery.min.js"></script>
  <script src="../ai/styleml5/libraries/p5.min.js"></script>
  <script src="../ai/styleml5/libraries/p5.dom.min.js"></script>
  <script src="../ai/styleml5/libraries/ml5.min.js"></script>
	<link rel="stylesheet" href="../deepseek/all.min.css">
	<style type="text/css">
		.style-toolbar {
			display: flex;
			flex-wrap: wrap;
			gap: 10px;
			justify-content: center;
			align-items: center;
		}

		.style-toolbar__btn {
			display: inline-flex;
			align-items: center;
			justify-content: center;
			gap: 8px;
			min-width: 118px;
			height: 40px;
			padding: 0 16px;
			border: 0;
			border-radius: 12px;
			background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
			color: #ffffff;
			font-size: 14px;
			font-weight: 700;
			white-space: nowrap;
			box-shadow: 0 14px 28px -18px rgba(37, 99, 235, 0.82);
			cursor: pointer;
			transition: transform .2s ease, box-shadow .2s ease, filter .2s ease;
		}

		.style-toolbar__btn:hover {
			transform: translateY(-1px);
			box-shadow: 0 18px 30px -18px rgba(37, 99, 235, 0.9);
			filter: brightness(1.03);
		}

		.style-toolbar__btn--secondary {
			background: linear-gradient(135deg, #0f766e 0%, #0f766e 100%);
			box-shadow: 0 14px 28px -18px rgba(15, 118, 110, 0.78);
		}

		.style-toolbar__btn--neutral {
			background: linear-gradient(135deg, #475569 0%, #334155 100%);
			box-shadow: 0 14px 28px -18px rgba(51, 65, 85, 0.72);
		}
	</style>


    <link href="../js/css/tailwind-utilities-2.2.19.min.css" rel="stylesheet">
</head>

<body>
  <div class="body-container row">
  <h2 class="center-text">图像风格迁移</h2>  
  <div class="input-container white-box col-3">
    <h3 class="title">① 输入图像</h3>
    <div class="center-container">
      <img id="input-img" src='../ai/styleml5/images/girlwithpearl.jpg'/>
      <div id="input-source" class="reverse-img"></div>
    </div>

    <div class="style-container">
      <div class="container">
          <br><br><br><br><br>
      </div>
    </div>
    <div class="style-container">
	  
      <input id="uploader" name="inputImgFile" type="file" accept="image/*">
	  <button class="style-toolbar__btn" onclick="uploadImg()" type="button"><i class="fa fa-upload" aria-hidden="true"></i><span>上传图片</span></button>
      <div class="hideme" onclick="useWebcam()" >使用我的网络摄像头</div>
    </div>
    <div class="hideme">
	      <button class="style-toolbar__btn style-toolbar__btn--secondary" onclick="onPredictClick()" type="button"><i class="fa fa-arrow-right" aria-hidden="true"></i><span>传输图像</span></button>
    </div>
  </div>

  <div id="learning-container" class="white-box col-3">
    <h3 class="title">② 选择风格</h3>
    <div class="center-container">
      <img id="style-img"src='../ai/styleml5/images/wave.jpg' >
    </div>
	<div id="msg"></div>
    <div class="style-container">
      <div class="container">
        <a class="imageAnchor" href="#" >
          <img class="image" id="wave" alt="浮世绘画 葛饰北斋 《神奈川冲浪》" src='../ai/styleml5/images/wave.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
      <div class="container">
        <a class="imageAnchor" href="#">
          <img class="image" id="la_muse" alt="毕加索 西班牙 《缪斯女神》"  src='../ai/styleml5/images/la_muse.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
      <div class="container">
        <a class="imageAnchor" href="#">
          <img class="image" id="rain_princess" alt="以色列 Leonid Afremov 油画 《绚丽光影》"  src='../ai/styleml5/images/rain_princess.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
    </div>
    <div class="style-container">
      <div class="container">
        <a class="imageAnchor" href="#">
          <img class="image" id="udnie" alt="法国 Francis Picabia 布面油画"  src='../ai/styleml5/images/udnie.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
      <div class="container">
        <a class="imageAnchor" href="#">
          <img class="image" id="wreck"  alt="英国 William Turner 画廊油画 《船只失事》" src='../ai/styleml5/images/wreck.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
      <div class="container">
        <a class="imageAnchor" href="#">
          <img class="image" id="scream" alt="挪威 爱德华蒙克 《呐喊》"  src='../ai/styleml5/images/scream.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
    </div>
    <div class="style-container">
      <div class="container">
        <a class="imageAnchor" href="#">
          <img class="image" id="fuchun"  alt="元 黄公望 山水画 《富春山居图》" src='../ai/styleml5/images/fuchun.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
      <div class="container">
        <a class="imageAnchor" href="#">
          <img class="image" id="zhangdaqian"  alt="张大千 国画 《荷花》" src='../ai/styleml5/images/zhangdaqian.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
      <div class="container">
        <a class="imageAnchor" href="#">
          <img class="image" id="mathura"  alt="马图拉 雕刻" src='../ai/styleml5/images/mathura.jpg' onclick="updateStyleImg(this)"/>
        </a>
      </div>
    </div>
  </div>

  <div class="white-box output-container col-3">
    <h3 class="title">③ 输出图像</h3>
    <div id="output-img-container">
	</div>
	
    <div class="style-container">
      <div class="note">
        将风格迁移到输入图像上，生成新的图像。
      </div>
    </div>
    <div class="style-container">
      <div class="style-toolbar">
      <button id="savebtn" class="style-toolbar__btn" onclick="onProduct()" type="button"><i class="fa fa-save" aria-hidden="true"></i><span>保存图像</span></button>
      </div>
    </div>
    <div class="style-container">
      <div class="style-toolbar">
      <button class="style-toolbar__btn style-toolbar__btn--neutral" onclick="returnurl()" type="button"><i class="fa fa-reply" aria-hidden="true"></i><span>返回学案</span></button>
      </div>
    </div>
  </div>

  </div>
</body>
<script type="text/javascript" >

var id = "<%=Id %>";

var isupload = false;

$("#savebtn").attr('disabled', true);
$("#savebtn").css("background-color", "gray");

function returnurl() {
    if (confirm('是否离开当前活动页面？请先保存作品。') == true) {
        window.location.href = "<%=Fpage %>"
    }
}

/*
===
Fast Style Transfer Simple Demo
===
*/

let nets = {};
let modelNames = ['la_muse', 'rain_princess', 'udnie', 'wreck', 'scream', 'wave', 'mathura', 'fuchun', 'zhangdaqian'];
let inputImg, styleImg;
let outputImgData;
let outputImg;
let modelNum = 0;
let currentModel = 'wave';
let uploader;
let webcam = false;
let modelReady = false;
let video;
let start = false;
let isLoading = true;
let isSafa = false;
let loadingif='../ai/styleml5/images/loading.gif';

function setup() {

  noCanvas();
  inputImg = select('#input-img').elt;
  styleImg = select('#style-img').elt;

  // load models
  modelNames.forEach(n => {
    nets[n] = new ml5.TransformNet('../ai/styleml5/models/' + n + '/', modelLoaded);
  });

  // Image uploader
  uploader = select('#uploader').elt;
  uploader.addEventListener('change', gotNewInputImg);

  // output img container
  outputImgContainer = createImg(loadingif, 'image');
  outputImgContainer.parent('output-img-container');

}

// A function to be called when the model has been loaded
function modelLoaded() {
  modelNum++;
  if (modelNum >= modelNames.length) {
    modelReady = true;
    //predictImg(currentModel);
  }
}

async function predictImg(modelName) {
  if(modelName){
	  isLoading = true;
	  if (!modelReady) return;
	  if (inputImg) {
		outputImgData = nets[modelName].predict(inputImg);
	  }
	  
	  outputImg = ml5.array3DToImage(outputImgData);
	  outputImgContainer.elt.src = outputImg.src;	  
	  isLoading = false;
	$("#savebtn").attr('disabled', false);
	$("#savebtn").css("background-color", "rgb(43, 144, 226)");
  }
  //console.log(isupload);
}

async function draw() {
  if (modelReady && start) {
    await predictImg(currentModel);
  }
}

function blob(dataURI) {
        var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]; 
        var byteString = atob(dataURI.split(',')[1]); 
        var arrayBuffer = new ArrayBuffer(byteString.length); 
        var intArray = new Uint8Array(arrayBuffer); 

        for (var i = 0; i < byteString.length; i++) {
            intArray[i] = byteString.charCodeAt(i);
        }
        return new Blob([intArray], {type: mimeString});
}

function onProduct(){
	//console.log(outputImg);
	if(outputImgContainer.elt.src.includes("loading")){
		alert("请选择风格！");
	}
	else{
		savework();
		alert("保存成功！");
	}
}

function savework() {
    var title = "";
    var Cover = blob(outputImg.src);
    var Content = "";
    var Extension = "png";
    var urls = 'uploadtopic.ashx?id=' + id;
    var formData = new FormData();
    formData.append('title', title);
    formData.append('cover', Cover);
    formData.append('content', Content);
    formData.append('ext', Extension);

    $.ajax({
        url: urls,
        type: 'POST',
        cache: false,
        data: formData,
        processData: false,
        contentType: false
    }).done(function (res) {
        //alert("保存成功！");
        console.log(res)
    });
}
async function updateStyleImg(ele) {
  if (ele.src) {
    styleImg.src = ele.src;
    currentModel = ele.id;
	//console.log(ele.alt);
	$("#msg").text(ele.alt);
  }
  if (currentModel) {
    await predictImg(currentModel);
  }
}

async function updateInputImg(ele) {
  outputImgContainer.elt.src=loadingif;
  if (ele.src) {
		inputImg.src = ele.src;
	}
}

function uploadImg() {
  uploader.click();
}

function gotNewInputImg2() {
  if (uploader.files && uploader.files[0]) {
	outputImgContainer.elt.src=loadingif;
    let newImgUrl = window.URL.createObjectURL(uploader.files[0]);
	inputImg.src =  newImgUrl;
		
	//var w=inputImg.style.width;	
	
    inputImg.style.width = '250px';
    inputImg.style.height = '250px';
	
	isupload=true;
  }
}

function gotNewInputImg() {
  const file = uploader.files[0];
  if(file){
    const reader = new FileReader(); 
    reader.onload = (function(theFile) {
        return function(e) {
        // 创建一个Image元素
        const img = document.createElement('img');
        img.src = e.target.result;
        img.onload=function(){
            var imgWidth = img.width;
            var imgHeight = img.height;        
            // 选择宽度和高度中较小的一个作为正方形边长
            var squareSize = Math.min(imgWidth, imgHeight);        
            // 设置Canvas的尺寸
            var canvas = document.createElement("canvas");
			var ctx = canvas.getContext('2d');
            canvas.width = canvas.height = squareSize;   
                // 绘制裁剪后的图片
            ctx.drawImage(
                img, // 图片元素
                (imgWidth - squareSize) / 2, // 从图片的x坐标开始裁剪
                (imgHeight - squareSize) / 2, // 从图片的y坐标开始裁剪
                squareSize, // 裁剪的宽度
                squareSize, // 裁剪的高度
                0, 0, // 在Canvas上的x和y位置
                squareSize, // 绘制的宽度
                squareSize // 绘制的高度
            );
                
			// 保存画布
			var cv = document.createElement("canvas");
			cv.width = "250"; 
			cv.height = "250";
			var ctx2 = cv.getContext('2d');
			ctx2.drawImage(canvas,0,0, 250, 250); // 改变完宽高后，重绘画布
				
			inputImg.src =   cv.toDataURL("image/jpeg", 0.5);
				
			//inputImg.style.width = '250px';
			//inputImg.style.height = '250px';
				
			isupload=true;
        }

        };
    })(file);

    reader.readAsDataURL(file);     
  }

}

</script>
</html>
