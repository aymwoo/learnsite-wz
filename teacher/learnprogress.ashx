<%@ WebHandler Language="C#" Class="learnprogress" %>

using System;
using System.Web;

/// <summary>
/// 教师端轮询接口：获取指定班级学生的实时学习状态
/// </summary>
public class learnprogress : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";
        context.Response.AddHeader("Cache-Control", "no-cache, no-store");

        try
        {
            // 验证教师身份
            if (context.Request.Cookies[LearnSite.Common.CookieHelp.teaCookieNname] == null)
            {
                context.Response.Write("{\"ok\":false,\"msg\":\"not authorized\"}");
                return;
            }

            string action = context.Request.QueryString["action"] ?? "status";
            string sgrade = context.Request.QueryString["sgrade"] ?? "0";
            string sclass = context.Request.QueryString["sclass"] ?? "0";

            int grade = int.Parse(sgrade);
            int cls = int.Parse(sclass);

            switch (action)
            {
                case "status":
                    // 返回该班级所有学生的学习状态列表
                    string statusJson = LearnSite.Common.LearnStatus.GetClassStatusJson(grade, cls);
                    context.Response.Write("{\"ok\":true,\"data\":" + statusJson + "}");
                    break;

                case "progress":
                    // 返回该班级的学习进度统计
                    string progressJson = LearnSite.Common.LearnStatus.GetClassProgressJson(grade, cls);
                    context.Response.Write("{\"ok\":true,\"data\":" + progressJson + "}");
                    break;

                case "all":
                    // 返回完整数据（状态列表 + 进度统计）
                    string allStatus = LearnSite.Common.LearnStatus.GetClassStatusJson(grade, cls);
                    string allProgress = LearnSite.Common.LearnStatus.GetClassProgressJson(grade, cls);
                    context.Response.Write("{\"ok\":true,\"students\":" + allStatus + ",\"progress\":" + allProgress + "}");
                    break;

                default:
                    context.Response.Write("{\"ok\":false,\"msg\":\"unknown action\"}");
                    break;
            }
        }
        catch (Exception ex)
        {
            context.Response.Write("{\"ok\":false,\"msg\":\"" + ex.Message.Replace("\"", "'") + "\"}");
        }
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
