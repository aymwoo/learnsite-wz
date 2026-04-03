<%@ WebHandler Language="C#" Class="aiprovider_api" %>

using System;
using System.Web;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.IO;
using System.Net;
using System.Text;

public class aiprovider_api : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";
        
        // Check teacher cookie exists (ashx cannot use JudgeTeacherCookies which returns void and does redirect)
        if (context.Request.Cookies[LearnSite.Common.CookieHelp.teaCookieNname] == null)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"Unauthorized\"}");
            return;
        }

        string action = context.Request["action"];
        
        try
        {
            switch (action)
            {
                case "list":
                    GetList(context);
                    break;
                case "save":
                    Save(context);
                    break;
                case "delete":
                    Delete(context);
                    break;
                case "setdefault":
                    SetDefault(context);
                    break;
                case "test":
                    TestConnection(context);
                    break;
                case "import":
                    ImportConfig(context);
                    break;
                default:
                    context.Response.Write("{\"success\":false,\"msg\":\"Unknown action\"}");
                    break;
            }
        }
        catch (Exception ex)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"" + ex.Message.Replace("\"", "'").Replace("\r", "").Replace("\n", " ") + "\"}");
        }
    }

    private void GetList(HttpContext context)
    {
        LearnSite.BLL.AIProvider bll = new LearnSite.BLL.AIProvider();
        List<LearnSite.Model.AIProvider> list = bll.GetModelList("");
        
        // Obscure API keys before sending to the client
        foreach (var item in list)
        {
            if (!string.IsNullOrEmpty(item.ApiKey))
            {
                if (item.ApiKey.Length > 4)
                {
                    item.ApiKey = "********" + item.ApiKey.Substring(item.ApiKey.Length - 4);
                }
                else
                {
                    item.ApiKey = "********";
                }
            }
        }
        
        string json = JsonConvert.SerializeObject(new { success = true, data = list });
        context.Response.Write(json);
    }

    private void Save(HttpContext context)
    {
        string idStr = context.Request["id"];
        string displayName = context.Request["displayName"];
        string providerName = context.Request["providerName"];
        string modelName = context.Request["modelName"];
        string apiKey = context.Request["apiKey"];
        string baseUrl = context.Request["baseUrl"];

        if (string.IsNullOrEmpty(displayName) || string.IsNullOrEmpty(providerName) || string.IsNullOrEmpty(modelName))
        {
            context.Response.Write("{\"success\":false,\"msg\":\"Please fill in all required fields.\"}");
            return;
        }

        LearnSite.Model.AIProvider model = new LearnSite.Model.AIProvider();
        model.DisplayName = displayName;
        model.ProviderName = providerName;
        model.ModelName = modelName;
        model.BaseUrl = baseUrl;

        LearnSite.BLL.AIProvider bll = new LearnSite.BLL.AIProvider();
        
        if (string.IsNullOrEmpty(idStr) || idStr == "0")
        {
            // Add
            model.ApiKey = apiKey;
            model.IsDefault = false;
            if (bll.GetModelList("").Count == 0)
            {
                model.IsDefault = true; // Make default if it's the first one
            }
            int id = bll.Add(model);
            if (id > 0)
            {
                context.Response.Write("{\"success\":true,\"msg\":\"Added successfully.\"}");
            }
            else
            {
                context.Response.Write("{\"success\":false,\"msg\":\"Failed to add.\"}");
            }
        }
        else
        {
            // Update
            int id = int.Parse(idStr);
            LearnSite.Model.AIProvider oldModel = bll.GetModel(id);
            if (oldModel != null)
            {
                // Do not overwrite API key if it's the obscured placeholder
                if (!string.IsNullOrEmpty(apiKey) && apiKey.StartsWith("********"))
                {
                    model.ApiKey = oldModel.ApiKey;
                }
                else
                {
                    model.ApiKey = apiKey; // Save the new explicit API key
                }
                
                model.Id = id;
                model.IsDefault = oldModel.IsDefault;
                if (bll.Update(model))
                {
                    context.Response.Write("{\"success\":true,\"msg\":\"Updated successfully.\"}");
                }
                else
                {
                    context.Response.Write("{\"success\":false,\"msg\":\"Failed to update.\"}");
                }
            }
            else
            {
                context.Response.Write("{\"success\":false,\"msg\":\"Record not found.\"}");
            }
        }
    }

    private void Delete(HttpContext context)
    {
        string idStr = context.Request["id"];
        if (!string.IsNullOrEmpty(idStr))
        {
            int id = int.Parse(idStr);
            LearnSite.BLL.AIProvider bll = new LearnSite.BLL.AIProvider();
            if (bll.Delete(id))
            {
                context.Response.Write("{\"success\":true,\"msg\":\"Deleted successfully.\"}");
            }
            else
            {
                context.Response.Write("{\"success\":false,\"msg\":\"Failed to delete.\"}");
            }
        }
        else
        {
            context.Response.Write("{\"success\":false,\"msg\":\"Invalid ID.\"}");
        }
    }

    private void SetDefault(HttpContext context)
    {
        string idStr = context.Request["id"];
        if (!string.IsNullOrEmpty(idStr))
        {
            int id = int.Parse(idStr);
            LearnSite.BLL.AIProvider bll = new LearnSite.BLL.AIProvider();
            if (bll.SetDefault(id))
            {
                context.Response.Write("{\"success\":true,\"msg\":\"Default provider set successfully.\"}");
            }
            else
            {
                context.Response.Write("{\"success\":false,\"msg\":\"Failed to set default.\"}");
            }
        }
        else
        {
            context.Response.Write("{\"success\":false,\"msg\":\"Invalid ID.\"}");
        }
    }

    private void TestConnection(HttpContext context)
    {
        string apiKey = context.Request["apiKey"];
        string baseUrl = context.Request["baseUrl"];
        string modelName = context.Request["modelName"];
        string idStr = context.Request["id"];
        
        if (string.IsNullOrEmpty(baseUrl))
        {
            context.Response.Write("{\"success\":false,\"msg\":\"Base URL is required for testing.\"}");
            return;
        }

        // If the apiKey contains asterisks, it means it's masked from the frontend.
        // We need to fetch the real apiKey from the database using the ID to test it.
        if (!string.IsNullOrEmpty(apiKey) && apiKey.StartsWith("********") && !string.IsNullOrEmpty(idStr) && idStr != "0")
        {
            int id = int.Parse(idStr);
            LearnSite.BLL.AIProvider bll = new LearnSite.BLL.AIProvider();
            LearnSite.Model.AIProvider existingModel = bll.GetModel(id);
            if (existingModel != null)
            {
                apiKey = existingModel.ApiKey;
            }
        }

        try
        {
            // Prepare OpenAI compatible request payload
            string testUrl = baseUrl.TrimEnd('/') + "/chat/completions";
            string payload = "{\"model\":\"" + modelName + "\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],\"max_tokens\":10}";
            
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(testUrl);
            request.Method = "POST";
            request.ContentType = "application/json";
            request.Timeout = 10000; // 10 seconds timeout
            
            if (!string.IsNullOrEmpty(apiKey))
            {
                request.Headers.Add("Authorization", "Bearer " + apiKey);
            }

            byte[] byteArray = Encoding.UTF8.GetBytes(payload);
            request.ContentLength = byteArray.Length;

            using (Stream dataStream = request.GetRequestStream())
            {
                dataStream.Write(byteArray, 0, byteArray.Length);
            }

            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    using (Stream responseStream = response.GetResponseStream())
                    {
                        using (StreamReader reader = new StreamReader(responseStream))
                        {
                            string responseFromServer = reader.ReadToEnd();
                            // Parse response just to check if it's valid JSON from OpenAI format
                            Newtonsoft.Json.Linq.JObject jsonResp = JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(responseFromServer);
                            if (jsonResp != null && jsonResp["choices"] != null)
                            {
                                context.Response.Write("{\"success\":true,\"msg\":\"Connection successful!\"}");
                            }
                            else
                            {
                                context.Response.Write("{\"success\":false,\"msg\":\"Connection succeeded, but response format is not standard OpenAI compatible.\"}");
                            }
                        }
                    }
                }
                else
                {
                    context.Response.Write("{\"success\":false,\"msg\":\"HTTP Error: " + response.StatusCode + "\"}");
                }
            }
        }
        catch (WebException wex)
        {
            string errorMsg = wex.Message;
            if (wex.Response != null)
            {
                using (HttpWebResponse errorResponse = (HttpWebResponse)wex.Response)
                {
                    errorMsg += " Status code: " + (int)errorResponse.StatusCode;
                    using (Stream responseStream = errorResponse.GetResponseStream())
                    {
                        if (responseStream != null)
                        {
                            using (StreamReader reader = new StreamReader(responseStream))
                            {
                                errorMsg += " Details: " + reader.ReadToEnd();
                            }
                        }
                    }
                }
            }
            context.Response.Write("{\"success\":false,\"msg\":\"Connection failed: " + errorMsg.Replace("\"", "'").Replace("\r", "").Replace("\n", " ") + "\"}");
        }
        catch (Exception ex)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"Test error: " + ex.Message.Replace("\"", "'").Replace("\r", "").Replace("\n", " ") + "\"}");
        }
    }
    
    private void ImportConfig(HttpContext context)
    {
        string jsonConfig = context.Request["config"];
        if (string.IsNullOrEmpty(jsonConfig))
        {
            context.Response.Write("{\"success\":false,\"msg\":\"Configuration JSON is empty.\"}");
            return;
        }

        try
        {
            List<LearnSite.Model.AIProvider> providers = JsonConvert.DeserializeObject<List<LearnSite.Model.AIProvider>>(jsonConfig);
            if (providers != null && providers.Count > 0)
            {
                LearnSite.BLL.AIProvider bll = new LearnSite.BLL.AIProvider();
                int successCount = 0;
                foreach (var provider in providers)
                {
                    if (!string.IsNullOrEmpty(provider.DisplayName) && !string.IsNullOrEmpty(provider.ModelName))
                    {
                        bll.Add(provider);
                        successCount++;
                    }
                }
                context.Response.Write("{\"success\":true,\"msg\":\"Successfully imported " + successCount + " provider(s).\"}");
            }
            else
            {
                context.Response.Write("{\"success\":false,\"msg\":\"Invalid JSON format or empty list.\"}");
            }
        }
        catch (Exception ex)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"Parse error: " + ex.Message.Replace("\"", "'").Replace("\r", "").Replace("\n", " ") + "\"}");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
}
