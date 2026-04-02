<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="student_chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线讨论</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../code/imgchat/chat.css" />
    <script type="text/javascript" src="../code/jquery.min.js"></script>
<script type="text/javascript" src="../code/imgchat/fcup.min.js"></script>
<script type="text/javascript" src="../code/imgchat/jquery.lineProgressbar.js"></script>
    <link rel="stylesheet" type="text/css" href="../code/imgchat/jquery.lineProgressbar.css" />

    <link href="https://cdn.bootcdn.net/ajax/libs/tailwindcss/2.2.19/utilities.min.css" rel="stylesheet">
    <style>
        /* Modern Responsive Flexbox Overrides */
        html, body { height: 100%; margin: 0; background: #f1f5f9; overflow: hidden; }
        body { padding: 1.5rem; box-sizing: border-box; }
        .content { height: 100%; display: flex; justify-content: center; align-items: center; }
        .chatBox {
            width: 100% !important;
            max-width: 1000px;
            height: clamp(500px, 90vh, 800px) !important;
            display: flex !important;
            flex-direction: row;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
            border: 1px solid #e2e8f0;
            background: #ffffff;
            margin: 0 auto;
        }
        .chatLeft {
            width: 100% !important;
            flex: 1;
            display: flex;
            flex-direction: column;
            border-right: 1px solid #e2e8f0;
            float: none !important;
        }
        .chatRight {
            width: 250px !important;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            background: #f8fafc;
            float: none !important;
        }
        .chat01 { flex: 1; display: flex; flex-direction: column; min-height: 0; overflow: hidden; }
        .chat01_title, .chat02_title, .chat02_bar, .chat03_title { background: #f8fafc !important; border-bottom: 1px solid #e2e8f0; }
        .chat02_bar { border-bottom: none; border-top: 1px solid #e2e8f0; background: #ffffff !important;}
        .talkTo li { background: none !important; margin: 0 !important; padding: 0.5rem 1rem !important; }
        .talkTo li a { background: none !important; color: #1e293b !important; font-size: 0.95rem !important; padding: 0 !important; display: flex; align-items: center; gap: 0.5rem;}
        .talkTo li a::before { content: ""; display: block; width: 8px; height: 8px; background: #3b82f6; border-radius: 50%; }
        .chat01_content { height: auto !important; flex: 1; overflow-y: auto; overflow-x: hidden; padding: 1rem; }
        .chat02 { height: 180px; flex-shrink: 0; border-top: 1px solid #e2e8f0; display: flex; flex-direction: column;}
        .chat02_content { flex: 1; overflow-y: auto; display: flex; padding: 0.5rem 1rem;}
        .textarea { height: 100% !important; font-size: 1rem !important; box-sizing: border-box; }
        .chat03 { display: flex; flex-direction: column; flex: 1; min-height: 0; border-bottom: 1px solid #e2e8f0;}
        .chat03_content ul, .chat03_file ul { height: auto !important; flex: 1; overflow-y: auto; }
        .chat03_name { left: 45px !important; top: 15px !important; font-weight: 500; font-size: 0.9rem;}
        .chat03_content ul li { height: auto !important; padding: 10px 15px !important; display: flex; align-items: center; gap: 12px; }
        .chat03_content ul img { width: 36px !important; height: 36px !important; border-radius: 50%; border: 2px solid #e2e8f0;}
        .chat03_content li label { position: static !important; width: 10px !important; height: 10px !important; margin: 0 !important; }
        .online, .offline { bottom: auto !important; margin-left: -20px; margin-top: 24px; z-index: 10; border: 2px solid #fff;}
        .chat02_bar ul li button { border-radius: 6px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); cursor: pointer; border: none; outline: none; }
        
        @media (max-width: 768px) {
            body { padding: 0; }
            .chatBox { height: 100% !important; max-width: 100%; border-radius: 0; box-shadow: none; border: none; }
            .chatRight { display: none !important; }
        }
    </style>
</head>
<body>	
    <div class="imgBox" ></div>	
    <div class="content">
        <div class="chatBox">
            <div class="chatLeft">
                <div class="chat01">
                    <div class="chat01_title">
                        <ul class="talkTo">
                            <li><a href="javascript:;"> 小组讨论   <%=Sname %> </a></li>
							</ul>
                    </div>
                    <div class="chat01_content">
                        <div class="message_box mes" style="display: block;">
                        </div>
                    </div>
                </div>
                <div class="chat02">
                    <div class="chat02_title">					
                        <a class="chat02_title_btn ctb01" href="javascript:;" title="常用表情"></a>
                        <a class="chat02_title_btn ctb011" href="javascript:;" title="表情符号" ></a>						
						<a class="chat02_title_btn ctb02" id="upphoto" title="发送图片附件"> </a>						
                        <a class="chat02_title_t" id="chatrecord" title="聊天记录"></a>
						
                        <div class="wl_faces_box" title="选择表情" >
                            <div class="wl_faces_content">
                                <div class="title">
                                    <ul>
                                        <li class="title_name">常用表情</li><li class="wl_faces_close"><span>&nbsp;</span></li></ul>
                                </div>
                                <div class="wl_faces_main">
                                    <ul>                                          
                                       <asp:Repeater ID="Rpemo" runat="server">
                                        <ItemTemplate>
                                        <li>
                                            <a href="javascript:;"> <img src='<%# Eval("Emo") %>' /></a>
                                        </li>
                                        </ItemTemplate>
                                       </asp:Repeater>

                                    </ul>
                                </div>
                            </div>
                            <div class="wlf_icon">
                            </div>
                        </div>

                        <div class="wl_emo_box" >
                            <div class="wl_emo_content">
								<div class="title">
                                    <ul>
                                        <li class="title_name">表情符号</li>
									</ul>
                                </div>
                                <div class="wl_emo_main" title="双击添加">
								
                                </div>
                            </div>
                            <div class="wlf_emo">
                            </div>
                        </div>

                    </div>
                    <div class="chat02_content">
						<div class="textarea" name="chatword"  contenteditable="true"></div>
                    </div>
                    <div class="chat02_bar">
                        <ul>
                            <li style="left: 4px; ">
								<div id="progress"></div>
							</li>
                            <li style="right: 30px;"><button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md border-0"></button> </li>
                        </ul>
                    </div>
								<audio id="audio" hidden="true" ></audio>
                </div>
            </div>
            <div class="chatRight">
                <div class="chat03">
                    <div class="chat03_title">
                        <label class="chat03_title_t"><%=Sgtitle %></label>
                    </div>
                    <div class="chat03_content">
                        <ul>  
                           <asp:Repeater ID="Rpteam" runat="server">
                            <ItemTemplate>
                            <li id="<%# Eval("Snum") %>">
                                <label class="online"></label>
                                <a href="javascript:;"><img class="offline" src='<%# Eval("Avatar") %>'></a>
                                <a href="javascript:;" class="chat03_name"><%# Eval("Sname") %></a>
                            </li>
                            </ItemTemplate>
                           </asp:Repeater>
                        </ul>
                    </div>
                </div>
				
                <div class="chat03">
                    <div class="chat03_title">
                        <label class="chat03_title_f">附件管理</label>
                    </div>
                    <div class="chat03_file">
                        <ul> 
                           <asp:Repeater ID="Rpfile" runat="server">
                            <ItemTemplate>
                            <li>
                                <a href="javascript:;"><img src='<%# Eval("ftype") %>'></a>
                                <a href='<%# Eval("furl") %>' target='_blank' ><%# Eval("fname")%></a>
                            </li>
                            </ItemTemplate>
                           </asp:Repeater> 
                        </ul>
                    </div>
                </div>
				
            </div>
            <div style="clear: both;">
            </div>
        </div>
    </div>
	
    <script type="text/javascript">
        var head = "<%=Head %>"; 
        var sname = "<%=Sname %>"; 
        var snum = "<%=Snum %>"; 
        var sgtitle = "<%=Sgtitle %>"; 
        var sgroup = "<%=Sgroup %>";
        var historys = "<%=History %>";
        var serverip = "<%=serverIp %>";
    </script>	

    <script type="text/javascript" src="../code/imgchat/chat.js"></script>		

</body>
</html>
