using System;
using System.Collections.Generic;
using System.Data;

namespace LearnSite.BLL
{
    public static class BllDataTableMappers
    {
        public static List<LearnSite.Model.Typer> MapTyperList(DataTable dt)
        {
            List<LearnSite.Model.Typer> modelList = new List<LearnSite.Model.Typer>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Typer model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Typer();
                    if (dt.Rows[n]["Tid"].ToString() != "")
                    {
                        model.Tid = int.Parse(dt.Rows[n]["Tid"].ToString());
                    }
                    if (dt.Rows[n]["Ttype"].ToString() != "")
                    {
                        model.Ttype = int.Parse(dt.Rows[n]["Ttype"].ToString());
                    }
                    if (dt.Rows[n]["Tuse"].ToString() != "")
                    {
                        model.Tuse = int.Parse(dt.Rows[n]["Tuse"].ToString());
                    }
                    model.Ttitle = dt.Rows[n]["Ttitle"].ToString();
                    model.Tcontent = dt.Rows[n]["Tcontent"].ToString();
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.QuizGrade> MapQuizGradeList(DataTable dt)
        {
            List<LearnSite.Model.QuizGrade> modelList = new List<LearnSite.Model.QuizGrade>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.QuizGrade model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.QuizGrade();
                    if (dt.Rows[n]["Qid"].ToString() != "")
                    {
                        model.Qid = int.Parse(dt.Rows[n]["Qid"].ToString());
                    }
                    if (dt.Rows[n]["Qobj"].ToString() != "")
                    {
                        model.Qobj = int.Parse(dt.Rows[n]["Qobj"].ToString());
                    }
                    model.Qclass = dt.Rows[n]["Qclass"].ToString();
                    if (dt.Rows[n]["Qhid"].ToString() != "")
                    {
                        model.Qhid = int.Parse(dt.Rows[n]["Qhid"].ToString());
                    }
                    if (dt.Rows[n]["Qonly"].ToString() != "")
                    {
                        model.Qonly = int.Parse(dt.Rows[n]["Qonly"].ToString());
                    }
                    if (dt.Rows[n]["Qmore"].ToString() != "")
                    {
                        model.Qmore = int.Parse(dt.Rows[n]["Qmore"].ToString());
                    }
                    if (dt.Rows[n]["Qjudge"].ToString() != "")
                    {
                        model.Qjudge = int.Parse(dt.Rows[n]["Qjudge"].ToString());
                    }
                    if (dt.Rows[n]["Qopen"].ToString() != "")
                    {
                        model.Qopen = dt.Rows[n]["Qopen"].ToString() == "1" || dt.Rows[n]["Qopen"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Qanswer"].ToString() != "")
                    {
                        model.Qanswer = dt.Rows[n]["Qanswer"].ToString() == "1" || dt.Rows[n]["Qanswer"].ToString().ToLower() == "true";
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.TermTotal> MapTermTotalList(DataTable dt)
        {
            List<LearnSite.Model.TermTotal> modelList = new List<LearnSite.Model.TermTotal>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.TermTotal model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.TermTotal();
                    if (dt.Rows[n]["Tid"].ToString() != "")
                    {
                        model.Tid = int.Parse(dt.Rows[n]["Tid"].ToString());
                    }
                    model.Tnum = dt.Rows[n]["Tnum"].ToString();
                    if (dt.Rows[n]["Tterm"].ToString() != "")
                    {
                        model.Tterm = int.Parse(dt.Rows[n]["Tterm"].ToString());
                    }
                    if (dt.Rows[n]["Tgrade"].ToString() != "")
                    {
                        model.Tgrade = int.Parse(dt.Rows[n]["Tgrade"].ToString());
                    }
                    if (dt.Rows[n]["Tscore"].ToString() != "")
                    {
                        model.Tscore = int.Parse(dt.Rows[n]["Tscore"].ToString());
                    }
                    if (dt.Rows[n]["Tgscore"].ToString() != "")
                    {
                        model.Tgscore = int.Parse(dt.Rows[n]["Tgscore"].ToString());
                    }
                    if (dt.Rows[n]["Tquiz"].ToString() != "")
                    {
                        model.Tquiz = int.Parse(dt.Rows[n]["Tquiz"].ToString());
                    }
                    if (dt.Rows[n]["Tattitude"].ToString() != "")
                    {
                        model.Tattitude = int.Parse(dt.Rows[n]["Tattitude"].ToString());
                    }
                    if (dt.Rows[n]["Twscore"].ToString() != "")
                    {
                        model.Twscore = int.Parse(dt.Rows[n]["Twscore"].ToString());
                    }
                    if (dt.Rows[n]["Ttscore"].ToString() != "")
                    {
                        model.Ttscore = int.Parse(dt.Rows[n]["Ttscore"].ToString());
                    }
                    if (dt.Rows[n]["Tpscore"].ToString() != "")
                    {
                        model.Tpscore = int.Parse(dt.Rows[n]["Tpscore"].ToString());
                    }
                    if (dt.Rows[n]["Tallscore"].ToString() != "")
                    {
                        model.Tallscore = int.Parse(dt.Rows[n]["Tallscore"].ToString());
                    }
                    model.Tape = dt.Rows[n]["Tape"].ToString();
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.AIProvider> MapAIProviderList(DataTable dt)
        {
            List<LearnSite.Model.AIProvider> modelList = new List<LearnSite.Model.AIProvider>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.AIProvider model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.AIProvider();
                    if (dt.Rows[n]["Id"].ToString() != "")
                    {
                        model.Id = int.Parse(dt.Rows[n]["Id"].ToString());
                    }
                    model.DisplayName = dt.Rows[n]["DisplayName"].ToString();
                    model.ProviderName = dt.Rows[n]["ProviderName"].ToString();
                    model.ModelName = dt.Rows[n]["ModelName"].ToString();
                    model.ApiKey = dt.Rows[n]["ApiKey"].ToString();
                    model.BaseUrl = dt.Rows[n]["BaseUrl"].ToString();
                    if (dt.Rows[n]["IsDefault"].ToString() != "")
                    {
                        model.IsDefault = dt.Rows[n]["IsDefault"].ToString() == "1" || dt.Rows[n]["IsDefault"].ToString().ToLower() == "true";
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.AISkill> MapAISkillList(DataTable dt)
        {
            List<LearnSite.Model.AISkill> modelList = new List<LearnSite.Model.AISkill>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.AISkill model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.AISkill();
                    if (dt.Rows[n]["Id"].ToString() != "")
                    {
                        model.Id = int.Parse(dt.Rows[n]["Id"].ToString());
                    }
                    model.SkillName = dt.Rows[n]["SkillName"].ToString();
                    model.PromptContent = dt.Rows[n]["PromptContent"].ToString();
                    if (dt.Rows[n]["IsActive"].ToString() != "")
                    {
                        model.IsActive = dt.Rows[n]["IsActive"].ToString() == "1" || dt.Rows[n]["IsActive"].ToString().ToLower() == "true";
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.TurtleMatch> MapTurtleMatchList(DataTable dt)
        {
            List<LearnSite.Model.TurtleMatch> modelList = new List<LearnSite.Model.TurtleMatch>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.TurtleMatch model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.TurtleMatch();
                    if (dt.Rows[n]["Mid"].ToString() != "")
                    {
                        model.Mid = int.Parse(dt.Rows[n]["Mid"].ToString());
                    }
                    if (dt.Rows[n]["Mhid"].ToString() != "")
                    {
                        model.Mhid = int.Parse(dt.Rows[n]["Mhid"].ToString());
                    }
                    model.Mtitle = dt.Rows[n]["Mtitle"].ToString();
                    model.Mcontent = dt.Rows[n]["Mcontent"].ToString();
                    if (dt.Rows[n]["Mbegin"].ToString() != "")
                    {
                        model.Mbegin = DateTime.Parse(dt.Rows[n]["Mbegin"].ToString());
                    }
                    if (dt.Rows[n]["Mend"].ToString() != "")
                    {
                        model.Mend = DateTime.Parse(dt.Rows[n]["Mend"].ToString());
                    }
                    if (dt.Rows[n]["Mpublish"].ToString() != "")
                    {
                        model.Mpublish = dt.Rows[n]["Mpublish"].ToString() == "1" || dt.Rows[n]["Mpublish"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Mdate"].ToString() != "")
                    {
                        model.Mdate = DateTime.Parse(dt.Rows[n]["Mdate"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Courses> MapCoursesList(DataTable dt)
        {
            List<LearnSite.Model.Courses> modelList = new List<LearnSite.Model.Courses>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Courses model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Courses();
                    if (dt.Rows[n]["Cid"].ToString() != "")
                    {
                        model.Cid = int.Parse(dt.Rows[n]["Cid"].ToString());
                    }
                    model.Ctitle = dt.Rows[n]["Ctitle"].ToString();
                    model.Cclass = dt.Rows[n]["Cclass"].ToString();
                    model.Ccontent = dt.Rows[n]["Ccontent"].ToString();
                    if (dt.Rows[n]["Cdate"].ToString() != "")
                    {
                        model.Cdate = DateTime.Parse(dt.Rows[n]["Cdate"].ToString());
                    }
                    if (dt.Rows[n]["Chit"].ToString() != "")
                    {
                        model.Chit = int.Parse(dt.Rows[n]["Chit"].ToString());
                    }
                    if (dt.Rows[n]["Cobj"].ToString() != "")
                    {
                        model.Cobj = int.Parse(dt.Rows[n]["Cobj"].ToString());
                    }
                    if (dt.Rows[n]["Cterm"].ToString() != "")
                    {
                        model.Cterm = int.Parse(dt.Rows[n]["Cterm"].ToString());
                    }
                    if (dt.Rows[n]["Cks"].ToString() != "")
                    {
                        model.Cks = int.Parse(dt.Rows[n]["Cks"].ToString());
                    }
                    model.Cfiletype = dt.Rows[n]["Cfiletype"].ToString();
                    if (dt.Rows[n]["Cupload"].ToString() != "")
                    {
                        model.Cupload = dt.Rows[n]["Cupload"].ToString() == "1" || dt.Rows[n]["Cupload"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Chid"].ToString() != "")
                    {
                        model.Chid = int.Parse(dt.Rows[n]["Chid"].ToString());
                    }
                    if (dt.Rows[n]["Cpublish"].ToString() != "")
                    {
                        model.Cpublish = dt.Rows[n]["Cpublish"].ToString() == "1" || dt.Rows[n]["Cpublish"].ToString().ToLower() == "true";
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Quiz> MapQuizList(DataTable dt)
        {
            List<LearnSite.Model.Quiz> modelList = new List<LearnSite.Model.Quiz>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Quiz model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Quiz();
                    if (dt.Rows[n]["Qid"].ToString() != "")
                    {
                        model.Qid = int.Parse(dt.Rows[n]["Qid"].ToString());
                    }
                    if (dt.Rows[n]["Qtype"].ToString() != "")
                    {
                        model.Qtype = int.Parse(dt.Rows[n]["Qtype"].ToString());
                    }
                    model.Question = dt.Rows[n]["Question"].ToString();
                    model.Qanswer = dt.Rows[n]["Qanswer"].ToString();
                    model.Qanalyze = dt.Rows[n]["Qanalyze"].ToString();
                    if (dt.Rows[n]["Qscore"].ToString() != "")
                    {
                        model.Qscore = int.Parse(dt.Rows[n]["Qscore"].ToString());
                    }
                    model.Qclass = dt.Rows[n]["Qclass"].ToString();
                    if (dt.Rows[n]["Qselect"].ToString() != "")
                    {
                        model.Qselect = dt.Rows[n]["Qselect"].ToString() == "1" || dt.Rows[n]["Qselect"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Qright"].ToString() != "")
                    {
                        model.Qright = int.Parse(dt.Rows[n]["Qright"].ToString());
                    }
                    if (dt.Rows[n]["Qwrong"].ToString() != "")
                    {
                        model.Qwrong = int.Parse(dt.Rows[n]["Qwrong"].ToString());
                    }
                    if (dt.Rows[n]["Qaccuracy"].ToString() != "")
                    {
                        model.Qaccuracy = int.Parse(dt.Rows[n]["Qaccuracy"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Signin> MapSigninList(DataTable dt)
        {
            List<LearnSite.Model.Signin> modelList = new List<LearnSite.Model.Signin>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Signin model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Signin();
                    if (dt.Rows[n]["Qid"].ToString() != "")
                    {
                        model.Qid = int.Parse(dt.Rows[n]["Qid"].ToString());
                    }
                    model.Qnum = dt.Rows[n]["Qnum"].ToString();
                    if (dt.Rows[n]["Qattitude"].ToString() != "")
                    {
                        model.Qattitude = int.Parse(dt.Rows[n]["Qattitude"].ToString());
                    }
                    if (dt.Rows[n]["Qdate"].ToString() != "")
                    {
                        model.Qdate = DateTime.Parse(dt.Rows[n]["Qdate"].ToString());
                    }
                    if (dt.Rows[n]["Qyear"].ToString() != "")
                    {
                        model.Qyear = int.Parse(dt.Rows[n]["Qyear"].ToString());
                    }
                    if (dt.Rows[n]["Qmonth"].ToString() != "")
                    {
                        model.Qmonth = int.Parse(dt.Rows[n]["Qmonth"].ToString());
                    }
                    if (dt.Rows[n]["Qday"].ToString() != "")
                    {
                        model.Qday = int.Parse(dt.Rows[n]["Qday"].ToString());
                    }
                    model.Qweek = dt.Rows[n]["Qweek"].ToString();
                    model.Qip = dt.Rows[n]["Qip"].ToString();
                    model.Qmachine = dt.Rows[n]["Qmachine"].ToString();
                    model.Qnote = dt.Rows[n]["Qnote"].ToString();
                    if (dt.Rows[n]["Qwork"].ToString() != "")
                    {
                        model.Qwork = int.Parse(dt.Rows[n]["Qwork"].ToString());
                    }
                    if (dt.Rows[n]["Qgrade"].ToString() != "")
                    {
                        model.Qgrade = int.Parse(dt.Rows[n]["Qgrade"].ToString());
                    }
                    if (dt.Rows[n]["Qterm"].ToString() != "")
                    {
                        model.Qterm = int.Parse(dt.Rows[n]["Qterm"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.AICustomSkill> MapAICustomSkillList(DataTable dt)
        {
            List<LearnSite.Model.AICustomSkill> modelList = new List<LearnSite.Model.AICustomSkill>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.AICustomSkill model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.AICustomSkill();
                    if (dt.Rows[n]["Id"].ToString() != "")
                    {
                        model.Id = int.Parse(dt.Rows[n]["Id"].ToString());
                    }
                    model.SkillName = dt.Rows[n]["SkillName"].ToString();
                    model.PromptContent = dt.Rows[n]["PromptContent"].ToString();
                    model.SkillScope = dt.Rows[n]["SkillScope"].ToString();
                    if (dt.Rows[n]["IsActive"].ToString() != "")
                    {
                        model.IsActive = dt.Rows[n]["IsActive"].ToString() == "1" || dt.Rows[n]["IsActive"].ToString().ToLower() == "true";
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.SoftCategory> MapSoftCategoryList(DataTable dt)
        {
            List<LearnSite.Model.SoftCategory> modelList = new List<LearnSite.Model.SoftCategory>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.SoftCategory model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.SoftCategory();
                    if (dt.Rows[n]["Yid"].ToString() != "")
                    {
                        model.Yid = int.Parse(dt.Rows[n]["Yid"].ToString());
                    }
                    if (dt.Rows[n]["Ysort"].ToString() != "")
                    {
                        model.Ysort = int.Parse(dt.Rows[n]["Ysort"].ToString());
                    }
                    model.Ytitle = dt.Rows[n]["Ytitle"].ToString();
                    model.Ycontent = dt.Rows[n]["Ycontent"].ToString();
                    if (dt.Rows[n]["Yopen"].ToString() != "")
                    {
                        model.Yopen = dt.Rows[n]["Yopen"].ToString() == "1" || dt.Rows[n]["Yopen"].ToString().ToLower() == "true";
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Works> MapWorksList(DataTable dt)
        {
            List<LearnSite.Model.Works> modelList = new List<LearnSite.Model.Works>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Works model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Works();
                    if (dt.Rows[n]["Wid"].ToString() != "")
                    {
                        model.Wid = int.Parse(dt.Rows[n]["Wid"].ToString());
                    }
                    model.Wnum = dt.Rows[n]["Wnum"].ToString();
                    if (dt.Rows[n]["Wcid"].ToString() != "")
                    {
                        model.Wcid = int.Parse(dt.Rows[n]["Wcid"].ToString());
                    }
                    if (dt.Rows[n]["Wmid"].ToString() != "")
                    {
                        model.Wmid = int.Parse(dt.Rows[n]["Wmid"].ToString());
                    }
                    if (dt.Rows[n]["Wmsort"].ToString() != "")
                    {
                        model.Wmsort = int.Parse(dt.Rows[n]["Wmsort"].ToString());
                    }
                    model.Wfilename = dt.Rows[n]["Wfilename"].ToString();
                    model.Wurl = dt.Rows[n]["Wurl"].ToString();
                    if (dt.Rows[n]["Wlength"].ToString() != "")
                    {
                        model.Wlength = int.Parse(dt.Rows[n]["Wlength"].ToString());
                    }
                    if (dt.Rows[n]["Wscore"].ToString() != "")
                    {
                        model.Wscore = int.Parse(dt.Rows[n]["Wscore"].ToString());
                    }
                    if (dt.Rows[n]["Wdate"].ToString() != "")
                    {
                        model.Wdate = DateTime.Parse(dt.Rows[n]["Wdate"].ToString());
                    }
                    model.Wip = dt.Rows[n]["Wip"].ToString();
                    model.Wtime = dt.Rows[n]["Wtime"].ToString();
                    if (dt.Rows[n]["Wvote"].ToString() != "")
                    {
                        model.Wvote = int.Parse(dt.Rows[n]["Wvote"].ToString());
                    }
                    if (dt.Rows[n]["Wegg"].ToString() != "")
                    {
                        model.Wegg = int.Parse(dt.Rows[n]["Wegg"].ToString());
                    }
                    if (dt.Rows[n]["Wcheck"].ToString() != "")
                    {
                        model.Wcheck = dt.Rows[n]["Wcheck"].ToString() == "1" || dt.Rows[n]["Wcheck"].ToString().ToLower() == "true";
                    }
                    model.Wself = dt.Rows[n]["Wself"].ToString();
                    if (dt.Rows[n]["Wcan"].ToString() != "")
                    {
                        model.Wcan = dt.Rows[n]["Wcan"].ToString() == "1" || dt.Rows[n]["Wcan"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Wgood"].ToString() != "")
                    {
                        model.Wgood = dt.Rows[n]["Wgood"].ToString() == "1" || dt.Rows[n]["Wgood"].ToString().ToLower() == "true";
                    }
                    model.Wtype = dt.Rows[n]["Wtype"].ToString();
                    if (dt.Rows[n]["Wgrade"].ToString() != "")
                    {
                        model.Wgrade = int.Parse(dt.Rows[n]["Wgrade"].ToString());
                    }
                    if (dt.Rows[n]["Wterm"].ToString() != "")
                    {
                        model.Wterm = int.Parse(dt.Rows[n]["Wterm"].ToString());
                    }
                    if (dt.Rows[n]["Whit"].ToString() != "")
                    {
                        model.Whit = int.Parse(dt.Rows[n]["Whit"].ToString());
                    }
                    if (dt.Rows[n]["Wlscore"].ToString() != "")
                    {
                        model.Wlscore = int.Parse(dt.Rows[n]["Wlscore"].ToString());
                    }
                    if (dt.Rows[n]["Wlemotion"].ToString() != "")
                    {
                        model.Wlemotion = int.Parse(dt.Rows[n]["Wlemotion"].ToString());
                    }
                    if (dt.Rows[n]["Woffice"].ToString() != "")
                    {
                        model.Woffice = dt.Rows[n]["Woffice"].ToString() == "1" || dt.Rows[n]["Woffice"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Wflash"].ToString() != "")
                    {
                        model.Wflash = dt.Rows[n]["Wflash"].ToString() == "1" || dt.Rows[n]["Wflash"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Werror"].ToString() != "")
                    {
                        model.Wflash = dt.Rows[n]["Werror"].ToString() == "1" || dt.Rows[n]["Werror"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Wfscore"].ToString() != "")
                    {
                        model.Wfscore = int.Parse(dt.Rows[n]["Wfscore"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Solves> MapSolvesList(DataTable dt)
        {
            List<LearnSite.Model.Solves> modelList = new List<LearnSite.Model.Solves>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Solves model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Solves();
                    if (dt.Rows[n]["Vid"] != null && dt.Rows[n]["Vid"].ToString() != "")
                    {
                        model.Vid = int.Parse(dt.Rows[n]["Vid"].ToString());
                    }
                    if (dt.Rows[n]["Vpid"] != null && dt.Rows[n]["Vpid"].ToString() != "")
                    {
                        model.Vpid = int.Parse(dt.Rows[n]["Vpid"].ToString());
                    }
                    if (dt.Rows[n]["Vsid"] != null && dt.Rows[n]["Vsid"].ToString() != "")
                    {
                        model.Vsid = int.Parse(dt.Rows[n]["Vsid"].ToString());
                    }
                    if (dt.Rows[n]["Vanswer"] != null && dt.Rows[n]["Vanswer"].ToString() != "")
                    {
                        model.Vanswer = dt.Rows[n]["Vanswer"].ToString();
                    }
                    if (dt.Rows[n]["Vright"] != null && dt.Rows[n]["Vright"].ToString() != "")
                    {
                        model.Vright = dt.Rows[n]["Vright"].ToString() == "1" || dt.Rows[n]["Vright"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Vscore"] != null && dt.Rows[n]["Vscore"].ToString() != "")
                    {
                        model.Vscore = int.Parse(dt.Rows[n]["Vscore"].ToString());
                    }
                    if (dt.Rows[n]["Vdate"] != null && dt.Rows[n]["Vdate"].ToString() != "")
                    {
                        model.Vdate = DateTime.Parse(dt.Rows[n]["Vdate"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.TxtForm> MapTxtFormList(DataTable dt)
        {
            List<LearnSite.Model.TxtForm> modelList = new List<LearnSite.Model.TxtForm>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.TxtForm model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.TxtForm();
                    if (dt.Rows[n]["Mid"] != null && dt.Rows[n]["Mid"].ToString() != "")
                    {
                        model.Mid = int.Parse(dt.Rows[n]["Mid"].ToString());
                    }
                    if (dt.Rows[n]["Mtitle"] != null)
                    {
                        model.Mtitle = dt.Rows[n]["Mtitle"].ToString();
                    }
                    if (dt.Rows[n]["Mcid"] != null && dt.Rows[n]["Mcid"].ToString() != "")
                    {
                        model.Mcid = int.Parse(dt.Rows[n]["Mcid"].ToString());
                    }
                    if (dt.Rows[n]["Mcontent"] != null)
                    {
                        model.Mcontent = dt.Rows[n]["Mcontent"].ToString();
                    }
                    if (dt.Rows[n]["Mdate"] != null && dt.Rows[n]["Mdate"].ToString() != "")
                    {
                        model.Mdate = DateTime.Parse(dt.Rows[n]["Mdate"].ToString());
                    }
                    if (dt.Rows[n]["Mhit"] != null && dt.Rows[n]["Mhit"].ToString() != "")
                    {
                        model.Mhit = int.Parse(dt.Rows[n]["Mhit"].ToString());
                    }
                    if (dt.Rows[n]["Mpublish"] != null && dt.Rows[n]["Mpublish"].ToString() != "")
                    {
                        model.Mpublish = dt.Rows[n]["Mpublish"].ToString() == "1" || dt.Rows[n]["Mpublish"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Mdelete"] != null && dt.Rows[n]["Mdelete"].ToString() != "")
                    {
                        model.Mdelete = dt.Rows[n]["Mdelete"].ToString() == "1" || dt.Rows[n]["Mdelete"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Mcollabo"] != null && dt.Rows[n]["Mcollabo"].ToString() != "")
                    {
                        model.Mcollabo = dt.Rows[n]["Mcollabo"].ToString() == "1" || dt.Rows[n]["Mcollabo"].ToString().ToLower() == "true";
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.MenuWorks> MapMenuWorksList(DataTable dt)
        {
            List<LearnSite.Model.MenuWorks> modelList = new List<LearnSite.Model.MenuWorks>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.MenuWorks model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.MenuWorks();
                    if (dt.Rows[n]["Kid"] != null && dt.Rows[n]["Kid"].ToString() != "")
                    {
                        model.Kid = int.Parse(dt.Rows[n]["Kid"].ToString());
                    }
                    if (dt.Rows[n]["Ksid"] != null && dt.Rows[n]["Ksid"].ToString() != "")
                    {
                        model.Ksid = int.Parse(dt.Rows[n]["Ksid"].ToString());
                    }
                    if (dt.Rows[n]["Klid"] != null && dt.Rows[n]["Klid"].ToString() != "")
                    {
                        model.Klid = int.Parse(dt.Rows[n]["Klid"].ToString());
                    }
                    if (dt.Rows[n]["Ktime"] != null && dt.Rows[n]["Ktime"].ToString() != "")
                    {
                        model.Ktime = int.Parse(dt.Rows[n]["Ktime"].ToString());
                    }
                    if (dt.Columns.Contains("Kseconds") && dt.Rows[n]["Kseconds"] != null && dt.Rows[n]["Kseconds"].ToString() != "")
                    {
                        model.Kseconds = int.Parse(dt.Rows[n]["Kseconds"].ToString());
                    }
                    if (dt.Rows[n]["Kcheck"] != null && dt.Rows[n]["Kcheck"].ToString() != "")
                    {
                        model.Kcheck = dt.Rows[n]["Kcheck"].ToString() == "1" || dt.Rows[n]["Kcheck"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Kstar"] != null && dt.Rows[n]["Kstar"].ToString() != "")
                    {
                        model.Kstar = int.Parse(dt.Rows[n]["Kstar"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.TxtFormBack> MapTxtFormBackList(DataTable dt)
        {
            List<LearnSite.Model.TxtFormBack> modelList = new List<LearnSite.Model.TxtFormBack>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.TxtFormBack model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.TxtFormBack();
                    if (dt.Rows[n]["Rid"] != null && dt.Rows[n]["Rid"].ToString() != "")
                    {
                        model.Rid = int.Parse(dt.Rows[n]["Rid"].ToString());
                    }
                    if (dt.Rows[n]["Rmid"] != null && dt.Rows[n]["Rmid"].ToString() != "")
                    {
                        model.Rmid = int.Parse(dt.Rows[n]["Rmid"].ToString());
                    }
                    if (dt.Rows[n]["Rsnum"] != null)
                    {
                        model.Rsnum = dt.Rows[n]["Rsnum"].ToString();
                    }
                    if (dt.Rows[n]["Rsid"] != null && dt.Rows[n]["Rsid"].ToString() != "")
                    {
                        model.Rsid = int.Parse(dt.Rows[n]["Rsid"].ToString());
                    }
                    if (dt.Rows[n]["Rwords"] != null)
                    {
                        model.Rwords = dt.Rows[n]["Rwords"].ToString();
                    }
                    if (dt.Rows[n]["Rtime"] != null && dt.Rows[n]["Rtime"].ToString() != "")
                    {
                        model.Rtime = DateTime.Parse(dt.Rows[n]["Rtime"].ToString());
                    }
                    if (dt.Rows[n]["Rip"] != null)
                    {
                        model.Rip = dt.Rows[n]["Rip"].ToString();
                    }
                    if (dt.Rows[n]["Rscore"] != null && dt.Rows[n]["Rscore"].ToString() != "")
                    {
                        model.Rscore = int.Parse(dt.Rows[n]["Rscore"].ToString());
                    }
                    if (dt.Rows[n]["Ryear"] != null && dt.Rows[n]["Ryear"].ToString() != "")
                    {
                        model.Ryear = int.Parse(dt.Rows[n]["Ryear"].ToString());
                    }
                    if (dt.Rows[n]["Rterm"] != null && dt.Rows[n]["Rterm"].ToString() != "")
                    {
                        model.Rterm = int.Parse(dt.Rows[n]["Rterm"].ToString());
                    }
                    if (dt.Rows[n]["Rgrade"] != null && dt.Rows[n]["Rgrade"].ToString() != "")
                    {
                        model.Rgrade = int.Parse(dt.Rows[n]["Rgrade"].ToString());
                    }
                    if (dt.Rows[n]["Rclass"] != null && dt.Rows[n]["Rclass"].ToString() != "")
                    {
                        model.Rclass = int.Parse(dt.Rows[n]["Rclass"].ToString());
                    }
                    if (dt.Rows[n]["Ragree"] != null && dt.Rows[n]["Ragree"].ToString() != "")
                    {
                        model.Ragree = int.Parse(dt.Rows[n]["Ragree"].ToString());
                    }
                    if (dt.Columns.Contains("Rlid") && dt.Rows[n]["Rlid"] != null && dt.Rows[n]["Rlid"].ToString() != "")
                    {
                        model.Rlid = int.Parse(dt.Rows[n]["Rlid"].ToString());
                    }
                    if (dt.Columns.Contains("Rcontent") && dt.Rows[n]["Rcontent"] != null)
                    {
                        model.Rcontent = dt.Rows[n]["Rcontent"].ToString();
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Survey> MapSurveyList(DataTable dt)
        {
            List<LearnSite.Model.Survey> modelList = new List<LearnSite.Model.Survey>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Survey model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Survey();
                    if (dt.Rows[n]["Vid"] != null && dt.Rows[n]["Vid"].ToString() != "")
                    {
                        model.Vid = int.Parse(dt.Rows[n]["Vid"].ToString());
                    }
                    if (dt.Rows[n]["Vcid"] != null && dt.Rows[n]["Vcid"].ToString() != "")
                    {
                        model.Vcid = int.Parse(dt.Rows[n]["Vcid"].ToString());
                    }
                    if (dt.Rows[n]["Vhid"] != null && dt.Rows[n]["Vhid"].ToString() != "")
                    {
                        model.Vhid = int.Parse(dt.Rows[n]["Vhid"].ToString());
                    }
                    if (dt.Rows[n]["Vtitle"] != null && dt.Rows[n]["Vtitle"].ToString() != "")
                    {
                        model.Vtitle = dt.Rows[n]["Vtitle"].ToString();
                    }
                    if (dt.Rows[n]["Vcontent"] != null && dt.Rows[n]["Vcontent"].ToString() != "")
                    {
                        model.Vcontent = dt.Rows[n]["Vcontent"].ToString();
                    }
                    if (dt.Rows[n]["Vtype"] != null && dt.Rows[n]["Vtype"].ToString() != "")
                    {
                        model.Vtype = int.Parse(dt.Rows[n]["Vtype"].ToString());
                    }
                    if (dt.Rows[n]["Vtotal"] != null && dt.Rows[n]["Vtotal"].ToString() != "")
                    {
                        model.Vtotal = int.Parse(dt.Rows[n]["Vtotal"].ToString());
                    }
                    if (dt.Rows[n]["Vscore"] != null && dt.Rows[n]["Vscore"].ToString() != "")
                    {
                        model.Vscore = int.Parse(dt.Rows[n]["Vscore"].ToString());
                    }
                    if (dt.Rows[n]["Vaverage"] != null && dt.Rows[n]["Vaverage"].ToString() != "")
                    {
                        model.Vaverage = int.Parse(dt.Rows[n]["Vaverage"].ToString());
                    }
                    if (dt.Rows[n]["Vclose"] != null && dt.Rows[n]["Vclose"].ToString() != "")
                    {
                        model.Vclose = dt.Rows[n]["Vclose"].ToString() == "1" || dt.Rows[n]["Vclose"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Vpoint"] != null && dt.Rows[n]["Vpoint"].ToString() != "")
                    {
                        model.Vpoint = dt.Rows[n]["Vpoint"].ToString() == "1" || dt.Rows[n]["Vpoint"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Vdate"] != null && dt.Rows[n]["Vdate"].ToString() != "")
                    {
                        model.Vdate = DateTime.Parse(dt.Rows[n]["Vdate"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.SurveyItem> MapSurveyItemList(DataTable dt)
        {
            List<LearnSite.Model.SurveyItem> modelList = new List<LearnSite.Model.SurveyItem>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.SurveyItem model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.SurveyItem();
                    if (dt.Rows[n]["Mid"] != null && dt.Rows[n]["Mid"].ToString() != "")
                    {
                        model.Mid = int.Parse(dt.Rows[n]["Mid"].ToString());
                    }
                    if (dt.Rows[n]["Mqid"] != null && dt.Rows[n]["Mqid"].ToString() != "")
                    {
                        model.Mqid = int.Parse(dt.Rows[n]["Mqid"].ToString());
                    }
                    if (dt.Rows[n]["Mvid"] != null && dt.Rows[n]["Mvid"].ToString() != "")
                    {
                        model.Mvid = int.Parse(dt.Rows[n]["Mvid"].ToString());
                    }
                    if (dt.Rows[n]["Mitem"] != null && dt.Rows[n]["Mitem"].ToString() != "")
                    {
                        model.Mitem = dt.Rows[n]["Mitem"].ToString();
                    }
                    if (dt.Rows[n]["Mscore"] != null && dt.Rows[n]["Mscore"].ToString() != "")
                    {
                        model.Mscore = int.Parse(dt.Rows[n]["Mscore"].ToString());
                    }
                    if (dt.Rows[n]["Mcount"] != null && dt.Rows[n]["Mcount"].ToString() != "")
                    {
                        model.Mcount = int.Parse(dt.Rows[n]["Mcount"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.SurveyQuestion> MapSurveyQuestionList(DataTable dt)
        {
            List<LearnSite.Model.SurveyQuestion> modelList = new List<LearnSite.Model.SurveyQuestion>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.SurveyQuestion model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.SurveyQuestion();
                    if (dt.Rows[n]["Qid"] != null && dt.Rows[n]["Qid"].ToString() != "")
                    {
                        model.Qid = int.Parse(dt.Rows[n]["Qid"].ToString());
                    }
                    if (dt.Rows[n]["Qvid"] != null && dt.Rows[n]["Qvid"].ToString() != "")
                    {
                        model.Qvid = int.Parse(dt.Rows[n]["Qvid"].ToString());
                    }
                    if (dt.Rows[n]["Qcid"] != null && dt.Rows[n]["Qcid"].ToString() != "")
                    {
                        model.Qcid = int.Parse(dt.Rows[n]["Qcid"].ToString());
                    }
                    if (dt.Rows[n]["Qtitle"] != null && dt.Rows[n]["Qtitle"].ToString() != "")
                    {
                        model.Qtitle = dt.Rows[n]["Qtitle"].ToString();
                    }
                    if (dt.Rows[n]["Qcount"] != null && dt.Rows[n]["Qcount"].ToString() != "")
                    {
                        model.Qcount = int.Parse(dt.Rows[n]["Qcount"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Soft> MapSoftList(DataTable dt)
        {
            List<LearnSite.Model.Soft> modelList = new List<LearnSite.Model.Soft>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Soft model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Soft();
                    if (dt.Rows[n]["Fid"].ToString() != "")
                    {
                        model.Fid = int.Parse(dt.Rows[n]["Fid"].ToString());
                    }
                    model.Ftitle = dt.Rows[n]["Ftitle"].ToString();
                    model.Fcontent = dt.Rows[n]["Fcontent"].ToString();
                    model.Furl = dt.Rows[n]["Furl"].ToString();
                    if (dt.Rows[n]["Fhit"].ToString() != "")
                    {
                        model.Fhit = int.Parse(dt.Rows[n]["Fhit"].ToString());
                    }
                    if (dt.Rows[n]["Fdate"].ToString() != "")
                    {
                        model.Fdate = DateTime.Parse(dt.Rows[n]["Fdate"].ToString());
                    }
                    model.Ffiletype = dt.Rows[n]["Ffiletype"].ToString();
                    model.Fclass = dt.Rows[n]["Fclass"].ToString();
                    if (dt.Rows[n]["Fhide"].ToString() != "")
                    {
                        model.Fhide = dt.Rows[n]["Fhide"].ToString() == "1" || dt.Rows[n]["Fhide"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Fopen"].ToString() != "")
                    {
                        model.Fopen = int.Parse(dt.Rows[n]["Fopen"].ToString());
                    }
                    if (dt.Rows[n]["Fhid"].ToString() != "")
                    {
                        model.Fhid = int.Parse(dt.Rows[n]["Fhid"].ToString());
                    }
                    if (dt.Rows[n]["Fyid"].ToString() != "")
                    {
                        model.Fyid = int.Parse(dt.Rows[n]["Fyid"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Research> MapResearchList(DataTable dt)
        {
            List<LearnSite.Model.Research> modelList = new List<LearnSite.Model.Research>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Research model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Research();
                    if (dt.Rows[n]["Rid"] != null && dt.Rows[n]["Rid"].ToString() != "")
                    {
                        model.Rid = int.Parse(dt.Rows[n]["Rid"].ToString());
                    }
                    if (dt.Rows[n]["Rsid"] != null && dt.Rows[n]["Rsid"].ToString() != "")
                    {
                        model.Rsid = int.Parse(dt.Rows[n]["Rsid"].ToString());
                    }
                    if (dt.Rows[n]["Ryear"] != null && dt.Rows[n]["Ryear"].ToString() != "")
                    {
                        model.Ryear = int.Parse(dt.Rows[n]["Ryear"].ToString());
                    }
                    if (dt.Rows[n]["Rgrade"] != null && dt.Rows[n]["Rgrade"].ToString() != "")
                    {
                        model.Rgrade = int.Parse(dt.Rows[n]["Rgrade"].ToString());
                    }
                    if (dt.Rows[n]["Rclass"] != null && dt.Rows[n]["Rclass"].ToString() != "")
                    {
                        model.Rclass = int.Parse(dt.Rows[n]["Rclass"].ToString());
                    }
                    if (dt.Rows[n]["Rterm"] != null && dt.Rows[n]["Rterm"].ToString() != "")
                    {
                        model.Rterm = int.Parse(dt.Rows[n]["Rterm"].ToString());
                    }
                    if (dt.Rows[n]["Rlearn"] != null && dt.Rows[n]["Rlearn"].ToString() != "")
                    {
                        model.Rlearn = decimal.Parse(dt.Rows[n]["Rlearn"].ToString());
                    }
                    if (dt.Rows[n]["Rplay"] != null && dt.Rows[n]["Rplay"].ToString() != "")
                    {
                        model.Rplay = decimal.Parse(dt.Rows[n]["Rplay"].ToString());
                    }
                    if (dt.Rows[n]["Rsleep"] != null && dt.Rows[n]["Rsleep"].ToString() != "")
                    {
                        model.Rsleep = decimal.Parse(dt.Rows[n]["Rsleep"].ToString());
                    }
                    if (dt.Rows[n]["Rfree"] != null && dt.Rows[n]["Rfree"].ToString() != "")
                    {
                        model.Rfree = decimal.Parse(dt.Rows[n]["Rfree"].ToString());
                    }
                    if (dt.Rows[n]["Rdate"] != null && dt.Rows[n]["Rdate"].ToString() != "")
                    {
                        model.Rdate = DateTime.Parse(dt.Rows[n]["Rdate"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Result> MapResultList(DataTable dt)
        {
            List<LearnSite.Model.Result> modelList = new List<LearnSite.Model.Result>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Result model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Result();
                    if (dt.Rows[n]["Rid"].ToString() != "")
                    {
                        model.Rid = int.Parse(dt.Rows[n]["Rid"].ToString());
                    }
                    model.Rnum = dt.Rows[n]["Rnum"].ToString();
                    if (dt.Rows[n]["Rscore"].ToString() != "")
                    {
                        model.Rscore = int.Parse(dt.Rows[n]["Rscore"].ToString());
                    }
                    if (dt.Rows[n]["Rdate"].ToString() != "")
                    {
                        model.Rdate = DateTime.Parse(dt.Rows[n]["Rdate"].ToString());
                    }
                    model.Rhistory = dt.Rows[n]["Rhistory"].ToString();
                    model.Rwrong = dt.Rows[n]["Rwrong"].ToString();
                    if (dt.Rows[n]["Rgrade"].ToString() != "")
                    {
                        model.Rgrade = int.Parse(dt.Rows[n]["Rgrade"].ToString());
                    }
                    if (dt.Rows[n]["Rterm"].ToString() != "")
                    {
                        model.Rterm = int.Parse(dt.Rows[n]["Rterm"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Mission> MapMissionList(DataTable dt)
        {
            List<LearnSite.Model.Mission> modelList = new List<LearnSite.Model.Mission>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Mission model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Mission();
                    if (dt.Rows[n]["Mid"].ToString() != "")
                    {
                        model.Mid = int.Parse(dt.Rows[n]["Mid"].ToString());
                    }
                    model.Mtitle = dt.Rows[n]["Mtitle"].ToString();
                    if (dt.Rows[n]["Mcid"].ToString() != "")
                    {
                        model.Mcid = int.Parse(dt.Rows[n]["Mcid"].ToString());
                    }
                    model.Mcontent = dt.Rows[n]["Mcontent"].ToString();
                    if (dt.Rows[n]["Mdate"].ToString() != "")
                    {
                        model.Mdate = DateTime.Parse(dt.Rows[n]["Mdate"].ToString());
                    }
                    if (dt.Rows[n]["Mhit"].ToString() != "")
                    {
                        model.Mhit = int.Parse(dt.Rows[n]["Mhit"].ToString());
                    }
                    model.Mfiletype = dt.Rows[n]["Mfiletype"].ToString();
                    if (dt.Rows[n]["Mupload"].ToString() != "")
                    {
                        model.Mupload = dt.Rows[n]["Mupload"].ToString() == "1" || dt.Rows[n]["Mupload"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Msort"].ToString() != "")
                    {
                        model.Msort = int.Parse(dt.Rows[n]["Msort"].ToString());
                    }
                    if (dt.Rows[n]["Mpublish"].ToString() != "")
                    {
                        model.Mpublish = dt.Rows[n]["Mpublish"].ToString() == "1" || dt.Rows[n]["Mpublish"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Mgroup"].ToString() != "")
                    {
                        model.Mgroup = dt.Rows[n]["Mgroup"].ToString() == "1" || dt.Rows[n]["Mgroup"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Mgid"] != null && dt.Rows[n]["Mgid"].ToString() != "")
                    {
                        model.Mgid = int.Parse(dt.Rows[n]["Mgid"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.ListMenu> MapListMenuList(DataTable dt)
        {
            List<LearnSite.Model.ListMenu> modelList = new List<LearnSite.Model.ListMenu>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.ListMenu model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.ListMenu();
                    if (dt.Rows[n]["Lid"] != null && dt.Rows[n]["Lid"].ToString() != "")
                    {
                        model.Lid = int.Parse(dt.Rows[n]["Lid"].ToString());
                    }
                    if (dt.Rows[n]["Lcid"] != null && dt.Rows[n]["Lcid"].ToString() != "")
                    {
                        model.Lcid = int.Parse(dt.Rows[n]["Lcid"].ToString());
                    }
                    if (dt.Rows[n]["Lsort"] != null && dt.Rows[n]["Lsort"].ToString() != "")
                    {
                        model.Lsort = int.Parse(dt.Rows[n]["Lsort"].ToString());
                    }
                    if (dt.Rows[n]["Ltype"] != null && dt.Rows[n]["Ltype"].ToString() != "")
                    {
                        model.Ltype = int.Parse(dt.Rows[n]["Ltype"].ToString());
                    }
                    if (dt.Rows[n]["Lxid"] != null && dt.Rows[n]["Lxid"].ToString() != "")
                    {
                        model.Lxid = int.Parse(dt.Rows[n]["Lxid"].ToString());
                    }
                    if (dt.Rows[n]["Lshow"] != null && dt.Rows[n]["Lshow"].ToString() != "")
                    {
                        model.Lshow = dt.Rows[n]["Lshow"].ToString() == "1" || dt.Rows[n]["Lshow"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Ltitle"] != null && dt.Rows[n]["Ltitle"].ToString() != "")
                    {
                        model.Ltitle = dt.Rows[n]["Ltitle"].ToString();
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Exams> MapExamsList(DataTable dt)
        {
            List<LearnSite.Model.Exams> modelList = new List<LearnSite.Model.Exams>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Exams model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Exams();
                    if (dt.Rows[n]["Eid"] != null && dt.Rows[n]["Eid"].ToString() != "")
                    {
                        model.Eid = int.Parse(dt.Rows[n]["Eid"].ToString());
                    }
                    if (dt.Rows[n]["Etitle"] != null)
                    {
                        model.Etitle = dt.Rows[n]["Etitle"].ToString();
                    }
                    if (dt.Rows[n]["Edescription"] != null)
                    {
                        model.Edescription = dt.Rows[n]["Edescription"].ToString();
                    }
                    if (dt.Rows[n]["Cid"] != null && dt.Rows[n]["Cid"].ToString() != "")
                    {
                        model.Cid = int.Parse(dt.Rows[n]["Cid"].ToString());
                    }
                    if (dt.Rows[n]["Hid"] != null && dt.Rows[n]["Hid"].ToString() != "")
                    {
                        model.Hid = int.Parse(dt.Rows[n]["Hid"].ToString());
                    }
                    if (dt.Rows[n]["Etime"] != null && dt.Rows[n]["Etime"].ToString() != "")
                    {
                        model.Etime = DateTime.Parse(dt.Rows[n]["Etime"].ToString());
                    }
                    if (dt.Rows[n]["Eclose"] != null && dt.Rows[n]["Eclose"].ToString() != "")
                    {
                        model.Eclose = dt.Rows[n]["Eclose"].ToString() == "1" || dt.Rows[n]["Eclose"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Escore"] != null && dt.Rows[n]["Escore"].ToString() != "")
                    {
                        model.Escore = int.Parse(dt.Rows[n]["Escore"].ToString());
                    }
                    if (dt.Rows[n]["Ecount"] != null && dt.Rows[n]["Ecount"].ToString() != "")
                    {
                        model.Ecount = int.Parse(dt.Rows[n]["Ecount"].ToString());
                    }
                    if (dt.Rows[n]["Edata"] != null)
                    {
                        model.Edata = dt.Rows[n]["Edata"].ToString();
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Teacher> MapTeacherList(DataTable dt)
        {
            List<LearnSite.Model.Teacher> modelList = new List<LearnSite.Model.Teacher>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Teacher model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Teacher();
                    if (dt.Rows[n]["Hid"].ToString() != "")
                    {
                        model.Hid = int.Parse(dt.Rows[n]["Hid"].ToString());
                    }
                    model.Hname = dt.Rows[n]["Hname"].ToString();
                    model.Hpwd = dt.Rows[n]["Hpwd"].ToString();
                    if (dt.Rows[n]["Hpermiss"].ToString() != "")
                    {
                        model.Hpermiss = dt.Rows[n]["Hpermiss"].ToString() == "1" || dt.Rows[n]["Hpermiss"].ToString().ToLower() == "true";
                    }
                    model.Hnote = dt.Rows[n]["Hnote"].ToString();
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.StudentsExcel> MapStudentsExcelList(DataTable dt)
        {
            List<LearnSite.Model.StudentsExcel> modelList = new List<LearnSite.Model.StudentsExcel>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.StudentsExcel model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.StudentsExcel();
                    if (dt.Rows[n]["Sid"].ToString() != "")
                    {
                        model.Sid = int.Parse(dt.Rows[n]["Sid"].ToString());
                    }
                    model.Snum = dt.Rows[n]["Snum"].ToString();
                    if (dt.Rows[n]["Syear"].ToString() != "")
                    {
                        model.Syear = int.Parse(dt.Rows[n]["Syear"].ToString());
                    }
                    if (dt.Rows[n]["Sgrade"].ToString() != "")
                    {
                        model.Sgrade = int.Parse(dt.Rows[n]["Sgrade"].ToString());
                    }
                    if (dt.Rows[n]["Sclass"].ToString() != "")
                    {
                        model.Sclass = int.Parse(dt.Rows[n]["Sclass"].ToString());
                    }
                    model.Sname = dt.Rows[n]["Sname"].ToString();
                    model.Spwd = dt.Rows[n]["Spwd"].ToString();
                    model.Sex = dt.Rows[n]["Sex"].ToString();
                    model.Saddress = dt.Rows[n]["Saddress"].ToString();
                    model.Sphone = dt.Rows[n]["Sphone"].ToString();
                    model.Sparents = dt.Rows[n]["Sparents"].ToString();
                    model.Sheadtheacher = dt.Rows[n]["Sheadtheacher"].ToString();
                    if (dt.Rows[n]["Sscore"].ToString() != "")
                    {
                        model.Sscore = int.Parse(dt.Rows[n]["Sscore"].ToString());
                    }
                    if (dt.Rows[n]["Squiz"].ToString() != "")
                    {
                        model.Squiz = int.Parse(dt.Rows[n]["Squiz"].ToString());
                    }
                    if (dt.Rows[n]["Sattitude"].ToString() != "")
                    {
                        model.Sattitude = int.Parse(dt.Rows[n]["Sattitude"].ToString());
                    }
                    model.Sape = dt.Rows[n]["Sape"].ToString();
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.ShareDisk> MapShareDiskList(DataTable dt)
        {
            List<LearnSite.Model.ShareDisk> modelList = new List<LearnSite.Model.ShareDisk>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.ShareDisk model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.ShareDisk();
                    if (dt.Rows[n]["Kid"] != null && dt.Rows[n]["Kid"].ToString() != "")
                    {
                        model.Kid = int.Parse(dt.Rows[n]["Kid"].ToString());
                    }
                    if (dt.Rows[n]["Kown"] != null && dt.Rows[n]["Kown"].ToString() != "")
                    {
                        model.Kown = dt.Rows[n]["Kown"].ToString() == "1" || dt.Rows[n]["Kown"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Kyear"] != null && dt.Rows[n]["Kyear"].ToString() != "")
                    {
                        model.Kyear = int.Parse(dt.Rows[n]["Kyear"].ToString());
                    }
                    if (dt.Rows[n]["Kgrade"] != null && dt.Rows[n]["Kgrade"].ToString() != "")
                    {
                        model.Kgrade = int.Parse(dt.Rows[n]["Kgrade"].ToString());
                    }
                    if (dt.Rows[n]["Kclass"] != null && dt.Rows[n]["Kclass"].ToString() != "")
                    {
                        model.Kclass = int.Parse(dt.Rows[n]["Kclass"].ToString());
                    }
                    if (dt.Rows[n]["Kgroup"] != null && dt.Rows[n]["Kgroup"].ToString() != "")
                    {
                        model.Kgroup = int.Parse(dt.Rows[n]["Kgroup"].ToString());
                    }
                    if (dt.Rows[n]["Knum"] != null)
                    {
                        model.Knum = dt.Rows[n]["Knum"].ToString();
                    }
                    if (dt.Rows[n]["Kname"] != null)
                    {
                        model.Kname = dt.Rows[n]["Kname"].ToString();
                    }
                    if (dt.Rows[n]["Kfilename"] != null)
                    {
                        model.Kfilename = dt.Rows[n]["Kfilename"].ToString();
                    }
                    if (dt.Rows[n]["Kfsize"] != null && dt.Rows[n]["Kfsize"].ToString() != "")
                    {
                        model.Kfsize = int.Parse(dt.Rows[n]["Kfsize"].ToString());
                    }
                    if (dt.Rows[n]["Kfurl"] != null)
                    {
                        model.Kfurl = dt.Rows[n]["Kfurl"].ToString();
                    }
                    if (dt.Rows[n]["Kftpe"] != null)
                    {
                        model.Kftpe = dt.Rows[n]["Kftpe"].ToString();
                    }
                    if (dt.Rows[n]["Kfdate"] != null && dt.Rows[n]["Kfdate"].ToString() != "")
                    {
                        model.Kfdate = DateTime.Parse(dt.Rows[n]["Kfdate"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.TopicReply> MapTopicReplyList(DataTable dt)
        {
            List<LearnSite.Model.TopicReply> modelList = new List<LearnSite.Model.TopicReply>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.TopicReply model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.TopicReply();
                    if (dt.Rows[n]["Rid"].ToString() != "")
                    {
                        model.Rid = int.Parse(dt.Rows[n]["Rid"].ToString());
                    }
                    if (dt.Rows[n]["Rtid"].ToString() != "")
                    {
                        model.Rtid = int.Parse(dt.Rows[n]["Rtid"].ToString());
                    }
                    model.Rsnum = dt.Rows[n]["Rsnum"].ToString();
                    model.Rwords = dt.Rows[n]["Rwords"].ToString();
                    if (dt.Rows[n]["Rtime"].ToString() != "")
                    {
                        model.Rtime = DateTime.Parse(dt.Rows[n]["Rtime"].ToString());
                    }
                    model.Rip = dt.Rows[n]["Rip"].ToString();
                    if (dt.Rows[n]["Rscore"].ToString() != "")
                    {
                        model.Rscore = int.Parse(dt.Rows[n]["Rscore"].ToString());
                    }
                    if (dt.Rows[n]["Rban"].ToString() != "")
                    {
                        model.Rban = dt.Rows[n]["Rban"].ToString() == "1" || dt.Rows[n]["Rban"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Rgrade"].ToString() != "")
                    {
                        model.Rgrade = int.Parse(dt.Rows[n]["Rgrade"].ToString());
                    }
                    if (dt.Rows[n]["Rterm"].ToString() != "")
                    {
                        model.Rterm = int.Parse(dt.Rows[n]["Rterm"].ToString());
                    }
                    if (dt.Rows[n]["Rcid"].ToString() != "")
                    {
                        model.Rcid = int.Parse(dt.Rows[n]["Rcid"].ToString());
                    }
                    if (dt.Rows[n]["Rclass"].ToString() != "")
                    {
                        model.Rclass = int.Parse(dt.Rows[n]["Rclass"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.WorksDiscuss> MapWorksDiscussList(DataTable dt)
        {
            List<LearnSite.Model.WorksDiscuss> modelList = new List<LearnSite.Model.WorksDiscuss>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.WorksDiscuss model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.WorksDiscuss();
                    if (dt.Rows[n]["Did"].ToString() != "")
                    {
                        model.Did = int.Parse(dt.Rows[n]["Did"].ToString());
                    }
                    if (dt.Rows[n]["Dwid"].ToString() != "")
                    {
                        model.Dwid = int.Parse(dt.Rows[n]["Dwid"].ToString());
                    }
                    model.Dsnum = dt.Rows[n]["Dsnum"].ToString();
                    model.Dwords = dt.Rows[n]["Dwords"].ToString();
                    if (dt.Rows[n]["Dtime"].ToString() != "")
                    {
                        model.Dtime = DateTime.Parse(dt.Rows[n]["Dtime"].ToString());
                    }
                    model.Dip = dt.Rows[n]["Dip"].ToString();
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.TopicDiscuss> MapTopicDiscussList(DataTable dt)
        {
            List<LearnSite.Model.TopicDiscuss> modelList = new List<LearnSite.Model.TopicDiscuss>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.TopicDiscuss model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.TopicDiscuss();
                    if (dt.Rows[n]["Tid"].ToString() != "")
                    {
                        model.Tid = int.Parse(dt.Rows[n]["Tid"].ToString());
                    }
                    if (dt.Rows[n]["Tcid"].ToString() != "")
                    {
                        model.Tcid = int.Parse(dt.Rows[n]["Tcid"].ToString());
                    }
                    model.Ttitle = dt.Rows[n]["Ttitle"].ToString();
                    model.Tcontent = dt.Rows[n]["Tcontent"].ToString();
                    if (dt.Rows[n]["Tcount"].ToString() != "")
                    {
                        model.Tcount = int.Parse(dt.Rows[n]["Tcount"].ToString());
                    }
                    if (dt.Rows[n]["Tteacher"].ToString() != "")
                    {
                        model.Tteacher = int.Parse(dt.Rows[n]["Tteacher"].ToString());
                    }
                    if (dt.Rows[n]["Tdate"].ToString() != "")
                    {
                        model.Tdate = DateTime.Parse(dt.Rows[n]["Tdate"].ToString());
                    }
                    if (dt.Rows[n]["Tclose"].ToString() != "")
                    {
                        model.Tclose = dt.Rows[n]["Tclose"].ToString() == "1" || dt.Rows[n]["Tclose"].ToString().ToLower() == "true";
                    }
                    model.Tresult = dt.Rows[n]["Tresult"].ToString();
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.TurtleAnswer> MapTurtleAnswerList(DataTable dt)
        {
            List<LearnSite.Model.TurtleAnswer> modelList = new List<LearnSite.Model.TurtleAnswer>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.TurtleAnswer model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.TurtleAnswer();
                    if (dt.Rows[n]["Aid"] != null && dt.Rows[n]["Aid"].ToString() != "")
                    {
                        model.Aid = int.Parse(dt.Rows[n]["Aid"].ToString());
                    }
                    if (dt.Rows[n]["Amid"] != null && dt.Rows[n]["Amid"].ToString() != "")
                    {
                        model.Amid = int.Parse(dt.Rows[n]["Amid"].ToString());
                    }
                    if (dt.Rows[n]["Aqid"] != null && dt.Rows[n]["Aqid"].ToString() != "")
                    {
                        model.Aqid = int.Parse(dt.Rows[n]["Aqid"].ToString());
                    }
                    if (dt.Rows[n]["Acode"] != null)
                    {
                        model.Acode = dt.Rows[n]["Acode"].ToString();
                    }
                    if (dt.Rows[n]["Aimg"] != null)
                    {
                        model.Aimg = dt.Rows[n]["Aimg"].ToString();
                    }
                    if (dt.Rows[n]["Aurl"] != null)
                    {
                        model.Aurl = dt.Rows[n]["Aurl"].ToString();
                    }
                    if (dt.Rows[n]["Aout"] != null)
                    {
                        model.Aout = dt.Rows[n]["Aout"].ToString();
                    }
                    if (dt.Rows[n]["Ascore"] != null && dt.Rows[n]["Ascore"].ToString() != "")
                    {
                        model.Ascore = int.Parse(dt.Rows[n]["Ascore"].ToString());
                    }
                    if (dt.Rows[n]["Asid"] != null && dt.Rows[n]["Asid"].ToString() != "")
                    {
                        model.Asid = int.Parse(dt.Rows[n]["Asid"].ToString());
                    }
                    if (dt.Rows[n]["Asname"] != null)
                    {
                        model.Asname = dt.Rows[n]["Asname"].ToString();
                    }
                    if (dt.Rows[n]["Alock"] != null && dt.Rows[n]["Alock"].ToString() != "")
                    {
                        model.Alock = dt.Rows[n]["Alock"].ToString() == "1" || dt.Rows[n]["Alock"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Adate"] != null && dt.Rows[n]["Adate"].ToString() != "")
                    {
                        model.Adate = DateTime.Parse(dt.Rows[n]["Adate"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.TurtleQuestion> MapTurtleQuestionList(DataTable dt)
        {
            List<LearnSite.Model.TurtleQuestion> modelList = new List<LearnSite.Model.TurtleQuestion>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.TurtleQuestion model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.TurtleQuestion();
                    if (dt.Rows[n]["Qid"] != null && dt.Rows[n]["Qid"].ToString() != "")
                    {
                        model.Qid = int.Parse(dt.Rows[n]["Qid"].ToString());
                    }
                    if (dt.Rows[n]["Qmid"] != null && dt.Rows[n]["Qmid"].ToString() != "")
                    {
                        model.Qmid = int.Parse(dt.Rows[n]["Qmid"].ToString());
                    }
                    if (dt.Rows[n]["Qtitle"] != null)
                    {
                        model.Qtitle = dt.Rows[n]["Qtitle"].ToString();
                    }
                    if (dt.Rows[n]["Qcontent"] != null)
                    {
                        model.Qcontent = dt.Rows[n]["Qcontent"].ToString();
                    }
                    if (dt.Rows[n]["Qdegree"] != null && dt.Rows[n]["Qdegree"].ToString() != "")
                    {
                        model.Qdegree = int.Parse(dt.Rows[n]["Qdegree"].ToString());
                    }
                    if (dt.Rows[n]["Qsort"] != null && dt.Rows[n]["Qsort"].ToString() != "")
                    {
                        model.Qsort = int.Parse(dt.Rows[n]["Qsort"].ToString());
                    }
                    if (dt.Rows[n]["Qcode"] != null)
                    {
                        model.Qcode = dt.Rows[n]["Qcode"].ToString();
                    }
                    if (dt.Rows[n]["Qimg"] != null)
                    {
                        model.Qimg = dt.Rows[n]["Qimg"].ToString();
                    }
                    if (dt.Rows[n]["Qurl"] != null)
                    {
                        model.Qurl = dt.Rows[n]["Qurl"].ToString();
                    }
                    if (dt.Rows[n]["Qout"] != null)
                    {
                        model.Qout = dt.Rows[n]["Qout"].ToString();
                    }
                    if (dt.Rows[n]["Qscore"] != null && dt.Rows[n]["Qscore"].ToString() != "")
                    {
                        model.Qscore = int.Parse(dt.Rows[n]["Qscore"].ToString());
                    }
                    if (dt.Rows[n]["Qdate"] != null && dt.Rows[n]["Qdate"].ToString() != "")
                    {
                        model.Qdate = DateTime.Parse(dt.Rows[n]["Qdate"].ToString());
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }

        public static List<LearnSite.Model.Turtle> MapTurtleList(DataTable dt)
        {
            List<LearnSite.Model.Turtle> modelList = new List<LearnSite.Model.Turtle>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.Turtle model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = new LearnSite.Model.Turtle();
                    if (dt.Rows[n]["Tid"] != null && dt.Rows[n]["Tid"].ToString() != "")
                    {
                        model.Tid = int.Parse(dt.Rows[n]["Tid"].ToString());
                    }
                    if (dt.Rows[n]["Thid"] != null && dt.Rows[n]["Thid"].ToString() != "")
                    {
                        model.Thid = int.Parse(dt.Rows[n]["Thid"].ToString());
                    }
                    if (dt.Rows[n]["Ttilte"] != null)
                    {
                        model.Ttilte = dt.Rows[n]["Ttilte"].ToString();
                    }
                    if (dt.Rows[n]["Tcontent"] != null)
                    {
                        model.Tcontent = dt.Rows[n]["Tcontent"].ToString();
                    }
                    if (dt.Rows[n]["Tdegree"] != null && dt.Rows[n]["Tdegree"].ToString() != "")
                    {
                        model.Tdegree = int.Parse(dt.Rows[n]["Tdegree"].ToString());
                    }
                    if (dt.Rows[n]["Tsort"] != null && dt.Rows[n]["Tsort"].ToString() != "")
                    {
                        model.Tsort = int.Parse(dt.Rows[n]["Tsort"].ToString());
                    }
                    if (dt.Rows[n]["Tcode"] != null)
                    {
                        model.Tcode = dt.Rows[n]["Tcode"].ToString();
                    }
                    if (dt.Rows[n]["Timg"] != null)
                    {
                        model.Timg = dt.Rows[n]["Timg"].ToString();
                    }
                    if (dt.Rows[n]["Turl"] != null)
                    {
                        model.Turl = dt.Rows[n]["Turl"].ToString();
                    }
                    if (dt.Rows[n]["Tout"] != null)
                    {
                        model.Tout = dt.Rows[n]["Tout"].ToString();
                    }
                    if (dt.Rows[n]["Tdate"] != null && dt.Rows[n]["Tdate"].ToString() != "")
                    {
                        model.Tdate = DateTime.Parse(dt.Rows[n]["Tdate"].ToString());
                    }
                    if (dt.Rows[n]["Tstudy"] != null && dt.Rows[n]["Tstudy"].ToString() != "")
                    {
                        model.Tstudy = dt.Rows[n]["Tstudy"].ToString() == "1" || dt.Rows[n]["Tstudy"].ToString().ToLower() == "true";
                    }
                    if (dt.Rows[n]["Tsid"] != null && dt.Rows[n]["Tsid"].ToString() != "")
                    {
                        model.Tsid = int.Parse(dt.Rows[n]["Tsid"].ToString());
                    }
                    if (dt.Rows[n]["Tscore"] != null && dt.Rows[n]["Tscore"].ToString() != "")
                    {
                        model.Tscore = int.Parse(dt.Rows[n]["Tscore"].ToString());
                    }
                    if (dt.Rows[n]["Tip"] != null)
                    {
                        model.Tip = dt.Rows[n]["Tip"].ToString();
                    }
                    modelList.Add(model);
                }
            }
            return modelList;
        }
    }
}
