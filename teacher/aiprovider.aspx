<%@ Page Title="AI Providers Settings" Language="C#" MasterPageFile="~/teacher/Teach.master" AutoEventWireup="true" CodeFile="aiprovider.aspx.cs" Inherits="Teacher_aiprovider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="p-6">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-gray-800">AI 模型提供商设置</h2>
            <div class="space-x-2">
                <button type="button" onclick="openImportModal()" class="px-4 py-2 bg-green-500 text-white rounded border-0 hover:bg-green-600 transition duration-300 shadow-md">
                    导入 JSON 配置
                </button>
                <button type="button" onclick="openModal()" class="px-4 py-2 bg-blue-500 text-white rounded border-0 hover:bg-blue-600 transition duration-300 shadow-md">
                    添加 AI 提供商
                </button>
            </div>
        </div>

        <div id="providersList" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Providers will be loaded here dynamically -->
        </div>
    </div>

    <!-- Add/Edit Provider Modal -->
    <div id="providerModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 backdrop-blur-sm hidden overflow-y-auto h-full w-full z-50 flex items-center justify-center p-4" onclick="closeModalOnOutsideClick(event, 'providerModalContent')">
        <div id="providerModalContent" class="relative w-full max-w-lg shadow-2xl rounded-2xl bg-white border border-gray-100 p-6 md:p-8" onclick="event.stopPropagation()">
            <div>
                <div class="flex justify-between items-center mb-6">
                    <h3 class="text-xl font-bold text-gray-800" id="modalTitle">添加 AI 提供商</h3>
                    <button type="button" onclick="closeModal()" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
                <div id="providerForm" class="space-y-5">
                    <input type="hidden" id="providerId" value="0">
                    
                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="displayName">显示名称 <span class="text-red-500">*</span></label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="displayName" type="text" placeholder="例如: 通义千问" required>
                    </div>
                    
                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="providerName">提供商名称 <span class="text-red-500">*</span></label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="providerName" type="text" placeholder="例如: Aliyun" required>
                    </div>

                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="modelName">模型名称 <span class="text-red-500">*</span></label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="modelName" type="text" placeholder="例如: qwen-max" required>
                    </div>

                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="apiKey">API Key</label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="apiKey" type="password" placeholder="填写对应的 API Key">
                    </div>

                    <div>
                        <label class="block text-gray-700 text-sm font-semibold mb-2" for="baseUrl">Base URL</label>
                        <input class="box-border w-full max-w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none" id="baseUrl" type="text" placeholder="https://api.openai.com/v1">
                    </div>

                    <div class="flex flex-col sm:flex-row items-center justify-between gap-3 sm:gap-0 mt-8 pt-6 border-t border-gray-100">
                        <div class="w-full sm:w-auto">
                            <button type="button" onclick="testConnection(event)" class="w-full sm:w-auto bg-green-500 hover:bg-green-600 text-white border-0 border-transparent font-semibold py-2.5 px-5 rounded-lg shadow-sm transition-all duration-200 flex items-center justify-center focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-1 whitespace-nowrap disabled:opacity-50 disabled:cursor-not-allowed">
                                <svg class="w-4 h-4 mr-2 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
                                <span>测试连接</span>
                            </button>
                        </div>
                        <div class="flex gap-3 w-full sm:w-auto">
                            <button type="button" onclick="closeModal()" class="flex-1 sm:flex-none bg-white border border-gray-300 hover:bg-gray-50 hover:border-gray-400 text-gray-700 font-semibold py-2.5 px-6 rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-gray-200 focus:ring-offset-1">
                                取消
                            </button>
                            <button type="button" onclick="saveProvider(event)" class="flex-1 sm:flex-none bg-blue-600 hover:bg-blue-700 text-white border-0 border-transparent font-semibold py-2.5 px-8 rounded-lg shadow-sm transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-1">
                                保存
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Import JSON Modal -->
    <div id="importModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 backdrop-blur-sm hidden overflow-y-auto h-full w-full z-50 flex items-center justify-center p-4" onclick="closeModalOnOutsideClick(event, 'importModalContent')">
        <div id="importModalContent" class="relative w-full max-w-2xl shadow-2xl rounded-2xl bg-white border border-gray-100 p-6 md:p-8" onclick="event.stopPropagation()">
            <div>
                <div class="flex justify-between items-center mb-6">
                    <h3 class="text-xl font-bold text-gray-800">导入 JSON 配置</h3>
                    <button type="button" onclick="closeImportModal()" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
                <div class="mb-6">
                    <p class="text-sm font-semibold text-gray-700 mb-3">格式示例:</p>
                    <pre class="bg-gray-50 border border-gray-200 p-4 rounded-lg text-xs font-mono text-gray-700 mb-4 overflow-x-auto shadow-inner">
