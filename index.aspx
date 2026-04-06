<%@ Page Title="" Language="C#" StylesheetTheme="Student" AutoEventWireup="true"
CodeFile="index.aspx.cs" Inherits="index" %>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>信息科技学习网站</title>
    <link
      href="../App_Themes/Student/StyleSheet.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="js/css/tailwind-utilities.css"
      rel="stylesheet"
    />
<style>
      .glass-panel {
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.3);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.15);
      }
      .bg-pattern {
        background-color: #f3f4f6;
        background-image: url('data:image/svg+xml,%3Csvg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg"%3E%3Cg fill="none" fill-rule="evenodd"%3E%3Cg fill="%239C92AC" fill-opacity="0.08"%3E%3Cpath d="M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z"/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');
      }
    </style>
  </head>
  <body class="bg-pattern min-h-screen flex flex-col font-sans text-gray-800">
    <form id="form1" runat="server" class="flex-grow flex flex-col">
      <!-- Header / Banner Area -->
      <header class="w-full bg-white shadow-sm border-b border-gray-200">
        <div
          class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center"
        >
          <div class="flex items-center">
            <svg
              class="h-8 w-8 text-blue-600 mr-3"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"
              />
            </svg>
            <h1 class="text-2xl font-bold text-gray-800 tracking-tight">
              信息科技学习网站
            </h1>
          </div>
          <div class="hidden sm:block">
            <span class="text-sm text-gray-500">欢迎来到学习平台</span>
          </div>
        </div>
      </header>

      <!-- Main Content -->
      <main class="flex-grow flex items-center justify-center p-4 sm:p-8">
        <div
          class="glass-panel rounded-2xl w-full max-w-md p-8 relative overflow-hidden transition-all duration-300 hover:shadow-xl"
        >
          <!-- Decorative element -->
          <div
            class="absolute top-0 right-0 -mr-8 -mt-8 w-32 h-32 rounded-full bg-blue-100 opacity-50 pointer-events-none"
          ></div>
          <div
            class="absolute bottom-0 left-0 -ml-8 -mb-8 w-24 h-24 rounded-full bg-green-100 opacity-50 pointer-events-none"
          ></div>

          <div class="relative z-10">
            <div class="text-center mb-8">
              <h2 class="indexhead text-3xl font-extrabold text-gray-900 mb-2">
                登录窗口
              </h2>
              <p class="text-sm text-gray-500">请输入您的学号和密码</p>
            </div>

            <div class="space-y-5">
              <div>
                <label
                  for="TextBoxuser"
                  class="block text-sm font-medium text-gray-700 mb-1"
                  >学号</label
                >
                <div class="relative">
                  <div
                    class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                  >
                    <svg
                      class="h-5 w-5 text-gray-400"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                      />
                    </svg>
                  </div>
                  <asp:TextBox
                    ID="TextBoxuser"
                    runat="server"
                    EnableViewState="False"
                    CssClass="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors shadow-sm text-gray-900 placeholder-gray-400"
                    placeholder="请输入学号"
                  ></asp:TextBox>
                </div>
              </div>

              <div>
                <label
                  for="TextBoxpwd"
                  class="block text-sm font-medium text-gray-700 mb-1"
                  >密码</label
                >
                <div class="relative">
                  <div
                    class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                  >
                    <svg
                      class="h-5 w-5 text-gray-400"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
                      />
                    </svg>
                  </div>
                  <asp:TextBox
                    ID="TextBoxpwd"
                    runat="server"
                    TextMode="Password"
                    EnableViewState="False"
                    AutoCompleteType="Disabled"
                    CssClass="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors shadow-sm text-gray-900 placeholder-gray-400"
                    placeholder="请输入密码"
                  ></asp:TextBox>
                </div>
              </div>

              <div class="pt-2">
                <asp:Button
                  ID="Btnlogin"
                  runat="server"
                  OnClick="Btnlogin_Click"
                  Text="登 录"
                  CssClass="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-md text-sm font-bold text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-all duration-200 cursor-pointer"
                />
              </div>

              <div class="text-center mt-2">
                <asp:Label
                  ID="Labelmsg"
                  runat="server"
                  SkinID="LabelMsgRed"
                  CssClass="text-red-500 text-sm font-medium block h-5"
                ></asp:Label>
              </div>
            </div>

            <!-- Action Links -->
            <div class="mt-8 pt-6 border-t border-gray-200">
              <div class="grid grid-cols-3 gap-3">
                <asp:HyperLink
                  ID="HyperLinkReg"
                  runat="server"
                  NavigateUrl="~/student/register.aspx"
                  Target="_self"
                  CssClass="flex items-center justify-center px-3 py-2 border border-transparent border-blue-200 shadow-sm text-sm font-medium rounded-lg text-blue-700 bg-blue-50 hover:bg-blue-100 hover:text-blue-800 transition-all duration-200"
                >
                  学员注册
                </asp:HyperLink>

                <asp:HyperLink
                  ID="HyperLinkSnum"
                  runat="server"
                  NavigateUrl="~/student/mynum.aspx"
                  Target="_self"
                  CssClass="flex items-center justify-center px-3 py-2 border border-transparent border-green-200 shadow-sm text-sm font-medium rounded-lg text-green-700 bg-green-50 hover:bg-green-100 hover:text-green-800 transition-all duration-200"
                >
                  学号查询
                </asp:HyperLink>

                <asp:HyperLink
                  ID="HyperLinkrule"
                  runat="server"
                  NavigateUrl="~/student/myrule.aspx"
                  CssClass="flex items-center justify-center px-2 py-2 border border-transparent text-xs font-medium rounded-md text-purple-700 bg-purple-100 hover:bg-purple-200 transition-colors"
                >
                  课堂守则
                </asp:HyperLink>
              </div>
            </div>
          </div>
        </div>
      </main>

      <!-- Footer -->
      <footer
        class="w-full bg-white bg-opacity-80 backdrop-blur-md border-t border-gray-200 py-6 mt-auto"
      >
        <div
          class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row justify-between items-center text-xs text-gray-500 space-y-4 md:space-y-0"
        >
          <div class="flex items-center space-x-4">
            <asp:Label ID="Labelversion" runat="server"></asp:Label>
            <asp:HyperLink
              ID="HLTeacher"
              runat="server"
              NavigateUrl="~/teacher/index.aspx"
              Target="_blank"
              CssClass="font-medium text-gray-600 hover:text-blue-600 transition-colors bg-gray-100 px-3 py-1 rounded-full border border-gray-200"
            >
              教师平台
            </asp:HyperLink>
          </div>

          <div
            class="flex flex-wrap justify-center md:justify-end items-center gap-x-4 gap-y-2"
          >
            <span class="flex items-center">
              <svg
                class="h-4 w-4 mr-1 text-gray-400"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"
                />
              </svg>
              IP:
              <asp:Label
                ID="Labelip"
                runat="server"
                CssClass="ml-1 font-mono"
              ></asp:Label>
            </span>
            <span class="flex items-center">
              <svg
                class="h-4 w-4 mr-1 text-gray-400"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z"
                />
              </svg>
              主机:
              <asp:Label
                ID="Labelhostname"
                runat="server"
                CssClass="ml-1 font-mono"
              ></asp:Label>
            </span>
            <span class="flex items-center">
              <svg
                class="h-4 w-4 mr-1 text-gray-400"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                />
              </svg>
              第<asp:Label
                ID="Labelterm"
                runat="server"
                CssClass="mx-1 font-semibold text-gray-700"
              ></asp:Label
              >学期
            </span>
          </div>
        </div>
        <div class="text-center mt-2 text-gray-400">
          <asp:Label
            ID="Labelloadtime"
            runat="server"
            Font-Italic="True"
          ></asp:Label>
        </div>
      </footer>

      <script type="text/javascript">
        function doubleCheck() {
          if (
            window.document.readyState != null &&
            window.document.readyState != "complete"
          ) {
            alert("正在处理，请等待！");
            return false;
          } else {
            return true;
          }
        }

        // Add slight animation to input fields on focus
        document.addEventListener("DOMContentLoaded", function () {
          const inputs = document.querySelectorAll(
            'input[type="text"], input[type="password"]',
          );
          inputs.forEach((input) => {
            input.addEventListener("focus", function () {
              this.parentElement.parentElement.classList.add(
                "transform",
                "-translate-y-1",
                "transition-transform",
                "duration-200",
              );
            });
            input.addEventListener("blur", function () {
              this.parentElement.parentElement.classList.remove(
                "transform",
                "-translate-y-1",
              );
            });
          });
        });
      </script>
    </form>
  </body>
</html>
