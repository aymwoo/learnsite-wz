using System;
using System.Collections.Generic;
using System.IO;
using Xunit;

namespace TeacherRegressionTests;

public class TeacherRegressionTests
{
    private static readonly string RepoRoot = GetRepoRoot();
    private static readonly string TeacherRoot = Path.Combine(RepoRoot, "teacher");

    private static readonly string[] ThreeEditorPages =
    {
        "courseedit.aspx",
        "missionadd.aspx",
        "missionedit.aspx",
        "softadd.aspx",
        "softedit.aspx",
        "exceladd.aspx",
        "exceledit.aspx",
        "pythonadd.aspx",
        "pythonedit.aspx",
        "programadd.aspx",
        "programedit.aspx",
        "kitymindadd.aspx",
        "kitymindedit.aspx",
        "graphadd.aspx",
        "graphedit.aspx",
        "htmladd.aspx",
        "htmledit.aspx",
        "txtformadd.aspx",
        "txtformedit.aspx",
        "pixeladd.aspx",
        "pixeledit.aspx",
        "topicadd.aspx",
        "topicedit.aspx",
        "qrcodeadd.aspx",
        "consoleadd.aspx",
    };

    private static readonly string[] ContentPagesReturningToCourse =
    {
        "txtformadd.aspx",
        "txtformedit.aspx",
        "graphadd.aspx",
        "graphedit.aspx",
        "htmladd.aspx",
        "htmledit.aspx",
        "pythonadd.aspx",
        "pythonedit.aspx",
        "programadd.aspx",
        "programedit.aspx",
        "pixeladd.aspx",
        "pixeledit.aspx",
        "kitymindadd.aspx",
        "kitymindedit.aspx",
        "exceladd.aspx",
        "exceledit.aspx",
        "missionadd.aspx",
        "missionedit.aspx",
        "topicadd.aspx",
        "qrcodeadd.aspx",
        "wareadd.aspx",
        "wareedit.aspx",
        "coursecreate.aspx",
    };

    private static readonly string[] ShowPagesWithEditAndReturn =
    {
        "wareshow.aspx",
        "missionshow.aspx",
        "kitymindshow.aspx",
        "programshow.aspx",
        "pythonshow.aspx",
        "pixelshow.aspx",
        "txtformshow.aspx",
        "excelshow.aspx",
        "htmlshow.aspx",
        "graphshow.aspx",
    };

    private static readonly string[] TypingPagesUsingReturnList =
    {
        "typeadd.aspx",
        "typeedit.aspx",
        "typechineseadd.aspx",
        "typechineseedit.aspx",
        "typeshow.aspx",
        "typechineseshow.aspx",
        "typerset.aspx",
        "typechineseset.aspx",
    };

    [Fact]
    public void TeacherAspx_ShouldNotContainImageButtonControls_ExceptStartCourseIconEntry()
    {
        var exceptions = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
            Path.Combine(TeacherRoot, "start.aspx"),
        };

