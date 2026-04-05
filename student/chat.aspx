<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="student_chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>小组讨论</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../code/imgchat/chat.css" />
    <script type="text/javascript" src="../code/jquery.min.js"></script>
    <script type="text/javascript" src="../code/imgchat/fcup.min.js"></script>
    <script type="text/javascript" src="../code/imgchat/jquery.lineProgressbar.js"></script>
    <link rel="stylesheet" type="text/css" href="../code/imgchat/jquery.lineProgressbar.css" />
    <style>
    /* ── Reset & base ── */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html, body { height: 100%; overflow: hidden;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }

    /* ── Outer shell ── */
    .content { height: 100vh; display: flex; align-items: center; justify-content: center; padding: 12px; }

    /* ── Chat box ── */
    .chatBox {
        width: 100% !important;
        max-width: 900px;
        height: clamp(480px, 88vh, 760px) !important;
        display: flex !important;
        flex-direction: row;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 32px 64px rgba(0,0,0,.28), 0 0 0 1px rgba(255,255,255,.12);
        background: #ffffff;
        margin: 0 auto;
    }

    /* ══════════════════════════════
       LEFT PANEL
    ══════════════════════════════ */
    .chatLeft {
        flex: 1 1 0; min-width: 0;
        display: flex; flex-direction: column;
        border-right: 1px solid #f1f5f9;
        float: none !important;
    }

    /* Title bar */
    .chat01 { flex: 1; display: flex; flex-direction: column; min-height: 0; }
    .chat01_title {
        flex-shrink: 0;
        background: linear-gradient(to right, #6366f1, #818cf8) !important;
        border-bottom: none !important;
        padding: 0 16px;
        min-height: 46px;
        display: flex; align-items: center;
    }
    .talkTo { display: flex; align-items: center; gap: 8px; }
    .talkTo li { background: none !important; margin: 0 !important; padding: 0 !important; }
    .talkTo li a {
        background: none !important;
        color: #fff !important;
        font-size: 13px !important; font-weight: 700 !important;
        padding: 0 !important;
        display: flex; align-items: center; gap: 8px;
        text-decoration: none !important;
        letter-spacing: -.01em;
    }
    .talkTo li a::before {
        content: "";
        display: block; width: 8px; height: 8px;
        background: #a5f3fc; border-radius: 50%;
        box-shadow: 0 0 0 2px rgba(165,243,252,.35);
        animation: chat-pulse 2s ease-in-out infinite;
    }
    @keyframes chat-pulse {
        0%, 100% { opacity: 1; transform: scale(1); }
        50%       { opacity: .6; transform: scale(.85); }
    }

    /* Message area */
    .chat01_content {
        flex: 1; overflow-y: auto; overflow-x: hidden;
        padding: 14px 16px;
        background: #f8fafc;
        height: auto !important;
    }
    .chat01_content::-webkit-scrollbar { width: 5px; }
    .chat01_content::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 9999px; }

    /* ── Message bubbles (overriding chat.css) ── */
    .message {
        clear: both; padding: 6px 0; margin: 4px 0 !important;
        display: flex; align-items: flex-end; gap: 8px;
    }
    .message .user-logo {
        width: 34px !important; height: 34px !important;
        border-radius: 50%; border: 2px solid #e2e8f0;
        float: none !important; flex-shrink: 0;
        object-fit: cover;
    }
    .message .wrap-text {
        float: none !important;
        max-width: 68%; width: auto !important;
        display: flex; flex-direction: column; gap: 2px;
        overflow: visible !important;
    }
    .message .wrap-text div {
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 4px 14px 14px 14px;
        padding: 7px 12px;
        font-size: 13px; line-height: 1.55; color: #1e293b;
        box-shadow: 0 1px 3px rgba(0,0,0,.06);
        word-break: break-all; white-space: pre-wrap;
        margin: 0 !important; height: auto !important; overflow: visible !important;
    }
    .message .name { font-size: 11px; color: #64748b; font-weight: 600; margin-bottom: 2px; }
    .message .time { font-size: 10px; color: #94a3b8; margin-left: 6px; font-weight: 400; }
    /* Self messages (wrap-ri = right-side indicator from chat.js) */
    .message .wrap-ri {
        float: none !important; width: auto !important;
        overflow: visible !important;
    }
    .message .wrap-ri + .user-logo { order: 2; }
    /* Self bubble style applied via chat.js adding class to message */
    .message.self { flex-direction: row-reverse; }
    .message.self .wrap-text div {
        background: linear-gradient(135deg, #6366f1, #818cf8);
        color: #fff; border-color: transparent;
        border-radius: 14px 4px 14px 14px;
    }
    .message.self .name { text-align: right; color: #a5b4fc; }

    /* Toolbar */
    .chat02 {
        flex-shrink: 0; height: 160px;
        border-top: 1px solid #f1f5f9;
        display: flex; flex-direction: column;
        background: #fff;
    }
    .chat02_title {
        flex-shrink: 0; height: 34px;
        background: #f8fafc !important;
        border-bottom: 1px solid #f1f5f9 !important;
        display: flex; align-items: center; padding: 0 10px;
        position: relative;
    }
    .chat02_title_btn {
        background-image: url('../../code/imgchat/icon.png') !important;
        cursor: pointer; display: inline-block;
        width: 20px !important; height: 20px !important;
        margin: 0 4px !important; float: none !important;
        border-radius: 5px; transition: background-color .15s;
        vertical-align: middle;
    }
    .chat02_title_btn:hover { background-color: #e0e7ff !important; }
    .ctb01 { background-position: 0 -90px !important; margin-left: 6px !important; }
    .ctb011 { background-position: 0 -186px !important; }
    .ctb02  { background-position: 0 -152px !important; }
    .chat02_title_t {
        position: absolute !important; right: 10px; top: 50%; transform: translateY(-50%);
        background-position: 0px -516px !important; padding-left: 20px !important;
        font-size: 11px !important; color: #64748b !important;
        line-height: 1 !important; height: auto !important; top: 50%; 
    }
    .chat02_title_t a { font-size: 11px !important; color: #64748b !important; }

    /* Emoji panels */
    .wl_faces_box { bottom: 34px !important; border-radius: 10px; overflow: hidden; box-shadow: 0 8px 24px rgba(0,0,0,.12); }
    .wl_faces_content { border-radius: 10px; border-color: #e2e8f0 !important; }
    .wl_faces_content .title { background: linear-gradient(to right,#6366f1,#818cf8) !important; }
    .wl_faces_content .title ul li.title_name { background: rgba(255,255,255,.2) !important; color: #fff !important; border-radius: 6px; }
    .wl_emo_box { bottom: 34px !important; border-radius: 10px; overflow: hidden; box-shadow: 0 8px 24px rgba(0,0,0,.12); }
    .wl_emo_content { border-radius: 10px; border-color: #e2e8f0 !important; }
    .wl_emo_content .title { background: linear-gradient(to right,#6366f1,#818cf8) !important; }
    .wl_emo_content .title ul li.title_name { background: rgba(255,255,255,.2) !important; color: #fff !important; border-radius: 6px; }

    /* Input area */
    .chat02_content {
        flex: 1; overflow-y: auto; padding: 8px 14px;
        display: flex;
    }
    .textarea {
        width: 100% !important; height: 100% !important;
        font-size: 13px !important; color: #1e293b;
        outline: none; resize: none; border: none;
        background: transparent; line-height: 1.6;
    }

    /* Send bar */
    .chat02_bar {
        flex-shrink: 0; height: 38px;
        background: #f8fafc !important;
        border-top: 1px solid #f1f5f9 !important;
        border-bottom: none !important;
        display: flex; align-items: center;
        padding: 0 12px; justify-content: flex-end;
        position: relative;
    }
    .chat02_bar ul { height: auto !important; display: flex; align-items: center; width: 100%; }
    .chat02_bar li { position: static !important; display: flex; align-items: center; }
    .chat02_bar li:first-child { flex: 1; }
    .chat02_bar li button {
        height: 28px !important; width: auto !important;
        padding: 0 16px !important;
        background: linear-gradient(135deg, #6366f1, #4f46e5) !important;
        color: #fff !important; font-size: 12px !important; font-weight: 700 !important;
        border-radius: 8px !important; border: none !important;
        cursor: pointer; box-shadow: 0 2px 8px rgba(99,102,241,.3) !important;
        transition: transform .15s, box-shadow .15s !important;
        letter-spacing: .02em;
    }
    .chat02_bar li button:hover {
        transform: translateY(-1px) !important;
        box-shadow: 0 4px 12px rgba(99,102,241,.4) !important;
        background: linear-gradient(135deg, #818cf8, #6366f1) !important;
    }
    #progress { width: 200px; }

    /* ══════════════════════════════
       RIGHT PANEL
    ══════════════════════════════ */
    .chatRight {
        width: 200px !important; flex-shrink: 0;
        display: flex; flex-direction: column;
        background: #fafafa;
        float: none !important;
    }

    /* Section */
    .chat03 {
        display: flex; flex-direction: column;
        flex: 1; min-height: 0;
        border-bottom: 1px solid #f1f5f9;
    }
    .chat03_title {
        flex-shrink: 0;
        background: #f1f5f9 !important;
        border-bottom: 1px solid #e2e8f0;
        height: 34px; display: flex; align-items: center; padding: 0 12px;
        position: relative;
    }
    .chat03_title_t, .chat03_title_f {
        background: none !important;
        position: static !important; padding-left: 0 !important;
        font-size: 11px !important; font-weight: 700 !important;
        color: #475569 !important; text-transform: uppercase; letter-spacing: .06em;
        top: auto !important; left: auto !important;
        display: block !important; width: auto !important; height: auto !important;
    }

    /* Member list */
    .chat03_content { flex: 1; overflow-y: auto; padding: 6px 0; }
    .chat03_content::-webkit-scrollbar { width: 4px; }
    .chat03_content::-webkit-scrollbar-thumb { background: #e2e8f0; border-radius: 9999px; }
    .chat03_content ul { height: auto !important; }
    .chat03_content ul li {
        height: auto !important; padding: 6px 12px !important;
        display: flex; align-items: center; gap: 8px;
        transition: background .12s; border-radius: 0;
        position: relative;
    }
    .chat03_content ul li:hover { background: #f1f5f9; }
    .chat03_content ul img {
        width: 30px !important; height: 30px !important;
        border-radius: 50%; border: 1.5px solid #e2e8f0;
        object-fit: cover; display: block; flex-shrink: 0;
    }
    .chat03_name {
        font-size: 12px !important; font-weight: 600 !important; color: #334155 !important;
        position: static !important; top: auto !important; left: auto !important;
        display: block !important; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
    }
    /* Online / offline dot */
    .chat03_content li label {
        position: absolute !important;
        width: 8px !important; height: 8px !important;
        left: 32px !important; bottom: 6px !important;
        border-radius: 50% !important; border: 1.5px solid #fff !important;
        margin: 0 !important;
    }
    label.online  { background: #22c55e !important; box-shadow: 0 0 0 1px #bbf7d0; }
    label.offline { background: #cbd5e1 !important; filter: none !important; }

    /* File list */
    .chat03_file { flex: 1; overflow-y: auto; }
    .chat03_file ul { height: auto !important; }
    .chat03_file ul li { padding: 5px 12px !important; display: flex; align-items: center; gap: 6px; font-size: 11px; }
    .chat03_file ul li a { color: #4f46e5 !important; font-size: 11px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 130px; display: inline-block; }
    .chat03_file ul img { width: 14px !important; height: 14px !important; }

    /* ── misc image ── */
    .imgBox { display: none; }
    img { max-height: 180px; border-radius: 8px; }

    /* Enlarge overlay */
    .enlargeImg_wrapper {
        display: none; position: fixed; z-index: 999; inset: 0;
        background: rgba(0,0,0,.85);
        background-repeat: no-repeat; background-position: center; background-size: contain;
        cursor: zoom-out;
    }
    .chatpic:hover { cursor: zoom-in; }

    /* Scrollbar global */
    ::-webkit-scrollbar { width: 5px; height: 5px; }
    ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 9999px; }

    @media (max-width: 640px) {
        .content { padding: 0; }
        .chatBox { height: 100vh !important; border-radius: 0; }
        .chatRight { display: none !important; }
    }
    </style>
</head>
<body>
    <div class="imgBox"></div>
    <div class="content">
        <div class="chatBox">

            <!-- ── Left: chat area ── -->
            <div class="chatLeft">
                <div class="chat01">
                    <div class="chat01_title">
                        <ul class="talkTo">
                            <li><a href="javascript:;">小组讨论 &nbsp;·&nbsp; <%=Sname %></a></li>
                        </ul>
                    </div>
                    <div class="chat01_content">
                        <div class="message_box mes" style="display:block;"></div>
                    </div>
                </div>

                <div class="chat02">
                    <div class="chat02_title">
                        <a class="chat02_title_btn ctb01"  href="javascript:;" title="常用表情"></a>
                        <a class="chat02_title_btn ctb011" href="javascript:;" title="表情符号"></a>
                        <a class="chat02_title_btn ctb02" id="upphoto" title="发送图片附件"></a>
                        <a class="chat02_title_t" id="chatrecord" title="聊天记录"></a>

                        <div class="wl_faces_box" title="选择表情">
                            <div class="wl_faces_content">
                                <div class="title">
                                    <ul>
                                        <li class="title_name">常用表情</li>
                                        <li class="wl_faces_close"><span>&nbsp;</span></li>
                                    </ul>
                                </div>
                                <div class="wl_faces_main">
                                    <ul>
                                        <asp:Repeater ID="Rpemo" runat="server">
                                            <ItemTemplate>
                                            <li><a href="javascript:;"><img src='<%# Eval("Emo") %>' /></a></li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                            <div class="wlf_icon"></div>
                        </div>

                        <div class="wl_emo_box">
                            <div class="wl_emo_content">
                                <div class="title">
                                    <ul><li class="title_name">表情符号</li></ul>
                                </div>
                                <div class="wl_emo_main" title="双击添加"></div>
                            </div>
                            <div class="wlf_emo"></div>
                        </div>
                    </div>

                    <div class="chat02_content">
                        <div class="textarea" name="chatword" contenteditable="true"></div>
                    </div>

                    <div class="chat02_bar">
                        <ul>
                            <li><div id="progress"></div></li>
                            <li><button></button></li>
                        </ul>
                    </div>
                    <audio id="audio" hidden="true"></audio>
                </div>
            </div>

            <!-- ── Right: members + files ── -->
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
                                    <a href='<%# Eval("furl") %>' target='_blank'><%# Eval("fname") %></a>
                                </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript">
        var head      = "<%=Head %>";
        var sname     = "<%=Sname %>";
        var snum      = "<%=Snum %>";
        var sgtitle   = "<%=Sgtitle %>";
        var sgroup    = "<%=Sgroup %>";
        var historys  = "<%=History %>";
        var serverip  = "<%=serverIp %>";
    </script>
    <script type="text/javascript" src="../code/imgchat/chat.js"></script>
</body>
</html>
