<%@ Page Title="" Language="C#" MasterPageFile="~/student/Stud.master" StylesheetTheme="Student"
    AutoEventWireup="true" CodeFile="downfile.aspx.cs" Inherits="Student_downfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cphs" runat="Server">
    <script type="text/javascript">
        // 页面加载后检查是否有游戏链接需要跳转
        window.onload = function() {
            var gameUrl = localStorage.getItem('gameUrl');
            if (gameUrl) {
                // 清除 localStorage 中的游戏链接
                localStorage.removeItem('gameUrl');
                // 跳转到游戏链接
                window.location.href = gameUrl;
            }
        };

        function accessResource(fid) {
            // 先获取资源信息，了解需要扣除的学分
            var infoXhr = new XMLHttpRequest();
            infoXhr.open('POST', '../api/ScoreProxy.ashx?action=getinfo', true);
            infoXhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            infoXhr.onreadystatechange = function() {
                if (infoXhr.readyState === 4) {
                    if (infoXhr.status === 200) {
                        try {
                            var infoResult = JSON.parse(infoXhr.responseText);
                            if (infoResult.code === 1) {
                                // 检查是否已经扣除过该资源的学分
                                if (infoResult.hasDeducted) {
                                    alert('已经扣除过该资源的学分，无法重复扣除');
                                    return;
                                }
                                
                                // 显示扣除确认
                                if (confirm('访问此资源需要扣除 ' + infoResult.score + ' 学分，你当前的学分为 ' + infoResult.currentScore + ' 分，是否继续？')) {
                                    // 扣除学分
                                    var deductXhr = new XMLHttpRequest();
                                    deductXhr.open('POST', '../api/ScoreProxy.ashx?action=deduct', true);
                                    deductXhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                    deductXhr.onreadystatechange = function() {
                                        if (deductXhr.readyState === 4) {
                                            if (deductXhr.status === 200) {
                                                try {
                                                    var deductResult = JSON.parse(deductXhr.responseText);
                                                    if (deductResult.code === 1) {
                                                        // 学分扣除成功，继续访问资源
                                                        var resourceXhr = new XMLHttpRequest();
                                                        resourceXhr.open('POST', '../api/ResourceProxy.ashx?action=geturl&fid=' + fid, true);
                                                        resourceXhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                                        resourceXhr.onreadystatechange = function() {
                                                            if (resourceXhr.readyState === 4) {
                                                                if (resourceXhr.status === 200) {
                                                                    try {
                                                                        var result = JSON.parse(resourceXhr.responseText);
                                                                        if (result.code === 1) {
                                                                            // 保存游戏链接到 localStorage
                                                                            localStorage.setItem('gameUrl', result.url);
                                                                            // 刷新页面，更新学分显示
                                                                            location.reload();
                                                                        } else {
                                                                            alert(result.msg || '无法访问该资源');
                                                                        }
                                                                    } catch (e) {
                                                                        alert('访问失败，请重试');
                                                                    }
                                                                } else {
                                                                    alert('网络错误，请重试');
                                                                }
                                                            }
                                                        };
                                                        resourceXhr.send();
                                                    } else {
                                                        alert(deductResult.msg || '扣除学分失败');
                                                    }
                                                } catch (e) {
                                                    alert('扣除学分失败，请重试');
                                                }
                                            } else {
                                                alert('网络错误，无法扣除学分');
                                            }
                                        }
                                    };
                                    deductXhr.send('fid=' + fid);
                                }
                            } else {
                                alert(infoResult.msg || '获取资源信息失败');
                            }
                        } catch (e) {
                            alert('获取资源信息失败，请重试');
                        }
                    } else {
                        alert('网络错误，无法获取资源信息');
                    }
                }
            };
            infoXhr.send('fid=' + fid);
        }

        function openSecureLink(element) {
            var linkUrl = element.getAttribute('data-link');
            var fid = element.getAttribute('data-fid');

            if (!linkUrl) {
                alert('链接无效');
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open('POST', '../api/LinkProxy.ashx?action=getlink', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        try {
                            var result = JSON.parse(xhr.responseText);
                            if (result.code === 1) {
                                window.location.href = result.url;
                            } else {
                                alert(result.msg || '无法访问该链接');
                            }
                        } catch (e) {
                            window.location.href = linkUrl;
                        }
                    } else {
                        alert('网络错误，请重试');
                    }
                }
            };
            xhr.send('url=' + encodeURIComponent(linkUrl) + '&fid=' + (fid || ''));
        }

        (function() {
            document.addEventListener('contextmenu', function(e) {
                var target = e.target;
                while (target) {
                    if (target.tagName === 'A' && target.hasAttribute('data-link')) {
                        e.preventDefault();
                        alert('此链接受保护，无法右键复制！');
                        return false;
                    }
                    target = target.parentElement;
                }
            });

            document.addEventListener('keydown', function(e) {
                if (e.ctrlKey && e.key === 'u') {
                    e.preventDefault();
                    alert('此页面禁止查看源代码！');
                    return false;
                }
                if (e.key === 'F12') {
                    e.preventDefault();
                    alert('此页面禁止使用开发者工具！');
                    return false;
                }
            });

            document.addEventListener('copy', function(e) {
                var selection = window.getSelection();
                var container = selection.anchorNode;
                while (container && container !== document) {
                    if (container.nodeType === 1) {
                        var links = container.getElementsByTagName('a');
                        for (var i = 0; i < links.length; i++) {
                            if (links[i].hasAttribute('data-link')) {
                                e.preventDefault();
                                alert('此内容受保护，无法复制！');
                                return false;
                            }
                        }
                    }
                    container = container.parentNode;
                }
            });
        })();
    </script>
    <div id="student">
        <div class="left">
            <br />
            <asp:Label ID="Labeltitle" runat="server" SkinID="LabelLightBlue" Width="98%" CssClass="txts24center"
                Height="24px"></asp:Label>
            <br />
            <div style="padding: 2px; margin: auto; border-bottom-style: dashed; border-width: 1px;
                border-color: #CCCCCC">
                属性：<asp:Label ID="Labelclass" runat="server" SkinID="LabelFileShow"></asp:Label>
                格式：<asp:Image ID="ImageType" runat="server" />
                <asp:Label ID="Labelfiletype" runat="server" SkinID="LabelFileShow"></asp:Label>
                点击率：<asp:Label ID="Labelhit" runat="server" SkinID="LabelFileShow"></asp:Label>
                更新日期：<asp:Label ID="Labeldate" runat="server" SkinID="LabelFileShow"></asp:Label>
                评分方式：<asp:Label ID="Labelopen" runat="server" SkinID="LabelFileShow"></asp:Label>
                <asp:Label ID="LabelFyid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelFid" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelSid" runat="server" Visible="False"></asp:Label>
            </div>
            <center>
                <div>
                    <br />
                    <div class="downcontent">
                        <asp:Literal ID="Labelcontent" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                </div>
            </center>
            <br />
            <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            <br />
            <asp:Image ID="ImageDown" runat="server" ImageUrl="~/images/down1.gif" />
            <asp:LinkButton ID="LBtnfile" runat="server" OnClick="LBtnfile_Click" Visible="False"
                Font-Underline="False" BorderColor="#7DBF80" BorderStyle="Dashed" BorderWidth="1px"
                CssClass="txtszcenter" Height="18px" BackColor="#E2F3E3" Width="80px">点击下载</asp:LinkButton>
            <br />
            <asp:HyperLink ID="HLurl" runat="server"></asp:HyperLink>
            <br />
        </div>
        <div class="right">
            <div style="width: 170px">
                <br />
                <asp:GridView ID="GVSoft" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnPageIndexChanging="GVSoft_PageIndexChanging" OnRowDataBound="GVSoft_RowDataBound"
                    Width="98%" SkinID="GridViewInfo" EnableModelValidation="True" CellPadding="4">
                    <AlternatingRowStyle BackColor="#E9EFF5" />
                    <Columns>
                        <asp:TemplateField HeaderText="标题">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("fid", "downfile.aspx?Fid={0}") %>'
                                    Text='<%# strcut( Eval("Ftitle").ToString()) %>' ToolTip='<%# Eval("Ftitle")%>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" Width="280px" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle Height="24px" BackColor="#DEE7F1" BorderColor="LightSteelBlue" BorderStyle="Solid"
                        BorderWidth="1px" />
                    <PagerStyle HorizontalAlign="Center" Font-Size="9pt" />
                    <PagerTemplate>
                        <div>
                            <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First"
                                CommandName="Page" Font-Underline="False" ForeColor="Black" Text="首页" />&nbsp;
                            <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev"
                                CommandName="Page" Font-Underline="False" ForeColor="Black" Text="上页" />&nbsp;
                            <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next"
                                CommandName="Page" Font-Underline="False" ForeColor="Black" Text="下页" />&nbsp;
                            <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last"
                                CommandName="Page" Font-Underline="False" ForeColor="Black" Text="尾页" />
                        </div>
                    </PagerTemplate>
                    <RowStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:Image runat="server" ID="upFileType" Visible="False" />
                <asp:HyperLink ID="upFileUrl" runat="server" Height="16px" Visible="False" Target="_blank">[upFileUrl]</asp:HyperLink>
                <br />
                <br />
                <asp:Panel ID="Panelswfupload" runat="server">
                    <link href="../kindeditor/themes/me/me.css" rel="stylesheet" type="text/css" />
                    <script type="text/javascript" charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                    <script type="text/javascript" charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                    <div id="swfu_container" style="margin: 0px 30px;">
                        <div style="text-align: center; margin: auto">
                            <script type="text/javascript">
                                KindEditor.ready(function (K) {
                                    var uploadbutton = K.uploadbutton({
                                        button: K('#uploadButton')[0],
                                        fieldName: 'imgFile',
                                        url: 'autoupload.aspx?yid=<%=LabelFyid.Text %>&fid=<%=LabelFid.Text %>&sid=<%=LabelSid.Text %>',
                                        afterUpload: function (data) {
                                            if (data.error == 0) {
                                                alert(data.message);
                                                location.reload();
                                            } else {
                                                alert(data.message);
                                            }
                                        },
                                        afterError: function (str) {
                                            alert('出错信息: ' + str);
                                        }
                                    });
                                    uploadbutton.fileBox.change(function (e) {
                                        uploadbutton.submit();
                                    });
                                });
                            </script>                            
                                <input type="button" id="uploadButton" value="作品保存" />                   
                        </div>
                    </div>
                </asp:Panel>
                <br />
                <br />                
                <br />
                <br />
                <asp:HyperLink ID="Hltonomic" runat="server" ImageUrl="~/images/nomic.gif" NavigateUrl="~/student/autonomic.aspx"
                    Target="_blank" BorderStyle="None">作品园</asp:HyperLink>
                <br />
                <br />
            </div>
            <div>
                <link href="../js/tinybox.css" rel="stylesheet" type="text/css" />
                <script src="../js/tinybox.js" type="text/javascript"></script>
                <script type="text/javascript">
                    function showShare() {
                        var urlat = "../student/groupshare.aspx";
                        TINY.box.show({ iframe: urlat, boxid: 'frameless', width: 600, height: 400, fixed: false, maskopacity: 60, close: true })
                    }   
                </script>
            </div>
        </div>
    </div>
</asp:Content>
