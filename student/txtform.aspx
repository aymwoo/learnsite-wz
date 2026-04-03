<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" StylesheetTheme="Student"
    AutoEventWireup="true" CodeFile="txtform.aspx.cs" Inherits="Student_txtform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" runat="Server">
<div class="grid grid-cols-1 lg:grid-cols-4 gap-6 lg:gap-8 w-full max-w-full">
    <!-- Main Content -->
    <div class="lg:col-span-3 space-y-6">
        <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6 sm:p-10">
            <div class="text-center pb-6 border-b border-slate-100 flex items-center justify-center gap-3">
                <asp:Label ID="LabelMtitle" runat="server" CssClass="text-2xl sm:text-3xl font-extrabold text-slate-800 tracking-tight"></asp:Label>
                <img id="connected" alt="" src="../images/topictitle.png" style="display: none;"
                    title="小组协作填表已开启" class="w-6 h-6" />
            </div>
            <div id="Mcontent" class="coursecontent mt-6" runat="server"></div>
            <div id="Mtable" class="mt-4" runat="server"></div>
        </div>
    </div>

    <!-- Right Sidebar -->
    <div class="lg:col-span-1 flex flex-col gap-6">
        <div class="bg-slate-50/80 rounded-2xl border border-slate-200/60 p-5 shadow-sm sticky top-24 flex flex-col items-center gap-4">
            <img id="sucessed" alt="" src="../images/sucessed.png" 
                class="w-24 h-24 object-contain hidden" />
            
            <input id="Btnform" type="button" value="提交填写" onclick="SaveForm();"
                class="w-full py-2.5 bg-gradient-to-r from-blue-500 to-indigo-600 text-white font-bold rounded-xl hover:from-blue-600 hover:to-indigo-700 transition duration-300 shadow-md border-0 cursor-pointer" />
            
            <div id="msg" class="text-red-500 font-bold text-sm min-h-[1.5rem]"></div>
            
            <asp:HyperLink ID="Hlresult" runat="server" SkinID="HyperLink" Target="_blank"
                CssClass="w-full flex justify-center py-2.5 text-sm bg-white border-2 border-emerald-500 text-emerald-600 font-bold rounded-xl hover:bg-emerald-500 hover:text-white transition duration-300 shadow-sm">查看结果</asp:HyperLink>
            
            <span class="namebox" style="position: absolute; display: none; color: #fff; background-color: #4f46e5; opacity: 0.9; padding: 4px 8px; border-radius: 6px; font-size: 12px; white-space: nowrap;">TextName</span>
            
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
                    var table = $("div.coursecontent table");  // tableId是你需要遍历的Table的id
                    table.css("table-layout", "auto");
                    var tds = []; //清空数组
                    var idx = 0;
                    table.find("tr").each(function () {
                        $(this).find("td").each(function () {
                            $(this).attr("id", "cell" + idx);
                            idx += 1;
                            var cellContent = $(this).text();  // 获取单元格中的内容
                            cellContent = jQuery.trim(cellContent);
                            var cellCan = $(this).attr("contenteditable");
                            var cellId = $(this).attr("id");
                            if (cellCan) {
                                //console.log(cellId," ",cellContent,"  ",cellCan);  // 在控制台中显示单元格中的内容
                                tds.push(cellContent);
                                $(this).text(cellContent);
                            }
                        });
                    });
                    //console.log(tds);
                    return tds;
                }

                var oldid = "";
                var isconnect = false;

                var start = function () {
                    tableshow(); //给表格单元格id赋值

                    var msg = "正在连接协作服务...\n";
                    var hostip = location.host;
                    if (serverip != "") {
                        hostip = serverip;
                    }
                    console.log(hostip, msg);

                    // create a new websocket and connect
                    var wsurl = "ws://" + hostip + ":8188/";
                    window.ws = new WebSocket(wsurl);

                    //当客户端收到服务端发来的消息时，触发onmessage事件
                    //参数e.data包含server传递过来的数据
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
                                        $(oldid).attr({ contenteditable: "true" }); //设置当前单元格可编辑
                                    }
                                    oldid = idstr; //存储当前单元格id
                                    $(idstr).text(textstr);
                                    $(".namebox").text(namestr + "正在输入...");
                                    $(".namebox").show();

                                    var p = $(idstr).offset();
                                    p.left = p.left + textstr.length;
                                    p.top = p.top;
                                    $(".namebox").offset(p);
                                    console.log("接收小组成员", namestr, "协作信息", talktimestr);
                                    if (snum != snumstr) {
                                        $(idstr).attr({ contenteditable: "none" }); //设置当前单元格占用，不可编辑
                                    }
                                }
                                else {
                                    $(".namebox").hide();
                                    console.log("...");
                                }
                            }
                        }
                    };

                    // 当WebSocket创建成功时，触发onopen事件
                    ws.onopen = function () {
                        msg = '.. 已连接\n';
                        console.log(msg);
                        isconnect = true;
                        if (collabo == "true") {
                            $("#connected").show();
                        }
                    };

                    // 当客户端收到服务端发送的关闭连接请求时，触发onclose事件
                    ws.onclose = function () {
                        msg = '.. 已断开\n';
                        console.log(msg);
                        isconnect = false;
                        $(".namebox").hide();
                    }

                    // 如果出现连接、处理、接收、发送数据失败的时候触发onerror事件
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
                            //console.log("发送协作",dicstr);
                        }
                        else {
                            //console.log("无法协作",dicstr);
                        }

                    });

                    $("td").click(function () {
                        //$(".namebox").hide();
                    });


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
                            $(oldid).attr({ contenteditable: "true" }); //设置当前单元格可编辑
                        }
                    }
                }, 8000); // 设置超时时间为8秒

                //---------------------协作测试-------------------------


                function SaveForm() {
                    var saveurl = "saveform.ashx?lid=" + "<%=Lid %>";

                    var contentstr = $("div.coursecontent").html();

                    var wordstr = "";
                    // $("div.coursecontent table").prop('outerHTML');
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
                        alert("提交成功！");
                        location.reload(); //重新加载当前页面
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
<asp:HiddenField ID="hiddencount" runat="server" />
</asp:Content>
