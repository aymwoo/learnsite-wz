<%@ WebHandler Language="C#" Class="ResourceProxy" %>

using System;
using System.Web;
using System.Text;

public class ResourceProxy : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";
        context.Response.Charset = "utf-8";
        
        string action = context.Request["action"] ?? "";
        
        try
        {
            if (action == "geturl")
            {
                GetResourceUrl(context);
            }
            else if (action == "check")
            {
                CheckAccess(context);
            }
            else
            {
                context.Response.Write("{\"code\":-1,\"msg\":\"未知操作\"}");
            }
        }
        catch (Exception ex)
        {
            context.Response.Write("{\"code\":-1,\"msg\":\"" + ex.Message.Replace("\"", "\\\"") + "\"}");
        }
    }
    
    private void GetResourceUrl(HttpContext context)
    {
        if (!LearnSite.Common.CookieHelp.IsStudentLogin())
        {
            context.Response.Write("{\"code\":0,\"msg\":\"请先登录\"}");
            return;
        }
        
        string fidStr = context.Request["fid"] ?? "";
        if (string.IsNullOrEmpty(fidStr))
        {
            context.Response.Write("{\"code\":0,\"msg\":\"参数错误\"}");
            return;
        }
        
        int fid = 0;
        if (!int.TryParse(fidStr, out fid))
        {
            context.Response.Write("{\"code\":0,\"msg\":\"参数错误\"}");
            return;
        }
        
        LearnSite.Model.Cook cook = new LearnSite.Model.Cook();
        LearnSite.BLL.Soft st = new LearnSite.BLL.Soft();
        LearnSite.Model.Soft smodel = st.GetModel(fid);
        
        if (smodel == null)
        {
            context.Response.Write("{\"code\":0,\"msg\":\"资源不存在\"}");
            return;
        }
        
        int fopenValue = smodel.Fopen ?? 0;
        bool canAccess = false;
        
        string fclass = smodel.Fclass;
        switch (fclass)
        {
            case "微课":
            case "教程":
            case "资料":
                canAccess = true;
                break;
            case "软件":
                canAccess = st.IsDownCan();
                break;
            case "游戏":
            case "课程":
                if (fopenValue >= 10000)
                {
                    LearnSite.BLL.StudentScoreService scoreService = new LearnSite.BLL.StudentScoreService();
                    int comprehensiveScore = scoreService.GetComprehensiveScore(cook.Snum);
                    canAccess = comprehensiveScore >= (fopenValue - 10000);
                }
                else
                {
                    LearnSite.BLL.Works wbll = new LearnSite.BLL.Works();
                    int todayScore = wbll.GetTodayWorkScores(cook.Snum);
                    canAccess = todayScore > fopenValue - 1;
                }
                break;
            default:
                canAccess = false;
                break;
        }
        
        if (!canAccess)
        {
            context.Response.Write("{\"code\":0,\"msg\":\"权限不足\"}");
            return;
        }
        
        string token = GenerateToken(fid, cook.Sid);
        string proxyUrl = context.Request.Url.GetLeftPart(UriPartial.Authority) + context.Request.ApplicationPath;
        if (!proxyUrl.EndsWith("/"))
        {
            proxyUrl += "/";
        }
        proxyUrl += "api/ResourceAccess.ashx?token=" + token + "&fid=" + fid;
        
        context.Response.Write("{\"code\":1,\"url\":\"" + proxyUrl + "\"}");
    }
    
    private void CheckAccess(HttpContext context)
    {
        if (!LearnSite.Common.CookieHelp.IsStudentLogin())
        {
            context.Response.Write("{\"code\":0,\"msg\":\"请先登录\"}");
            return;
        }
        
        string fidStr = context.Request["fid"] ?? "";
        if (string.IsNullOrEmpty(fidStr))
        {
            context.Response.Write("{\"code\":0,\"msg\":\"参数错误\"}");
            return;
        }
        
        int fid = int.Parse(fidStr);
        LearnSite.Model.Cook cook = new LearnSite.Model.Cook();
        
        string tokenKey = "ResourceToken_" + fid + "_" + cook.Snum;
        string sessionToken = context.Session[tokenKey] as string;
        string requestToken = context.Request["token"] ?? "";
        
        if (!string.IsNullOrEmpty(sessionToken) && sessionToken == requestToken)
        {
            context.Response.Write("{\"code\":1,\"msg\":\"验证通过\"}");
        }
        else
        {
            context.Response.Write("{\"code\":0,\"msg\":\"验证失败\"}");
        }
    }
    
    private string GenerateToken(int fid, int sid)
    {
        string token = Guid.NewGuid().ToString("N");
        string tokenKey = "ResourceToken_" + fid + "_" + sid;
        HttpContext.Current.Session[tokenKey] = token;
        HttpContext.Current.Session[tokenKey + "_Time"] = DateTime.Now;
        return token;
    }
    
    public bool IsReusable
    {
        get { return false; }
    }
}
