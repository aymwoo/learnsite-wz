<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="gauge.aspx.cs" Inherits="Teacher_gauge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<div class="box-border max-w-full mx-auto p-4 sm:p-6 space-y-6 font-sans text-slate-800">
    <!-- Header -->
    <div class="box-border bg-white rounded-2xl overflow-hidden" style="border: none; border-top: 4px solid #6366f1; box-shadow: 0 4px 25px rgba(0,0,0,0.04);">
        <div class="px-6 py-5 flex flex-col sm:flex-row items-center justify-between gap-4" style="background: linear-gradient(135deg, #eef2ff 0%, #ffffff 100%);">
            <div>
                <h1 class="text-[16px] font-extrabold text-slate-800 flex items-center gap-2">
                    <i class="bi bi-ui-checks-grid text-indigo-600"></i> 自定义量化评价标准
                </h1>
                <p class="text-[13px] text-slate-500 mt-1.5">创建和管理作品互评的量化指标库</p>
            </div>
        </div>
    </div>

    <!-- Data Table -->
    <div class="box-border bg-white rounded-2xl overflow-hidden" style="border: none; box-shadow: 0 4px 25px rgba(0,0,0,0.04);">
        <asp:GridView ID="GVGauge" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="Gid" Width="100%" 
            CssClass="w-full text-sm text-slate-600 text-center" 
            onrowcommand="GVGauge_RowCommand" EnableModelValidation="True" onrowdatabound="GVGauge_RowDataBound"
            GridLines="None">
            <HeaderStyle CssClass="bg-slate-50 font-semibold text-slate-700 border-b border-slate-200" />
            <RowStyle CssClass="border-b border-slate-100 hover:bg-slate-50 transition-colors" />
            <Columns>
                <asp:BoundField HeaderText="序号">
                    <HeaderStyle CssClass="py-4 px-4 w-16" />
                    <ItemStyle CssClass="py-3 px-4 text-slate-400 font-mono" />
                </asp:BoundField>
                <asp:BoundField DataField="Gtype" HeaderText="分类">
                    <HeaderStyle CssClass="py-4 px-4 w-24" />
                    <ItemStyle CssClass="py-3 px-4 font-medium text-slate-700" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="Gid"  
                    DataNavigateUrlFormatString="~/teacher/gaugeitem.aspx?gid={0}" 
                    DataTextField="Gtitle" HeaderText="标题" >
                    <HeaderStyle CssClass="py-4 px-4 text-left" />
                    <ItemStyle CssClass="py-3 px-4 text-left font-bold text-indigo-600 hover:text-indigo-800" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="Gcount" HeaderText="使用次数">
                    <HeaderStyle CssClass="py-4 px-4 w-28" />
                    <ItemStyle CssClass="py-3 px-4 font-mono text-emerald-600 font-semibold" />
                </asp:BoundField>
                <asp:BoundField DataField="Gdate" HeaderText="日期">
                    <HeaderStyle CssClass="py-4 px-4 w-40" />
                    <ItemStyle CssClass="py-3 px-4 text-slate-500 text-xs" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="BtnEdit" runat="server" CausesValidation="false" 
                            CommandArgument='<%# Eval("Gid") %>' CommandName="Del" 
                            Text="✖" ToolTip="删除" 
                            CssClass="inline-flex items-center justify-center w-8 h-8 rounded-full text-rose-500 bg-rose-50 hover:bg-rose-500 hover:text-white transition-all duration-200 text-sm"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="py-4 px-4 w-24" />
                    <ItemStyle CssClass="py-3 px-4" />
                </asp:TemplateField>
            </Columns>                            
        </asp:GridView>
    </div>

    <!-- Add Form -->
    <div class="box-border bg-white rounded-2xl overflow-hidden" style="border: none; border-top: 4px solid #10b981; box-shadow: 0 4px 25px rgba(0,0,0,0.04);">
        <div class="px-6 py-5 flex flex-wrap items-center gap-4" style="background: linear-gradient(135deg, #ecfdf5 0%, #ffffff 100%);">
        <div class="flex items-center gap-2">
            <span class="text-sm font-bold text-indigo-800">作品类型</span>
            <asp:DropDownList ID="DDLtype" runat="server" CssClass="border border-indigo-200 rounded-xl px-3 py-2.5 text-sm bg-white focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition text-indigo-700 font-semibold min-w-[120px]">
            </asp:DropDownList>
        </div>
        <div class="flex items-center gap-2 flex-1 min-w-[200px]">
            <span class="text-sm font-bold text-indigo-800 whitespace-nowrap">量规标题</span>
            <asp:TextBox ID="TextBoxGtitle" runat="server" 
                CssClass="w-full border border-indigo-200 rounded-xl px-4 py-2.5 text-sm bg-white focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition placeholder-indigo-300"
                placeholder="例如：Scratch游戏作品互评表"></asp:TextBox>
        </div>
        <asp:Button ID="Btnadd" runat="server" Text="添加量规" onclick="Btnadd_Click" 
            CssClass="px-6 py-2.5 text-white font-bold rounded-xl transition duration-300 border-0 cursor-pointer whitespace-nowrap" 
            style="background: linear-gradient(135deg, #10b981 0%, #059669 100%); box-shadow: 0 4px 14px rgba(16,185,129,0.3);" />
        </div>
    </div>

    <!-- Warnings -->
    <div class="box-border rounded-2xl p-5 space-y-3 text-[13px] text-amber-800" style="background: linear-gradient(135deg, #fffbeb 0%, #fefce8 100%); border: 1px solid #fde68a;">
        <p class="flex items-start gap-2">
            <i class="bi bi-exclamation-triangle-fill text-amber-500 mt-0.5"></i>
            <span class="text-amber-900"><strong>注意：</strong>评价标准一旦被使用后，将无法删除，请慎重填写！</span>
        </p>
        <p class="flex items-start gap-2">
            <i class="bi bi-info-circle-fill text-blue-500 mt-0.5"></i>
            <span class="text-blue-800">当活动中未指定互评评价标准时，系统将自动选取相应作品类型中的第一条评价标准。</span>
        </p>
    </div>
</div>
</asp:Content>