<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="termscores.aspx.cs" Inherits="Teacher_termscores" ResponseEncoding="utf-8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    

    <div class="placehold term-page">
        <div class="term-shell">
            <div class="term-hero">
                <div class="term-hero__content">
                    <div>
                        <h1 class="term-hero__title">学期总评</h1>
                        <p class="term-hero__subtitle">统计折算各项成绩并生成期末总评，支持导出 Excel。</p>
                    </div>
                    <div class="term-hero__badge">
                        第 <asp:Label ID="Lbterm" runat="server"></asp:Label> 学期
                    </div>
                </div>
            </div>

            <div class="term-grid">
                <section class="term-card term-card--span-8 term-theme--blue">
                    <div class="term-card__head">
                        <h2 class="term-card__title">班级与操作</h2>
                    </div>
                    <div class="term-card__body">
                        <div class="term-form-row">
                            <div class="term-field">
                                <span class="term-label">年级</span>
                                <asp:DropDownList ID="DDLgrade" runat="server" CssClass="term-select term-select--sm"
                                    AutoPostBack="True" onselectedindexchanged="DDLgrade_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="term-field">
                                <span class="term-label">班级</span>
                                <asp:DropDownList ID="DDLclass" runat="server" CssClass="term-select term-select--sm"
                                    AutoPostBack="True" onselectedindexchanged="DDLclass_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="term-actions" style="margin-top: 16px;">
                            <asp:Button ID="BtnScoresNo" runat="server" OnClick="BtnScoresNo_Click"
                                Text="未评设置C" ToolTip="所教班级未评作品全部设置为C（分值6）"
                                CssClass="term-btn term-btn--warning" />
                            <asp:Button ID="BtnScores" runat="server" OnClick="BtnScore_Click"
                                Text="总分折算" ToolTip="先统计总分，再得出折算总分"
                                CssClass="term-btn term-btn--primary" />
                            <asp:Button ID="Btnape" runat="server" onclick="Btnape_Click"
                                Text="期末总评"
                                CssClass="term-btn term-btn--success" />
                            <asp:Button ID="BtnExcel" runat="server" OnClick="BtnExcel_Click"
                                Text="导出 Excel" ToolTip="将学生期末成绩以Excel表格导出"
                                CssClass="term-btn term-btn--secondary" />
                            <asp:Button ID="Btntermview" runat="server" Text="学期查询" OnClick="Btntermview_Click"
                                CssClass="term-btn term-btn--secondary" />
                            <asp:Button ID="Btnback" runat="server" Text="返回查询" OnClick="Btnback_Click"
                                CssClass="term-btn term-btn--ghost" />
                        </div>

                        <div class="term-msg">
                            <asp:Label ID="Labelmsg" runat="server" SkinID="LabelMsgRed"></asp:Label>
                        </div>
                    </div>
                </section>

                <section class="term-card term-card--span-4 term-theme--indigo">
                    <div class="term-card__head">
                        <h2 class="term-card__title">总分折算比重</h2>
                    </div>
                    <div class="term-card__body">
                        <div class="term-weight-grid">
                            <div class="term-weight-item">
                                <span class="term-weight-label">作品+小组+讨论+表单+测评</span>
                                <asp:DropDownList ID="DDLwork" runat="server" CssClass="term-select term-select--sm">
                                    <asp:ListItem Selected="True">100</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <span class="term-weight-sep">:</span>
                            <div class="term-weight-item">
                                <span class="term-weight-label">测验</span>
                                <asp:DropDownList ID="DDLexam" runat="server" CssClass="term-select term-select--sm">
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem Selected="True">50</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <span class="term-weight-sep">:</span>
                            <div class="term-weight-item">
                                <span class="term-weight-label">中英文</span>
                                <asp:DropDownList ID="DDLtyper" runat="server" CssClass="term-select term-select--sm">
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem Selected="True">10</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <span class="term-weight-sep">:</span>
                            <div class="term-weight-item">
                                <span class="term-weight-label">表现</span>
                                <asp:DropDownList ID="DDLattitude" runat="server" CssClass="term-select term-select--sm">
                                    <asp:ListItem Selected="True">100</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <span class="term-note" style="margin-top: 14px;">
                            期末总评等级比重：优秀 &gt; 80%、良好 &gt; 60%、及格 &gt; 30%、不及格 = 0%
                        </span>
                    </div>
                </section>

                <section class="term-card term-card--span-12 term-theme--slate">
                    <div class="term-card__head">
                        <h2 class="term-card__title">学生成绩明细</h2>
                    </div>
                    <div class="term-card__body">
                        <div class="term-table-wrap">
                            <asp:GridView ID="GVCourse" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="Sid" SkinID="GVmission" OnRowDataBound="GVCourse_RowDataBound"
                                PageSize="25" Width="100%" EnableModelValidation="True">
                                <Columns>
                                    <asp:BoundField HeaderText="编号" />
                                    <asp:BoundField DataField="Snum" HeaderText="学号" />
                                    <asp:BoundField DataField="Sgradeclass" HeaderText="班级" />
                                    <asp:HyperLinkField DataNavigateUrlFields="Snum"
                                        DataNavigateUrlFormatString="studentwork.aspx?snum={0}" DataTextField="Sname"
                                        HeaderText="姓名" Target="_blank" />
                                    <asp:BoundField DataField="Sscore" HeaderText="作品" />
                                    <asp:BoundField DataField="Sgscore" HeaderText="小组" />
                                    <asp:BoundField DataField="Spscore" HeaderText="讨论" />
                                    <asp:BoundField DataField="Stxtform" HeaderText="表单" />
                                    <asp:BoundField DataField="Svscore" HeaderText="测验" />
                                    <asp:BoundField DataField="Schinese" HeaderText="拼音" />
                                    <asp:BoundField DataField="Sfscore" HeaderText="英语" />
                                    <asp:BoundField DataField="Stscore" HeaderText="中文" />
                                    <asp:BoundField DataField="Sidle" HeaderText="测评" />
                                    <asp:BoundField DataField="Sattitude" HeaderText="表现" />
                                    <asp:BoundField DataField="Sallscore" HeaderText="总分" />
                                    <asp:BoundField DataField="Sape" HeaderText="评定" />
                                    <asp:BoundField DataField="Stenscore" HeaderText="评定" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
