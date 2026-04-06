<%@ Page Language="C#" AutoEventWireup="true" CodeFile="iframe.aspx.cs" Inherits="student_iframe" ResponseEncoding="utf-8" %>

<html lang="zh-CN">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>嵌入网页活动</title>
    <link rel="stylesheet" href="../deepseek/all.min.css">
    <script src="../code/jquery.min.js" type="text/javascript"></script>
    <script src="../Plupload/plupload.full.min.js" type="text/javascript"></script>
	<style>
	    body {
	        margin: 0;
	        font-family: "PingFang SC", "Microsoft YaHei", sans-serif;
	        background: linear-gradient(180deg, #eff6ff 0%, #f8fafc 100%);
	        color: #0f172a;
	    }

	    .iframe-page {
	        max-width: 1440px;
	        margin: 0 auto;
	        padding: 24px 20px 32px;
	    }

	    .iframe-hero {
	        border-radius: 24px;
	        background: linear-gradient(135deg, #0f172a 0%, #1d4ed8 58%, #38bdf8 100%);
	        box-shadow: 0 24px 48px -30px rgba(37, 99, 235, 0.8);
	        color: #ffffff;
	        padding: 28px 28px 24px;
	        position: relative;
	        overflow: hidden;
	    }

	    .iframe-hero:before,
	    .iframe-hero:after {
	        content: "";
	        position: absolute;
	        border-radius: 999px;
	        background: rgba(255,255,255,0.1);
	        pointer-events: none;
	    }

	    .iframe-hero:before {
	        width: 220px;
	        height: 220px;
	        top: -110px;
	        right: -70px;
	    }

	    .iframe-hero:after {
	        width: 180px;
	        height: 180px;
	        bottom: -120px;
	        right: 18%;
	    }

	    .iframe-hero-body {
	        position: relative;
	        z-index: 1;
	    }

	    .iframe-eyebrow {
	        display: inline-flex;
	        align-items: center;
	        gap: 8px;
	        padding: 6px 12px;
	        border-radius: 999px;
	        background: rgba(255,255,255,0.12);
	        border: 1px solid rgba(255,255,255,0.18);
	        font-size: 13px;
	        font-weight: 700;
	    }

	    .iframe-title {
	        margin: 14px 0 8px;
	        font-size: clamp(24px, 3vw, 34px);
	        font-weight: 800;
	        letter-spacing: -0.02em;
	    }

	    .iframe-subtitle {
	        margin: 0;
	        max-width: 920px;
	        color: rgba(255,255,255,0.84);
	        line-height: 1.8;
	        font-size: 15px;
	    }

	    .iframe-toolbar {
	        display: flex;
	        flex-wrap: wrap;
	        gap: 12px;
	        margin-top: 18px;
	    }

	    .iframe-btn {
	        display: inline-flex;
	        align-items: center;
	        justify-content: center;
	        gap: 8px;
	        min-width: 112px;
	        min-height: 42px;
	        padding: 0 16px;
	        border: 0;
	        border-radius: 12px;
	        background: #ffffff;
	        color: #1d4ed8;
	        font-size: 14px;
	        font-weight: 700;
	        white-space: nowrap;
	        cursor: pointer;
	        box-shadow: 0 16px 32px -22px rgba(15, 23, 42, 0.55);
	        transition: transform .2s ease, box-shadow .2s ease, background .2s ease;
	    }

	    .iframe-btn:hover {
	        transform: translateY(-1px);
	        box-shadow: 0 18px 34px -22px rgba(15, 23, 42, 0.58);
	        background: #eff6ff;
	    }

	    .iframe-btn-primary {
	        background: #1d4ed8;
	        color: #ffffff;
	    }

	    .iframe-btn-neutral {
	        background: linear-gradient(135deg, #475569 0%, #334155 100%);
	        color: #ffffff;
	    }

	    .iframe-btn-neutral:hover {
	        background: linear-gradient(135deg, #334155 0%, #1f2937 100%);
	    }

	    .iframe-btn-primary:hover {
	        background: #1e40af;
	    }

	    .iframe-layout {
	        display: grid;
	        grid-template-columns: minmax(0, 1fr);
	        gap: 18px;
	        margin-top: 18px;
	    }

	    .iframe-panel {
	        background: rgba(255,255,255,0.92);
	        border: 1px solid rgba(148, 163, 184, 0.18);
	        border-radius: 22px;
	        box-shadow: 0 18px 38px -30px rgba(15, 23, 42, 0.35);
	        backdrop-filter: blur(10px);
	    }

	    .iframe-panel-head {
	        padding: 20px 22px 0;
	    }

	    .iframe-panel-title {
	        margin: 0;
	        font-size: 17px;
	        font-weight: 800;
	        color: #0f172a;
	    }

	    .iframe-panel-desc {
	        margin: 8px 0 0;
	        color: #64748b;
	        font-size: 14px;
	        line-height: 1.75;
	    }

	    .iframe-mission {
	        padding: 12px 22px 22px;
	        color: #334155;
	        line-height: 1.85;
	        word-break: break-word;
	    }

	    .iframe-frame-wrap {
	        padding: 0 18px 18px;
	    }

	    #homeframe {
	        width: 100%;
	        min-height: 78vh;
	        border: 0;
	        border-radius: 18px;
	        background: #ffffff;
	        box-shadow: inset 0 0 0 1px rgba(191, 219, 254, 0.85);
	    }

	    @media (max-width: 768px) {
	        .iframe-page {
	            padding: 16px 12px 24px;
	        }

	        .iframe-hero {
	            padding: 22px 18px 18px;
	            border-radius: 20px;
	        }

	        .iframe-toolbar {
	            display: grid;
	            grid-template-columns: repeat(2, minmax(0, 1fr));
	        }

	        .iframe-btn {
	            width: 100%;
	        }

	        .iframe-panel-head,
	        .iframe-mission {
	            padding-left: 16px;
	            padding-right: 16px;
	        }

	        .iframe-frame-wrap {
	            padding: 0 12px 12px;
	        }
	    }
	</style>

    <link href="../js/css/tailwind-utilities-2.2.19.min.css" rel="stylesheet">
</head>
<body>
    <div class="iframe-page">
        <section class="iframe-hero">
            <div class="iframe-hero-body">
                <div class="iframe-eyebrow"><i class="fa fa-window-maximize" aria-hidden="true"></i> 嵌入网页活动</div>
                <h1 class="iframe-title">外部工具学习区</h1>
                <p class="iframe-subtitle">先阅读活动说明，再在下方嵌入页面中完成操作。提交作品后可返回学案继续学习。</p>
                <div class="iframe-toolbar">
                    <button onclick="homeland()" class="iframe-btn"><i class="fa fa-home" aria-hidden="true"></i> 首页</button>
                    <button onclick="backward()" class="iframe-btn"><i class="fa fa-arrow-left" aria-hidden="true"></i> 后退</button>
                    <button onclick="forward()" class="iframe-btn"><i class="fa fa-arrow-right" aria-hidden="true"></i> 前进</button>
                    <button id="savebtn" type="button" class="iframe-btn iframe-btn-primary" title="将PSD格式图片上传到服务器上"><i class="fa fa-upload" aria-hidden="true"></i> 提交作品</button>
                    <button onclick="returnurl()" class="iframe-btn iframe-btn-neutral"><i class="fa fa-reply" aria-hidden="true"></i> 返回学案</button>
                </div>
            </div>
        </section>

        <div class="iframe-layout">
            <section class="iframe-panel">
                <div class="iframe-panel-head">
                    <h2 class="iframe-panel-title">活动说明</h2>
                    <p class="iframe-panel-desc">以下内容由教师在活动编辑页维护，帮助你明确本次任务要求、完成标准和操作注意事项。</p>
                </div>
                <div id="Mcontents" class="iframe-mission"><%= HttpUtility.HtmlDecode(Mcontents) %></div>
            </section>

            <section class="iframe-panel">
                <div class="iframe-panel-head">
                    <h2 class="iframe-panel-title">嵌入网页</h2>
                    <p class="iframe-panel-desc">如果目标网页没有自动加载，可使用“首页”重新打开。完成操作后记得提交作品并返回学案。</p>
                </div>
                <div class="iframe-frame-wrap">
                    <iframe id="homeframe" title="嵌入网页操作区" sandbox="allow-scripts allow-same-origin allow-forms allow-popups allow-downloads">
                      您的浏览器不支持 iframe。
                    </iframe>
                </div>
            </section>
        </div>
    </div>
    <script type="text/javascript" >
		var id = "<%=Id %>";
		var courseurl = "<%=Fpage %>";
		var homeurl= "<%=Mexample %>"; 

		var homeframe = document.getElementById("homeframe");		
		homeland();
		
		function homeland(){
			homeframe.src=homeurl;
			//console.log("首页",homeurl);			
		}
		function backward(){
			window.history.back();
			console.log("后退");			
		}
		function forward(){
			window.history.forward();
			console.log("前进");			
		}	
        var docurl = document.URL;
		var ipurl = docurl.substring(0, docurl.lastIndexOf("/"));
		
        function returnurl() {
            if (confirm('是否离开当前活动页面？请先保存作品。') == true) {
                window.location.href = courseurl;
            }
        }

        // 上传图片
        var isup = false;
        var urlstr = "uploadworkm.aspx?lid=" + "<%=Lid %>";
        var uploader = new plupload.Uploader({
            runtimes: 'html5,html4',
            browse_button: 'savebtn', // you can pass an id...
            url: urlstr,
            multi_selection: false,
            filters: {
                max_file_size: '60mb',
                mime_types: [
			        { title: "work files", extensions: "<%=Ext %>" }
		        ]
            },
            init: {
                FilesAdded: function (up, files) {
                    uploader.start();
                },
                UploadProgress: function (up, file) {
                    if (file.percent == 100 && !isup) {
                        isup = true;
                    }
                },
                UploadComplete: function (up, file) {
                    alert("作品已经提交成功！");
                }
            }
        });

        uploader.init();
</script>
</body>
</html>
