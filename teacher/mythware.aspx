<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="mythware.aspx.cs" Inherits="Teacher_mythware" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <link href="../js/fileupload.css" rel="stylesheet" />
    <style type="text/css">
        .myth-page {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
            min-height: calc(100vh - 8rem);
        }

        .myth-page * {
            box-sizing: border-box;
        }

        .myth-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Hero */
        .myth-hero {
            position: relative;
            overflow: hidden;
            border: 1px solid var(--ls-border);
            border-radius: 0.75rem;
            padding: 24px 28px;
            background:
                radial-gradient(circle at top left, rgba(59, 130, 246, 0.18), transparent 38%),
                radial-gradient(circle at right center, rgba(14, 165, 233, 0.16), transparent 26%),
                linear-gradient(135deg, #0f172a 0%, #1d4ed8 52%, #38bdf8 100%);
            color: #eff6ff;
            box-shadow: 0 28px 60px rgba(37, 99, 235, 0.2);
        }

        .myth-hero__title {
            margin: 0;
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .myth-hero__subtitle {
            max-width: 760px;
            margin: 8px 0 0;
            font-size: 14px;
            line-height: 1.8;
            color: rgba(239, 246, 255, 0.88);
        }

        /* Grid */
        .myth-grid {
            display: grid;
            gap: 20px;
            grid-template-columns: repeat(12, minmax(0, 1fr));
        }

        /* Card */
        .myth-card {
            min-width: 0;
            border: 1px solid var(--ls-border);
            border-radius: 0.75rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
        }

        .myth-card--span-12 { grid-column: span 12; }
        .myth-card--span-7 { grid-column: span 7; }
        .myth-card--span-5 { grid-column: span 5; }

        .myth-card--files {
            background: linear-gradient(160deg, #ffffff 0%, #f0f7ff 100%);
        }

        .myth-card--build {
            background: linear-gradient(160deg, #ffffff 0%, #f5f3ff 100%);
        }

        .myth-card__head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 12px;
            align-items: center;
            padding: 20px 24px 0;
        }

        .myth-card__title {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            letter-spacing: -0.02em;
            color: var(--ls-text);
        }

        .myth-card__body {
            padding: 18px 24px 22px;
        }

        /* Download button */
        .myth-download-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 32px;
            padding: 0 12px;
            border: 1px solid #bfdbfe;
            border-radius: 0.375rem;
            background: #eff6ff;
            cursor: pointer;
            transition: background-color 0.15s;
            color: #1d4ed8;
            font-weight: 700;
        }

        .myth-download-btn:hover {
            background: #dbeafe;
        }

        /* File list */
        .myth-file-list {
            width: 100%;
        }

        .myth-file-item {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin: 0 10px 8px 0;
            padding: 10px 14px;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
            font-size: 13px;
            vertical-align: top;
        }

        .myth-file-item a {
            color: #2563eb;
            font-weight: 600;
            text-decoration: none;
        }

        .myth-file-item a:hover {
            color: #1d4ed8;
            text-decoration: underline;
        }

        .myth-file-id {
            font-size: 12px;
            font-weight: 600;
            color: #94a3b8;
        }

        .myth-file-size {
            font-size: 12px;
            color: var(--ls-muted);
        }

        .myth-file-flag {
            font-size: 11px;
            font-weight: 700;
            color: #059669;
        }

        /* Build form */
        .myth-form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .myth-field {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .myth-label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .myth-select {
            width: 100%;
            min-height: 38px;
            padding: 0 12px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 13px;
            font-weight: 600;
            transition: border-color 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }

        .myth-select:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        .myth-input {
            min-height: 38px;
            padding: 0 12px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 14px;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .myth-input:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        .myth-check-group {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 14px;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            background: #f8fafc;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
        }

        .myth-room-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: flex-end;
        }

        .myth-room-preview {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 38px;
            height: 38px;
            border: 1px solid #bbf7d0;
            border-radius: 0.375rem;
            background: #f0fdf4;
            cursor: pointer;
            transition: background-color 0.15s;
        }

        .myth-room-preview:hover {
            background: #dcfce7;
        }

        .myth-room-preview img {
            width: 18px;
            height: 18px;
        }

        .myth-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 42px;
            padding: 0 24px;
            border-radius: 0.375rem;
            border: none;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            color: #ffffff;
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.2);
            transition: transform 0.18s, box-shadow 0.18s;
        }

        .myth-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.3);
        }

        .myth-msg {
            padding: 12px 14px;
            border-radius: 0.375rem;
            background: #fef2f2;
            border: 1px solid #fecaca;
            font-size: 13px;
            color: #991b1b;
            line-height: 1.7;
        }

        .myth-hint {
            padding: 10px 14px;
            border-radius: 0.375rem;
            background: #dbeafe;
            border: 1px solid #bfdbfe;
            font-size: 12px;
            color: #1e3a8a;
            line-height: 1.7;
        }

        .myth-hidden {
            display: none;
        }

        @media (max-width: 1200px) {
            .myth-card--span-7,
            .myth-card--span-5 {
                grid-column: span 12;
            }
        }

        @media (max-width: 768px) {
            .myth-page {
                padding: 16px;
            }

            .myth-hero {
                padding: 20px 16px;
            }

            .myth-hero__title {
                font-size: 22px;
            }

            .myth-card__head {
                padding: 16px 16px 0;
            }

            .myth-card__body {
                padding: 14px 16px 18px;
            }

            .myth-room-row {
                flex-direction: column;
                align-items: stretch;
            }
        }
    </style>

    <div class="myth-page">
        <div class="myth-shell">
            <div class="myth-hero">
                <h1 class="myth-hero__title">极域班级模型</h1>
                <p class="myth-hero__subtitle">根据签到记录生成极域ClassModel班级模型文件，支持上传原有模型并自动匹配学生座位。</p>
            </div>

            <div class="myth-grid">
                <div class="myth-card myth-card--span-5 myth-card--files">
                    <div class="myth-card__head">
                        <h2 class="myth-card__title">模型文件</h2>
                        <asp:Button ID="ImgBtnDown" runat="server"
                            Text="打包下载" OnClick="ImgBtnDown_Click"
                            ToolTip="点击打包下载" CssClass="myth-download-btn" />
                    </div>
                    <div class="myth-card__body">
                        <asp:DataList ID="Dlfilelist" runat="server"
                            RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Flow"
                            CssClass="myth-file-list" CellPadding="0" CellSpacing="0">
                            <ItemTemplate>
                                <div class="myth-file-item">
                                    <span class="myth-file-id"><asp:Label ID="Labelfid" runat="server" Text='<%# Eval("fid") %>'></asp:Label></span>
                                    <asp:HyperLink ID="HLfname" runat="server" Target="_blank" Text='<%# Eval("fname") %>'></asp:HyperLink>
                                    <span class="myth-file-size"><asp:Label ID="Labelfsize" runat="server" Text='<%# Eval("fsize") %>'></asp:Label></span>
                                    <span class="myth-file-flag"><asp:Label ID="Labelfread" runat="server" Text='<%# Eval("fread") %>' ToolTip="是否只读（T：只读 | F：可写）"></asp:Label></span>
                                    <asp:Label ID="Labelurl" runat="server" Text='<%# Eval("furl") %>' CssClass="myth-hidden"></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>

                <div class="myth-card myth-card--span-7 myth-card--build">
                    <div class="myth-card__head">
                        <h2 class="myth-card__title">生成模型</h2>
                    </div>
                    <div class="myth-card__body">
                        <div class="myth-form">
                            <div class="myth-field">
                                <span class="myth-label">上传原有班级模型（xml/cls格式）</span>
                                <div class="ls-upload" data-accept=".xml,.cls" data-label="点击或拖拽上传班级模型" data-hint="支持 xml / cls 格式">
                                    <asp:FileUpload ID="FuClassModel" runat="server" />
                                </div>
                            </div>

                            <div>
                                <span class="myth-check-group">
                                    <asp:CheckBox ID="CkMachine" runat="server" Text="空余学生机预处理为主机名"
                                        ToolTip="主机名与IP对应表有记录则有效" Checked="True" />
                                </span>
                            </div>

                            <div class="myth-field">
                                <span class="myth-label">签到时间范围</span>
                                <asp:DropDownList ID="DDLmonth" runat="server" CssClass="myth-select">
                                    <asp:ListItem Value="1" Selected="True">1周内</asp:ListItem>
                                    <asp:ListItem Value="2">2周内</asp:ListItem>
                                    <asp:ListItem Value="3">3周内</asp:ListItem>
                                    <asp:ListItem Value="4">4周内</asp:ListItem>
                                    <asp:ListItem Value="5">5周内</asp:ListItem>
                                    <asp:ListItem Value="6">6周内</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="myth-field">
                                <span class="myth-label">电脑室名称</span>
                                <div class="myth-room-row">
                                    <asp:TextBox ID="TextBoxRoom" runat="server" CssClass="myth-input" style="width: 120px;"></asp:TextBox>
                                    <asp:HyperLink ID="Hlkroom" runat="server"
                                        NavigateUrl="~/teacher/myseat.aspx" Target="_blank"
                                        ToolTip="机房视图预览" CssClass="myth-room-preview">
                                        <img src="../images/zoom.gif" alt="预览" />
                                    </asp:HyperLink>
                                </div>
                            </div>

                            <div>
                                <asp:Button ID="BtnBuild" runat="server" onclick="BtnBuild_Click"
                                    Text="生成任教班级模型" CssClass="myth-btn" />
                            </div>

                            <asp:Label ID="Labelmsg" runat="server" CssClass="myth-msg"></asp:Label>

                            <div class="myth-hint">根据最近几周内签到表的姓名与IP对应，生成所教班级模型，完成后可点击打包按钮下载。</div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Label ID="Labeldirhid" runat="server" CssClass="myth-hidden"></asp:Label>
            <asp:Label ID="Labeldir" runat="server" CssClass="myth-hidden"></asp:Label>
        </div>
    </div>
    <script src="../js/fileupload.js"></script>
</asp:Content>
