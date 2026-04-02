<%@ Page Title="" Language="C#" MasterPageFile="~/student/Scm.master" StylesheetTheme="Student"  Validaterequest="false"  AutoEventWireup="true" CodeFile="showcourse.aspx.cs" Inherits="Student_showcourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Cpcm" Runat="Server">
<div id="showcontent" class="w-full max-w-5xl mx-auto py-6 px-4 sm:px-8 bg-white rounded-2xl shadow-sm border border-slate-200">
    <!-- Course Title Header -->
    <div class="missiontitle text-center pb-8 border-b border-slate-100">
        <asp:Label ID="LabelCtitle" runat="server" CssClass="text-2xl sm:text-3xl font-extrabold text-slate-800 tracking-tight"></asp:Label>
    </div>
    
    <div class="courseother mt-2 text-center text-sm text-slate-500">	
    </div>
    
    <!-- Rich Text Content Area -->
    <div id="Ccontent" class="coursecontent mt-8 w-full max-w-none text-slate-700 leading-loose text-lg" style="word-wrap:break-word; word-break:break-all;" runat="server">   
    </div>
</div>
</asp:Content>

