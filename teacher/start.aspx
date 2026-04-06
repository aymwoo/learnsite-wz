<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/Teach.master" StylesheetTheme="Teacher" AutoEventWireup="true" CodeFile="start.aspx.cs" Inherits="Teacher_start" ResponseEncoding="utf-8" %>

<%@ Register Assembly="Anthem" Namespace="Anthem" TagPrefix="anthem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <style type="text/css">
        .lesson-start {
            --ls-bg: linear-gradient(180deg, #f8fbff 0%, #f3f7ff 100%);
            --ls-card: rgba(255, 255, 255, 0.96);
            --ls-border: #dbe6f5;
            --ls-border-strong: #bfdbfe;
            --ls-text: #0f172a;
            --ls-muted: #64748b;
            --ls-primary: #2563eb;
            --ls-primary-soft: #dbeafe;
            --ls-success: #16a34a;
            --ls-danger: #dc2626;
            padding: 28px;
            background: var(--ls-bg);
            color: var(--ls-text);
        }

        .lesson-start * {
            box-sizing: border-box;
        }

        .lesson-shell {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .lesson-hero {
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

        .lesson-hero__content {
            position: relative;
            z-index: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 16px;
            align-items: center;
        }

        .lesson-hero__title {
            margin: 0;
            font-size: 28px;
            line-height: 1.15;
            font-weight: 800;
            letter-spacing: -0.03em;
        }

        .lesson-hero__subtitle {
            max-width: 760px;
            margin: 8px 0 0;
            font-size: 14px;
            line-height: 1.8;
            color: rgba(239, 246, 255, 0.88);
        }

        .lesson-grid {
            display: grid;
            gap: 20px;
            grid-template-columns: repeat(12, minmax(0, 1fr));
        }

        .lesson-card {
            min-width: 0;
            border: 1px solid var(--ls-border);
            border-radius: 0.75rem;
            background: var(--ls-card);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.05);
        }

        .lesson-card--span-12 { grid-column: span 12; }
        .lesson-card--span-8 { grid-column: span 8; }
        .lesson-card--span-7 { grid-column: span 7; }
        .lesson-card--span-6 { grid-column: span 6; }
        .lesson-card--span-5 { grid-column: span 5; }
        .lesson-card--span-4 { grid-column: span 4; }

        .lesson-theme--blue { background: linear-gradient(160deg, #ffffff 0%, #f0f7ff 100%); }
        .lesson-theme--blue .lesson-prompt, .lesson-theme--blue .lesson-alert { background: #dbeafe; color: #1e3a8a; border: 1px solid #bfdbfe; border-radius: 0.5rem; }

        .lesson-theme--purple { background: linear-gradient(160deg, #ffffff 0%, #f5f3ff 100%); }
        .lesson-theme--purple .lesson-prompt, .lesson-theme--purple .lesson-alert { background: #ede9fe; color: #4c1d95; border: 1px solid #ddd6fe; border-radius: 0.5rem; }

        .lesson-theme--orange { background: linear-gradient(160deg, #ffffff 0%, #fffbeb 100%); }
        .lesson-theme--orange .lesson-prompt, .lesson-theme--orange .lesson-alert { background: #ffedd5; color: #7c2d12; border: 1px solid #fed7aa; border-radius: 0.5rem; }

        .lesson-theme--teal { background: linear-gradient(160deg, #ffffff 0%, #f0fdfa 100%); }
        .lesson-theme--teal .lesson-prompt, .lesson-theme--teal .lesson-alert { background: #ccfbf1; color: #115e59; border: 1px solid #99f6e4; border-radius: 0.5rem; }

        .lesson-theme--green { background: linear-gradient(160deg, #ffffff 0%, #f0fdf4 100%); }
        .lesson-theme--green .lesson-prompt, .lesson-theme--green .lesson-alert { background: #dcfce7; color: #14532d; border: 1px solid #bbf7d0; border-radius: 0.5rem; }

        .lesson-theme--red { background: linear-gradient(160deg, #ffffff 0%, #fff1f2 100%); }
        .lesson-theme--red .lesson-prompt, .lesson-theme--red .lesson-alert { background: #fee2e2; color: #7f1d1d; border: 1px solid #fecaca; border-radius: 0.5rem; }

        .lesson-theme--indigo { background: linear-gradient(160deg, #ffffff 0%, #eef2ff 100%); }
        .lesson-theme--indigo .lesson-prompt, .lesson-theme--indigo .lesson-alert { background: #e0e7ff; color: #312e81; border: 1px solid #c7d2fe; border-radius: 0.5rem; }

        .lesson-theme--slate { background: linear-gradient(160deg, #ffffff 0%, #f8fafc 100%); }
        .lesson-theme--slate .lesson-prompt, .lesson-theme--slate .lesson-alert { background: #e2e8f0; color: #0f172a; border: 1px solid #cbd5e1; border-radius: 0.5rem; }

        .lesson-theme--cyan { background: linear-gradient(160deg, #ffffff 0%, #ecfeff 100%); }
        .lesson-theme--cyan .lesson-prompt, .lesson-theme--cyan .lesson-alert { background: #cffafe; color: #164e63; border: 1px solid #a5f3fc; border-radius: 0.5rem; }

        .lesson-alert .lesson-inline-note { color: inherit !important; }
        .lesson-alert [ForeColor="White"] { color: inherit !important; }

        .lesson-card__head {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 12px;
            align-items: flex-start;
            padding: 20px 24px 0;
        }

        .lesson-card__title {
            margin: 0;
            font-size: 18px;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.02em;
            color: var(--ls-text);
        }

        .lesson-card__desc {
            margin: 6px 0 0;
            font-size: 13px;
            line-height: 1.7;
            color: var(--ls-muted);
        }

        .lesson-card__body {
            padding: 18px 24px 22px;
        }

        .lesson-form-grid {
            display: grid;
            gap: 16px;
            grid-template-columns: 1fr 1fr 2fr;
        }

        .lesson-field {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .lesson-field--actions {
            grid-column: span 3;
        }

        .lesson-label {
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .lesson-select,
        .lesson-input {
            width: 100% !important;
            min-height: 42px;
            padding: 0 14px;
            border: 1px solid #cbd5e1;
            border-radius: 0.375rem;
            background: #f8fafc;
            color: #0f172a;
            font-size: 14px;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
        }

        .lesson-select:focus,
        .lesson-input:focus {
            border-color: #60a5fa;
            outline: none;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        .lesson-input {
            text-align: center;
            font-weight: 700;
            letter-spacing: 0.08em;
            background: #ecfeff;
            border-radius: 0.375rem;
        }

        .lesson-input-group {
            display: inline-flex;
            align-items: stretch;
            min-height: 40px;
            border: 1px solid #cbd5e1;
            background: #ffffff;
            border-radius: 0.375rem;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .lesson-input-group:focus-within {
            border-color: #60a5fa;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.18);
        }

        .lesson-input-group__label {
            display: inline-flex;
            align-items: center;
            padding: 0 14px;
            background: #f8fafc;
            color: #475569;
            font-size: 13px;
            font-weight: 700;
            border-right: 1px solid #cbd5e1;
            white-space: nowrap;
        }

        .lesson-input-group__input {
            flex: 1;
            min-width: 0;
            border: none;
            padding: 0 14px;
            background: transparent;
            font-weight: 800;
            text-align: center;
            color: #0f172a;
            font-size: 16px;
            letter-spacing: 0.05em;
        }

        .lesson-input-group__input:focus {
            outline: none;
        }

        .lesson-actions,
        .lesson-links,
        .lesson-room-tools,
        .lesson-toolbar,
        .lesson-legend,
        .lesson-footer {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }

        .lesson-actions {
            margin-top: 6px;
        }

        .lesson-btn,
        .lesson-link,
        .lesson-icon-link,
        .lesson-refresh {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 38px;
            padding: 0 14px;
            border-radius: 0.375rem;
            border: 1px solid transparent;
            text-decoration: none;
            font-size: 13px;
            font-weight: 700;
            transition: transform 0.18s ease, box-shadow 0.18s ease, background-color 0.18s ease, border-color 0.18s ease;
            cursor: pointer;
        }

        .lesson-btn:hover,
        .lesson-link:hover,
        .lesson-icon-link:hover,
        .lesson-refresh:hover {
            transform: translateY(-1px);
        }

        .lesson-btn {
            border: 0;
            color: #ffffff;
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.2);
            border-radius: 0.375rem;
        }

        .lesson-btn--secondary {
            color: #1d4ed8;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            box-shadow: none;
        }

        .lesson-btn--danger {
            color: #ffffff;
            background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
            box-shadow: 0 6px 16px rgba(220, 38, 38, 0.22);
        }

        .lesson-link {
            color: #14532d;
            background: #f0fdf4;
            border-color: #bbf7d0;
            border-radius: 0.375rem;
        }

        .lesson-icon-link {
            width: 38px;
            padding: 0;
            background: #eff6ff;
            border-color: #bfdbfe;
            border-radius: 0.375rem;
        }

        .lesson-refresh {
            width: 38px;
            padding: 0;
            background: #f8fafc;
            border-color: #cbd5e1;
            border-radius: 0.375rem;
        }

        .lesson-btn[disabled],
        .lesson-refresh[disabled],
        .lesson-select[disabled],
        .lesson-input[disabled] {
            opacity: 0.58;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .lesson-status-grid {
            display: grid;
            gap: 14px;
            grid-template-columns: repeat(4, minmax(0, 1fr));
        }

        .lesson-stat {
            padding: 16px;
            border-radius: 0.5rem;
            border: 1px solid #e2e8f0;
            background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
        }

        .lesson-stat__label {
            margin: 0;
            font-size: 13px;
            color: var(--ls-muted);
        }

        .lesson-stat__value {
            display: block;
            margin-top: 8px;
            font-size: 24px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.2;
        }

        .lesson-stat__sub {
            display: block;
            margin-top: 6px;
            font-size: 12px;
            line-height: 1.6;
            color: var(--ls-muted);
        }

        .lesson-prompt {
            display: block;
            margin-top: 10px;
            padding: 10px 14px;
            border-radius: 0.375rem;
            background: #f1f5f9;
            color: #334155;
            font-size: 12px;
            line-height: 1.7;
        }

        .lesson-menu-list {
            width: 100%;
        }

        .lesson-menu-item {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            width: 120px;
            margin: 0 10px 10px 0;
            padding: 14px 10px;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
            vertical-align: top;
        }

        .lesson-menu-card {
            width: 100%;
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
            padding: 0;
            border: none;
            background: transparent;
            cursor: pointer;
            text-align: center;
        }

        .lesson-menu-button {
            width: 48px;
            height: 48px;
            padding: 8px;
            border-radius: 0.5rem;
            border: 1px solid #dbeafe;
            background: #eff6ff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.18s ease, box-shadow 0.18s ease, border-color 0.18s ease;
        }

        .lesson-menu-card:hover .lesson-menu-button {
            transform: translateY(-1px);
            border-color: #93c5fd;
            box-shadow: 0 10px 22px rgba(37, 99, 235, 0.16);
        }

        .lesson-menu-button img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .lesson-quick-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }

        .lesson-quick-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 34px;
            padding: 0 14px;
            border-radius: 9999px;
            border: 1px solid #fed7aa;
            background: #fff7ed;
            color: #c2410c;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.18s ease, background-color 0.18s ease;
        }

        .lesson-quick-btn:hover {
            transform: translateY(-1px);
            background: #ffedd5;
        }

        .lesson-switch {
            position: relative;
            display: inline-flex;
            width: 36px;
            height: 20px;
            background-color: #cbd5e1;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
            border: none;
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
            align-items: center;
        }

        .lesson-switch--on {
            background-color: #f97316;
        }

        .lesson-switch-slider {
            position: absolute;
            top: 2px;
            left: 2px;
            width: 16px;
            height: 16px;
            background-color: white;
            border-radius: 50%;
            transition: transform 0.3s cubic-bezier(0.4, 0.0, 0.2, 1);
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }

        .lesson-switch--on .lesson-switch-slider {
            transform: translateX(16px);
        }

        .lesson-menu-title {
            display: block;
            min-height: 36px;
            font-size: 12px;
            font-weight: 700;
            line-height: 1.45;
            color: #0f172a;
        }

        .lesson-legend {
            row-gap: 8px;
        }

        .lesson-legend__item {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #475569;
            font-size: 12px;
            font-weight: 600;
        }

        .lesson-legend__swatch {
            display: inline-block;
            width: 14px;
            height: 14px;
            border-radius: 0.25rem;
            border: 1px solid rgba(15, 23, 42, 0.08);
            vertical-align: middle;
        }

        .lesson-inline-note {
            font-size: 13px;
            color: var(--ls-muted);
            line-height: 1.8;
        }

        .lesson-online-list,
        .lesson-done-list,
        .lesson-new-list {
            width: 100%;
        }

        .lesson-online-list {
            display: flex;
            flex-wrap: wrap;
            align-items: flex-start;
            gap: 10px;
        }

        .lesson-offline-list {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            gap: 0;
        }

        .student-card {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            min-height: 110px;
            margin: 0;
            padding: 12px 10px;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
            box-shadow: 0 4px 12px rgba(15, 23, 42, 0.04);
        }

        .student-card--offline {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            min-height: 0;
            margin: 0 6px 6px 0;
            padding: 6px 12px;
            border: 1px solid #e2e8f0;
            border-radius: 0.375rem;
            background: #ffffff;
            box-shadow: none;
            transition: background 0.15s, border-color 0.15s;
            vertical-align: top;
            cursor: pointer;
        }

        .student-card--offline:hover {
            background: #f1f5f9;
            border-color: #cbd5e1;
        }

        .student-card--offline .student-card__num {
            font-size: 11px;
            font-weight: 700;
            color: #94a3b8;
            flex-shrink: 0;
        }

        .student-card--offline .labelname {
            display: inline;
            width: auto;
            min-height: 0;
            margin: 0;
            padding: 0;
            background: none;
            border: none;
            border-radius: 0;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            line-height: 1;
            cursor: pointer;
        }

        .student-card--offline .student-card__score {
            margin: 0;
            font-size: 11px;
            color: #94a3b8;
            flex-shrink: 0;
        }

        .student-card__num {
            font-size: 12px;
            font-weight: 700;
            color: #64748b;
        }

        .student-card__machine,
        .student-card__score {
            margin-top: 6px;
            font-size: 12px;
            color: #64748b;
            line-height: 1.6;
        }

        .labelname {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            min-height: 30px;
            margin-top: 6px;
            padding: 0 8px;
            color: #0f172a;
            background-color: #f8fafc;
            border: 1px solid #dbe4f0;
            border-radius: 0.375rem;
            font-size: 13px;
            line-height: 1.4;
            cursor: pointer;
        }

        .lesson-student-actions {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 6px;
            margin-top: 8px;
        }

        .lesson-group-flag {
            min-width: 28px;
            min-height: 28px;
            padding: 0 6px;
            border-radius: 0.375rem;
            border: 1px solid #bfdbfe;
            background: #eff6ff;
            color: transparent;
            overflow: hidden;
        }

        .lesson-group-flag img {
            width: 16px;
            height: 16px;
            margin-top: 5px;
        }

        .groupscore {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 18px;
            min-height: 18px;
            font-size: 11px;
            font-weight: 800;
            line-height: 1;
        }

        .lockbtn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 26px;
            height: 26px;
            border-radius: 0.25rem;
            background: #fee2e2;
            color: #b91c1c;
            font-size: 0;
            text-decoration: none;
            border: 1px solid #fecaca;
        }

        .lockbtn:before {
            content: "退";
            font-size: 11px;
            font-weight: 800;
            line-height: 1;
        }

        .lesson-toggle-group {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
            gap: 0;
            padding: 0;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            background: #ffffff;
            overflow: hidden;
        }

        /* --- Checkbox switch item --- */
        .lesson-toggle-group > .ls-ck-switch {
            display: flex;
            align-items: center;
            padding: 9px 14px;
            border-bottom: 1px solid #f1f5f9;
            border-right: 1px solid #f1f5f9;
            transition: background 0.15s;
        }
        .lesson-toggle-group > .ls-ck-switch:hover {
            background: #f8fafc;
        }

        /* Make ASP.NET / Anthem wrapper span transparent */
        .ls-ck-switch > span {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
        }

        /* Hide native checkbox */
        .ls-ck-switch input[type="checkbox"] {
            -webkit-appearance: none !important;
            -moz-appearance: none !important;
            appearance: none !important;
            position: absolute !important;
            opacity: 0 !important;
            width: 0 !important;
            height: 0 !important;
            margin: 0 !important;
            padding: 0 !important;
            pointer-events: none;
        }

        /* Switch label: text left, switch right */
        .ls-ck-switch label {
            position: relative;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            width: 100%;
            margin: 0;
            padding: 0;
            padding-right: 40px;
            font-size: 13px;
            font-weight: 500;
            color: #334155;
            cursor: pointer;
            user-select: none;
            line-height: 1;
            white-space: nowrap;
        }

        /* Switch track */
        .ls-ck-switch label::after {
            content: '';
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 32px;
            height: 18px;
            background: #d1d5db;
            border-radius: 9px;
            transition: background 0.2s ease;
        }

        /* Switch knob */
        .ls-ck-switch label::before {
            content: '';
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            width: 14px;
            height: 14px;
            background: #ffffff;
            border-radius: 50%;
            box-shadow: 0 1px 2px rgba(0,0,0,0.2);
            transition: right 0.2s ease;
            z-index: 1;
        }

        /* Checked: track turns blue, knob slides right */
        .ls-ck-switch input[type="checkbox"]:checked + label::after {
            background: #6366f1;
        }
        .ls-ck-switch input[type="checkbox"]:checked + label::before {
            right: 2px;
        }

        /* Focus ring */
        .ls-ck-switch input[type="checkbox"]:focus-visible + label::after {
            box-shadow: 0 0 0 2px #c7d2fe;
        }

        .lesson-sort span {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-right: 10px;
            font-size: 13px;
            color: #334155;
        }

        .lesson-sort {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            padding: 14px;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            background: #ffffff;
        }

        .lesson-alert {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 10px;
            padding: 12px 14px;
            border-radius: 0.5rem;
            background: #f1f5f9;
            color: #334155;
        }

        .lesson-alert__title {
            font-size: 13px;
            font-weight: 700;
        }

        .lesson-alert__count {
            font-size: 18px;
            font-weight: 800;
            color: inherit;
        }

        .lesson-room-meta {
            display: grid;
            gap: 16px;
            grid-template-columns: minmax(180px, 240px) 1fr;
            align-items: end;
        }

        .doneksdiv {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 56px;
            min-height: 68px;
            margin: 0 8px 8px 0;
            padding: 8px 6px;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            background: #ffffff;
            float: none;
            vertical-align: top;
        }

        .donekc,
        .newkc {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 34px;
            min-height: 28px;
            padding: 0 6px;
            border-radius: 0.25rem;
            font-weight: 800;
            text-decoration: none;
            border: 1px solid transparent;
        }

        .donekc {
            color: #166534;
            background: #dcfce7;
            border-color: #bbf7d0;
        }

        .newkc {
            color: #9a3412;
            background: #ffedd5;
            border-color: #fed7aa;
        }

        .lesson-course-note {
            margin-top: 4px;
            font-size: 12px;
            color: var(--ls-muted);
        }

        .lesson-publish-toggle img {
            width: 20px;
            height: 20px;
        }

        .lesson-footer {
            justify-content: space-between;
            align-items: center;
            padding-top: 6px;
        }

        .lesson-footer__meta {
            font-size: 13px;
            line-height: 1.8;
            color: var(--ls-muted);
        }

        .lesson-footer__meta span,
        .lesson-footer__meta label {
            color: #334155;
            font-weight: 600;
        }

        @media (max-width: 1200px) {
            .lesson-card--span-8,
            .lesson-card--span-7,
            .lesson-card--span-6,
            .lesson-card--span-5,
            .lesson-card--span-4 {
                grid-column: span 12;
            }

            .lesson-status-grid,
            .lesson-form-grid,
            .lesson-room-meta {
                grid-template-columns: 1fr;
            }

            .lesson-toggle-group {
                grid-template-columns: 1fr;
            }

            .lesson-field--actions {
                grid-column: span 1;
            }
        }

        @media (max-width: 768px) {
            .lesson-start {
                padding: 16px;
            }

            .lesson-hero,
            .lesson-card__head,
            .lesson-card__body {
                padding-left: 16px;
                padding-right: 16px;
            }

            .lesson-hero__title {
                font-size: 22px;
            }

            .lesson-menu-item,
            .student-card,
            .student-card--offline,
            .doneksdiv {
                margin-right: 6px;
            }
        }

        /* ================================================================
           Tab 切换组件样式
           ================================================================ */
        .ls-tab-bar {
            display: inline-flex;
            gap: 4px;
            padding: 3px;
            background: #f1f5f9;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
        }

        .ls-tab {
            padding: 6px 16px;
            border: none;
            border-radius: 6px;
            background: transparent;
            color: #64748b;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            white-space: nowrap;
        }

        .ls-tab:hover {
            color: #334155;
            background: rgba(255, 255, 255, 0.6);
        }

        .ls-tab--active {
            color: #0f172a;
            background: #ffffff;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
        }

        .ls-tab-panel {
            min-height: 100px;
        }

        /* 实时监控指示器 */
        .ls-realtime-indicator {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 12px;
            border-radius: 999px;
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            font-size: 12px;
            font-weight: 600;
            color: #16a34a;
        }

        .ls-pulse {
            display: inline-block;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #22c55e;
            animation: ls-pulse-anim 1.5s ease-in-out infinite;
        }

        @keyframes ls-pulse-anim {
            0%, 100% { opacity: 1; transform: scale(1); }
            50% { opacity: 0.5; transform: scale(1.3); }
        }

        /* 实时统计卡片 */
        .ls-rt-summary {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .ls-rt-stat {
            flex: 1;
            min-width: 100px;
            padding: 14px 16px;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
            background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
            text-align: center;
        }

        .ls-rt-stat__num {
            display: block;
            font-size: 28px;
            font-weight: 800;
            line-height: 1.2;
            color: #0f172a;
        }

        .ls-rt-stat__label {
            display: block;
            margin-top: 4px;
            font-size: 12px;
            font-weight: 600;
            color: #64748b;
        }

        .ls-rt-stat--working { border-color: #bbf7d0; background: linear-gradient(180deg, #f0fdf4, #dcfce7); }
        .ls-rt-stat--working .ls-rt-stat__num { color: #16a34a; }

        .ls-rt-stat--viewing { border-color: #bfdbfe; background: linear-gradient(180deg, #eff6ff, #dbeafe); }
        .ls-rt-stat--viewing .ls-rt-stat__num { color: #2563eb; }

        .ls-rt-stat--submitted { border-color: #c4b5fd; background: linear-gradient(180deg, #f5f3ff, #ede9fe); }
        .ls-rt-stat--submitted .ls-rt-stat__num { color: #7c3aed; }

        .ls-rt-stat--idle { border-color: #fed7aa; background: linear-gradient(180deg, #fffbeb, #fef3c7); }
        .ls-rt-stat--idle .ls-rt-stat__num { color: #d97706; }

        .ls-rt-stat--total { border-color: #cbd5e1; background: linear-gradient(180deg, #ffffff, #f1f5f9); }

        /* 环节分布条 */
        .ls-rt-step-bar {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 8px 0;
            border-bottom: 1px solid #f1f5f9;
        }

        .ls-rt-step-bar:last-child { border-bottom: none; }

        .ls-rt-step-name {
            flex-shrink: 0;
            width: 120px;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .ls-rt-step-progress {
            flex: 1;
            height: 22px;
            background: #f1f5f9;
            border-radius: 6px;
            overflow: hidden;
        }

        .ls-rt-step-fill {
            height: 100%;
            background: linear-gradient(90deg, #3b82f6, #60a5fa);
            border-radius: 6px;
            transition: width 0.4s ease;
            min-width: 0;
        }

        .ls-rt-step-count {
            flex-shrink: 0;
            font-size: 13px;
            font-weight: 800;
            color: #0f172a;
            min-width: 28px;
            text-align: right;
        }

        /* 学生状态卡片 */
        .ls-rt-stu {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            gap: 4px;
            padding: 8px 10px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            background: #ffffff;
            min-width: 72px;
            text-align: center;
            transition: border-color 0.2s;
            cursor: pointer;
        }

        .ls-rt-stu--working { border-color: #86efac; background: #f0fdf4; }
        .ls-rt-stu--viewing { border-color: #93c5fd; background: #eff6ff; }
        .ls-rt-stu--submitted { border-color: #c4b5fd; background: #f5f3ff; }
        .ls-rt-stu--idle { border-color: #fcd34d; background: #fffbeb; }

        .ls-rt-stu__name {
            font-size: 12px;
            font-weight: 700;
            color: #0f172a;
        }

        .ls-rt-stu__step {
            font-size: 11px;
            color: #64748b;
            max-width: 80px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .ls-rt-stu__meta {
            font-size: 10px;
            color: #64748b;
            max-width: 140px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .ls-rt-stu__status {
            font-size: 10px;
            font-weight: 700;
            padding: 1px 6px;
            border-radius: 4px;
        }

        .ls-rt-stu__status--working { background: #dcfce7; color: #16a34a; }
        .ls-rt-stu__status--viewing { background: #dbeafe; color: #2563eb; }
        .ls-rt-stu__status--submitted { background: #ede9fe; color: #7c3aed; }
        .ls-rt-stu__status--idle { background: #fef3c7; color: #d97706; }

        .ls-rt-stu__time {
            font-size: 10px;
            color: #94a3b8;
        }

        .ls-rt-stu__badge {
            margin-top: 4px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 2px 8px;
            border-radius: 999px;
            border: 1px solid #bfdbfe;
            background: #eff6ff;
            color: #1d4ed8;
            font-size: 10px;
            font-weight: 700;
        }

        .ls-rt-modal {
            position: fixed;
            inset: 0;
            z-index: 9999;
            display: none;
            align-items: center;
            justify-content: center;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(3px);
        }

        .ls-rt-modal.is-open {
            display: flex;
        }

        .ls-rt-modal__dialog {
            width: min(92vw, 760px);
            max-height: 86vh;
            overflow: auto;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 24px 60px rgba(15, 23, 42, 0.24);
            padding: 24px;
        }

        .ls-rt-modal__head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-bottom: 16px;
        }

        .ls-rt-modal__title {
            margin: 0;
            font-size: 20px;
            font-weight: 800;
            color: #0f172a;
        }

        .ls-rt-modal__close {
            border: none;
            background: #f1f5f9;
            color: #334155;
            border-radius: 999px;
            width: 36px;
            height: 36px;
            cursor: pointer;
            font-size: 18px;
            font-weight: 700;
        }

        .ls-rt-modal__section {
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 16px;
            background: #f8fafc;
            margin-top: 14px;
        }

        .ls-rt-modal__label {
            display: block;
            margin-bottom: 8px;
            font-size: 12px;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: .04em;
        }

        .ls-rt-modal__content {
            font-size: 14px;
            line-height: 1.8;
            color: #1e293b;
            white-space: pre-wrap;
            word-break: break-word;
        }

        .ls-rt-chip {
            display: inline-flex;
            align-items: center;
            padding: 4px 10px;
            border-radius: 999px;
            background: #eef2ff;
            color: #4338ca;
            border: 1px solid #c7d2fe;
            font-size: 12px;
            font-weight: 700;
            margin-right: 8px;
        }
    </style>

    <div class="placehold lesson-start">
        <div class="lesson-shell">
            <div class="lesson-hero">
                <div class="lesson-hero__content">
                    <div>
                        <h1 class="lesson-hero__title">课堂启动中心</h1>
                        <p class="lesson-hero__subtitle">选择班级与学案，启动课堂后实时查看学生进度与各项功能控制。</p>
                    </div>
                </div>
            </div>

            <div class="lesson-grid">
                <section class="lesson-card lesson-card--span-8 lesson-theme--blue">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">课堂准备</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-form-grid">
                            <div class="lesson-field">
                                <span class="lesson-label">年级</span>
                                <asp:DropDownList ID="DDLgrade" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLgrade_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field">
                                <span class="lesson-label">班级</span>
                                <asp:DropDownList ID="DDLclass" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLclass_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field">
                                <span class="lesson-label">当前学案</span>
                                <asp:DropDownList ID="DDLCid" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLCid_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-field lesson-field--actions">
                                <div class="lesson-actions">
                                    <asp:Button ID="Btnset" runat="server" Text="开始上课" ToolTip="设置上课班级登录密码" onclick="Btnset_Click" CssClass="lesson-btn" />
                                    <asp:Button ID="Btnstudent" runat="server" Text="模拟学生" ToolTip="模拟本班级学生角色登录学生平台" onclick="Btnstudent_Click" Enabled="False" CssClass="lesson-btn lesson-btn--secondary" />
                                    <div class="lesson-input-group" style="min-width: 200px; max-width: 240px;">
                                        <span class="lesson-input-group__label">班级口令</span>
                                        <asp:TextBox ID="TBpwd" runat="server" ReadOnly="True" CssClass="lesson-input-group__input"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-4 lesson-theme--purple">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">课堂速览</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-status-grid">
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">已签到</p>
                                <span class="lesson-stat__value"><asp:Label ID="Labelsigin" runat="server"></asp:Label></span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">未签到</p>
                                <span class="lesson-stat__value"><asp:Label ID="Labelsigno" runat="server"></asp:Label></span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">作品提交</p>
                                <span class="lesson-stat__sub" style="margin-top: 10px;"><asp:Label ID="Labelcount" runat="server"></asp:Label></span>
                            </div>
                            <div class="lesson-stat">
                                <p class="lesson-stat__label">课堂时钟</p>
                                <span class="lesson-stat__sub" style="margin-top: 10px;"><asp:Label ID="Labelfresh" runat="server"></asp:Label></span>
                                <span class="lesson-stat__sub"><asp:Label ID="LabelToday" runat="server" ToolTip="服务器日期校准：作品、签到日期以此为准"></asp:Label></span>
                            </div>
                        </div>

                        <div class="lesson-links" style="margin-top: 14px;">
                            <asp:HyperLink ID="HLrate" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">学习进度</asp:HyperLink>
                            <asp:HyperLink ID="HLworkshow" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">作品展示</asp:HyperLink>
                            <asp:HyperLink ID="HLtotal" runat="server" BorderStyle="None" Font-Underline="False" Target="_blank" CssClass="lesson-link">学习汇总</asp:HyperLink>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12 lesson-theme--orange">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">学案活动开关</h2>
                            <p class="lesson-card__desc">可逐项切换当前学案活动，也可使用快捷按钮一次全部打开或关闭。</p>
                        </div>
                        <div class="lesson-quick-actions">
                            <asp:Button ID="BtnMenuOpenAll" runat="server" Text="全部开启" OnClick="BtnMenuOpenAll_Click" CssClass="lesson-quick-btn" />
                            <asp:Button ID="BtnMenuCloseAll" runat="server" Text="全部关闭" OnClick="BtnMenuCloseAll_Click" CssClass="lesson-quick-btn" />
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <asp:DataList ID="DataListMenu" runat="server" CssClass="lesson-menu-list" RepeatLayout="Flow" RepeatDirection="Horizontal" DataKeyField="Lid" onitemdatabound="DataListMenu_ItemDataBound" onitemcommand="DataListMenu_ItemCommand">
                            <ItemTemplate>
                                <div class="lesson-menu-item">
                                    <asp:LinkButton ID="imgBtn" runat="server" CssClass="lesson-menu-card" CommandArgument='<%# Eval("Lid") %>' CommandName="P">
                                        <span class="lesson-menu-button">
                                            <asp:Image ID="ImageMenuIcon" runat="server" ImageUrl='<%# Eval("Limgurl") %>' AlternateText='<%# Eval("Ltitle") %>' />
                                        </span>
                                    </asp:LinkButton>
                                    <asp:Label ID="lableTitle" runat="server" CssClass="lesson-menu-title" Text='<%# Eval("Ltitle") %>'></asp:Label>
                                    <asp:CheckBox ID="CheckBoxShow" Checked='<%# Eval("Lshow") %>' runat="server" Visible="false" />
                                    <asp:LinkButton ID="BtnSwitchToggle" runat="server" CommandName="P" CommandArgument='<%# Eval("Lid") %>' CssClass='<%# Convert.ToBoolean(Eval("Lshow")) ? "lesson-switch lesson-switch--on" : "lesson-switch" %>'>
                                        <span class="lesson-switch-slider"></span>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12 lesson-theme--teal" id="ls-realtime-section">
                    <div class="lesson-card__head">
                        <div style="display:flex;align-items:center;gap:16px;width:100%;">
                            <div class="ls-tab-bar" id="ls-tab-bar">
                                <button type="button" class="ls-tab ls-tab--active" data-tab="online" onclick="lsSwitchTab('online')">在线学生</button>
                                <button type="button" class="ls-tab" data-tab="progress" onclick="lsSwitchTab('progress')">学案进度</button>
                                <button type="button" class="ls-tab" data-tab="realtime" onclick="lsSwitchTab('realtime')">实时动态</button>
                            </div>
                            <div id="ls-realtime-indicator" class="ls-realtime-indicator" style="display:none;">
                                <span class="ls-pulse"></span>
                                <span class="ls-indicator-text">实时监控中</span>
                            </div>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <!-- Tab 1: 在线学生 -->
                        <div class="ls-tab-panel" id="ls-panel-online" style="display:block;">
                            <div class="lesson-legend">
                                <span class="lesson-legend__item"><asp:Label ID="Labelnocolor" runat="server" BackColor="#E8E8E8" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="没有作品"></asp:Label>无作品</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labelone" runat="server" BackColor="#B1D2FE" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="单个作品"></asp:Label>1件</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labeltwo" runat="server" BackColor="#4F98FB" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="两个作品"></asp:Label>2件</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labelthree" runat="server" BackColor="#CDE7CF" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="三个作品"></asp:Label>3件</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labelfour" runat="server" BackColor="#9BC47D" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="四个作品"></asp:Label>4件</span>
                                <span class="lesson-legend__item"><asp:Label ID="Labelmore" runat="server" BackColor="#BCADE4" CssClass="lesson-legend__swatch" EnableViewState="False" ToolTip="多个作品"></asp:Label>5+</span>
                            </div>

                            <div style="margin-top: 14px; overflow-x: auto;">
                                <asp:DataList ID="DLonline" runat="server" CssClass="lesson-online-list" RepeatDirection="Horizontal" HorizontalAlign="Left" DataKeyField="Qid" onitemdatabound="DLonline_ItemDataBound" onitemcommand="DLonline_ItemCommand" RepeatLayout="Flow">
                                    <ItemTemplate>
                                        <div class="divonline student-card">
                                            <div class="student-card__num"><asp:Label ID="Labelqnum" runat="server" Text='<%# Eval("Qnum") %>'></asp:Label></div>
                                            <asp:Label ID="HyperSname" runat="server" Text='<%# Eval("Qname") %>' CssClass="labelname"></asp:Label>
                                            <div class="lesson-student-actions">
                                                <asp:HyperLink ID="Groupflag" runat="server" CssClass="lesson-group-flag">g</asp:HyperLink>
                                                <asp:Label ID="Labelcolor" runat="server" Text='<%# Eval("Qgscore") %>' ToolTip='<%# "组评语："+Eval("Qgroup") %>' CssClass="groupscore"></asp:Label>
                                                <asp:LinkButton ID="Lunlock" runat="server" CommandArgument="Qid" CommandName="UnLock" ToolTip="让该学生重新登录" CssClass="lockbtn"></asp:LinkButton>
                                            </div>
                                            <div class="student-card__machine"><asp:Label ID="LabelQmachine" runat="server" Text='<%# Eval("QmachineShort") %>' Visible="false"></asp:Label></div>
                                            <div style="display: none;">
                                                <asp:Label ID="Labelwork" runat="server" Text='<%# Eval("Qwork") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Labelattitude" runat="server" Text='<%# Eval("Qattitude") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Labelnote" runat="server" Text='<%# Eval("Qnote") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LabelSleader" runat="server" Text='<%# Eval("Sleader") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LabelSgroup" runat="server" Text='<%# Eval("Sgroup") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LabelSgtitle" runat="server" Text='<%# Eval("Sgtitle") %>' Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>

                        <!-- Tab 2: 学案进度 -->
                        <div class="ls-tab-panel" id="ls-panel-progress" style="display:none;">
                            <div>
                                <div class="lesson-label">已学学案</div>
                                <div style="margin-top: 10px;">
                                    <asp:DataList ID="DLdonekc" runat="server" CssClass="lesson-done-list" ForeColor="Black" RepeatDirection="Horizontal" RepeatLayout="Flow" CellPadding="0" CellSpacing="0" DataKeyField="Cid" onitemdatabound="DLdonekc_ItemDataBound">
                                        <ItemTemplate>
                                            <div class="doneksdiv">
                                                <div><asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="donekc"></asp:HyperLink></div>
                                                <div class="lesson-course-note"><asp:Label ID="wk" runat="server" ToolTip="作品总数"></asp:Label></div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>

                            <div style="margin-top: 18px;">
                                <div class="lesson-label">未学学案</div>
                                <div style="margin-top: 10px;">
                                    <asp:DataList ID="DLnewkc" runat="server" CssClass="lesson-new-list" ForeColor="Black" RepeatDirection="Horizontal" RepeatLayout="Flow" CellPadding="0" CellSpacing="0" DataKeyField="Cid" onitemdatabound="DLnewkc_ItemDataBound" onitemcommand="DLnewkc_ItemCommand">
                                        <ItemTemplate>
                                            <div class="doneksdiv">
                                                <div><asp:HyperLink ID="ks" runat="server" Text='<%# Eval("Cks") %>' ToolTip='<%# Eval("Ctitle") %>' CssClass="newkc"></asp:HyperLink></div>
                                                <div class="lesson-course-note"><asp:CheckBox ID="Ck" runat="server" Checked='<%# Eval("Cpublish") %>' Enabled="False" /></div>
                                                <div style="margin-top: 4px;"><asp:Button runat="server" ID="PubSet" CssClass="lesson-publish-toggle" CommandArgument="Cid" CommandName="P" Text="发布状态" /></div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>

                        <!-- Tab 3: 实时动态 -->
                        <div class="ls-tab-panel" id="ls-panel-realtime" style="display:none;">
                            <div class="ls-rt-summary" id="ls-rt-summary">
                                <div class="ls-rt-stat ls-rt-stat--working">
                                    <span class="ls-rt-stat__num" id="ls-rt-working">0</span>
                                    <span class="ls-rt-stat__label">学习中</span>
                                </div>
                                <div class="ls-rt-stat ls-rt-stat--viewing">
                                    <span class="ls-rt-stat__num" id="ls-rt-viewing">0</span>
                                    <span class="ls-rt-stat__label">浏览中</span>
                                </div>
                                <div class="ls-rt-stat ls-rt-stat--submitted">
                                    <span class="ls-rt-stat__num" id="ls-rt-submitted">0</span>
                                    <span class="ls-rt-stat__label">已提交</span>
                                </div>
                                <div class="ls-rt-stat ls-rt-stat--idle">
                                    <span class="ls-rt-stat__num" id="ls-rt-idle">0</span>
                                    <span class="ls-rt-stat__label">空闲</span>
                                </div>
                                <div class="ls-rt-stat ls-rt-stat--total">
                                    <span class="ls-rt-stat__num" id="ls-rt-total">0</span>
                                    <span class="ls-rt-stat__label">在线总数</span>
                                </div>
                            </div>

                            <div class="ls-rt-steps" id="ls-rt-steps" style="margin-top:16px;">
                                <div class="lesson-label">各环节学生分布</div>
                                <div id="ls-rt-steps-chart" style="margin-top:10px;"></div>
                            </div>

                            <div style="margin-top:16px;">
                                <div class="lesson-label">学生详细状态</div>
                                <div id="ls-rt-students" style="margin-top:10px;display:flex;flex-wrap:wrap;gap:8px;"></div>
                            </div>
                        </div>

                        <div id="lsStudentModal" class="ls-rt-modal" aria-hidden="true">
                            <div class="ls-rt-modal__dialog" role="dialog" aria-modal="true" aria-labelledby="lsStudentModalTitle">
                                <div class="ls-rt-modal__head">
                                    <h3 id="lsStudentModalTitle" class="ls-rt-modal__title">学生学习详情</h3>
                                    <button type="button" class="ls-rt-modal__close" onclick="lsCloseStudentModal();">×</button>
                                </div>
                                <div id="lsStudentModalBody" class="ls-rt-modal__content">正在加载...</div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-6 lesson-theme--indigo">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">课堂控制</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-sort">
                            <span class="lesson-label">视图排序</span>
                            <anthem:RadioButtonList ID="RBsort" runat="server" AutoPostBack="True" CssClass="lesson-radio-list" RepeatDirection="Horizontal" RepeatLayout="Flow" onselectedindexchanged="RBsort_SelectedIndexChanged">
                                <Items>
                                    <asp:ListItem Value="3">机房视图</asp:ListItem>
                                    <asp:ListItem Value="0">主机排序</asp:ListItem>
                                    <asp:ListItem Value="1" Selected="True">学号排序</asp:ListItem>
                                    <asp:ListItem Value="2">小组排序</asp:ListItem>
                                </Items>
                            </anthem:RadioButtonList>
                        </div>

                        <div class="lesson-toggle-group" style="margin-top: 14px;">
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxScratch" runat="server" Text="编程控制" AutoPostBack="True" ToolTip="编程开关控制，选中表示可以进入编程页面" oncheckedchanged="CheckBoxScratch_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxRgauge" runat="server" Text="作品互评" AutoPostBack="True" ToolTip="作品互评控制，选中表示开启" oncheckedchanged="CheckBoxRgauge_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxip" runat="server" Text="IP锁定登录" AutoPostBack="True" ToolTip="根据上次登录的IP进行锁定登录" oncheckedchanged="CheckBoxip_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxPass" runat="server" Text="闯关模式" AutoPostBack="True" ToolTip="当前学案活动依次完成后解锁下一个活动" oncheckedchanged="CheckBoxPass_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxOpen" runat="server" Text="快速模式" AutoPostBack="True" ToolTip="本班学生登录后，直接进入当前学案导航" oncheckedchanged="CheckBoxOpen_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxPwd" runat="server" Text="班级密码" AutoPostBack="True" ToolTip="选中表示公开显示班级密码，未选表示隐藏" oncheckedchanged="CheckBoxPwd_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><anthem:CheckBox ID="CheckBoxLogin" runat="server" Text="个人模式" AutoPostBack="True" ToolTip="选中表示允许本班单独个人模式登录" oncheckedchanged="CheckBoxLogin_CheckedChanged" /></div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-6 lesson-theme--cyan">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">机房与资源</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-room-meta">
                            <div class="lesson-field">
                                <span class="lesson-label">机房 / 座位配置</span>
                                <asp:DropDownList ID="DDLhouse" runat="server" AutoPostBack="True" CssClass="lesson-select" onselectedindexchanged="DDLhouse_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="lesson-room-tools">
                                <asp:HyperLink ID="HyperLinkSeat" runat="server" Target="_blank" CssClass="lesson-link">座位表</asp:HyperLink>
                                <asp:Button ID="Btnrefresh" runat="server" Text="刷新座位" OnClick="Btnrefresh_Click" Enabled="False" CssClass="lesson-refresh" />
                                <asp:HyperLink ID="HylkDiskstu" runat="server" ImageUrl="~/images/disksmallstu.gif" Target="_blank" ToolTip="查看学生网盘存档情况" CssClass="lesson-icon-link"></asp:HyperLink>
                                <asp:HyperLink ID="HylkDiskGroup" runat="server" ImageUrl="~/images/disksmall.gif" Target="_blank" ToolTip="查看小组网盘存档情况" CssClass="lesson-icon-link"></asp:HyperLink>
                            </div>
                        </div>

                        <div class="lesson-toggle-group" style="margin-top: 14px;">
                            <div class="ls-ck-switch"><asp:CheckBox ID="CheckBoxShare" runat="server" Text="网盘开关" AutoPostBack="True" ToolTip="选中表示网盘启用，未选表示网盘禁用" oncheckedchanged="CheckBoxShare_CheckedChanged" /></div>
                            <div class="ls-ck-switch"><asp:CheckBox ID="CheckBoxGroupShare" runat="server" Text="小组网盘" AutoPostBack="True" ToolTip="选中表示小组网盘启用（需先启用网盘开关）" oncheckedchanged="CheckBoxGroupShare_CheckedChanged" /></div>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12 lesson-theme--slate">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">未签到学生</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <div style="overflow-x: auto;">
                            <asp:DataList ID="DLnotline" runat="server" CssClass="lesson-offline-list" RepeatDirection="Horizontal" onitemdatabound="DLnotline_ItemDataBound" RepeatLayout="Flow">
                                <ItemTemplate>
                                    <div class="student-card student-card--offline">
                                        <div class="student-card__num"><asp:Label ID="LabelNnum" runat="server" Text='<%# Eval("Snum") %>'></asp:Label></div>
                                        <asp:Label ID="lbQname" runat="server" Text='<%# Eval("Sname") %>' CssClass="labelname"></asp:Label>
                                        <div class="student-card__score"><asp:Label ID="LabelSscore" runat="server" Text='<%# Eval("Sscore") %>' ToolTip="总学分"></asp:Label></div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </section>

                <section class="lesson-card lesson-card--span-12 lesson-theme--red">
                    <div class="lesson-card__head">
                        <div>
                            <h2 class="lesson-card__title">课堂收尾</h2>
                        </div>
                    </div>
                    <div class="lesson-card__body">
                        <div class="lesson-footer">
                            <asp:Button ID="BtnaAllQuit" runat="server" Text="全班下线" Visible="False" EnableViewState="False" onclick="BtnaAllQuit_Click" CssClass="lesson-btn lesson-btn--danger" />
                            <div class="lesson-footer__meta">
                                <span>该操作会让当前上课班级学生全部退出登录，建议仅在下课时使用。</span>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <link href="../js/tooltip.css" rel="stylesheet" type="text/css" />
        <script src="../js/spanToolTip.js" type="text/javascript"></script>
        <script type="text/javascript">
            function myrefresh() {
                document.getElementById("<%= Btnrefresh.ClientID %>").click();
            }
            setTimeout("myrefresh()", 120000);

            function notsg(n, g, m) {
                var urlsg = "../teacher/notsign.aspx?nnum=" + n + "&ngrade=" + g + "&qname=" + m;
                openLessonModal(urlsg, "未签到备注", 300);
            }
            function attitude(q, m, a, c) {
                var urlat = "../teacher/attitude.aspx?qid=" + q + "&qname=" + m + "&qattitude=" + a + "&qcid=" + c;
                openLessonModal(urlat, "学习表现评价", 360);
            }
            function attitudegroup(g, m, q, c) {
                var urlat = "../teacher/attitudegroup.aspx?sg=" + g + "&ld=" + m + "&qd=" + q + "&qcid=" + c;
                openLessonModal(urlat, "小组学习表现评价", 240);
            }

            /* ================================================================
               Tab 切换
               ================================================================ */
            var lsCurrentTab = "online";
            function lsSwitchTab(tabName) {
                lsCurrentTab = tabName;
                var tabs = document.querySelectorAll("#ls-tab-bar .ls-tab");
                for (var i = 0; i < tabs.length; i++) {
                    var t = tabs[i];
                    if (t.getAttribute("data-tab") === tabName) {
                        t.className = "ls-tab ls-tab--active";
                    } else {
                        t.className = "ls-tab";
                    }
                }
                var panels = ["online", "progress", "realtime"];
                for (var j = 0; j < panels.length; j++) {
                    var p = document.getElementById("ls-panel-" + panels[j]);
                    if (p) p.style.display = (panels[j] === tabName) ? "block" : "none";
                }
                // 切换到实时动态时启动轮询
                var indicator = document.getElementById("ls-realtime-indicator");
                if (tabName === "realtime") {
                    if (indicator) indicator.style.display = "inline-flex";
                    lsStartPolling();
                } else {
                    if (indicator) indicator.style.display = "none";
                    lsStopPolling();
                }
            }

            /* ================================================================
               实时动态 AJAX 轮询
               ================================================================ */
            var lsPollingTimer = null;
            var lsPollingInterval = 8000; // 8秒轮询
            var lsGrade = "<%= LsGrade %>";
            var lsClass = "<%= LsClass %>";
            var lsCid = "<%= LsCid %>";

            function lsStartPolling() {
                lsFetchData(); // 立即获取一次
                if (lsPollingTimer) clearInterval(lsPollingTimer);
                lsPollingTimer = setInterval(lsFetchData, lsPollingInterval);
            }

            function lsStopPolling() {
                if (lsPollingTimer) {
                    clearInterval(lsPollingTimer);
                    lsPollingTimer = null;
                }
            }

            var statusLabels = {
                "working": "学习中",
                "viewing": "浏览中",
                "submitted": "已提交",
                "idle": "空闲"
            };

            var stepTypeLabels = {
                "1": "活动",
                "2": "调查",
                "3": "讨论",
                "4": "表单",
                "5": "Scratch",
                "6": "资源",
                "7": "说明",
                "8": "Python",
                "9": "测评",
                "10": "流程图",
                "11": "像素画",
                "12": "网页",
                "13": "拼图",
                "14": "积木"
            };

            function lsDecodeMaybe(val) {
                if (!val) return "";
                try {
                    if (/%[0-9A-Fa-f]{2}/.test(val)) {
                        return decodeURIComponent(val);
                    }
                } catch (e) { }
                return val;
            }

            function lsFetchData() {
                if (lsGrade === "0" && lsClass === "0") return;
                $.ajax({
                    url: "../teacher/learnprogress.ashx",
                    type: "GET",
                    data: { action: "all", sgrade: lsGrade, sclass: lsClass, cid: lsCid },
                    dataType: "json",
                    timeout: 6000,
                    success: function (resp) {
                        if (resp && resp.ok) {
                            lsRenderProgress(resp.progress);
                            lsRenderStudents(resp.students);
                        } else {
                            var container = document.getElementById("ls-rt-students");
                            if (container) {
                                container.innerHTML = '<span style="color:#ef4444;font-size:13px;">实时动态加载失败</span>';
                            }
                        }
                    },
                    error: function () {
                        var container = document.getElementById("ls-rt-students");
                        if (container) {
                            container.innerHTML = '<span style="color:#ef4444;font-size:13px;">实时动态加载失败</span>';
                        }
                    }
                });
            }

            function lsRenderProgress(prog) {
                if (!prog) return;
                var el = function (id) { return document.getElementById(id); };
                el("ls-rt-working").innerText = prog.working || 0;
                el("ls-rt-viewing").innerText = prog.viewing || 0;
                el("ls-rt-submitted").innerText = prog.submitted || 0;
                el("ls-rt-idle").innerText = prog.idle || 0;
                el("ls-rt-total").innerText = prog.total || 0;

                // 环节分布
                var chart = el("ls-rt-steps-chart");
                if (chart && prog.steps) {
                    var html = "";
                    var maxCount = 0;
                    for (var k in prog.steps) {
                        if (prog.steps[k] > maxCount) maxCount = prog.steps[k];
                    }
                    if (maxCount === 0) maxCount = 1;
                    for (var stepName in prog.steps) {
                        var cnt = prog.steps[stepName];
                        var pct = Math.round((cnt / maxCount) * 100);
                        html += '<div class="ls-rt-step-bar">' +
                            '<span class="ls-rt-step-name" title="' + stepName + '">' + stepName + '</span>' +
                            '<div class="ls-rt-step-progress"><div class="ls-rt-step-fill" style="width:' + pct + '%"></div></div>' +
                            '<span class="ls-rt-step-count">' + cnt + '人</span>' +
                            '</div>';
                    }
                    if (html === "") {
                        html = '<span style="color:#94a3b8;font-size:13px;">暂无学生在线</span>';
                    }
                    chart.innerHTML = html;
                }
            }

            function lsRenderStudents(students) {
                var container = document.getElementById("ls-rt-students");
                if (!container || !students) return;
                if (students.length === 0) {
                    container.innerHTML = '<span style="color:#94a3b8;font-size:13px;">暂无学生状态数据</span>';
                    return;
                }
                var html = "";
                for (var i = 0; i < students.length; i++) {
                    var s = students[i];
                    var st = s.Status || "idle";
                    var label = statusLabels[st] || st;
                    var sname = lsDecodeMaybe(s.Sname || "");
                    var ltitle = lsDecodeMaybe(s.Ltitle || "");
                    var ltype = stepTypeLabels[s.Ltype] || (s.Ltype ? ("类型" + s.Ltype) : "未知类型");
                    var meta = "学案#" + (s.Cid || 0) + " · " + ltype;
                    var aiBadge = '';
                    if (s.HasAssessment) {
                        var badgeClass = s.AssessmentFallback ? 'ls-rt-stu__badge ls-rt-stu__badge--fallback' : 'ls-rt-stu__badge';
                        var badgeText = s.AssessmentFallback ? '模板评估' : 'AI评估';
                        aiBadge = '<span class="' + badgeClass + '" title="最近评估：' + (s.AssessmentTime || '-') + '">' + badgeText + '</span>';
                    }
                    html += '<div class="ls-rt-stu ls-rt-stu--' + st + '" onclick="lsOpenStudentDetail(' + (s.Sid || 0) + ',' + (s.Lid || 0) + ')">' +
                        '<span class="ls-rt-stu__name">' + sname + '</span>' +
                        '<span class="ls-rt-stu__step" title="' + ltitle + '">' + (ltitle || "-") + '</span>' +
                        '<span class="ls-rt-stu__meta" title="' + meta + '">' + meta + '</span>' +
                        '<span class="ls-rt-stu__status ls-rt-stu__status--' + st + '">' + label + '</span>' +
                        aiBadge +
                        '<span class="ls-rt-stu__time">' + (s.UpdateTime || "") + '</span>' +
                        '</div>';
                }
                container.innerHTML = html;
            }

            function lsCloseStudentModal() {
                var modal = document.getElementById('lsStudentModal');
                if (!modal) return;
                modal.className = modal.className.replace(/\s?is-open/g, '');
                modal.setAttribute('aria-hidden', 'true');
            }

            function lsEscapeHtml(text) {
                if (text === null || text === undefined) return '';
                return String(text)
                    .replace(/&/g, '&amp;')
                    .replace(/</g, '&lt;')
                    .replace(/>/g, '&gt;')
                    .replace(/"/g, '&quot;')
                    .replace(/'/g, '&#39;');
            }

            function lsRenderAnswerLog(answerLog) {
                if (!answerLog) {
                    return '<div class="ls-rt-modal__content">暂无答题记录。</div>';
                }
                try {
                    var parsed = JSON.parse(answerLog);
                    if (!parsed || !parsed.answers || !parsed.answers.length) {
                        return '<div class="ls-rt-modal__content">暂无答题记录。</div>';
                    }
                    var titleMap = window.lsStudentQuestionTitles || {};
                    var optionMap = window.lsStudentOptionTexts || {};
                    var blankMap = window.lsStudentBlankAnswers || {};
                    var summary = parsed.summary || {};
                    var totalQuestions = summary.totalQuestions || parsed.total || parsed.answers.length || 0;
                    var earnedScore = summary.earnedScore || parsed.score || 0;
                    var html = '<div class="ls-rt-modal__content">本次记录共 ' + totalQuestions + ' 题，得分 ' + earnedScore + '。</div>';
                    html += '<div style="margin-top:12px;display:grid;gap:10px;">';
                    for (var i = 0; i < parsed.answers.length; i++) {
                        var item = parsed.answers[i];
                        var isCorrect = item.isCorrect === true || item.isWrong === false;
                        var state = isCorrect ? '正确' : '错误';
                        var stateColor = isCorrect ? '#047857' : '#b91c1c';
                        var qid = item.questionId || '';
                        if (!qid && item.name && item.name.indexOf('-') > -1) {
                            qid = item.name.split('-')[1] || '';
                        }
                        var displayTitle = item.questionTitle || titleMap[qid] || item.name || ('第' + (i + 1) + '题');
                        var answerValue = lsFormatStudentAnswer(item, optionMap);
                        var answerMeta = '';
                        if (item.name && item.name.indexOf('填空-') === 0) {
                            var blankMid = item.name.split('-')[2] || '';
                            if (blankMap[blankMid]) {
                                answerMeta = '<div style="margin-top:6px;color:#64748b;font-size:12px;">标准答案：' + lsEscapeHtml(blankMap[blankMid]) + '</div>';
                            }
                        }
                        html += '<div style="border:1px solid #e2e8f0;border-radius:12px;padding:12px;background:#fff;">'
                            + '<div style="display:flex;justify-content:space-between;gap:12px;align-items:center;">'
                            + '<strong style="color:#0f172a;">' + lsEscapeHtml(displayTitle) + '</strong>'
                            + '<span style="font-size:12px;font-weight:700;color:' + stateColor + ';">' + state + '</span>'
                            + '</div>'
                            + '<div style="margin-top:6px;color:#475569;font-size:13px;">学生答案：' + lsEscapeHtml(answerValue) + '</div>'
                            + answerMeta
                            + '</div>';
                    }
                    html += '</div>';
                    return html;
                } catch (e) {
                    return '<div class="ls-rt-modal__content">' + lsEscapeHtml(answerLog).replace(/\n/g, '<br>') + '</div>';
                }
            }

            function lsFormatStudentAnswer(item, optionMap) {
                if (!item) return '-';
                var answerValue = item.userAnswer;
                var questionType = item.questionType || '';

                if (answerValue === null || answerValue === undefined || answerValue === '') {
                    return '-';
                }

                if (questionType === 'single_choice') {
                    if (optionMap[String(answerValue)]) {
                        return optionMap[String(answerValue)] + '（选项索引:' + answerValue + '）';
                    }
                    return String(answerValue);
                }

                if (questionType === 'multiple_choice') {
                    if (!Array.isArray(answerValue) || answerValue.length === 0) return '-';
                    return answerValue.map(function (value) {
                        return optionMap[String(value)] ? optionMap[String(value)] + '（选项索引:' + value + '）' : String(value);
                    }).join('；');
                }

                if (questionType === 'true_false') {
                    return answerValue ? '正确' : '错误';
                }

                if (questionType === 'fill_blank') {
                    return Array.isArray(answerValue) && answerValue.length ? answerValue.join('；') : '-';
                }

                if (questionType === 'matching' || questionType === 'table_question') {
                    try {
                        return JSON.stringify(answerValue);
                    } catch (e) {
                        return '-';
                    }
                }

                if (questionType === 'sort_question') {
                    return Array.isArray(answerValue) && answerValue.length ? answerValue.join(' -> ') : '-';
                }

                if (typeof answerValue === 'object') {
                    try {
                        return JSON.stringify(answerValue);
                    } catch (e) {
                        return '-';
                    }
                }

                return String(answerValue);
            }

            function lsOpenStudentDetail(sid, lid) {
                if (!sid) return;
                var modal = document.getElementById('lsStudentModal');
                var body = document.getElementById('lsStudentModalBody');
                if (!modal || !body) return;
                body.innerHTML = '正在加载学生学习详情...';
                if (modal.className.indexOf('is-open') < 0) modal.className += ' is-open';
                modal.setAttribute('aria-hidden', 'false');

                $.ajax({
                    url: '../teacher/learnprogress.ashx',
                    type: 'GET',
                    dataType: 'json',
                    data: { action: 'studentdetail', sid: sid, cid: lsCid, lid: lid || 0, sgrade: lsGrade, sclass: lsClass },
                    timeout: 6000,
                    success: function (resp) {
                        if (!resp || !resp.ok || !resp.data) {
                            body.innerHTML = '未获取到学生详情。';
                            return;
                        }
                        var data = resp.data;
                        window.lsStudentQuestionTitles = data.questionTitles || {};
                        window.lsStudentOptionTexts = data.optionTexts || {};
                        window.lsStudentBlankAnswers = data.blankAnswers || {};
                        var assessment = data.assessment;
                        if (!assessment) {
                            body.innerHTML = '<div class="ls-rt-modal__section"><span class="ls-rt-modal__label">学生信息</span><div class="ls-rt-modal__content">' + (data.sname || '') + '（' + (data.snum || '') + '）</div></div>' +
                                '<div class="ls-rt-modal__section"><span class="ls-rt-modal__label">AI 测验评估</span><div class="ls-rt-modal__content">当前学案下暂无该学生的 AI 测验评估记录。</div></div>';
                            return;
                        }
                        var isRuleAssessment = (assessment.providerName || '') === '规则评估';
                        var modeChipStyle = isRuleAssessment
                            ? 'background:#f1f5f9;color:#475569;border:1px solid #cbd5e1;'
                            : 'background:#dbeafe;color:#1d4ed8;border:1px solid #93c5fd;';
                        var chips = '<span class="ls-rt-chip" style="' + modeChipStyle + '">评估模式：' + (isRuleAssessment ? '规则评估模式' : 'AI 评估已启用') + '</span>' +
                            '<span class="ls-rt-chip">Provider：' + (assessment.providerName || '-') + '</span>' +
                            '<span class="ls-rt-chip">Skill：' + (assessment.skillName || '-') + '</span>' +
                            '<span class="ls-rt-chip">得分：' + (assessment.score || 0) + ' / ' + (assessment.questionCount || 0) + '</span>' +
                            '<span class="ls-rt-chip">生成时间：' + (assessment.createdAt || '-') + '</span>';
                        if (assessment.isFallback) {
                            chips += '<span class="ls-rt-chip">默认模板兜底</span>';
                        }
                        var answerLogHtml = lsRenderAnswerLog(assessment.answerLog || '');
                        body.innerHTML = '<div class="ls-rt-modal__section"><span class="ls-rt-modal__label">学生信息</span><div class="ls-rt-modal__content">' + (data.sname || '') + '（' + (data.snum || '') + '）</div></div>' +
                            '<div class="ls-rt-modal__section"><span class="ls-rt-modal__label">AI 测验评估概览</span><div class="ls-rt-modal__content">' + chips + '</div><div class="ls-rt-modal__content" style="margin-top:12px;">' + (assessment.summary || '') + '</div></div>' +
                            '<div class="ls-rt-modal__section"><span class="ls-rt-modal__label">AI 分析与建议</span><div class="ls-rt-modal__content">' + (assessment.assessmentContent || '').replace(/\n/g, '<br>') + '</div></div>' +
                            '<div class="ls-rt-modal__section"><span class="ls-rt-modal__label">学习日志</span><div class="ls-rt-modal__content">' + (assessment.learningLog || '').replace(/\n/g, '<br>') + '</div></div>' +
                            '<div class="ls-rt-modal__section"><span class="ls-rt-modal__label">答题记录</span>' + answerLogHtml + '</div>';
                    },
                    error: function () {
                        body.innerHTML = '加载学生详情失败，请稍后重试。';
                    }
                });
            }
        </script>
    </div>
</asp:Content>
