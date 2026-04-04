<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="courseshow.aspx.cs" Inherits="Teacher_courseshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .course-show-page {
            --workspace-page-bg: linear-gradient(180deg, #f8fafc 0%, #eef2ff 100%);
            --workspace-hero-bg: linear-gradient(135deg, #1d4ed8 0%, #4338ca 52%, #7c3aed 100%);
            --workspace-primary-bg: #4f46e5;
            --workspace-primary-hover: #4338ca;
            --workspace-primary-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
            --workspace-secondary-bg: #eef2ff;
            --workspace-secondary-hover: #e0e7ff;
            --workspace-secondary-border: #c7d2fe;
            --workspace-secondary-fg: #3730a3;
        }

        .course-show-page a {
            text-decoration: none;
        }

        .course-show-shell {
            gap: 1.25rem;
        }

        .course-show-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 0.6rem;
            margin-top: 0.25rem;
        }

        .course-show-meta-chip {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            min-height: 2.25rem;
            padding: 0.42rem 0.85rem;
            border-radius: 0.75rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.13);
            color: rgba(255, 255, 255, 0.92);
            font-size: 0.84rem;
            font-weight: 500;
            backdrop-filter: blur(6px);
            transition: background 0.2s ease, border-color 0.2s ease, transform 0.2s ease;
        }

        .course-show-meta-chip:hover {
            background: rgba(255, 255, 255, 0.18);
            border-color: rgba(255, 255, 255, 0.22);
            transform: translateY(-1px);
        }

        .course-show-meta-chip-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 1.15rem;
            height: 1.15rem;
            flex-shrink: 0;
        }

        .course-show-meta-chip-icon svg {
            width: 100%;
            height: 100%;
            stroke: rgba(196, 181, 253, 0.9);
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .course-show-meta-chip-label {
            color: rgba(196, 181, 253, 0.85);
            font-weight: 600;
            font-size: 0.78rem;
            letter-spacing: 0.02em;
        }

        .course-show-meta-chip-value {
            color: #ffffff;
            font-weight: 600;
        }

        .course-show-hero {
            position: relative;
            isolation: isolate;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .course-show-hero.has-banner {
            box-shadow: 0 24px 52px -30px rgba(15, 23, 42, 0.7);
        }

        .course-show-hero.has-banner:before,
        .course-show-hero.has-banner:after {
            background: rgba(255, 255, 255, 0.04);
        }

        .course-show-hero-overlay {
            position: absolute;
            inset: 0;
            z-index: 0;
            background: linear-gradient(135deg, rgba(15, 23, 42, 0.62) 0%, rgba(49, 46, 129, 0.5) 45%, rgba(30, 41, 59, 0.68) 100%);
            transition: opacity 0.35s ease;
        }

        .course-show-hero.is-refreshing {
            animation: course-show-hero-refresh 0.45s ease;
        }

        .course-show-hero.is-refreshing .course-show-hero-overlay {
            opacity: 0.84;
        }

        .course-show-hero-content {
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .course-show-hero-header {
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
            padding-bottom: 1.5rem;
        }

        .course-show-hero-header::after {
            content: "";
            display: block;
            height: 2px;
            border-radius: 2px;
            background: linear-gradient(90deg, rgba(196, 181, 253, 0.5) 0%, rgba(99, 102, 241, 0.35) 40%, rgba(139, 92, 246, 0.2) 70%, transparent 100%);
            animation: course-show-accent-shimmer 3s ease-in-out infinite;
        }

        @keyframes course-show-accent-shimmer {
            0%, 100% { opacity: 0.7; }
            50% { opacity: 1; }
        }

        .course-show-hero-top {
            display: grid;
            grid-template-columns: minmax(0, 1fr) auto;
            gap: 1.5rem;
            align-items: flex-start;
        }

        .course-show-hero-copy {
            display: flex;
            flex-direction: column;
            gap: 0.85rem;
            min-width: 0;
        }

        .course-show-hero-nav {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            flex-wrap: wrap;
        }

        .course-show-hero-kicker {
            display: inline-flex;
            align-items: center;
            align-self: flex-start;
            gap: 0.45rem;
            min-height: 1.85rem;
            padding: 0.3rem 0.75rem;
            border-radius: 9999px;
            border: 1px solid rgba(196, 181, 253, 0.25);
            background: rgba(139, 92, 246, 0.18);
            color: #c4b5fd;
            font-size: 0.76rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            text-transform: uppercase;
        }

        .course-show-hero-kicker:before {
            content: "";
            width: 0.42rem;
            height: 0.42rem;
            border-radius: 9999px;
            background: #a78bfa;
            box-shadow: 0 0 0 3px rgba(167, 139, 250, 0.2);
            animation: course-show-kicker-pulse 2s ease-in-out infinite;
        }

        @keyframes course-show-kicker-pulse {
            0%, 100% { box-shadow: 0 0 0 3px rgba(167, 139, 250, 0.2); }
            50% { box-shadow: 0 0 0 6px rgba(167, 139, 250, 0.08); }
        }

        .course-show-title-wrap {
            display: flex;
            flex-direction: column;
            gap: 0.35rem;
        }

        .course-show-back-link {
            display: inline-flex;
            align-items: center;
            align-self: flex-start;
            gap: 0.35rem;
            min-height: 2rem;
            padding: 0.35rem 0.8rem;
            border-radius: 9999px;
            border: 1px solid rgba(255, 255, 255, 0.15);
            background: rgba(255, 255, 255, 0.08);
            color: rgba(255, 255, 255, 0.88);
            font-size: 0.82rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .course-show-back-link:hover {
            background: rgba(255, 255, 255, 0.16);
            border-color: rgba(255, 255, 255, 0.28);
            color: #ffffff;
            transform: translateX(-2px);
        }

        .course-show-back-link svg {
            width: 0.9rem;
            height: 0.9rem;
            stroke: currentColor;
            fill: none;
            stroke-width: 2.2;
            stroke-linecap: round;
            stroke-linejoin: round;
            transition: transform 0.2s ease;
        }

        .course-show-back-link:hover svg {
            transform: translateX(-2px);
        }

        .course-show-hero-edit {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 3.1rem;
            height: 3.1rem;
            padding: 0;
            border-radius: 9999px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            background: rgba(15, 23, 42, 0.22);
            color: #ffffff;
            box-shadow: 0 14px 28px -20px rgba(15, 23, 42, 0.85);
            backdrop-filter: blur(10px);
            transition: transform 0.2s ease, background 0.2s ease, border-color 0.2s ease;
            text-decoration: none;
        }

        .course-show-hero-actions {
            display: flex;
            justify-content: flex-end;
            align-items: flex-start;
            min-width: 0;
        }

        .course-show-hero-edit svg {
            width: 1.25rem;
            height: 1.25rem;
            stroke: currentColor;
            fill: none;
            stroke-width: 1.9;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .course-show-hero-edit:hover {
            transform: translateY(-1px);
            background: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.28);
            color: #ffffff;
        }

        .course-show-hero-edit.is-disabled,
        .course-show-hero-edit[aria-disabled="true"] {
            opacity: 0.52;
            pointer-events: none;
            cursor: not-allowed;
        }

        .course-show-banner-modal {
            position: fixed;
            inset: 0;
            z-index: 10020;
            display: none;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            background: rgba(15, 23, 42, 0.58);
            backdrop-filter: blur(8px);
        }

        .course-show-banner-modal.is-open {
            display: flex;
        }

        .course-show-banner-dialog {
            width: min(100%, 62rem);
            max-height: calc(100vh - 3rem);
            overflow: auto;
            border-radius: 1.5rem;
            border: 1px solid rgba(148, 163, 184, 0.22);
            background: #ffffff;
            box-shadow: 0 32px 80px -36px rgba(15, 23, 42, 0.55);
        }

        .course-show-banner-dialog-head {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 1rem;
            padding: 1.2rem 1.25rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .course-show-banner-dialog-title {
            margin: 0;
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
        }

        .course-show-banner-dialog-desc {
            margin: 0.35rem 0 0;
            color: #64748b;
            font-size: 0.9rem;
            line-height: 1.6;
        }

        .course-show-banner-close {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 2.4rem;
            height: 2.4rem;
            border: 1px solid #dbe4ff;
            border-radius: 9999px;
            background: #f8faff;
            color: #475569;
        }

        .course-show-banner-close:hover {
            border-color: #a5b4fc;
            background: #eef2ff;
            color: #4338ca;
        }

        .course-show-banner-close svg {
            width: 1rem;
            height: 1rem;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .course-show-banner-dialog-body {
            display: grid;
            grid-template-columns: minmax(0, 1.1fr) minmax(18rem, 0.9fr);
            gap: 1.25rem;
            padding: 1.25rem;
        }

        .course-show-banner-upload {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .course-show-banner-dropzone {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 0.85rem;
            min-height: 17rem;
            padding: 1.5rem;
            border: 1.5px dashed #a5b4fc;
            border-radius: 1.25rem;
            background: linear-gradient(180deg, #f8faff 0%, #eef2ff 100%);
            text-align: center;
            transition: border-color 0.2s ease, background 0.2s ease, transform 0.2s ease;
        }

        .course-show-banner-dropzone.is-dragover {
            border-color: #4f46e5;
            background: linear-gradient(180deg, #eef2ff 0%, #e0e7ff 100%);
            transform: scale(0.995);
        }

        .course-show-banner-dropzone svg {
            width: 2.4rem;
            height: 2.4rem;
            stroke: #4338ca;
            fill: none;
            stroke-width: 1.8;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .course-show-banner-drop-title {
            margin: 0;
            font-size: 1rem;
            font-weight: 700;
            color: #1e293b;
        }

        .course-show-banner-drop-desc {
            margin: 0;
            color: #64748b;
            font-size: 0.88rem;
            line-height: 1.7;
        }

        .course-show-banner-browse {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.6rem;
            padding: 0.55rem 1rem;
            border-radius: 0.9rem;
            border: 1px solid #c7d2fe;
            background: #ffffff;
            color: #4338ca;
            font-size: 0.88rem;
            font-weight: 700;
            cursor: pointer;
        }

        .course-show-banner-browse:hover {
            background: #eef2ff;
            border-color: #a5b4fc;
        }

        .course-show-banner-file {
            display: none;
        }

        .course-show-banner-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 0.6rem;
        }

        .course-show-banner-chip {
            display: inline-flex;
            align-items: center;
            min-height: 2rem;
            padding: 0.35rem 0.7rem;
            border-radius: 9999px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            color: #475569;
            font-size: 0.82rem;
            font-weight: 600;
        }

        .course-show-banner-preview-card {
            display: flex;
            flex-direction: column;
            gap: 0.9rem;
            min-width: 0;
        }

        .course-show-banner-preview-head {
            display: flex;
            flex-direction: column;
            gap: 0.35rem;
        }

        .course-show-banner-current {
            display: inline-flex;
            align-items: center;
            align-self: flex-start;
            min-height: 2rem;
            padding: 0.32rem 0.68rem;
            border-radius: 9999px;
            background: #eef2ff;
            border: 1px solid #c7d2fe;
            color: #4338ca;
            font-size: 0.8rem;
            font-weight: 700;
        }

        .course-show-banner-preview-title {
            margin: 0;
            font-size: 0.98rem;
            font-weight: 700;
            color: #0f172a;
        }

        .course-show-banner-preview-desc {
            margin: 0;
            color: #64748b;
            font-size: 0.86rem;
            line-height: 1.6;
        }

        .course-show-banner-stage {
            position: relative;
            min-height: 18rem;
            border-radius: 1.25rem;
            overflow: hidden;
            border: 1px solid #dbe4ff;
            background: linear-gradient(135deg, #1d4ed8 0%, #4338ca 52%, #7c3aed 100%);
        }

        .course-show-banner-stage.is-refreshing {
            animation: course-show-banner-stage-refresh 0.45s ease;
        }

        .course-show-banner-stage.has-image {
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .course-show-banner-stage:before {
            content: "";
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, rgba(15, 23, 42, 0.38) 0%, rgba(49, 46, 129, 0.28) 45%, rgba(30, 41, 59, 0.46) 100%);
        }

        .course-show-banner-stage-copy {
            position: absolute;
            left: 1.2rem;
            right: 1.2rem;
            bottom: 1.2rem;
            z-index: 1;
            color: #ffffff;
        }

        .course-show-banner-stage-copy strong {
            display: block;
            font-size: 1.15rem;
            line-height: 1.3;
        }

        .course-show-banner-stage-copy span {
            display: block;
            margin-top: 0.3rem;
            font-size: 0.84rem;
            color: rgba(255, 255, 255, 0.86);
        }

        .course-show-banner-stage-empty {
            position: absolute;
            inset: 0;
            z-index: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            color: rgba(255, 255, 255, 0.88);
            font-size: 0.92rem;
            font-weight: 600;
        }

        .course-show-banner-status {
            min-height: 1.35rem;
            color: #475569;
            font-size: 0.84rem;
            font-weight: 600;
        }

        .course-show-banner-progress {
            position: relative;
            height: 0.55rem;
            border-radius: 9999px;
            background: #e2e8f0;
            overflow: hidden;
        }

        .course-show-banner-progress[hidden] {
            display: none;
        }

        .course-show-banner-progress-bar {
            width: 0;
            height: 100%;
            border-radius: inherit;
            background: linear-gradient(90deg, #6366f1 0%, #8b5cf6 100%);
            transition: width 0.2s ease;
        }

        .course-show-banner-status.is-success {
            color: #15803d;
        }

        .course-show-banner-status.is-error {
            color: #b91c1c;
        }

        .course-show-banner-dialog-foot {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 1rem;
            padding: 1rem 1.25rem 1.25rem;
            border-top: 1px solid #e2e8f0;
        }

        .course-show-banner-foot-note {
            color: #64748b;
            font-size: 0.82rem;
            line-height: 1.6;
        }

        .course-show-banner-actions {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
            gap: 0.75rem;
        }

        .course-show-banner-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.6rem;
            padding: 0.55rem 1rem;
            border-radius: 0.9rem;
            border: 1px solid #cbd5e1;
            background: #ffffff;
            color: #334155;
            font-size: 0.88rem;
            font-weight: 700;
        }

        .course-show-banner-btn:hover {
            border-color: #a5b4fc;
            background: #f8faff;
        }

        .course-show-banner-btn.primary {
            border-color: #4f46e5;
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            color: #ffffff;
            box-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
        }

        .course-show-banner-btn.primary:hover {
            background: linear-gradient(135deg, #4338ca 0%, #3730a3 100%);
        }

        .course-show-banner-btn[disabled] {
            opacity: 0.55;
            cursor: wait;
        }

        @keyframes course-show-hero-refresh {
            0% {
                transform: scale(0.992);
                filter: brightness(0.94);
            }
            100% {
                transform: scale(1);
                filter: brightness(1);
            }
        }

        @keyframes course-show-banner-stage-refresh {
            0% {
                transform: scale(0.992);
                filter: saturate(0.92);
            }
            100% {
                transform: scale(1);
                filter: saturate(1);
            }
        }

        .course-show-preview-panel {
            position: relative;
            z-index: 1;
            border-radius: 1.25rem;
            border: 1px solid rgba(226, 232, 240, 0.7);
            background: rgba(255, 255, 255, 0.96);
            box-shadow: 0 18px 40px -28px rgba(15, 23, 42, 0.45);
            overflow: hidden;
        }

        .course-show-preview-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 0.75rem;
            padding: 1rem 1.25rem;
            border-bottom: 1px solid rgba(226, 232, 240, 0.85);
            background: linear-gradient(180deg, rgba(248, 250, 252, 0.98) 0%, rgba(255, 255, 255, 0.92) 100%);
        }

        .course-show-preview-title {
            margin: 0;
            font-size: 1rem;
            font-weight: 700;
            color: #0f172a;
        }

        .course-show-preview-desc {
            margin: 0.25rem 0 0;
            color: #64748b;
            font-size: 0.84rem;
        }

        .course-show-preview-content {
            padding: 1.25rem;
        }

        .course-show-tools-head,
        .course-show-menu-head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 1rem;
            align-items: flex-start;
            margin-bottom: 1.25rem;
        }

        .course-show-tool-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 0.9rem;
        }

        .course-show-tool {
            display: flex;
            align-items: center;
            gap: 0.85rem;
            min-height: 4.25rem;
            padding: 0.95rem 1rem;
            border-radius: 1rem;
            border: 1px solid #dbe4ff;
            background: linear-gradient(180deg, #ffffff 0%, #f8faff 100%);
            color: #1e293b;
            box-shadow: 0 12px 24px -24px rgba(30, 41, 59, 0.55);
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
        }

        .course-show-tool:hover {
            transform: translateY(-2px);
            border-color: #a5b4fc;
            box-shadow: 0 18px 30px -22px rgba(79, 70, 229, 0.45);
        }

        .course-show-tool[disabled],
        .course-show-tool.aspNetDisabled {
            opacity: 0.52;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
            border-style: dashed;
            filter: grayscale(0.12);
        }

        .course-show-tool[disabled] .course-show-tool-subtitle,
        .course-show-tool.aspNetDisabled .course-show-tool-subtitle {
            color: #94a3b8;
        }

        .course-show-edit-btn[disabled],
        .course-show-edit-btn.aspNetDisabled {
            opacity: 0.5;
            filter: grayscale(1);
            cursor: not-allowed;
        }

        .course-show-tool-readonly-note {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            align-self: flex-start;
            padding: 0.55rem 0.75rem;
            border-radius: 0.85rem;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.14);
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.84rem;
        }

        .course-show-tool-readonly-note[hidden] {
            display: none;
        }

        .course-show-tool-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 2.9rem;
            height: 2.9rem;
            border-radius: 0.95rem;
            background: #eef2ff;
            color: #4338ca;
            flex-shrink: 0;
        }

        .course-show-tool-icon svg {
            width: 1.35rem;
            height: 1.35rem;
            stroke: currentColor;
            fill: none;
            stroke-width: 1.9;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .course-show-tool-mission .course-show-tool-icon {
            background: #eef2ff;
            color: #4338ca;
        }

        .course-show-tool-topic .course-show-tool-icon {
            background: #ecfeff;
            color: #0f766e;
        }

        .course-show-tool-exam .course-show-tool-icon {
            background: #fef3c7;
            color: #b45309;
        }

        .course-show-tool-form .course-show-tool-icon {
            background: #dcfce7;
            color: #166534;
        }

        .course-show-tool-block .course-show-tool-icon {
            background: #ede9fe;
            color: #6d28d9;
        }

        .course-show-tool-python .course-show-tool-icon {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .course-show-tool-console .course-show-tool-icon {
            background: #e0f2fe;
            color: #0369a1;
        }

        .course-show-tool-graph .course-show-tool-icon {
            background: #fae8ff;
            color: #a21caf;
        }

        .course-show-tool-pixel .course-show-tool-icon {
            background: #fce7f3;
            color: #be185d;
        }

        .course-show-tool-html .course-show-tool-icon {
            background: #fee2e2;
            color: #b91c1c;
        }

        .course-show-tool-mind .course-show-tool-icon {
            background: #ede9fe;
            color: #7c3aed;
        }

        .course-show-tool-sheet .course-show-tool-icon {
            background: #dcfce7;
            color: #15803d;
        }

        .course-show-tool-ware .course-show-tool-icon {
            background: #e0e7ff;
            color: #3730a3;
        }

        .course-show-tool-copy {
            display: flex;
            flex-direction: column;
            gap: 0.18rem;
            text-align: left;
        }

        .course-show-tool-title {
            font-size: 0.96rem;
            font-weight: 700;
            color: #0f172a;
        }

        .course-show-tool-subtitle {
            font-size: 0.82rem;
            color: #64748b;
        }

        .course-show-menu-hint {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.45rem 0.7rem;
            border-radius: 9999px;
            background: #eef2ff;
            color: #4338ca;
            font-size: 0.84rem;
            font-weight: 600;
        }

        .course-show-menu-toolbar {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: flex-end;
            gap: 0.75rem;
        }

        .course-show-save-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 2.5rem;
            padding: 0.55rem 1rem;
            border-radius: 0.85rem;
            border: 1px solid #4f46e5;
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            color: #ffffff;
            font-size: 0.9rem;
            font-weight: 700;
            box-shadow: 0 14px 24px -18px rgba(79, 70, 229, 0.85);
            transition: opacity 0.2s ease, transform 0.2s ease, box-shadow 0.2s ease;
        }

        .course-show-save-btn[disabled] {
            opacity: 0.55;
            cursor: wait;
        }

        .course-show-save-status {
            min-height: 1.4rem;
            color: #4338ca;
            font-size: 0.84rem;
            font-weight: 600;
            transition: opacity 0.25s ease;
        }

        .course-show-save-status.is-fading {
            opacity: 0;
        }

        .course-show-save-status.is-success {
            color: #15803d;
        }

        .course-show-save-status.is-error {
            color: #b91c1c;
        }

        .course-show-menu-list {
            display: flex;
            flex-direction: column;
            gap: 0;
        }

        .course-show-menu-row {
            display: flex;
            align-items: center;
            gap: 0;
            border-bottom: 1px solid #f1f5f9;
            background: #ffffff;
            transition: background 0.15s ease, opacity 0.15s ease, transform 0.15s ease;
        }

        .course-show-menu-row:first-child {
            border-radius: 0.75rem 0.75rem 0 0;
        }

        .course-show-menu-row:last-child {
            border-bottom: none;
            border-radius: 0 0 0.75rem 0.75rem;
        }

        .course-show-menu-row:hover {
            background: #fafbff;
        }

        .course-show-menu-row.dragging {
            opacity: 0.38;
            transform: scaleX(0.72);
            transform-origin: left center;
        }

        .course-show-menu-row.is-hidden {
            background: #f8fafc;
        }

        .course-show-menu-row.is-hidden .course-show-link,
        .course-show-menu-row.is-hidden .course-show-type-text {
            color: #64748b;
        }

        .course-show-menu-col-order {
            flex: 0 0 7rem;
            padding: 0.45rem 0.75rem;
        }

        .course-show-menu-col-type {
            flex: 0 0 13rem;
            padding: 0.45rem 0.75rem;
        }

        .course-show-menu-col-title {
            flex: 1 1 0;
            min-width: 0;
            padding: 0.45rem 0.75rem;
        }

        .course-show-menu-col-state {
            flex: 0 0 6rem;
            padding: 0.45rem 0.75rem;
            text-align: center;
        }

        .course-show-menu-col-action {
            flex: 0 0 5rem;
            padding: 0.45rem 0.75rem;
            text-align: center;
        }

        .course-show-menu-header {
            display: flex;
            align-items: center;
            gap: 0;
            padding: 0.3rem 0;
            border-bottom: 1px solid #e2e8f0;
            background: #f8fafc;
            border-radius: 0.75rem 0.75rem 0 0;
            color: #64748b;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .course-show-drag-proxy {
            position: fixed;
            left: 0;
            top: 0;
            pointer-events: none;
            z-index: 9999;
            opacity: 0.92;
            transform: translate3d(-9999px, -9999px, 0);
            box-shadow: 0 12px 32px -16px rgba(15, 23, 42, 0.28);
            border-radius: 0.75rem;
            border: 1px solid #c7d2fe;
            background: #ffffff;
            transition: transform 0.03s linear;
        }

        .course-show-placeholder {
            height: 2px;
            background: linear-gradient(90deg, #6366f1 0%, #8b5cf6 100%);
            border-radius: 9999px;
            box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.15);
            margin: 0;
        }

        .course-show-order-wrap {
            display: flex;
            align-items: center;
            gap: 0.55rem;
        }

        .course-show-drag {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 1.6rem;
            height: 1.6rem;
            border-radius: 0.5rem;
            border: 1px solid #dbe4ff;
            background: #f8faff;
            color: #64748b;
            cursor: move;
            font-size: 0.85rem;
            user-select: none;
            touch-action: none;
        }

        .course-show-drag:hover {
            border-color: #a5b4fc;
            background: #eef2ff;
            color: #4338ca;
        }

        .course-show-menu-list.is-sorting .course-show-drag {
            cursor: grabbing;
        }

        .course-show-order-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 1.6rem;
            height: 1.6rem;
            padding: 0 0.4rem;
            border-radius: 9999px;
            background: #e0e7ff;
            color: #3730a3;
            font-weight: 700;
            font-size: 0.8rem;
        }

        .course-show-type-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.55rem;
            max-width: 100%;
            padding: 0.3rem 0.65rem;
            border-radius: 9999px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
        }

        .course-show-type-icon {
            width: 1.4rem;
            height: 1.4rem;
            object-fit: contain;
            flex-shrink: 0;
        }

        .course-show-type-text {
            font-size: 0.88rem;
            font-weight: 600;
            color: #334155;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .course-show-link {
            display: inline-flex;
            align-items: center;
            gap: 0.55rem;
            color: #0f172a;
            font-size: 0.98rem;
            font-weight: 700;
        }

        .course-show-link:before {
            content: "";
            width: 0.55rem;
            height: 0.55rem;
            border-radius: 9999px;
            background: #6366f1;
            box-shadow: 0 0 0 5px rgba(99, 102, 241, 0.12);
            flex-shrink: 0;
        }

        .course-show-menu-wrap {
            overflow-x: auto;
        }

        .course-show-state-btn,
        .course-show-danger-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 2rem;
            min-height: 1.7rem;
            padding: 0.22rem 0.55rem;
            border-radius: 0.6rem;
            border: 1px solid #dbe4ff;
            background: #ffffff;
            color: #334155;
            font-size: 0.8rem;
            font-weight: 700;
        }

        .course-show-state-btn:hover,
        .course-show-danger-btn:hover {
            border-color: #a5b4fc;
            background: #f8faff;
        }

        .course-show-state-btn {
            min-width: 4rem;
            color: #166534;
            background: #ecfdf5;
            border-color: #bbf7d0;
        }

        .course-show-state-btn.is-off {
            color: #92400e;
            background: #fffbeb;
            border-color: #fde68a;
        }

        .course-show-danger-btn {
            min-width: 3rem;
            color: #b91c1c;
            background: #fff1f2;
            border-color: #fecdd3;
        }

        .course-show-content {
            line-height: 1.8;
            color: #1e293b;
        }

        .course-show-content.course-show-preview-content {
            background: transparent;
        }

        .course-show-content img,
        .course-show-content table,
        .course-show-content iframe,
        .course-show-content video {
            max-width: 100%;
        }

        .course-show-hidden {
            display: none;
        }

        @media (max-width: 1200px) {
            .course-show-tool-grid {
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }
        }

        @media (max-width: 980px) {
            .course-show-tool-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .course-show-hero-top {
                grid-template-columns: 1fr;
            }

            .course-show-hero-actions {
                width: 100%;
                justify-content: flex-start;
            }

            .course-show-banner-dialog-body {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .course-show-tool-grid {
                grid-template-columns: 1fr;
            }

            .course-show-hero {
                padding: 1.2rem;
            }

            .course-show-hero-header {
                padding-bottom: 1.15rem;
            }

            .course-show-hero-top {
                grid-template-columns: 1fr;
            }

            .course-show-hero-nav {
                gap: 0.5rem;
            }

            .course-show-back-link,
            .course-show-hero-kicker {
                font-size: 0.76rem;
            }

            .course-show-title {
                font-size: 1.55rem;
            }

            .course-show-meta {
                gap: 0.45rem;
            }

            .course-show-meta-chip {
                min-height: 2rem;
                padding: 0.38rem 0.7rem;
                font-size: 0.8rem;
            }

            .course-show-meta-chip-icon {
                width: 1rem;
                height: 1rem;
            }

            .course-show-hero-actions {
                justify-content: flex-start;
            }

            .course-show-preview-head,
            .course-show-preview-content {
                padding: 1rem;
            }

            .course-show-tool-readonly-note {
                font-size: 0.82rem;
            }

            .course-show-banner-modal {
                padding: 0.75rem;
            }

            .course-show-banner-dialog-head,
            .course-show-banner-dialog-body,
            .course-show-banner-dialog-foot {
                padding-left: 1rem;
                padding-right: 1rem;
            }

            .course-show-banner-dialog-foot {
                align-items: flex-start;
                flex-direction: column;
            }

            .course-show-banner-actions {
                width: 100%;
                justify-content: stretch;
            }

            .course-show-banner-btn {
                flex: 1 1 auto;
            }

            .course-show-order-wrap {
                flex-wrap: wrap;
            }

            .course-show-menu-toolbar {
                justify-content: flex-start;
            }

            .course-show-menu-wrap {
                overflow-x: auto;
            }

            .course-show-type-cell {
                width: 10rem;
            }

            .course-show-type-badge {
                gap: 0.55rem;
                padding: 0.5rem 0.7rem;
            }

            .course-show-link {
                font-size: 0.92rem;
            }

            .course-show-state-btn,
            .course-show-danger-btn {
                min-height: 1.9rem;
                padding: 0.32rem 0.58rem;
                font-size: 0.8rem;
            }
        }
    </style>

    <div class="course-show-page">
        <div class="course-show-shell">
            <section id="HeroSection" runat="server" class="course-show-hero">
                <div class="course-show-hero-overlay" aria-hidden="true"></div>
                <div class="course-show-hero-content">
                    <div class="course-show-hero-header">
                        <div class="course-show-hero-top">
                            <div class="course-show-hero-copy">
                                <div class="course-show-hero-nav">
                                    <asp:LinkButton ID="LinkBtnReturn" runat="server" OnClick="LinkBtnReturn_Click" CssClass="course-show-back-link" title="返回列表"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M19 12H5"></path><path d="M12 19l-7-7 7-7"></path></svg>返回列表</asp:LinkButton>
                                    <span class="course-show-hero-kicker">学案详情</span>
                                </div>
                                <div class="course-show-title-wrap">
                                    <asp:Label ID="LabelCtitle" runat="server" CssClass="course-show-title"></asp:Label>
                                </div>
                                <div class="course-show-meta">
                                    <span class="course-show-meta-chip">
                                        <span class="course-show-meta-chip-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="3" y="4" width="18" height="18" rx="2"></rect><path d="M16 2v4"></path><path d="M8 2v4"></path><path d="M3 10h18"></path></svg></span>
                                        <span class="course-show-meta-chip-label">日期</span>
                                        <span class="course-show-meta-chip-value"><asp:Label ID="LabelCdate" runat="server"></asp:Label></span>
                                    </span>
                                    <span class="course-show-meta-chip">
                                        <span class="course-show-meta-chip-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M4 20h16a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-7.93a2 2 0 0 1-1.66-.9l-.82-1.2A2 2 0 0 0 7.93 3H4a2 2 0 0 0-2 2v13c0 1.1.9 2 2 2z"></path></svg></span>
                                        <span class="course-show-meta-chip-label">分类</span>
                                        <span class="course-show-meta-chip-value"><asp:Label ID="LabelCclass" runat="server"></asp:Label></span>
                                    </span>
                                    <span class="course-show-meta-chip">
                                        <span class="course-show-meta-chip-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle></svg></span>
                                        <span class="course-show-meta-chip-label">年级</span>
                                        <span class="course-show-meta-chip-value"><asp:Label ID="LabelCobj" runat="server"></asp:Label></span>
                                    </span>
                                    <span class="course-show-meta-chip">
                                        <span class="course-show-meta-chip-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="12" r="10"></circle><path d="M12 6v6l4 2"></path></svg></span>
                                        <span class="course-show-meta-chip-label">学期</span>
                                        <span class="course-show-meta-chip-value">第 <asp:Label ID="LabelCterm" runat="server"></asp:Label> 学期</span>
                                    </span>
                                    <span class="course-show-meta-chip">
                                        <span class="course-show-meta-chip-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg></span>
                                        <span class="course-show-meta-chip-label">课节</span>
                                        <span class="course-show-meta-chip-value">第 <asp:Label ID="LabelCks" runat="server"></asp:Label> 课</span>
                                    </span>
                                </div>
                                <span id="ReadonlyNote" class="course-show-tool-readonly-note" runat="server" hidden="hidden">当前为旧版学案视图，部分新增与编辑入口已按原逻辑禁用</span>
                            </div>
                            <div class="course-show-hero-actions">
                                <a id="HeroEditLink" runat="server" class="course-show-hero-edit" title="编辑横幅" aria-label="编辑横幅">
                                    <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 5H7a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-5"></path><path d="M16.5 4.5a2.12 2.12 0 1 1 3 3L12 15l-4 1 1-4 7.5-7.5z"></path></svg>
                                </a>
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/edit.gif" ToolTip="点击修改" OnClick="BtnEdit_Click" CssClass="course-show-hidden course-show-edit-btn" AlternateText="编辑学案" />
                            </div>
                        </div>
                    </div>
                    <section class="course-show-preview-panel">
                        <div class="course-show-preview-head">
                            <div>
                                <h2 class="course-show-preview-title">学案预览</h2>
                                <p class="course-show-preview-desc">下方内容继续沿用原有学案正文输出，只优化首屏阅读层次。</p>
                            </div>
                        </div>
                        <div id="Ccontent" class="course-show-content course-show-preview-content" runat="server"></div>
                    </section>
                    <div class="course-show-hidden" aria-hidden="true">
                        <asp:Image ID="Imagebanner" runat="server" ToolTip="横幅图片" />
                        <span id="BannerEmpty" runat="server">当前学案未设置横幅图片</span>
                    </div>
                </div>
            </section>

            <div id="BannerModal" class="course-show-banner-modal" aria-hidden="true">
                <div class="course-show-banner-dialog" role="dialog" aria-modal="true" aria-labelledby="BannerModalTitle">
                    <div class="course-show-banner-dialog-head">
                        <div>
                            <h2 id="BannerModalTitle" class="course-show-banner-dialog-title">编辑课程横幅</h2>
                            <p class="course-show-banner-dialog-desc">拖入图片或从本地选择新封面，预览确认后直接更新当前学案横幅。</p>
                        </div>
                        <button id="BannerModalClose" type="button" class="course-show-banner-close" aria-label="关闭弹窗">
                            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6 6l12 12"></path><path d="M18 6l-12 12"></path></svg>
                        </button>
                    </div>
                    <div class="course-show-banner-dialog-body">
                        <div class="course-show-banner-upload">
                            <div id="BannerDropzone" class="course-show-banner-dropzone">
                                <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 16V7"></path><path d="M8.5 10.5L12 7l3.5 3.5"></path><path d="M5 17v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1"></path><rect x="3" y="3" width="18" height="18" rx="3"></rect></svg>
                                <p class="course-show-banner-drop-title">拖动图片到这里上传横幅</p>
                                <p class="course-show-banner-drop-desc">支持 png、jpg、jpeg、gif、webp，建议使用横向大图，大小不超过 5MB。</p>
                                <label for="BannerFileInput" class="course-show-banner-browse">选择图片</label>
                                <input id="BannerFileInput" type="file" class="course-show-banner-file" accept="image/png,image/jpeg,image/jpg,image/gif,image/webp" />
                            </div>
                            <div class="course-show-banner-meta">
                                <span class="course-show-banner-chip">拖拽上传</span>
                                <span class="course-show-banner-chip">粘贴图片</span>
                                <span class="course-show-banner-chip">实时预览</span>
                                <span class="course-show-banner-chip">无刷新保存</span>
                            </div>
                            <div id="BannerUploadProgress" class="course-show-banner-progress" hidden="hidden">
                                <div id="BannerUploadProgressBar" class="course-show-banner-progress-bar"></div>
                            </div>
                            <div id="BannerUploadStatus" class="course-show-banner-status"></div>
                        </div>
                        <div class="course-show-banner-preview-card">
                            <div class="course-show-banner-preview-head">
                                <span id="BannerCurrentState" class="course-show-banner-current">当前封面：默认样式</span>
                                <p class="course-show-banner-preview-title">封面预览</p>
                                <p class="course-show-banner-preview-desc">保存后将立即替换顶部课程封面，并保持当前页面停留。</p>
                            </div>
                            <div id="BannerPreviewStage" class="course-show-banner-stage">
                                <div id="BannerPreviewEmpty" class="course-show-banner-stage-empty">当前还没有选择新的横幅图片</div>
                                <div class="course-show-banner-stage-copy">
                                    <strong><asp:Label ID="LabelBannerPreviewTitle" runat="server"></asp:Label></strong>
                                    <span>新的课程横幅将应用到当前学案首页封面</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="course-show-banner-dialog-foot">
                        <div class="course-show-banner-foot-note">上传成功后会立即更新课程横幅，并同步刷新当前页面顶部封面背景。</div>
                        <div class="course-show-banner-actions">
                            <button id="BannerModalCancel" type="button" class="course-show-banner-btn">取消</button>
                            <button id="BannerUploadButton" type="button" class="course-show-banner-btn primary">保存横幅</button>
                        </div>
                    </div>
                </div>
            </div>

            <section class="course-show-tools">
                <div class="course-show-tools-head">
                    <div>
                        <h2 class="course-show-section-title">添加课堂内容</h2>
                        <p class="course-show-section-desc">所有入口仍然对应原有新增页面与跳转参数，仅升级为图标化操作卡片。</p>
                    </div>
                </div>

                <div class="course-show-tool-grid">
                    <asp:LinkButton ID="LinkBtnAdd" runat="server" OnClick="LinkBtnAdd_Click" CssClass="course-show-tool course-show-tool-mission" title="学习活动">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 3l7 4v5c0 5-3.5 7.5-7 9-3.5-1.5-7-4-7-9V7l7-4z"></path><path d="M9.5 12l1.8 1.8 3.7-4.3"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">添加活动</span><span class="course-show-tool-subtitle">学习活动 / 任务</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnAddTopic" runat="server" OnClick="LinkBtnAddTopic_Click" CssClass="course-show-tool course-show-tool-topic" title="课堂讨论板">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M4 6.5a3.5 3.5 0 0 1 3.5-3.5h9A3.5 3.5 0 0 1 20 6.5v5A3.5 3.5 0 0 1 16.5 15H10l-4 4v-4.5A3.5 3.5 0 0 1 4 11.5z"></path><path d="M8 8h8"></path><path d="M8 11h5"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">添加讨论</span><span class="course-show-tool-subtitle">讨论区 / 互动</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonAddExam" runat="server" OnClick="LinkBtnAddExam_Click" CssClass="course-show-tool course-show-tool-exam" title="课堂测验">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8 3h8"></path><path d="M9 3v4"></path><path d="M15 3v4"></path><rect x="4" y="7" width="16" height="14" rx="2"></rect><path d="M8 12h8"></path><path d="M8 16h5"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">添加测验</span><span class="course-show-tool-subtitle">课堂测验 / 反馈</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnAddTxtForm" runat="server" OnClick="LinkBtnAddTxtForm_Click" CssClass="course-show-tool course-show-tool-form" title="表格填写">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="4" y="3" width="16" height="18" rx="2"></rect><path d="M8 8h8"></path><path d="M8 12h8"></path><path d="M8 16h5"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">添加填表</span><span class="course-show-tool-subtitle">表单 / 采集</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnProgram" runat="server" OnClick="LinkBtnProgram_Click" CssClass="course-show-tool course-show-tool-block" title="Scratch积木编程">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8 4h4a2 2 0 0 1 2 2v1h2a2 2 0 0 1 2 2v3h-3a2 2 0 1 0 0 4h3v3a2 2 0 0 1-2 2h-4v-3H8a2 2 0 0 1-2-2v-4h3a2 2 0 1 0 0-4H6V6a2 2 0 0 1 2-2z"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">积木编程</span><span class="course-show-tool-subtitle">Scratch / Block</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnPython" runat="server" OnClick="LinkBtnPython_Click" CssClass="course-show-tool course-show-tool-python" title="在线Python编程">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M9 4h4a3 3 0 0 1 3 3v2H9a2 2 0 0 0-2 2v2"></path><path d="M15 20h-4a3 3 0 0 1-3-3v-2h7a2 2 0 0 0 2-2v-2"></path><path d="M9 6h.01"></path><path d="M15 18h.01"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">Python编程</span><span class="course-show-tool-subtitle">代码 / 编写</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkBtnConsole" runat="server" OnClick="LinkBtnConsole_Click" CssClass="course-show-tool course-show-tool-console" title="在线Python测评">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="3" y="4" width="18" height="14" rx="2"></rect><path d="M7 8l3 3-3 3"></path><path d="M13 14h4"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">Python测评</span><span class="course-show-tool-subtitle">自动评测</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonGraph" runat="server" OnClick="LinkBtnGraph_Click" CssClass="course-show-tool course-show-tool-graph" title="在线流程图">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="4" y="4" width="6" height="4" rx="1"></rect><rect x="14" y="10" width="6" height="4" rx="1"></rect><rect x="4" y="16" width="6" height="4" rx="1"></rect><path d="M10 6h4"></path><path d="M17 10V8H7v8"></path><path d="M10 18h4"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">流程图</span><span class="course-show-tool-subtitle">图形化表达</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonPixel" runat="server" OnClick="LinkButtonPixel_Click" CssClass="course-show-tool course-show-tool-pixel" title="在线应用">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M7 4h3v3H7z"></path><path d="M11 4h3v3h-3z"></path><path d="M15 4h3v3h-3z"></path><path d="M7 8h3v3H7z"></path><path d="M11 8h3v3h-3z"></path><path d="M15 8h3v3h-3z"></path><path d="M7 12h3v3H7z"></path><path d="M11 12h3v3h-3z"></path><path d="M15 12h3v3h-3z"></path><path d="M11 16h3v3h-3z"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">主题应用</span><span class="course-show-tool-subtitle">主题实验 / 创作</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonHtml" runat="server" OnClick="LinkButtonHtml_Click" CssClass="course-show-tool course-show-tool-html" title="单网页设计">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8 9l-3 3 3 3"></path><path d="M16 9l3 3-3 3"></path><path d="M14 5l-4 14"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">Html网页</span><span class="course-show-tool-subtitle">网页设计</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonKm" runat="server" OnClick="LinkButtonKm_Click" CssClass="course-show-tool course-show-tool-mind" title="在线思维导图">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="12" r="2.5"></circle><path d="M12 4v3"></path><path d="M12 17v3"></path><path d="M4 12h3"></path><path d="M17 12h3"></path><path d="M6.8 6.8l2.1 2.1"></path><path d="M15.1 15.1l2.1 2.1"></path><path d="M17.2 6.8l-2.1 2.1"></path><path d="M8.9 15.1l-2.1 2.1"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">思维导图</span><span class="course-show-tool-subtitle">脑图 / 梳理</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonExcel" runat="server" OnClick="LinkButtonExcel_Click" CssClass="course-show-tool course-show-tool-sheet" title="在线表格">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="4" y="4" width="16" height="16" rx="2"></rect><path d="M9 4v16"></path><path d="M15 4v16"></path><path d="M4 9h16"></path><path d="M4 15h16"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">在线表格</span><span class="course-show-tool-subtitle">数据 / 表格</span></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonware" runat="server" OnClick="LinkButtonware_Click" CssClass="course-show-tool course-show-tool-ware" title="嵌入网页小课件">
                        <span class="course-show-tool-icon"><svg viewBox="0 0 24 24" aria-hidden="true"><rect x="3" y="5" width="18" height="12" rx="2"></rect><path d="M8 21h8"></path><path d="M12 17v4"></path><path d="M7 9h10"></path><path d="M7 13h6"></path></svg></span>
                        <span class="course-show-tool-copy"><span class="course-show-tool-title">网页课件</span><span class="course-show-tool-subtitle">嵌入课件</span></span>
                    </asp:LinkButton>
                </div>
            </section>

            <section class="course-show-menu-panel">
                <div class="course-show-menu-head">
                    <div>
                        <h2 class="course-show-section-title">导航栏目</h2>
                        <p class="course-show-section-desc">保留原有跳转、发布与删除逻辑，并新增拖拽排序能力。</p>
                    </div>
                    <div class="course-show-menu-toolbar">
                        <span class="course-show-menu-hint">可拖动左侧手柄调整顺序</span>
                        <button id="MenuSortSaveButton" type="button" class="course-show-save-btn" style="display:none;">保存排序</button>
                    </div>
                </div>

                <asp:HiddenField ID="HiddenSortOrder" runat="server" />
                <asp:HiddenField ID="HiddenCourseId" runat="server" />
                <asp:HiddenField ID="HiddenBannerUrl" runat="server" />
                <asp:Button ID="BtnApplySort" runat="server" Text="apply sort" CssClass="course-show-hidden" OnClick="BtnApplySort_Click" />
                <div id="MenuSortStatus" class="course-show-save-status"></div>

                <div class="course-show-menu-wrap">
                    <div class="course-show-menu-header">
                        <div class="course-show-menu-col-order">顺序</div>
                        <div class="course-show-menu-col-type">类型</div>
                        <div class="course-show-menu-col-title">导航栏目</div>
                        <div class="course-show-menu-col-state">发布</div>
                        <div class="course-show-menu-col-action">操作</div>
                    </div>
                    <div id="MenuList" class="course-show-menu-list">
                        <asp:Repeater ID="RptListMenu" runat="server" OnItemDataBound="RptListMenu_ItemDataBound" OnItemCommand="RptListMenu_ItemCommand">
                            <ItemTemplate>
                                <div id="MenuRow" runat="server" class="course-show-menu-row" data-lid='<%# Eval("Lid") %>'>
                                    <div class="course-show-menu-col-order">
                                        <div class="course-show-order-wrap">
                                            <span class="course-show-drag" title="拖动排序">::</span>
                                            <span class="course-show-order-badge"><asp:Label ID="LabelLsort" runat="server" Text='<%# Eval("Lsort") %>'></asp:Label></span>
                                        </div>
                                    </div>
                                    <div class="course-show-menu-col-type">
                                        <span class="course-show-type-badge">
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/images/new_none.gif" CssClass="course-show-type-icon" />
                                            <asp:Label ID="Label4" runat="server" CssClass="course-show-type-text"></asp:Label>
                                        </span>
                                    </div>
                                    <div class="course-show-menu-col-title">
                                        <asp:HyperLink ID="HlLtitle" runat="server" NavigateUrl="" Text='<%# Eval("Ltitle") %>' CssClass="course-show-link"></asp:HyperLink>
                                    </div>
                                    <div class="course-show-menu-col-state">
                                        <asp:LinkButton ID="LinkBtnShow" runat="server" CausesValidation="false" CommandName="P" CommandArgument='<%# Eval("Lid") %>' Text='<%# Eval("lshow") %>' ToolTip="True显示，False隐藏" CssClass="course-show-state-btn"></asp:LinkButton>
                                    </div>
                                    <div class="course-show-menu-col-action">
                                        <asp:LinkButton ID="LinkBtnDel" runat="server" CausesValidation="false" CommandName="D" CommandArgument='<%# Eval("Lid") %>' Text="删除" ToolTip="请认真确定是否删除，不可恢复！" CssClass="course-show-danger-btn"></asp:LinkButton>
                                    </div>
                                    <asp:Label ID="LabelLid" runat="server" Text='<%# Eval("Lid") %>' style="display:none"></asp:Label>
                                    <asp:Label ID="LabelLxid" runat="server" Text='<%# Eval("Lxid") %>' style="display:none"></asp:Label>
                                    <asp:Label ID="LabelLtype" runat="server" Text='<%# Eval("Ltype") %>' style="display:none"></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <script type="text/javascript">
        (function () {
            function initBannerModal() {
                var trigger = document.getElementById('<%= HeroEditLink.ClientID %>');
                var modal = document.getElementById('BannerModal');
                var closeButton = document.getElementById('BannerModalClose');
                var cancelButton = document.getElementById('BannerModalCancel');
                var uploadButton = document.getElementById('BannerUploadButton');
                var dropzone = document.getElementById('BannerDropzone');
                var fileInput = document.getElementById('BannerFileInput');
                var stage = document.getElementById('BannerPreviewStage');
                var empty = document.getElementById('BannerPreviewEmpty');
                var status = document.getElementById('BannerUploadStatus');
                var progress = document.getElementById('BannerUploadProgress');
                var progressBar = document.getElementById('BannerUploadProgressBar');
                var currentState = document.getElementById('BannerCurrentState');
                var hero = document.getElementById('<%= HeroSection.ClientID %>');
                var hiddenBannerUrl = document.getElementById('<%= HiddenBannerUrl.ClientID %>');
                var courseIdField = document.getElementById('<%= HiddenCourseId.ClientID %>');
                var selectedFile = null;
                var localPreviewUrl = '';
                var previewUrl = hiddenBannerUrl ? hiddenBannerUrl.value : '';
                var originalUrl = previewUrl;
                var isUploading = false;

                if (!trigger || !modal || !dropzone || !fileInput || !stage || !uploadButton) {
                    return;
                }

                function setStatus(message, cls) {
                    if (!status) {
                        return;
                    }

                    status.className = 'course-show-banner-status';
                    if (cls) {
                        status.className += ' ' + cls;
                    }
                    status.innerHTML = message || '';
                }

                function setCurrentState(hasBanner, pending) {
                    if (!currentState) {
                        return;
                    }

                    if (pending) {
                        currentState.innerHTML = '当前封面：待上传新图片';
                        return;
                    }

                    currentState.innerHTML = hasBanner ? '当前封面：已设置课程横幅' : '当前封面：默认样式';
                }

                function setProgress(value, visible) {
                    if (!progress || !progressBar) {
                        return;
                    }

                    if (visible) {
                        progress.removeAttribute('hidden');
                    } else {
                        progress.setAttribute('hidden', 'hidden');
                    }

                    progressBar.style.width = Math.max(0, Math.min(100, value || 0)) + '%';
                }

                function setUploadingState(uploading) {
                    isUploading = uploading;
                    uploadButton.disabled = uploading;
                    uploadButton.innerHTML = uploading ? '正在上传...' : '重新上传';
                    if (!uploading) {
                        setProgress(0, false);
                    }
                }

                function pulsePreviewStage() {
                    stage.className = stage.className.replace(/\s?is-refreshing/g, '');
                    stage.offsetWidth;
                    stage.className += ' is-refreshing';
                    window.setTimeout(function () {
                        stage.className = stage.className.replace(/\s?is-refreshing/g, '');
                    }, 460);
                }

                function pulseHero() {
                    if (!hero) {
                        return;
                    }

                    hero.className = hero.className.replace(/\s?is-refreshing/g, '');
                    hero.offsetWidth;
                    hero.className += ' is-refreshing';
                    window.setTimeout(function () {
                        hero.className = hero.className.replace(/\s?is-refreshing/g, '');
                    }, 460);
                }

                function applyStage(url) {
                    previewUrl = url || '';
                    stage.style.backgroundImage = previewUrl ? "url('" + previewUrl.replace(/'/g, "%27") + "')" : '';
                    if (previewUrl) {
                        if (stage.className.indexOf('has-image') === -1) {
                            stage.className += ' has-image';
                        }
                        if (empty) {
                            empty.style.display = 'none';
                        }
                    } else {
                        stage.className = stage.className.replace(/\s?has-image/g, '');
                        if (empty) {
                            empty.style.display = 'flex';
                        }
                    }
                }

                function clearLocalPreview() {
                    if (localPreviewUrl && window.URL && window.URL.revokeObjectURL) {
                        window.URL.revokeObjectURL(localPreviewUrl);
                    }
                    localPreviewUrl = '';
                }

                function applyHero(url) {
                    if (!hero) {
                        return;
                    }

                    if (url) {
                        if (hero.className.indexOf('has-banner') === -1) {
                            hero.className += ' has-banner';
                        }
                        hero.style.backgroundImage = "url('" + url.replace(/'/g, "%27") + "')";
                    } else {
                        hero.className = hero.className.replace(/\s?has-banner/g, '');
                        hero.style.backgroundImage = '';
                    }

                    pulseHero();
                }

                function uploadSelectedBanner() {
                    var cid = courseIdField ? courseIdField.value : '';
                    var formData;

                    if (isUploading) {
                        return false;
                    }

                    if (!selectedFile) {
                        setStatus('请先选择一张新的横幅图片', 'is-error');
                        return false;
                    }

                    if (!cid) {
                        setStatus('缺少课程编号，无法上传横幅', 'is-error');
                        return false;
                    }

                    if (!window.FormData || !window.jQuery || !jQuery.ajax) {
                        setStatus('当前页面缺少上传能力支持', 'is-error');
                        return false;
                    }

                    formData = new FormData();
                    formData.append('action', 'upload');
                    formData.append('cid', cid);
                    formData.append('banner', selectedFile);

                    setUploadingState(true);
                    setProgress(8, true);
                    setStatus('正在上传并更新横幅...', '');

                    jQuery.ajax({
                        url: 'coursebanner.ashx',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        dataType: 'json',
                        xhr: function () {
                            var xhr = jQuery.ajaxSettings.xhr();
                            if (xhr && xhr.upload) {
                                xhr.upload.onprogress = function (ev) {
                                    if (ev.lengthComputable) {
                                        setProgress(Math.round((ev.loaded / ev.total) * 100), true);
                                    }
                                };
                            }
                            return xhr;
                        },
                        success: function (response) {
                            setUploadingState(false);
                            if (!response || response.success !== true || !response.bannerUrl) {
                                setStatus(response && response.message ? response.message : '横幅更新失败，请重试', 'is-error');
                                return;
                            }

                            originalUrl = response.bannerUrl;
                            selectedFile = null;
                            clearLocalPreview();
                            if (hiddenBannerUrl) {
                                hiddenBannerUrl.value = response.bannerUrl;
                            }
                            fileInput.value = '';
                            applyStage(response.bannerUrl);
                            applyHero(response.bannerUrl);
                            setCurrentState(true, false);
                            setStatus(response.message || '横幅已更新', 'is-success');
                            window.setTimeout(function () {
                                closeModal();
                            }, 700);
                        },
                        error: function () {
                            setUploadingState(false);
                            setStatus('上传失败，请检查网络后重试', 'is-error');
                        }
                    });

                    return false;
                }

                function validateAndPreview(file) {
                    var type = (file.type || '').toLowerCase();
                    var objectUrl;
                    var img;

                    if (type.indexOf('image/') !== 0) {
                        setStatus('请选择图片文件', 'is-error');
                        return;
                    }

                    if (file.size > 5 * 1024 * 1024) {
                        setStatus('图片大小不能超过 5MB', 'is-error');
                        return;
                    }

                    if (!window.URL || !window.URL.createObjectURL) {
                        selectedFile = file;
                        setStatus('已选择新图片，正在上传横幅...', '');
                        uploadSelectedBanner();
                        return;
                    }

                    clearLocalPreview();
                    objectUrl = window.URL.createObjectURL(file);
                    localPreviewUrl = objectUrl;
                    img = new Image();
                    img.onload = function () {
                        var width = img.width || 0;
                        var height = img.height || 0;
                        var ratio = height ? (width / height) : 0;
                        var tips = [];

                        if (width < 960 || height < 320) {
                            clearLocalPreview();
                            setStatus('建议上传更大的横幅图片，至少 960 x 320', 'is-error');
                            return;
                        }

                        if (ratio < 2.1) {
                            tips.push('当前图片偏窄，建议使用更宽的横向封面');
                        }

                        if (ratio > 4.6) {
                            tips.push('当前图片过宽，封面展示时可能被裁切');
                        }

                        selectedFile = file;
                        applyStage(objectUrl);
                        pulsePreviewStage();
                        setCurrentState(true, true);
                        setStatus(tips.length ? tips.join('；') + '，正在上传横幅...' : '图片校验通过，正在上传横幅...', tips.length ? '' : '');
                        uploadSelectedBanner();
                    };

                    img.onerror = function () {
                        clearLocalPreview();
                        setStatus('图片读取失败，请重新选择', 'is-error');
                    };

                    img.src = objectUrl;
                }

                function openModal() {
                    selectedFile = null;
                    fileInput.value = '';
                    modal.className += modal.className.indexOf('is-open') === -1 ? ' is-open' : '';
                    modal.setAttribute('aria-hidden', 'false');
                    setStatus('', '');
                    setCurrentState(!!originalUrl, false);
                    applyStage(originalUrl);
                }

                function closeModal() {
                    modal.className = modal.className.replace(/\s?is-open/g, '');
                    modal.setAttribute('aria-hidden', 'true');
                    dropzone.className = dropzone.className.replace(/\s?is-dragover/g, '');
                    clearLocalPreview();
                    selectedFile = null;
                    if (!selectedFile) {
                        applyStage(originalUrl);
                    }
                }

                function pickFile(file) {
                    if (!file) {
                        return;
                    }

                    validateAndPreview(file);
                }

                trigger.onclick = function () {
                    if (trigger.getAttribute('aria-disabled') === 'true') {
                        return false;
                    }
                    openModal();
                    return false;
                };

                if (closeButton) {
                    closeButton.onclick = function () {
                        closeModal();
                        return false;
                    };
                }

                if (cancelButton) {
                    cancelButton.onclick = function () {
                        closeModal();
                        return false;
                    };
                }

                modal.onclick = function (ev) {
                    ev = ev || window.event;
                    if (ev.target === modal) {
                        closeModal();
                    }
                };

                if (document.addEventListener) {
                    document.addEventListener('keydown', function (ev) {
                        ev = ev || window.event;
                        if ((ev.key === 'Escape' || ev.keyCode === 27) && modal.className.indexOf('is-open') > -1) {
                            closeModal();
                        }
                    }, false);
                }

                fileInput.onchange = function () {
                    if (fileInput.files && fileInput.files.length) {
                        pickFile(fileInput.files[0]);
                    }
                };

                if (modal.addEventListener) {
                    modal.addEventListener('paste', function (ev) {
                        var items = ev.clipboardData && ev.clipboardData.items ? ev.clipboardData.items : null;
                        var i;
                        if (!items) {
                            return;
                        }

                        for (i = 0; i < items.length; i++) {
                            if (items[i].kind === 'file' && items[i].type.indexOf('image/') === 0) {
                                pickFile(items[i].getAsFile());
                                if (ev.preventDefault) {
                                    ev.preventDefault();
                                }
                                return;
                            }
                        }
                    }, false);
                }

                function stopEvent(ev) {
                    if (ev.preventDefault) {
                        ev.preventDefault();
                    }
                    if (ev.stopPropagation) {
                        ev.stopPropagation();
                    }
                }

                dropzone.ondragenter = dropzone.ondragover = function (ev) {
                    stopEvent(ev);
                    if (dropzone.className.indexOf('is-dragover') === -1) {
                        dropzone.className += ' is-dragover';
                    }
                    return false;
                };

                dropzone.ondragleave = function (ev) {
                    stopEvent(ev);
                    dropzone.className = dropzone.className.replace(/\s?is-dragover/g, '');
                    return false;
                };

                dropzone.ondrop = function (ev) {
                    stopEvent(ev);
                    dropzone.className = dropzone.className.replace(/\s?is-dragover/g, '');
                    var files = ev.dataTransfer ? ev.dataTransfer.files : null;
                    if (files && files.length) {
                        pickFile(files[0]);
                    }
                    return false;
                };

                uploadButton.onclick = function () {
                    return uploadSelectedBanner();
                };

                applyStage(originalUrl);
                setCurrentState(!!originalUrl, false);
            }

            function initDragSort() {
                var list = document.getElementById('MenuList');
                if (!list) { return; }

                var activeRow = null;
                var dragProxy = null;
                var placeholder = null;
                var dragOffsetY = 0;
                var startOrder = '';
                var lastClientY = 0;
                var rafId = 0;
                var moveHandler = null;
                var endHandler = null;
                var currentOrderValue = '';
                var isDirty = false;
                var isSaving = false;
                var saveButton = document.getElementById('MenuSortSaveButton');
                var statusNode = document.getElementById('MenuSortStatus');
                var hiddenOrder = document.getElementById('<%= HiddenSortOrder.ClientID %>');
                var courseIdField = document.getElementById('<%= HiddenCourseId.ClientID %>');
                var saveButtonDefaultText = saveButton ? (saveButton.innerHTML || '保存排序') : '保存排序';
                var statusTimer = 0;

                function getRows() {
                    return Array.prototype.slice.call(list.children).filter(function (el) {
                        return el.getAttribute && el.getAttribute('data-lid');
                    });
                }

                function getOrder() {
                    return getRows().map(function (r) { return r.getAttribute('data-lid'); });
                }

                function setStatus(message, statusClass) {
                    if (!statusNode) { return; }
                    if (statusTimer) { window.clearTimeout(statusTimer); statusTimer = 0; }
                    statusNode.className = 'course-show-save-status' + (statusClass ? ' ' + statusClass : '');
                    statusNode.innerHTML = message || '';
                    if (statusClass === 'is-success' && message) {
                        statusTimer = window.setTimeout(function () {
                            statusNode.className = 'course-show-save-status is-success is-fading';
                            window.setTimeout(function () {
                                if (!isDirty) { statusNode.className = 'course-show-save-status'; statusNode.innerHTML = ''; }
                            }, 280);
                        }, 1600);
                    }
                }

                function setSaveButtonState(saving) {
                    if (!saveButton) { return; }
                    saveButton.disabled = saving;
                    saveButton.innerHTML = saving ? '保存中...' : saveButtonDefaultText;
                }

                function setDirtyState(dirty) {
                    isDirty = dirty;
                    currentOrderValue = getOrder().join(',');
                    if (hiddenOrder) { hiddenOrder.value = currentOrderValue; }
                    if (saveButton) { saveButton.style.display = dirty ? 'inline-flex' : 'none'; setSaveButtonState(false); }
                    if (!dirty) { setStatus('', ''); } else { setStatus('顺序已调整，点击保存后生效', ''); }
                }

                function updateSortBadges() {
                    getRows().forEach(function (row, i) {
                        var label = row.querySelector('[id$="LabelLsort"]');
                        if (label) { label.textContent = String(i + 1); }
                    });
                }

                function removeProxy() {
                    if (dragProxy && dragProxy.parentNode) { dragProxy.parentNode.removeChild(dragProxy); }
                    dragProxy = null;
                }

                function removePlaceholder() {
                    if (placeholder && placeholder.parentNode) { placeholder.parentNode.removeChild(placeholder); }
                    placeholder = null;
                }

                function createProxy(row) {
                    removeProxy();
                    var rect = row.getBoundingClientRect();
                    var clone = row.cloneNode(true);
                    clone.className = clone.className.replace(/\s?dragging/g, '');
                    clone.style.width = rect.width + 'px';
                    clone.style.boxSizing = 'border-box';
                    var wrapper = document.createElement('div');
                    wrapper.className = 'course-show-drag-proxy';
                    wrapper.style.width = rect.width + 'px';
                    wrapper.appendChild(clone);
                    document.body.appendChild(wrapper);
                    dragProxy = wrapper;
                }

                function createPlaceholder() {
                    removePlaceholder();
                    var el = document.createElement('div');
                    el.className = 'course-show-placeholder';
                    placeholder = el;
                }

                function moveProxy(clientY) {
                    if (!dragProxy || !activeRow) { return; }
                    var rect = activeRow.getBoundingClientRect();
                    dragProxy.style.transform = 'translate3d(' + rect.left + 'px,' + (clientY - dragOffsetY) + 'px,0)';
                }

                function movePlaceholder(clientY) {
                    if (!placeholder || !activeRow) { return; }
                    var rows = getRows().filter(function (r) { return r !== activeRow; });
                    for (var i = 0; i < rows.length; i++) {
                        var rect = rows[i].getBoundingClientRect();
                        if (clientY < rect.top + rect.height / 2) {
                            list.insertBefore(placeholder, rows[i]);
                            return;
                        }
                    }
                    list.appendChild(placeholder);
                }

                function applyRowMove() {
                    if (!activeRow || !placeholder || !placeholder.parentNode) { return; }
                    list.insertBefore(activeRow, placeholder);
                    updateSortBadges();
                }

                function autoScroll(clientY) {
                    var edge = 72, step = 18;
                    if (clientY < edge) { window.scrollBy(0, -step); }
                    else if (clientY > window.innerHeight - edge) { window.scrollBy(0, step); }
                }

                function handlePointerMove(clientY) {
                    lastClientY = clientY;
                    if (rafId) { return; }
                    rafId = window.requestAnimationFrame(function () {
                        rafId = 0;
                        moveProxy(lastClientY);
                        movePlaceholder(lastClientY);
                        applyRowMove();
                        autoScroll(lastClientY);
                    });
                }

                function bindActiveEvents() {
                    if (!moveHandler) {
                        moveHandler = function (ev) {
                            if (!activeRow) { return; }
                            ev = ev || window.event;
                            if (ev.preventDefault && ev.touches) { ev.preventDefault(); }
                            handlePointerMove(getClientY(ev));
                        };
                    }
                    if (!endHandler) { endHandler = function () { finishDrag(); }; }
                    if (document.addEventListener) {
                        document.addEventListener('mousemove', moveHandler, false);
                        document.addEventListener('mouseup', endHandler, false);
                        document.addEventListener('touchmove', moveHandler, false);
                        document.addEventListener('touchend', endHandler, false);
                        document.addEventListener('touchcancel', endHandler, false);
                    }
                }

                function unbindActiveEvents() {
                    if (document.removeEventListener) {
                        if (moveHandler) { document.removeEventListener('mousemove', moveHandler, false); document.removeEventListener('touchmove', moveHandler, false); }
                        if (endHandler) { document.removeEventListener('mouseup', endHandler, false); document.removeEventListener('touchend', endHandler, false); document.removeEventListener('touchcancel', endHandler, false); }
                    }
                }

                function saveSort() {
                    if (!isDirty || isSaving) { return; }
                    var cid = courseIdField ? courseIdField.value : '';
                    var orderValue = currentOrderValue || getOrder().join(',');
                    if (!cid || !orderValue) { setStatus('保存失败，缺少排序数据', 'is-error'); return; }
                    isSaving = true;
                    setSaveButtonState(true);
                    setStatus('正在保存排序...', '');
                    if (!window.jQuery || !jQuery.ajax) {
                        isSaving = false; setSaveButtonState(false); setStatus('保存失败，页面缺少 AJAX 支持', 'is-error'); return;
                    }
                    jQuery.ajax({
                        type: 'POST', url: 'courseshow.aspx/SaveSort',
                        contentType: 'application/json; charset=utf-8', dataType: 'json',
                        data: JSON.stringify({ cid: cid, order: orderValue }),
                        success: function (response) {
                            isSaving = false;
                            var ok = response && response.d === true;
                            setSaveButtonState(false);
                            if (ok) { setDirtyState(false); setStatus('排序已保存', 'is-success'); }
                            else { setStatus('保存失败，请重试', 'is-error'); }
                        },
                        error: function () { isSaving = false; setSaveButtonState(false); setStatus('保存失败，请检查网络后重试', 'is-error'); }
                    });
                }

                function startDrag(row, clientY) {
                    activeRow = row;
                    startOrder = getOrder().join(',');
                    dragOffsetY = Math.max(16, clientY - row.getBoundingClientRect().top);
                    createProxy(row);
                    row.className += ' dragging';
                    createPlaceholder();
                    list.insertBefore(placeholder, row.nextSibling);
                    moveProxy(clientY);
                    bindActiveEvents();
                }

                function finishDrag() {
                    if (!activeRow) { return; }
                    if (rafId) { window.cancelAnimationFrame(rafId); rafId = 0; }
                    activeRow.className = activeRow.className.replace(/\s?dragging/g, '');
                    removeProxy();
                    removePlaceholder();
                    unbindActiveEvents();
                    var currentOrder = getOrder().join(',');
                    if (startOrder && currentOrder && startOrder !== currentOrder) {
                        updateSortBadges();
                        setDirtyState(true);
                    }
                    activeRow = null;
                    startOrder = '';
                }

                function getClientY(ev) {
                    if (typeof ev.clientY === 'number') { return ev.clientY; }
                    if (ev.touches && ev.touches.length) { return ev.touches[0].clientY; }
                    if (ev.changedTouches && ev.changedTouches.length) { return ev.changedTouches[0].clientY; }
                    return 0;
                }

                function bindRow(row) {
                    if (!row || !row.getAttribute('data-lid')) { return; }
                    var handle = row.querySelector('.course-show-drag');
                    if (!handle) { return; }
                    handle.onmousedown = function (ev) {
                        ev = ev || window.event;
                        if (ev.preventDefault) { ev.preventDefault(); }
                        startDrag(row, getClientY(ev));
                        return false;
                    };
                    handle.ontouchstart = function (ev) {
                        ev = ev || window.event;
                        if (ev.preventDefault) { ev.preventDefault(); }
                        startDrag(row, getClientY(ev));
                        return false;
                    };
                }

                getRows().forEach(bindRow);
                updateSortBadges();
                currentOrderValue = getOrder().join(',');
                if (hiddenOrder) { hiddenOrder.value = currentOrderValue; }

                if (saveButton) {
                    saveButton.onclick = function () { saveSort(); return false; };
                }

                if (window.addEventListener) {
                    window.addEventListener('beforeunload', function (ev) {
                        if (!isDirty) { return; }
                        var message = '当前排序尚未保存，离开页面将丢失本次调整。';
                        if (ev) { ev.returnValue = message; }
                        return message;
                    }, false);
                }
            }

            if (window.addEventListener) {
                window.addEventListener('load', initBannerModal, false);
                window.addEventListener('load', initDragSort, false);
            } else if (window.attachEvent) {
                window.attachEvent('onload', initBannerModal);
                window.attachEvent('onload', initDragSort);
            }
        })();
    </script>
</asp:Content>