[
  {
    "DisplayName": "通义千问",
    "ProviderName": "Aliyun",
    "ModelName": "qwen-max",
    "ApiKey": "YOUR_API_KEY",
    "BaseUrl": "https://dashscope.aliyuncs.com/compatible-mode/v1"
  }
]
                    </pre>
                    <textarea id="jsonConfigInput" rows="10" class="box-border w-full max-w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 outline-none font-mono text-sm" placeholder="粘贴 JSON 配置..."></textarea>
                </div>
                <div class="flex flex-col-reverse sm:flex-row items-center justify-end gap-3 mt-6 pt-6 border-t border-gray-100">
                    <button type="button" onclick="closeImportModal()" class="w-full sm:w-auto bg-white border border-gray-300 hover:bg-gray-50 text-gray-700 font-semibold py-2.5 px-6 rounded-lg transition-colors duration-200">
                        取消
                    </button>
                    <button type="button" onclick="importJsonConfig()" class="w-full sm:w-auto bg-green-600 hover:bg-green-700 text-white font-semibold py-2.5 px-6 rounded-lg shadow-sm transition-colors duration-200 flex items-center justify-center">
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"></path></svg>
                        导入
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            loadProviders();
        });

        function loadProviders() {
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: { action: 'list' },
                success: function(res) {
                    if (res.success) {
                        renderProviders(res.data);
                    } else {
                        alert("加载失败: " + res.msg);
                    }
                },
                error: function() {
                    alert("网络错误，无法加载数据。");
                }
            });
        }

        function renderProviders(data) {
            var html = '';
            if (data.length === 0) {
                html = '<div class="col-span-full text-center text-gray-500 py-8">暂无 AI 提供商配置，请点击右上角添加。</div>';
            } else {
                $.each(data, function(i, item) {
                    var defaultBadge = item.IsDefault ? '<span class="px-2 py-1 bg-green-100 text-green-800 text-xs rounded-full font-semibold border border-green-200">默认</span>' : '';
                    var hiddenKey = item.ApiKey ? '********' + item.ApiKey.substring(item.ApiKey.length - 4) : '未设置';
                    
                    html += '<div class="bg-white rounded-xl shadow-sm border ' + (item.IsDefault ? 'border-green-400 ring-1 ring-green-400' : 'border-gray-200') + ' overflow-hidden hover:shadow-md transition-shadow relative">';
                    html += '<div class="p-5">';
                    html += '<div class="flex justify-between items-start mb-4">';
                    html += '<div><h3 class="text-xl font-bold text-gray-800">' + item.DisplayName + '</h3>';
                    html += '<p class="text-sm text-gray-500">' + item.ProviderName + '</p></div>';
                    html += '<div>' + defaultBadge + '</div>';
                    html += '</div>';
                    
                    html += '<div class="space-y-2 mb-6">';
                    html += '<div class="flex items-center text-sm"><span class="text-gray-500 w-20">模型:</span><span class="font-medium text-gray-800">' + item.ModelName + '</span></div>';
                    html += '<div class="flex items-center text-sm"><span class="text-gray-500 w-20">API Key:</span><span class="font-mono text-gray-600 truncate">' + hiddenKey + '</span></div>';
                    html += '<div class="flex items-center text-sm"><span class="text-gray-500 w-20">Base URL:</span><span class="text-gray-600 truncate" title="' + item.BaseUrl + '">' + item.BaseUrl + '</span></div>';
                    html += '</div>';
                    
                    html += '<div class="flex justify-between items-center pt-4 border-t border-gray-100">';
                    html += '<div>';
                    if (!item.IsDefault) {
                        html += '<button type="button" onclick="setDefault(' + item.Id + ')" class="text-sm text-green-600 hover:text-green-800 border-0 bg-transparent mr-3">设为默认</button>';
                    }
                    html += '</div>';
                    html += '<div class="space-x-2">';
                    html += '<button type="button" onclick=\'editProvider(' + JSON.stringify(item).replace(/'/g, "\\'") + ')\' class="text-sm text-blue-600 hover:text-blue-800 px-3 py-1.5 bg-blue-50 hover:bg-blue-100 border-0 rounded transition-colors">编辑</button>';
                    html += '<button type="button" onclick="deleteProvider(' + item.Id + ')" class="text-sm text-red-600 hover:text-red-800 px-3 py-1.5 bg-red-50 hover:bg-red-100 border-0 rounded transition-colors">删除</button>';
                    html += '</div>';
                    html += '</div>';
                    html += '</div></div>';
                });
            }
            $('#providersList').html(html);
        }

        function openModal() {
            $('#modalTitle').text('添加 AI 提供商');
            $('#providerId').val('0');
            $('#displayName').val('');
            $('#providerName').val('');
            $('#modelName').val('');
            $('#apiKey').val('');
            $('#baseUrl').val('https://api.openai.com/v1');
            $('#providerModal').removeClass('hidden').addClass('flex');
        }

        function editProvider(item) {
            $('#modalTitle').text('编辑 AI 提供商');
            $('#providerId').val(item.Id);
            $('#displayName').val(item.DisplayName);
            $('#providerName').val(item.ProviderName);
            $('#modelName').val(item.ModelName);
            $('#apiKey').val(item.ApiKey);
            $('#baseUrl').val(item.BaseUrl);
            $('#providerModal').removeClass('hidden').addClass('flex');
        }

        function closeModal() {
            $('#providerModal').addClass('hidden').removeClass('flex');
        }

        function openImportModal() {
            $('#jsonConfigInput').val('');
            $('#importModal').removeClass('hidden').addClass('flex');
        }

        function closeImportModal() {
            $('#importModal').addClass('hidden').removeClass('flex');
        }

        function saveProvider(e) {
            e.preventDefault();
            var data = {
                action: 'save',
                id: $('#providerId').val(),
                displayName: $('#displayName').val(),
                providerName: $('#providerName').val(),
                modelName: $('#modelName').val(),
                apiKey: $('#apiKey').val(),
                baseUrl: $('#baseUrl').val()
            };

            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res.success) {
                        closeModal();
                        loadProviders();
                    } else {
                        alert("保存失败: " + res.msg);
                    }
                },
                error: function() {
                    alert("网络错误，保存失败。");
                }
            });
        }

        function deleteProvider(id) {
            if (confirm("确定要删除此配置吗？")) {
                $.ajax({
                    url: 'aiprovider_api.ashx',
                    type: 'POST',
                    data: { action: 'delete', id: id },
                    success: function(res) {
                        if (res.success) {
                            loadProviders();
                        } else {
                            alert("删除失败: " + res.msg);
                        }
                    },
                    error: function() {
                        alert("网络错误，删除失败。");
                    }
                });
            }
        }

        function setDefault(id) {
            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: { action: 'setdefault', id: id },
                success: function(res) {
                    if (res.success) {
                        loadProviders();
                    } else {
                        alert("设置失败: " + res.msg);
                    }
                },
                error: function() {
                    alert("网络错误，设置失败。");
                }
            });
        }

        function testConnection(e) {
            var btn = $(e.currentTarget);
            var span = btn.find('span');
            var originalText = span.text();
            span.text('测试中...');
            btn.prop('disabled', true);
            
            var data = {
                action: 'test',
                modelName: $('#modelName').val(),
                apiKey: $('#apiKey').val(),
                baseUrl: $('#baseUrl').val()
            };

            if (!data.baseUrl || !data.modelName) {
                alert("请至少填写 Base URL 和 模型名称");
                span.text(originalText);
                btn.prop('disabled', false);
                return;
            }

            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res.success) {
                        alert("测试成功！\n" + res.msg);
                    } else {
                        alert("测试失败:\n" + res.msg);
                    }
                },
                error: function() {
                    alert("网络错误，测试请求发送失败。");
                },
                complete: function() {
                    span.text(originalText);
                    btn.prop('disabled', false);
                }
            });
        }

        function importJsonConfig() {
            var jsonStr = $('#jsonConfigInput').val().trim();
            if (!jsonStr) {
                alert("请输入 JSON 配置。");
                return;
            }

            try {
                // Verify valid JSON before sending
                JSON.parse(jsonStr);
            } catch (e) {
                alert("JSON 格式不正确: " + e.message);
                return;
            }

            $.ajax({
                url: 'aiprovider_api.ashx',
                type: 'POST',
                data: { action: 'import', config: jsonStr },
                success: function(res) {
                    if (res.success) {
                        alert(res.msg);
                        closeImportModal();
                        loadProviders();
                    } else {
                        alert("导入失败: " + res.msg);
                    }
                },
                error: function() {
                    alert("网络错误，导入失败。");
                }
            });
        }
        
        // Handle clicking outside the modal content to close
        function closeModalOnOutsideClick(event, contentId) {
            var modalContent = document.getElementById(contentId);
            if (modalContent && !modalContent.contains(event.target)) {
                if (contentId === 'providerModalContent') {
                    closeModal();
                } else if (contentId === 'importModalContent') {
                    closeImportModal();
                }
            }
        }
        
        // Handle ESC key to close modal
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                if (!$('#providerModal').hasClass('hidden')) {
                    closeModal();
                }
                if (!$('#importModal').hasClass('hidden')) {
                    closeImportModal();
                }
            }
        });
    </script>
</asp:Content>