        foreach (var file in Directory.GetFiles(TeacherRoot, "*.aspx", SearchOption.TopDirectoryOnly))
        {
            var content = File.ReadAllText(file);
            if (exceptions.Contains(file))
            {
                Assert.DoesNotContain("<asp:ImageButton ID=\"PubSet\"", content, StringComparison.OrdinalIgnoreCase);
                continue;
            }

            Assert.DoesNotContain("<asp:ImageButton", content, StringComparison.OrdinalIgnoreCase);
        }
    }

    [Fact]
    public void TeacherCodeBehind_ShouldNotContainImageClickEventArgs()
    {
        foreach (var file in Directory.GetFiles(TeacherRoot, "*.cs", SearchOption.TopDirectoryOnly))
        {
            var content = File.ReadAllText(file);
            Assert.DoesNotContain("ImageClickEventArgs", content, StringComparison.Ordinal);
        }
    }

    [Theory]
    [MemberData(nameof(GetThreeEditorPages))]
    public void ThreeEditorPages_ShouldKeepSwitchSyncAndSubmitHooks(string relativePath)
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, relativePath));
        Assert.Contains("switchEditor(", content, StringComparison.Ordinal);
        Assert.Contains("syncContent()", content, StringComparison.Ordinal);
        Assert.Contains("OnClientClick=\"return syncContent();\"", content, StringComparison.Ordinal);
    }

    [Fact]
    public void ProblemPage_ShouldKeepProblemSpecificEditorHooks()
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, "problem.aspx"));

        Assert.Contains("switchProblemEditor(", content, StringComparison.Ordinal);
        Assert.Contains("syncProblemContent()", content, StringComparison.Ordinal);
        Assert.Contains("OnClientClick=\"return syncProblemContent();\"", content, StringComparison.Ordinal);
        Assert.Contains("id=\"editorSelector\"", content, StringComparison.Ordinal);
    }

    [Fact]
    public void TeacherAspx_ShouldUseLoadEventListenersInsteadOfWindowOnload()
    {
        foreach (var file in Directory.GetFiles(TeacherRoot, "*.aspx", SearchOption.TopDirectoryOnly))
        {
            var content = File.ReadAllText(file);
            Assert.DoesNotContain("window.onload =", content, StringComparison.Ordinal);
        }
    }

    [Fact]
    public void StartPage_ShouldKeepBulkMenuButtonsAndSwitcherOnly()
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, "start.aspx"));

        Assert.Contains("ID=\"BtnMenuOpenAll\"", content, StringComparison.Ordinal);
        Assert.Contains("ID=\"BtnMenuCloseAll\"", content, StringComparison.Ordinal);
        Assert.Contains("ID=\"BtnSwitchToggle\"", content, StringComparison.Ordinal);

        Assert.DoesNotContain("MenuStatus", content, StringComparison.Ordinal);
        Assert.DoesNotContain("lesson-menu-meta", content, StringComparison.Ordinal);
        Assert.DoesNotContain("lesson-menu-status", content, StringComparison.Ordinal);
        Assert.DoesNotContain("点击切换", content, StringComparison.Ordinal);
    }

    [Fact]
    public void StartCodeBehind_ShouldUseCurrentControlTypesForMenuBindings()
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, "start.aspx.cs"));

        Assert.Contains("imgbtn = (Button)e.Item.FindControl(\"PubSet\")", content, StringComparison.Ordinal);
        Assert.Contains("imgbtn = (LinkButton)e.Item.FindControl(\"imgBtn\")", content, StringComparison.Ordinal);
        Assert.Contains("BatchSetCurrentCourseMenuVisibility", content, StringComparison.Ordinal);
        Assert.DoesNotContain("FindControl(\"PubSet\")", content.Replace("imgbtn = (Button)e.Item.FindControl(\"PubSet\")", string.Empty), StringComparison.Ordinal);
    }

    [Fact]
    public void StartCodeBehind_ItemDataBoundHandlersShouldGuardNonDataItems()
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, "start.aspx.cs"));

        Assert.Contains("protected void DLdonekc_ItemDataBound", content, StringComparison.Ordinal);
        Assert.Contains("protected void DLnotline_ItemDataBound", content, StringComparison.Ordinal);
        Assert.Contains("protected void DLnewkc_ItemDataBound", content, StringComparison.Ordinal);
        Assert.Contains("protected void DataListMenu_ItemDataBound", content, StringComparison.Ordinal);

        var guard = "if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)";
        Assert.True(CountOccurrences(content, guard) >= 4, "Expected item-type guards on all critical ItemDataBound handlers.");
    }

    [Fact]
    public void IpythonTeacherPreview_ShouldPreserveTeacherReturnAndNoSaveBehavior()
    {
        var content = File.ReadAllText(Path.Combine(RepoRoot, "code", "ipython.js"));

        Assert.Contains("var isTeacherPreview = pathname.indexOf(\"/teacher/\") !== -1;", content, StringComparison.Ordinal);
        Assert.Contains("returnurl = ipurl + \"/consoleshow.aspx?nid=\" + hnid + \"&ncid=\" + hcid + \"&lid=\" + hlid;", content, StringComparison.Ordinal);
        Assert.Contains("if(isTeacherPreview)", content.Replace(" ", string.Empty), StringComparison.Ordinal);
        Assert.Contains("当前测评暂无试题，请先返回继续编辑。", content, StringComparison.Ordinal);
    }

    [Fact]
    public void ConsoleFlow_ShouldPreserveLidAcrossTeacherPages()
    {
        var consoleShow = File.ReadAllText(Path.Combine(TeacherRoot, "consoleshow.aspx.cs"));
        var consoleAdd = File.ReadAllText(Path.Combine(TeacherRoot, "consoleadd.aspx.cs"));
        var problemCodeBehind = File.ReadAllText(Path.Combine(TeacherRoot, "problem.aspx.cs"));

        Assert.Contains("if (Request.QueryString[\"lid\"] != null)", consoleShow, StringComparison.Ordinal);
        Assert.Contains("url += \"&lid=\" + Request.QueryString[\"lid\"].ToString();", consoleShow, StringComparison.Ordinal);
        Assert.Contains("url += \"&lid=\" + Request.QueryString[\"lid\"].ToString();", consoleAdd, StringComparison.Ordinal);
        Assert.Contains("url += \"&lid=\" + Request.QueryString[\"lid\"].ToString();", problemCodeBehind, StringComparison.Ordinal);
    }

    [Fact]
    public void WarePages_ShouldUseLoadEventListenerAndServerResolvedTextboxId()
    {
        var wareAdd = File.ReadAllText(Path.Combine(TeacherRoot, "wareadd.aspx"));
        var wareEdit = File.ReadAllText(Path.Combine(TeacherRoot, "wareedit.aspx"));

        Assert.Contains("window.addEventListener('load'", wareAdd, StringComparison.Ordinal);
        Assert.Contains("window.addEventListener('load'", wareEdit, StringComparison.Ordinal);
        Assert.Contains("<%= TextBoxHtml.ClientID %>", wareAdd, StringComparison.Ordinal);
        Assert.Contains("<%= TextBoxHtml.ClientID %>", wareEdit, StringComparison.Ordinal);
    }

    [Theory]
    [MemberData(nameof(GetContentPagesReturningToCourse))]
    public void ContentPages_ShouldKeepReturnToCourseCopy(string relativePath)
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, relativePath));
        Assert.Contains("Text=\"返回学案\"", content, StringComparison.Ordinal);
    }

    [Theory]
    [MemberData(nameof(GetShowPagesWithEditAndReturn))]
    public void ShowPages_ShouldKeepEditContentAndReturnCourseButtons(string relativePath)
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, relativePath));
        Assert.Contains("Text=\"编辑内容\"", content, StringComparison.Ordinal);
        Assert.Contains("Text=\"返回学案\"", content, StringComparison.Ordinal);
    }

    [Theory]
    [MemberData(nameof(GetTypingPagesUsingReturnList))]
    public void TypingPages_ShouldUseReturnListCopy(string relativePath)
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, relativePath));
        Assert.Contains("Text=\"返回列表\"", content, StringComparison.Ordinal);
    }

    [Fact]
    public void StatusPages_ShouldKeepModernStatusButtonLabels()
    {
        var consoleShow = File.ReadAllText(Path.Combine(TeacherRoot, "consoleshow.aspx"));
        var topicShow = File.ReadAllText(Path.Combine(TeacherRoot, "topicshow.aspx"));
        var circleShow = File.ReadAllText(Path.Combine(TeacherRoot, "circleshow.aspx"));
        var workNoScore = File.ReadAllText(Path.Combine(TeacherRoot, "worknoscore.aspx"));
        var stuWorkCircle = File.ReadAllText(Path.Combine(TeacherRoot, "stuworkcircle.aspx"));
        var softNomic = File.ReadAllText(Path.Combine(TeacherRoot, "softnomic.aspx"));

        Assert.Contains("Text=\"测评状态\"", consoleShow, StringComparison.Ordinal);
        Assert.Contains("Text=\"讨论状态\"", topicShow, StringComparison.Ordinal);
        Assert.Contains("Text=\"标记已评\"", circleShow, StringComparison.Ordinal);
        Assert.Contains("Text=\"刷新展播\"", circleShow, StringComparison.Ordinal);
        Assert.Contains("Text=\"刷新展播\"", workNoScore, StringComparison.Ordinal);
        Assert.Contains("Text=\"刷新展播\"", stuWorkCircle, StringComparison.Ordinal);
        Assert.Contains("Text=\"刷新展播\"", softNomic, StringComparison.Ordinal);
    }

    [Fact]
    public void StartPage_MenuAreaShouldKeepBatchButtonsAndSwitcherMarkup()
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, "start.aspx"));

        Assert.Contains("Text=\"全部开启\"", content, StringComparison.Ordinal);
        Assert.Contains("Text=\"全部关闭\"", content, StringComparison.Ordinal);
        Assert.Contains("ID=\"imgBtn\"", content, StringComparison.Ordinal);
        Assert.Contains("ID=\"BtnSwitchToggle\"", content, StringComparison.Ordinal);
        Assert.Contains("lesson-switch lesson-switch--on", content, StringComparison.Ordinal);
    }

    [Fact]
    public void StartCodeBehind_ShouldKeepBatchOpenCloseCalls()
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, "start.aspx.cs"));

        Assert.Contains("BatchSetCurrentCourseMenuVisibility(true);", content, StringComparison.Ordinal);
        Assert.Contains("BatchSetCurrentCourseMenuVisibility(false);", content, StringComparison.Ordinal);
        Assert.Contains("lbll.OpenLshow(lid);", content, StringComparison.Ordinal);
        Assert.Contains("lbll.CloseLshow(lid);", content, StringComparison.Ordinal);
    }

    [Theory]
    [InlineData("consoleadd.aspx", "Text=\"返回学案\"")]
    [InlineData("consoleshow.aspx", "Text=\"返回学案\"")]
    [InlineData("problem.aspx", "Text=\"添加题目\"")]
    [InlineData("problem.aspx", "Text=\"返回测评\"")]
    [InlineData("package.aspx", "Text=\"开始打包\"")]
    [InlineData("package.aspx", "Text=\"下载压缩包\"")]
    [InlineData("termview.aspx", "Text=\"导出 Excel\"")]
    [InlineData("termscores.aspx", "Text=\"导出 Excel\"")]
    [InlineData("studentadd.aspx", "Text=\"添加学生\"")]
    [InlineData("studentedit.aspx", "Text=\"保存修改\"")]
    public void TeacherButtonCopy_ShouldRetainNormalizedLabels(string relativePath, string expectedSnippet)
    {
        var content = File.ReadAllText(Path.Combine(TeacherRoot, relativePath));
        Assert.Contains(expectedSnippet, content, StringComparison.Ordinal);
    }

    public static IEnumerable<object[]> GetThreeEditorPages()
    {
        foreach (var page in ThreeEditorPages)
        {
            yield return new object[] { page };
        }
    }

    public static IEnumerable<object[]> GetContentPagesReturningToCourse()
    {
        foreach (var page in ContentPagesReturningToCourse)
        {
            yield return new object[] { page };
        }
    }

    public static IEnumerable<object[]> GetShowPagesWithEditAndReturn()
    {
        foreach (var page in ShowPagesWithEditAndReturn)
        {
            yield return new object[] { page };
        }
    }

    public static IEnumerable<object[]> GetTypingPagesUsingReturnList()
    {
        foreach (var page in TypingPagesUsingReturnList)
        {
            yield return new object[] { page };
        }
    }

    private static int CountOccurrences(string content, string value)
    {
        var count = 0;
        var index = 0;
        while ((index = content.IndexOf(value, index, StringComparison.Ordinal)) >= 0)
        {
            count++;
            index += value.Length;
        }

        return count;
    }

    private static string GetRepoRoot()
    {
        var current = AppContext.BaseDirectory;
        while (!string.IsNullOrEmpty(current))
        {
            if (File.Exists(Path.Combine(current, "learnsite-wz.sln")))
            {
                return current;
            }

            current = Directory.GetParent(current)?.FullName ?? string.Empty;
        }

        throw new InvalidOperationException("Could not locate repository root.");
    }
}
