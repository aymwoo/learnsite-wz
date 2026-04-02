<%@ Page Title="AI Providers Settings" Language="C#" MasterPageFile="~/teacher/Teach.master" AutoEventWireup="true" CodeFile="aiprovider.aspx.cs" Inherits="Teacher_aiprovider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="p-6">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-gray-800">AI 模型提供商设置</h2>
            <div class="space-x-2">
                <button type="button" onclick="openImportModal()" class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 transition duration-300 shadow-md">
                    导入 JSON 配置
                </button>
                <button type="button" onclick="openModal()" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300 shadow-md">
                    添加 AI 提供商
                </button>
            </div>
        </div>

        <div id="providersList" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Providers will be loaded here dynamically -->
        </div>
    </div>

    <!-- Add/Edit Provider Modal -->
    <div id="providerModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-96 md:w-1/2 lg:w-1/3 shadow-lg rounded-md bg-white">
            <div class="mt-3">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4" id="modalTitle">添加 AI 提供商</h3>
                <div id="providerForm">
                    <input type="hidden" id="providerId" value="0">
                    
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="displayName">显示名称 <span class="text-red-500">*</span></label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="displayName" type="text" placeholder="例如: 通义千问" required>
                    </div>
                    
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="providerName">提供商名称 <span class="text-red-500">*</span></label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="providerName" type="text" placeholder="例如: Aliyun" required>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="modelName">模型名称 <span class="text-red-500">*</span></label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="modelName" type="text" placeholder="例如: qwen-max" required>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="apiKey">API Key</label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="apiKey" type="password" placeholder="填写对应的 API Key">
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="baseUrl">Base URL</label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="baseUrl" type="text" placeholder="https://api.openai.com/v1">
                    </div>

                    <div class="flex items-center justify-between mt-6">
                        <div>
                            <button type="button" onclick="testConnection(event)" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline text-sm mr-2">
                                测试连接
                            </button>
                        </div>
                        <div>
                            <button type="button" onclick="closeModal()" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mr-2">
                                取消
                            </button>
                            <button type="button" onclick="saveProvider(event)" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                                保存
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Import JSON Modal -->
    <div id="importModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-11/12 md:w-2/3 lg:w-1/2 shadow-lg rounded-md bg-white">
            <div class="mt-3">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">导入 JSON 配置</h3>
                <div class="mb-4">
                    <p class="text-sm text-gray-600 mb-2">格式示例:</p>
                    <pre class="bg-gray-100 p-2 rounded text-xs text-gray-800 mb-2 overflow-x-auto">
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
                    <textarea id="jsonConfigInput" rows="10" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="粘贴 JSON 配置..."></textarea>
                </div>
                <div class="flex items-center justify-end mt-4">
                    <button type="button" onclick="closeImportModal()" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mr-2">
                        取消
                    </button>
                    <button type="button" onclick="importJsonConfig()" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
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
                        html += '<button onclick="setDefault(' + item.Id + ')" class="text-sm text-green-600 hover:text-green-800 mr-3">设为默认</button>';
                    }
                    html += '</div>';
                    html += '<div class="space-x-2">';
                    html += '<button onclick=\'editProvider(' + JSON.stringify(item).replace(/'/g, "\\'") + ')\' class="text-sm text-blue-600 hover:text-blue-800 px-2 py-1 bg-blue-50 rounded">编辑</button>';
                    html += '<button onclick="deleteProvider(' + item.Id + ')" class="text-sm text-red-600 hover:text-red-800 px-2 py-1 bg-red-50 rounded">删除</button>';
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
            $('#providerModal').removeClass('hidden');
        }

        function editProvider(item) {
            $('#modalTitle').text('编辑 AI 提供商');
            $('#providerId').val(item.Id);
            $('#displayName').val(item.DisplayName);
            $('#providerName').val(item.ProviderName);
            $('#modelName').val(item.ModelName);
            $('#apiKey').val(item.ApiKey);
            $('#baseUrl').val(item.BaseUrl);
            $('#providerModal').removeClass('hidden');
        }

        function closeModal() {
            $('#providerModal').addClass('hidden');
        }

        function openImportModal() {
            $('#jsonConfigInput').val('');
            $('#importModal').removeClass('hidden');
        }

        function closeImportModal() {
            $('#importModal').addClass('hidden');
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
            var btn = $(e.target);
            var originalText = btn.text();
            btn.text('测试中...').prop('disabled', true);
            
            var data = {
                action: 'test',
                modelName: $('#modelName').val(),
                apiKey: $('#apiKey').val(),
                baseUrl: $('#baseUrl').val()
            };

            if (!data.baseUrl || !data.modelName) {
                alert("请至少填写 Base URL 和 模型名称");
                btn.text(originalText).prop('disabled', false);
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
                    btn.text(originalText).prop('disabled', false);
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
    </script>
</asp:Content>
