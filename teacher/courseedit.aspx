<%@ Page Validaterequest="false" Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher"  AutoEventWireup="true" CodeFile="courseedit.aspx.cs" Inherits="Teacher_courseedit" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    

    <div class="course-edit-page">
        <div class="course-edit-shell">
            <section id="EditHeroSection" class="course-edit-hero">
                <button type="button" class="course-edit-banner-trigger" id="BannerTrigger">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M12 5H7a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-5"></path><path d="M16.5 4.5a2.12 2.12 0 1 1 3 3L12 15l-4 1 1-4 7.5-7.5z"></path></svg>
                    编辑横幅
                </button>
                <div class="course-edit-hero-content">
                    <h1 class="course-edit-title">学案编辑</h1>
                </div>
            </section>

            <section class="course-edit-panel">
                <div class="course-edit-grid">
                    <div class="course-edit-field course-edit-field-wide">
                        <label class="course-edit-label" for="<%= Texttitle.ClientID %>">学案名称</label>
                        <asp:TextBox ID="Texttitle" runat="server" SkinID="TextBoxNormal" CssClass="course-edit-input"></asp:TextBox>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLclass.ClientID %>">学案分类</label>
                        <asp:DropDownList ID="DDLclass" runat="server" Font-Size="9pt" CssClass="course-edit-select"></asp:DropDownList>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLcobj.ClientID %>">授课年级</label>
                        <asp:DropDownList ID="DDLcobj" runat="server" Font-Size="9pt" CssClass="course-edit-select"></asp:DropDownList>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLCterm.ClientID %>">学期设置</label>
                        <div class="course-edit-static">
                            第&nbsp;<asp:DropDownList ID="DDLCterm" runat="server" Font-Names="Arial" Font-Size="8pt" CssClass="course-edit-select">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem Selected="True">2</asp:ListItem>
                            </asp:DropDownList>
                            学期
                        </div>
                    </div>

                    <div class="course-edit-field">
                        <label class="course-edit-label" for="<%= DDLCks.ClientID %>">课节</label>
                        <div class="course-edit-static">
                            第&nbsp;<asp:DropDownList ID="DDLCks" runat="server" Font-Size="8pt" Font-Names="Arial" CssClass="course-edit-select"></asp:DropDownList>
                            课节
                        </div>
                    </div>

                    <div class="course-edit-field">
                        <span class="course-edit-label">发布设置</span>
                        <label class="course-edit-publish" for="<%= CheckPublish.ClientID %>">
                            <asp:CheckBox ID="CheckPublish" runat="server" Text="是否发布" Checked="True" />
                        </label>
                    </div>

                    <div class="course-edit-field course-edit-field-wide" style="display:none;">
                        <span class="course-edit-label">横幅设置</span>
                        <div class="course-edit-banner-row">
                            <asp:HyperLink ID="HLbanner" runat="server" Target="_blank" CssClass="course-edit-banner-link">学案横幅</asp:HyperLink>
                            <div class="course-edit-file">
                                <asp:FileUpload ID="Fupload" runat="server" Font-Size="10pt" />
                            </div>
                        </div>
                    </div>
                    <asp:HiddenField ID="HiddenBannerUrl" runat="server" />
                </div>
            </section>

            <section class="course-edit-editor-panel">
                <link href="../js/vendors/wangeditor/style.css" rel="stylesheet">
                <link rel="stylesheet" href="../js/vendors/vditor/index.css" />
                <script src="../js/vendors/vditor/index.min.js"></script>
                <script src="../js/vendors/wangeditor/index.js"></script>

                <div class="course-edit-editor-toolbar">
                    <div>
                        <h2 class="course-edit-section-title">内容编辑</h2>
                        <p class="course-edit-section-desc">支持 KindEditor、WangEditor 和 Vditor 三种模式切换。</p>
                    </div>
                    <div>
                        <label class="course-edit-label">编辑器</label>
                        <select id="editorSelector" onchange="switchEditor(this.value)" class="course-edit-editor-select">
                            <option value="kindeditor" selected>KindEditor（原生）</option>
                            <option value="wangeditor">WangEditor（富文本）</option>
                            <option value="vditor">Vditor（Markdown）</option>
                        </select>
                    </div>
                </div>

                <script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
                <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
                <script src="../teacher/editor-upload-helper.js" type="text/javascript"></script>
                

                <div class="course-edit-editor-stage custom-scrollbar">
                    <div id="wangeditor-wrap" style="display:none; width:100%; position:relative; border: 1px solid #ccc; z-index: 100;">
                        <div id="wangeditor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
                        <div id="wangeditor-text" style="height: 350px;"></div>
                    </div>

                    <div id="vditor-wrap" style="display:none; width:100%; position:relative; margin-bottom: 10px;">
                        <div id="vditor-container"></div>
                    </div>

                    <textarea id="mcontent" runat="server" style="width:100%; height:400px;"></textarea>
                </div>
            </section>

            <section class="course-edit-feedback">
                <asp:Label ID="Labelmsg" runat="server" CssClass="course-edit-msg"></asp:Label>
            </section>

            <section class="course-edit-actions">
                <asp:Button ID="Btnedit" runat="server" Text="保存学案" onclick="Btnedit_Click" OnClientClick="return syncContent();" CssClass="course-edit-primary-btn" />
                <asp:Button ID="Btnreturn" runat="server" Text="返回列表" onclick="Btnreturn_Click" CssClass="course-edit-secondary-btn" />
            </section>
        </div>
    </div>

    <!-- Banner Modal -->
    <div id="CeBannerModal" class="ce-banner-modal" aria-hidden="true">
        <div class="ce-banner-dialog">
            <div class="ce-banner-head">
                <div>
                    <h2 class="ce-banner-title">编辑学案横幅</h2>
                    <p class="ce-banner-desc">上传图片作为学案横幅背景，建议使用横向大图。</p>
                </div>
                <button type="button" class="ce-banner-close" id="CeBannerClose">
                    <svg viewBox="0 0 24 24"><path d="M6 6l12 12"></path><path d="M18 6l-12 12"></path></svg>
                </button>
            </div>
            <div class="ce-banner-body">
                <div class="ce-banner-dropzone" id="CeBannerDropzone">
                    <svg viewBox="0 0 24 24"><path d="M12 16V7"></path><path d="M8.5 10.5L12 7l3.5 3.5"></path><path d="M5 17v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1"></path></svg>
                    <p class="ce-banner-drop-title">点击选择或拖拽图片到此处</p>
                    <p class="ce-banner-drop-desc">支持 png、jpg、gif、webp，建议横向大图</p>
                    <input type="file" id="CeBannerFile" accept="image/png,image/jpeg,image/jpg,image/gif,image/webp" />
                </div>
                <div id="CeBannerPreview" class="ce-banner-preview"></div>
                <div id="CeBannerStatus" class="ce-banner-status"></div>
            </div>
            <div class="ce-banner-foot">
                <button type="button" class="ce-banner-btn" id="CeBannerCancel">取消</button>
                <button type="button" class="ce-banner-btn primary" id="CeBannerSave">保存横幅</button>
            </div>
        </div>
    </div>

    
</asp:Content>
