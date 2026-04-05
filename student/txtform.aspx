<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" StylesheetTheme="Student"
    AutoEventWireup="true" CodeFile="txtform.aspx.cs" Inherits="Student_txtform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<style>
    .prog-wrap * { box-sizing: border-box; }
    .prog-grid {
        display: grid;
        grid-template-columns: 1fr 280px;
        gap: 20px;
        align-items: start;
        width: 100%;
    }
    @media (max-width: 1024px) {
        .prog-grid { grid-template-columns: 1fr; }
        .prog-sidebar { position: static !important; }
    }
    .prog-card {
        border: 1px solid #dbe6f5;
        border-radius: 0.75rem;
        background: rgba(255,255,255,0.97);
        box-shadow: 0 12px 30px rgba(15,23,42,0.05);
        min-width: 0;
    }
    .prog-sidebar {
        position: sticky;
        top: 116px;
    }
    .prog-sidebar-card {
        background: linear-gradient(160deg, #ffffff 0%, #eef2ff 100%);
    }
    .prog-card__head {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 16px 20px 0;
    }
    .prog-card__title {
        margin: 0;
        font-size: 15px;
        font-weight: 800;
        color: #0f172a;
        flex: 1;
    }
    .prog-sidebar-icon {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 30px; height: 30px;
        border-radius: 0.5rem;
        background: #e0e7ff;
        color: #4338ca;
        flex-shrink: 0;
    }
    .prog-sidebar-icon svg { width: 15px; height: 15px; }
    .prog-card__body { padding: 14px 20px 18px; }
    .prog-divider { border: none; border-top: 1px solid #e2e8f0; margin: 12px 0; }
    .prog-btn-stack { display: flex; flex-direction: column; gap: 8px; }
    .prog-btn {
        display: inline-flex; align-items: center; justify-content: center;
        width: 100%; min-height: 40px; padding: 0 16px;
        border-radius: 0.375rem; border: none;
        font-size: 14px; font-weight: 700; cursor: pointer;
        background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
        color: #fff;
        box-shadow: 0 6px 16px rgba(37,99,235,0.22);
        transition: transform 0.18s ease, box-shadow 0.18s ease;
    }
    .prog-btn:hover { transform: translateY(-1px); box-shadow: 0 8px 20px rgba(37,99,235,0.30); }
    .prog-btn-secondary {
        display: inline-flex; align-items: center; justify-content: center;
        width: 100%; min-height: 40px; padding: 0 16px;
        border-radius: 0.375rem;
        font-size: 14px; font-weight: 700; cursor: pointer;
        background: #eff6ff; color: #1d4ed8; border: 1px solid #bfdbfe;
        transition: transform 0.18s ease;
    }
    .prog-btn-secondary:hover { transform: translateY(-1px); background: #dbeafe; }
    .prog-btn-outline {
        display: inline-flex; align-items: center; justify-content: center;
        width: 100%; min-height: 40px; padding: 0 16px;
        border-radius: 0.375rem;
        font-size: 14px; font-weight: 700; text-decoration: none; cursor: pointer;
        background: #f0fdf4; color: #14532d; border: 1px solid #bbf7d0;
        transition: transform 0.18s ease;
    }
    .prog-btn-outline:hover { transform: translateY(-1px); background: #dcfce7; }
    .prog-info-label {
        display: block; font-size: 13px; color: #64748b;
        line-height: 1.7; text-align: center;
    }
    /* skin override */
    .prog-card__body .prog-btn-stack .prog-btn,
    .prog-card__body .prog-btn-stack input.prog-btn {
        width: 100% !important; min-height: 40px !important; height: auto !important;
        font-size: 14px !important; font-weight: 700 !important;
        background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%) !important;
        color: #fff !important; border: none !important;
    }
    .prog-card__body .prog-btn-stack a.prog-btn-outline {
        width: 100% !important; min-height: 40px !important; height: auto !important;
        font-size: 14px !important; font-weight: 700 !important;
        background: #f0fdf4 !important; color: #14532d !important;
        border: 1px solid #bbf7d0 !important;
    }
</style>
<div class="prog-wrap">
<div class="prog-grid">
    <!-- Main Content -->
    <div class="prog-card" style="background:linear-gradient(160deg,#fff 0%,#f0f7ff 100%);">
        <div class="prog-card__body">
        <div class="text-center pb-5 border-b border-slate-100 flex items-center justify-center gap-3" style="margin-bottom:16px;">
            <asp:Label ID="LabelMtitle" runat="server" style="font-size:clamp(18px,2.5vw,24px);font-weight:800;color:#0f172a;letter-spacing:-0.02em;"></asp:Label>
            <img id="connected" alt="" src="../images/topictitle.png" style="display:none;" title="小组协作填表已开启" class="w-6 h-6" />
        </div>
        <div id="Mcontent" class="coursecontent" runat="server" style="color:#334155;line-height:1.9;font-size:16px;word-wrap:break-word;word-break:break-word;"></div>
        <div id="Mtable" class="mt-4" runat="server"></div>
        </div>
    </div>

    <!-- Right Sidebar -->
    <div class="prog-sidebar">
        <div class="prog-card prog-sidebar-card">
            <div class="prog-card__head">
                <div class="prog-sidebar-icon">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"></path></svg>
                </div>
                <h3 class="prog-card__title">操作面板</h3>
            </div>
            <div class="prog-card__body">
                <img id="sucessed" alt="" src="../images/sucessed.png" style="display:none;width:80px;height:auto;margin:0 auto 10px;display:none;" />
                <div class="prog-btn-stack">
                    <input id="Btnform" type="button" value="提交填写" onclick="SaveForm();" class="prog-btn" />
                    <asp:HyperLink ID="Hlresult" runat="server" SkinID="HyperLink" Target="_blank"
                        CssClass="prog-btn-outline">查看结果</asp:HyperLink>
                </div>
                <div id="msg" class="prog-info-label" style="color:#b91c1c;font-weight:700;min-height:1.4rem;margin-top:6px;"></div>
                <span class="namebox" style="position:absolute;display:none;color:#fff;background:#4f46e5;opacity:0.9;padding:4px 8px;border-radius:6px;font-size:12px;white-space:nowrap;">TextName</span>
                <script type="text/javascript">

                    var snum = "<%=Snum %>";
                    var sname = "<%=Sname %>";
                    var sgroup = "<%=Sgroup %>";
                    var isopen = true;
                    var collabo = "<%=Collabo %>";
                    var serverip = "<%=serverIp %>";

                    if (collabo == "false") {
                        $("#connected").hide();
                        isopen = false;
                    }

                    $("#connected").click(function () {
                        if (isopen) {
                            isopen = false;
                            $(this).css("filter", "hue-rotate(200deg)");
                            $(this).attr("title", "不接收小组协作内容");
                        }
                        else {
                            isopen = true;
                            $(this).css("filter", "");
                            $(this).attr("title", "接收小组协作内容");
                        }
                    });

                    function tableshow() {
                        var table = $("div.coursecontent table");
                        table.css("table-layout", "auto");
                        var tds = [];
                        var idx = 0;
                        table.find("tr").each(function () {
                            $(this).find("td").each(function () {
                                $(this).attr("id", "cell" + idx);
                                idx += 1;
                                var cellContent = $(this).text();
                                cellContent = jQuery.trim(cellContent);
                                var cellCan = $(this).attr("contenteditable");
                                var cellId = $(this).attr("id");
                                if (cellCan) {
                                    tds.push(cellContent);
                                    $(this).text(cellContent);
                                }
                            });
                        });
                        return tds;
                    }

                    var oldid = "";
                    var isconnect = false;

                    var start = function () {
                        tableshow();

                        var msg = "正在连接协作服务...\n";
                        var hostip = location.host;
                        if (serverip != "") {
                            hostip = serverip;
                        }
                        console.log(hostip, msg);

                        var wsurl = "ws://" + hostip + ":8188/";
                        window.ws = new WebSocket(wsurl);

                        ws.onmessage = function (evt) {
                            var msg = JSON.parse(evt.data);
                            var idstr = "#" + msg[0];
                            var textstr = msg[1];
                            var snumstr = msg[2];
                            var namestr = msg[3];
                            var txtform = msg[4];
                            var sgroupstr = msg[5];
                            var talktimestr = msg[6];

                            if (isopen) {
                                if (txtform == "txtform") {
                                    if (sgroup == sgroupstr) {
                                        if (oldid != "") {
                                            $(oldid).attr({ contenteditable: "true" });
                                        }
                                        oldid = idstr;
                                        $(idstr).text(textstr);
                                        $(".namebox").text(namestr + "正在输入...");
                                        $(".namebox").show();

                                        var p = $(idstr).offset();
                                        p.left = p.left + textstr.length;
                                        p.top = p.top;
                                        $(".namebox").offset(p);
                                        console.log("接收小组成员", namestr, "协作信息", talktimestr);
                                        if (snum != snumstr) {
                                            $(idstr).attr({ contenteditable: "none" });
                                        }
                                    }
                                    else {
                                        $(".namebox").hide();
                                        console.log("...");
                                    }
                                }
                            }
                        };

                        ws.onopen = function () {
                            msg = '.. 已连接\n';
                            console.log(msg);
                            isconnect = true;
                            if (collabo == "true") {
                                $("#connected").show();
                            }
                        };

                        ws.onclose = function () {
                            msg = '.. 已断开\n';
                            console.log(msg);
                            isconnect = false;
                            $(".namebox").hide();
                        }

                        ws.onerror = function (e) {
                            console.log("发送失败!");
                            $("#connected").hide();
                        }

                        $("td").keyup(function (e) {
                            e.preventDefault();
                            var da = new Date;
                            var talktime = da.toLocaleString();

                            var dic = [];
                            dic.push($(this).attr("id"));
                            dic.push($(this).text());
                            dic.push(snum);
                            dic.push(sname);
                            dic.push("txtform");
                            dic.push(sgroup);
                            dic.push(talktime);

                            var dicstr = JSON.stringify(dic);
                            if (isconnect && isopen) {
                                ws.send(dicstr);
                            }
                        });

                        $("td").click(function () {});
                    }

                    if (collabo == "false") {
                        console.log("独立模式");
                    }
                    else {
                        window.onload = start;
                        console.log("协作模式");
                    }

                    var timer = setInterval(function () {
                        if (isconnect) {
                            $(".namebox").hide();
                            if (oldid != "") {
                                $(oldid).attr({ contenteditable: "true" });
                            }
                        }
                    }, 8000);

                    function SaveForm() {
                        var saveurl = "saveform.ashx?lid=" + "<%=Lid %>";
                        var contentstr = $("div.coursecontent").html();
                        var wordstr = "";
                        $(function () {
                            $("div.coursecontent table").each(function (index, element) {
                                var htmlstr = $(element).prop('outerHTML') + "<br>";
                                wordstr = wordstr + htmlstr;
                            })
                        })
                        var formData = new FormData();
                        formData.append('Word', wordstr);
                        formData.append('Content', contentstr);
                        $.ajax({
                            url: saveurl,
                            type: 'POST',
                            cache: false,
                            data: formData,
                            processData: false,
                            contentType: false
                        }).done(function (res) {
                            $("#sucessed").show();
                            if (window.LearnStatus && typeof window.LearnStatus.submitted === "function") {
                                window.LearnStatus.submitted();
                            }
                            alert("提交成功！");
                            location.reload();
                        }).fail(function (res) {
                            console.log(res)
                        });
                    }

                    var isdone = "<%=Done %>";
                    if (isdone == "true") {
                        $("#sucessed").show();
                    }
                    else {
                        $("#sucessed").hide();
                    }

                    function HTMLDecode(text) {
                        var temp = document.createElement("div");
                        temp.innerHTML = text;
                        var output = temp.innerText || temp.textContent;
                        temp = null;
                        return output;
                    }
                </script>
            </div>
        </div>
    </div>
</div>
</div>
<asp:HiddenField ID="hiddencount" runat="server" />
</asp:Content>
