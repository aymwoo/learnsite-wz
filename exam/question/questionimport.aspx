<%@ Page Language="C#" AutoEventWireup="true" CodeFile="questionimport.aspx.cs" Inherits="exam_question_questionimport" MasterPageFile="~/teacher/Teach.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style>
        .import-container { padding: 20px; }
        .import-header { margin-bottom: 20px; padding-bottom: 15px; border-bottom: 2px solid #e0e0e0; }
        .import-header h2 { margin: 0; }
        .import-form { background: #fff; padding: 20px; border-radius: 8px; border: 1px solid #e8e8e8; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: 600; color: #333; }
        .form-group input, .form-group select, .form-group textarea { 
            width: 100%; padding: 10px; border: 1px solid #d9d9d9; border-radius: 4px; font-size: 14px;
        }
        .form-group textarea { min-height: 300px; font-family: Consolas, Monaco, monospace; font-size: 13px; }
        .btn { display: inline-block; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; margin-right: 10px; }
        .btn-primary { background: #1890ff; color: #fff; }
        .btn-primary:hover { background: #40a9ff; }
        .btn-default { background: #f0f0f0; color: #333; }
        .btn-default:hover { background: #d9d9d9; }
        .help-box { background: #f5f5f5; padding: 15px; border-radius: 4px; margin-bottom: 20px; }
        .help-box h4 { margin: 0 0 10px 0; color: #333; }
        .help-box p { margin: 5px 0; color: #666; font-size: 13px; }
        .help-box code { background: #e8e8e8; padding: 2px 6px; border-radius: 3px; font-size: 12px; }
        .help-box pre { background: #fff; padding: 10px; border-radius: 4px; overflow-x: auto; font-size: 12px; margin: 10px 0; }
        .result-box { margin-top: 20px; padding: 15px; border-radius: 4px; }
        .result-success { background: #f6ffed; border: 1px solid #b7eb8f; color: #52c41a; }
        .result-error { background: #fff2f0; border: 1px solid #ffccc7; color: #ff4d4f; }
        .result-warning { background: #fffbe6; border: 1px solid #ffe58f; color: #faad14; }
        .stats { margin-top: 10px; padding: 10px; background: #fff; border-radius: 4px; }
        .stats span { margin-right: 20px; }
    </style>

    <div class="import-container">
        <div class="import-header">
            <h2><asp:Literal ID="ltlBankName" runat="server"></asp:Literal> - 批量导入题目</h2>
        </div>

        <asp:Panel ID="pnlImport" runat="server">
            <div class="help-box">
                <h4>导入格式说明</h4>
                <p>每行一道题目，使用竖线 | 分隔各字段。格式如下：</p>
                <pre>题型|题目内容|选项|答案|解析|分值|难度|知识点</pre>
                <p><strong>题型：</strong></p>
                <p>1=单选，2=多选，3=判断，4=填空，5=简答</p>
                <p>6=连线，7=分类，8=组合，9=多项填空，10=下拉选择</p>
                <p>11=打分题，12=矩阵单选，13=矩阵多选，14=NPS评分</p>
                <p><strong>选项格式：</strong>选项之间用 ## 分隔，如：A.选项1##B.选项2##C.选项3##D.选项4</p>
                <p><strong>答案格式：</strong></p>
                <p> - 单选/判断：直接写选项字母，如 A 或 B</p>
                <p> - 多选：多个答案用逗号分隔，如 A,B,C</p>
                <p> - 填空：多个空用竖线分隔，如 答案1|答案2|答案3</p>
                <p> - 多项填空：答案用竖线分隔，如 答案1|答案2|答案3</p>
                <p> - 简答：直接写答案文本</p>
                <p> - 打分题：写默认分值，如 3</p>
                <p> - NPS：写默认分值，如 8</p>
                <p> - 矩阵题：JSON格式，如 {"行1":"列2","行2":"列1"}</p>
                <p><strong>分值：</strong>数字，如 2 或 5</p>
                <p><strong>难度：</strong>1=简单，2=中等，3=困难</p>
                <p><strong>知识点：</strong>可选字段</p>
                <br/>
                <p><strong>示例：</strong></p>
                <pre>1|以下哪个是C#的数据类型？|A. var##B. dynamic##C. both##D. none|C|C#支持var和dynamic两种类型|2|1|C#基础
2|以下哪些是面向对象的特性？|A. 封装##B. 继承##C. 多态##D. 以上都是|A,B,C|面向对象三大特性|3|2|面向对象
3|C#是一种面向对象的编程语言。||对||2|1|C#基础
4|C#中string是___类型，int是___类型。|引用|值|string是引用类型，int是值类型|4|2|C#数据类型
5|请简述C#中接口和抽象类的区别。||接口只定义契约不包含实现，抽象类可以包含部分实现...|10|3|C#高级特性
9|Python中___是列表，___是字典，___是集合。|list|dict|set|Python基础数据类型|4|2|Python基础
11|请对本次服务进行评分（1-5分）|1##2##3##4##5|4|满意度调查|5|1|客户服务
14|您有多大可能向朋友推荐我们的产品？||8|NPS评分题|5|1|用户调研</pre>
            </div>

            <div class="import-form">
                <div class="form-group">
                    <label>题目内容（每行一道题）</label>
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" placeholder="请按照格式粘贴题目内容..."></asp:TextBox>
                </div>

                <div class="form-actions">
                    <asp:Button ID="btnImport" runat="server" Text="开始导入" CssClass="btn btn-primary" OnClick="btnImport_Click" />
                    <a href="questionlist.aspx?bankId=<%= BankId %>" class="btn btn-default">返回列表</a>
                    <asp:Button ID="btnClear" runat="server" Text="清空内容" CssClass="btn btn-default" OnClick="btnClear_Click" />
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlResult" runat="server" Visible="false">
            <div class="result-box" id="resultBox" runat="server">
                <asp:Literal ID="ltlResult" runat="server"></asp:Literal>
                <div class="stats" id="statsBox" runat="server">
                    <span>总数：<asp:Literal ID="ltlTotal" runat="server"></asp:Literal></span>
                    <span>成功：<asp:Literal ID="ltlSuccess" runat="server"></asp:Literal></span>
                    <span>失败：<asp:Literal ID="ltlFailed" runat="server"></asp:Literal></span>
                </div>
            </div>
            
            <div style="margin-top: 20px;">
                <a href="questionlist.aspx?bankId=<%= BankId %>" class="btn btn-primary">查看题目列表</a>
                <asp:Button ID="btnContinue" runat="server" Text="继续导入" CssClass="btn btn-default" OnClick="btnContinue_Click" />
            </div>

            <asp:Panel ID="pnlErrorDetails" runat="server" Visible="false" style="margin-top: 20px;">
                <h4>错误详情：</h4>
                <asp:Literal ID="ltlErrorDetails" runat="server"></asp:Literal>
            </asp:Panel>
        </asp:Panel>
    </div>
</asp:Content>
