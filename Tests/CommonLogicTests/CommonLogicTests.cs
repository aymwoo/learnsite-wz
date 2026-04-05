using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using LearnSite.Common;

namespace CommonLogicTests;

public class CommonLogicTests : IDisposable
{
    private readonly string _tempDir;
    private readonly string _xmlFile;

    public CommonLogicTests()
    {
        _tempDir = Path.Combine(Path.GetTempPath(), "CommonLogicTests_" + Guid.NewGuid().ToString("N"));
        Directory.CreateDirectory(_tempDir);
        _xmlFile = Path.Combine(_tempDir, "website.xml");
        File.WriteAllText(_xmlFile, "<?xml version=\"1.0\" encoding=\"utf-8\"?><LearnSite><website>" +
            "<add key=\"CourseType\" value=\"Word|Powerpoint|Excel\" />" +
            "<add key=\"CoursePeriod\" value=\"3\" />" +
            "<add key=\"ClassMax\" value=\"4\" />" +
            "<add key=\"CookiesFix\" value=\"1\" />" +
            "<add key=\"Term\" value=\"2\" />" +
            "<add key=\"AllowDir\" value=\"images|_private\" />" +
            "</website></LearnSite>");
    }

    public void Dispose()
    {
        if (Directory.Exists(_tempDir))
        {
            Directory.Delete(_tempDir, true);
        }
    }

    [Fact]
    public void FileNameInfo_ParsesVirtualPathCorrectly()
    {
        var info = new FileNameInfo("~/upload/course/test-file.HTML");

        Assert.Equal("~/upload/course/", info.Path);
        Assert.Equal("test-file", info.Fname);
        Assert.Equal("html", info.Ext);
    }

    [Fact]
    public void FileNameInfo_ParsesPhysicalPathCorrectly()
    {
        var info = new FileNameInfo(@"C:\temp\demo\report.PDF");

        Assert.Equal(@"C:\temp\demo\", info.Path);
        Assert.Equal("report", info.Fname);
        Assert.Equal("pdf", info.Ext);
    }

    [Theory]
    [InlineData("abc123_测试", true)]
    [InlineData("abc-123", false)]
    [InlineData("空 格", false)]
    public void WordProcessCore_IsCnEnNum_ReturnsExpectedResult(string value, bool expected)
    {
        Assert.Equal(expected, WordProcessCore.IsCnEnNum(value));
    }

    [Theory]
    [InlineData("12345", true)]
    [InlineData("001", true)]
    [InlineData("12a", false)]
    [InlineData("-10", false)]
    public void WordProcessCore_IsNum_ReturnsExpectedResult(string value, bool expected)
    {
        Assert.Equal(expected, WordProcessCore.IsNum(value));
    }

    [Theory]
    [InlineData("123", true)]
    [InlineData("-123", true)]
    [InlineData("12.5", true)]
    [InlineData("0", true)]
    [InlineData("12a", false)]
    public void WordProcessCore_IsIntNum_ReturnsExpectedResult(string value, bool expected)
    {
        Assert.Equal(expected, WordProcessCore.IsIntNum(value));
    }

    [Theory]
    [InlineData("abcXYZ", true)]
    [InlineData("abc123", false)]
    [InlineData("中文", false)]
    public void WordProcessCore_IsEnglish_ReturnsExpectedResult(string value, bool expected)
    {
        Assert.Equal(expected, WordProcessCore.IsEnglish(value));
    }

    [Theory]
    [InlineData("hello", false)]
    [InlineData("你好", true)]
    [InlineData("abc你好", true)]
    public void WordProcessCore_IsZh_ReturnsExpectedResult(string value, bool expected)
    {
        Assert.Equal(expected, WordProcessCore.IsZh(value));
    }

    [Theory]
    [InlineData("abc123", true)]
    [InlineData("abc", true)]
    [InlineData("123", true)]
    [InlineData("abc_123", false)]
    [InlineData("中文", false)]
    public void WordProcessCore_IsEnNum_ReturnsExpectedResult(string value, bool expected)
    {
        Assert.Equal(expected, WordProcessCore.IsEnNum(value));
    }

    [Theory]
    [InlineData("12345678", true)]
    [InlineData("123456789", false)]
    public void WordProcessCore_StrLength_UsesEightCharacterLimit(string value, bool expected)
    {
        Assert.Equal(expected, WordProcessCore.StrLength(value));
    }

    [Fact]
    public void WordProcessCore_HashAndMd5Helpers_ReturnLowercaseExpectedLengths()
    {
        Assert.Equal(32, WordProcessCore.Hash("abc").Length);
        Assert.Equal(32, WordProcessCore.GetMD5("abc").Length);
        Assert.Equal(8, WordProcessCore.GetMD5_8bit("abc").Length);
        Assert.Equal(16, WordProcessCore.GetMD5_16bit("abc").Length);
        Assert.Equal(10, WordProcessCore.GetMD5_Nbit("abc", 10).Length);

        Assert.Equal(WordProcessCore.GetMD5("abc"), WordProcessCore.GetMD5("abc").ToLowerInvariant());
        Assert.Equal(WordProcessCore.GetMD5_16bit("abc"), WordProcessCore.GetMD5_16bit("abc").ToLowerInvariant());
    }

    [Fact]
    public void WordProcessCore_StrToLower_ReturnsLowercase()
    {
        Assert.Equal("abc123", WordProcessCore.StrToLower("AbC123"));
    }

    [Fact]
    public void WordProcessCore_GenerateRandom_ReturnsRequestedLengthAndAllowedChars()
    {
        var result = WordProcessCore.GenerateRandom(24);

        Assert.Equal(24, result.Length);
        Assert.All(result, c => Assert.True(char.IsDigit(c) || (c >= 'a' && c <= 'z')));
    }

    [Fact]
    public void WordProcessCore_GenerateRandomNum_ReturnsRequestedLengthAndDigitsOnly()
    {
        var result = WordProcessCore.GenerateRandomNum(18);

        Assert.Equal(18, result.Length);
        Assert.All(result, c => Assert.True(char.IsDigit(c)));
        Assert.DoesNotContain('4', result);
    }

    [Fact]
    public void WordProcessCore_GetRandomNum_NonPositiveMaxReturnsZero()
    {
        Assert.Equal(0, WordProcessCore.GetRandomNum(0));
        Assert.Equal(0, WordProcessCore.GetRandomNum(-1));
    }

    [Fact]
    public void WordProcessCore_GetRandomNum_PositiveMaxReturnsInRange()
    {
        var result = WordProcessCore.GetRandomNum(10);
        Assert.InRange(result, 0, 9);
    }

    [Fact]
    public void WordProcessCore_ServUMd5_ReturnsTwoLetterPrefixPlusMd5()
    {
        var result = WordProcessCore.Serv_u_Md5("secret");

        Assert.Equal(34, result.Length);
        Assert.True(char.IsLower(result[0]) && char.IsLower(result[1]));
        Assert.All(result.Skip(2), c => Assert.True(char.IsDigit(c) || (c >= 'a' && c <= 'f')));
    }

    [Fact]
    public void EncodingType_GetFileEncodeType_DetectsUtf8Bom()
    {
        var file = Path.Combine(_tempDir, "utf8bom.txt");
        File.WriteAllBytes(file, new byte[] { 0xEF, 0xBB, 0xBF, 0x41, 0x42 });

        var encoding = EncodingType.GetFileEncodeType(file);
        Assert.Equal(Encoding.UTF8.WebName, encoding.WebName);
    }

    [Fact]
    public void EncodingType_GetFileEncodeType_DetectsUnicodeBom()
    {
        var file = Path.Combine(_tempDir, "unicode.txt");
        File.WriteAllBytes(file, new byte[] { 0xFF, 0xFE, 0x41, 0x00 });

        var encoding = EncodingType.GetFileEncodeType(file);
        Assert.Equal(Encoding.Unicode.WebName, encoding.WebName);
    }

    [Fact]
    public void EncodingType_GetFileEncodeType_DefaultsWhenNoBom()
    {
        var file = Path.Combine(_tempDir, "ansi.txt");
        File.WriteAllBytes(file, Encoding.ASCII.GetBytes("abc"));

        var encoding = EncodingType.GetFileEncodeType(file);
        Assert.Equal(Encoding.Default.WebName, encoding.WebName);
    }

    [Fact]
    public void EncodingType_GetType_DetectsUtf8Bom()
    {
        var file = Path.Combine(_tempDir, "utf8_gettype.txt");
        File.WriteAllBytes(file, new byte[] { 0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63 });

        var encoding = EncodingType.GetType(file);
        Assert.Equal(Encoding.UTF8.WebName, encoding.WebName);
    }

    [Fact]
    public void XmlHelpCore_GetValue_ReturnsConfiguredValue()
    {
        Assert.Equal("1", XmlHelpCore.GetValue(_xmlFile, "CookiesFix"));
        Assert.Equal("2", XmlHelpCore.GetValue(_xmlFile, "Term"));
    }

    [Fact]
    public void XmlHelpCore_GetValue_MissingKeyReturnsZeroString()
    {
        Assert.Equal("0", XmlHelpCore.GetValue(_xmlFile, "MissingKey"));
    }

    [Fact]
    public void XmlHelpCore_SetValue_UpdatesExistingKey()
    {
        bool result = XmlHelpCore.SetValue(_xmlFile, "CookiesFix", "99");

        Assert.True(result);
        Assert.Equal("99", XmlHelpCore.GetValue(_xmlFile, "CookiesFix"));
    }

    [Fact]
    public void XmlHelpCore_GetPipeSeparatedValues_ReturnsExpectedSegments()
    {
        var values = XmlHelpCore.GetPipeSeparatedValues(_xmlFile, "AllowDir");

        Assert.Equal(new[] { "images", "_private" }, values);
    }

    [Fact]
    public void XmlHelpCore_GetTrimmedPipeSeparatedList_ReturnsTrimmedCourseTypes()
    {
        var values = XmlHelpCore.GetTrimmedPipeSeparatedList(_xmlFile, "CourseType");

        Assert.Equal(new[] { "Word", "Powerpoint", "Excel" }, values);
    }

    [Fact]
    public void XmlHelpCore_GetOneBasedNumericRangeFromValue_ReturnsExpectedRange()
    {
        var values = XmlHelpCore.GetOneBasedNumericRangeFromValue(_xmlFile, "CoursePeriod");

        Assert.Equal(new[] { 1, 2, 3 }, values);
    }

    [Fact]
    public void XmlHelpCore_GetQuizCourseTypes_PrependsAllDisplayOption()
    {
        var values = XmlHelpCore.GetQuizCourseTypes(_xmlFile);

        Assert.Equal("全部显示", values[0]);
        Assert.Equal(new[] { "Word", "Powerpoint", "Excel" }, values.GetRange(1, 3));
    }

    [Fact]
    public void BllDataTableMappers_MapTyperList_MapsNumericAndTextFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Tid");
        dt.Columns.Add("Ttype");
        dt.Columns.Add("Tuse");
        dt.Columns.Add("Ttitle");
        dt.Columns.Add("Tcontent");
        dt.Rows.Add("5", "2", "9", "Title A", "Content A");

        var result = LearnSite.BLL.BllDataTableMappers.MapTyperList(dt);

        Assert.Single(result);
        Assert.Equal(5, result[0].Tid);
        Assert.Equal(2, result[0].Ttype);
        Assert.Equal(9, result[0].Tuse);
        Assert.Equal("Title A", result[0].Ttitle);
        Assert.Equal("Content A", result[0].Tcontent);
    }

    [Fact]
    public void BllDataTableMappers_MapQuizGradeList_MapsBooleanVariants()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Qid");
        dt.Columns.Add("Qobj");
        dt.Columns.Add("Qclass");
        dt.Columns.Add("Qhid");
        dt.Columns.Add("Qonly");
        dt.Columns.Add("Qmore");
        dt.Columns.Add("Qjudge");
        dt.Columns.Add("Qopen");
        dt.Columns.Add("Qanswer");
        dt.Rows.Add("1", "6", "1,2", "10", "3", "4", "5", "1", "false");

        var result = LearnSite.BLL.BllDataTableMappers.MapQuizGradeList(dt);

        Assert.Single(result);
        Assert.Equal(1, result[0].Qid);
        Assert.Equal(6, result[0].Qobj);
        Assert.Equal("1,2", result[0].Qclass);
        Assert.Equal(10, result[0].Qhid);
        Assert.Equal(3, result[0].Qonly);
        Assert.Equal(4, result[0].Qmore);
        Assert.Equal(5, result[0].Qjudge);
        Assert.True(result[0].Qopen);
        Assert.False(result[0].Qanswer);
    }

    [Fact]
    public void BllDataTableMappers_MapTermTotalList_MapsScoreFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Tid");
        dt.Columns.Add("Tnum");
        dt.Columns.Add("Tterm");
        dt.Columns.Add("Tgrade");
        dt.Columns.Add("Tscore");
        dt.Columns.Add("Tgscore");
        dt.Columns.Add("Tquiz");
        dt.Columns.Add("Tattitude");
        dt.Columns.Add("Twscore");
        dt.Columns.Add("Ttscore");
        dt.Columns.Add("Tpscore");
        dt.Columns.Add("Tallscore");
        dt.Columns.Add("Tape");
        dt.Rows.Add("2", "2024001", "1", "6", "90", "91", "92", "93", "94", "95", "96", "97", "A");

        var result = LearnSite.BLL.BllDataTableMappers.MapTermTotalList(dt);

        Assert.Single(result);
        Assert.Equal(2, result[0].Tid);
        Assert.Equal("2024001", result[0].Tnum);
        Assert.Equal(1, result[0].Tterm);
        Assert.Equal(6, result[0].Tgrade);
        Assert.Equal(90, result[0].Tscore);
        Assert.Equal(91, result[0].Tgscore);
        Assert.Equal(92, result[0].Tquiz);
        Assert.Equal(93, result[0].Tattitude);
        Assert.Equal(94, result[0].Twscore);
        Assert.Equal(95, result[0].Ttscore);
        Assert.Equal(96, result[0].Tpscore);
        Assert.Equal(97, result[0].Tallscore);
        Assert.Equal("A", result[0].Tape);
    }

    [Fact]
    public void BllDataTableMappers_MapAIProviderList_MapsProviderFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Id");
        dt.Columns.Add("DisplayName");
        dt.Columns.Add("ProviderName");
        dt.Columns.Add("ModelName");
        dt.Columns.Add("ApiKey");
        dt.Columns.Add("BaseUrl");
        dt.Columns.Add("IsDefault");
        dt.Rows.Add("7", "OpenAI", "openai", "gpt-4o", "secret", "https://api.test", "true");

        var result = LearnSite.BLL.BllDataTableMappers.MapAIProviderList(dt);

        Assert.Single(result);
        Assert.Equal(7, result[0].Id);
        Assert.Equal("OpenAI", result[0].DisplayName);
        Assert.Equal("openai", result[0].ProviderName);
        Assert.Equal("gpt-4o", result[0].ModelName);
        Assert.Equal("secret", result[0].ApiKey);
        Assert.Equal("https://api.test", result[0].BaseUrl);
        Assert.True(result[0].IsDefault);
    }

    [Fact]
    public void BllDataTableMappers_MapAISkillList_MapsSkillFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Id");
        dt.Columns.Add("SkillName");
        dt.Columns.Add("PromptContent");
        dt.Columns.Add("IsActive");
        dt.Rows.Add("3", "summary", "summarize content", "1");

        var result = LearnSite.BLL.BllDataTableMappers.MapAISkillList(dt);

        Assert.Single(result);
        Assert.Equal(3, result[0].Id);
        Assert.Equal("summary", result[0].SkillName);
        Assert.Equal("summarize content", result[0].PromptContent);
        Assert.True(result[0].IsActive);
    }

    [Fact]
    public void BllDataTableMappers_MapTurtleMatchList_MapsDatesAndBoolean()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Mid");
        dt.Columns.Add("Mhid");
        dt.Columns.Add("Mtitle");
        dt.Columns.Add("Mcontent");
        dt.Columns.Add("Mbegin");
        dt.Columns.Add("Mend");
        dt.Columns.Add("Mpublish");
        dt.Columns.Add("Mdate");
        dt.Rows.Add("2", "8", "Match", "Content", "2024-01-01", "2024-01-31", "false", "2024-02-01");

        var result = LearnSite.BLL.BllDataTableMappers.MapTurtleMatchList(dt);

        Assert.Single(result);
        Assert.Equal(2, result[0].Mid);
        Assert.Equal(8, result[0].Mhid);
        Assert.Equal("Match", result[0].Mtitle);
        Assert.Equal("Content", result[0].Mcontent);
        Assert.Equal(new DateTime(2024, 1, 1), result[0].Mbegin);
        Assert.Equal(new DateTime(2024, 1, 31), result[0].Mend);
        Assert.False(result[0].Mpublish);
        Assert.Equal(new DateTime(2024, 2, 1), result[0].Mdate);
    }

    [Fact]
    public void BllDataTableMappers_MapCoursesList_MapsCoreCourseFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Cid");
        dt.Columns.Add("Ctitle");
        dt.Columns.Add("Cclass");
        dt.Columns.Add("Ccontent");
        dt.Columns.Add("Cdate");
        dt.Columns.Add("Chit");
        dt.Columns.Add("Cobj");
        dt.Columns.Add("Cterm");
        dt.Columns.Add("Cks");
        dt.Columns.Add("Cfiletype");
        dt.Columns.Add("Cupload");
        dt.Columns.Add("Chid");
        dt.Columns.Add("Cpublish");
        dt.Rows.Add("11", "Course A", "1,2", "Body", "2024-03-01", "5", "6", "1", "2", "html", "1", "9", "true");

        var result = LearnSite.BLL.BllDataTableMappers.MapCoursesList(dt);

        Assert.Single(result);
        Assert.Equal(11, result[0].Cid);
        Assert.Equal("Course A", result[0].Ctitle);
        Assert.Equal("1,2", result[0].Cclass);
        Assert.Equal("Body", result[0].Ccontent);
        Assert.Equal(new DateTime(2024, 3, 1), result[0].Cdate);
        Assert.Equal(5, result[0].Chit);
        Assert.Equal(6, result[0].Cobj);
        Assert.Equal(1, result[0].Cterm);
        Assert.Equal(2, result[0].Cks);
        Assert.Equal("html", result[0].Cfiletype);
        Assert.True(result[0].Cupload);
        Assert.Equal(9, result[0].Chid);
        Assert.True(result[0].Cpublish);
    }

    [Fact]
    public void BllDataTableMappers_MapQuizList_MapsQuizFieldsAndBooleanVariants()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Qid");
        dt.Columns.Add("Qtype");
        dt.Columns.Add("Question");
        dt.Columns.Add("Qanswer");
        dt.Columns.Add("Qanalyze");
        dt.Columns.Add("Qscore");
        dt.Columns.Add("Qclass");
        dt.Columns.Add("Qselect");
        dt.Columns.Add("Qright");
        dt.Columns.Add("Qwrong");
        dt.Columns.Add("Qaccuracy");
        dt.Rows.Add("12", "2", "What is 2+2?", "4", "basic math", "5", "6,1", "false", "10", "1", "90");

        var result = LearnSite.BLL.BllDataTableMappers.MapQuizList(dt);

        Assert.Single(result);
        Assert.Equal(12, result[0].Qid);
        Assert.Equal(2, result[0].Qtype);
        Assert.Equal("What is 2+2?", result[0].Question);
        Assert.Equal("4", result[0].Qanswer);
        Assert.Equal("basic math", result[0].Qanalyze);
        Assert.Equal(5, result[0].Qscore);
        Assert.Equal("6,1", result[0].Qclass);
        Assert.False(result[0].Qselect);
        Assert.Equal(10, result[0].Qright);
        Assert.Equal(1, result[0].Qwrong);
        Assert.Equal(90, result[0].Qaccuracy);
    }

    [Fact]
    public void BllDataTableMappers_MapSigninList_MapsSigninFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Qid");
        dt.Columns.Add("Qnum");
        dt.Columns.Add("Qattitude");
        dt.Columns.Add("Qdate");
        dt.Columns.Add("Qyear");
        dt.Columns.Add("Qmonth");
        dt.Columns.Add("Qday");
        dt.Columns.Add("Qweek");
        dt.Columns.Add("Qip");
        dt.Columns.Add("Qmachine");
        dt.Columns.Add("Qnote");
        dt.Columns.Add("Qwork");
        dt.Columns.Add("Qgrade");
        dt.Columns.Add("Qterm");
        dt.Rows.Add("18", "2024002", "4", "2024-04-05", "2024", "4", "5", "Fri", "10.0.0.8", "PC-01", "good", "2", "6", "1");

        var result = LearnSite.BLL.BllDataTableMappers.MapSigninList(dt);

        Assert.Single(result);
        Assert.Equal(18, result[0].Qid);
        Assert.Equal("2024002", result[0].Qnum);
        Assert.Equal(4, result[0].Qattitude);
        Assert.Equal(new DateTime(2024, 4, 5), result[0].Qdate);
        Assert.Equal(2024, result[0].Qyear);
        Assert.Equal(4, result[0].Qmonth);
        Assert.Equal(5, result[0].Qday);
        Assert.Equal("Fri", result[0].Qweek);
        Assert.Equal("10.0.0.8", result[0].Qip);
        Assert.Equal("PC-01", result[0].Qmachine);
        Assert.Equal("good", result[0].Qnote);
        Assert.Equal(2, result[0].Qwork);
        Assert.Equal(6, result[0].Qgrade);
        Assert.Equal(1, result[0].Qterm);
    }

    [Fact]
    public void BllDataTableMappers_MapAICustomSkillList_MapsCustomSkillFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Id");
        dt.Columns.Add("SkillName");
        dt.Columns.Add("PromptContent");
        dt.Columns.Add("SkillScope");
        dt.Columns.Add("IsActive");
        dt.Rows.Add("4", "console-helper", "help with console tasks", "chat,console", "1");

        var result = LearnSite.BLL.BllDataTableMappers.MapAICustomSkillList(dt);

        Assert.Single(result);
        Assert.Equal(4, result[0].Id);
        Assert.Equal("console-helper", result[0].SkillName);
        Assert.Equal("help with console tasks", result[0].PromptContent);
        Assert.Equal("chat,console", result[0].SkillScope);
        Assert.True(result[0].IsActive);
    }

    [Fact]
    public void BllDataTableMappers_MapSoftCategoryList_MapsCategoryFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Yid");
        dt.Columns.Add("Ysort");
        dt.Columns.Add("Ytitle");
        dt.Columns.Add("Ycontent");
        dt.Columns.Add("Yopen");
        dt.Rows.Add("6", "3", "Graphics", "Drawing tools", "true");

        var result = LearnSite.BLL.BllDataTableMappers.MapSoftCategoryList(dt);

        Assert.Single(result);
        Assert.Equal(6, result[0].Yid);
        Assert.Equal(3, result[0].Ysort);
        Assert.Equal("Graphics", result[0].Ytitle);
        Assert.Equal("Drawing tools", result[0].Ycontent);
        Assert.True(result[0].Yopen);
    }

    [Fact]
    public void BllDataTableMappers_MapWorksList_MapsCoreWorkFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Wid");
        dt.Columns.Add("Wnum");
        dt.Columns.Add("Wcid");
        dt.Columns.Add("Wmid");
        dt.Columns.Add("Wmsort");
        dt.Columns.Add("Wfilename");
        dt.Columns.Add("Wurl");
        dt.Columns.Add("Wlength");
        dt.Columns.Add("Wscore");
        dt.Columns.Add("Wdate");
        dt.Columns.Add("Wip");
        dt.Columns.Add("Wtime");
        dt.Columns.Add("Wvote");
        dt.Columns.Add("Wegg");
        dt.Columns.Add("Wcheck");
        dt.Columns.Add("Wself");
        dt.Columns.Add("Wcan");
        dt.Columns.Add("Wgood");
        dt.Columns.Add("Wtype");
        dt.Columns.Add("Wgrade");
        dt.Columns.Add("Wterm");
        dt.Columns.Add("Whit");
        dt.Columns.Add("Wlscore");
        dt.Columns.Add("Wlemotion");
        dt.Columns.Add("Woffice");
        dt.Columns.Add("Wflash");
        dt.Columns.Add("Werror");
        dt.Columns.Add("Wfscore");
        dt.Rows.Add("21", "2024003", "9", "10", "2", "demo.docx", "/upload/demo.docx", "2048", "10", "2024-04-06", "10.0.0.9", "08:30", "3", "1", "true", "self note", "1", "false", "docx", "6", "2", "15", "8", "5", "false", "1", "false", "7");

        var result = LearnSite.BLL.BllDataTableMappers.MapWorksList(dt);

        Assert.Single(result);
        Assert.Equal(21, result[0].Wid);
        Assert.Equal("2024003", result[0].Wnum);
        Assert.Equal(9, result[0].Wcid);
        Assert.Equal(10, result[0].Wmid);
        Assert.Equal(2, result[0].Wmsort);
        Assert.Equal("demo.docx", result[0].Wfilename);
        Assert.Equal("/upload/demo.docx", result[0].Wurl);
        Assert.Equal(2048, result[0].Wlength);
        Assert.Equal(10, result[0].Wscore);
        Assert.Equal(new DateTime(2024, 4, 6), result[0].Wdate);
        Assert.Equal("10.0.0.9", result[0].Wip);
        Assert.Equal("08:30", result[0].Wtime);
        Assert.Equal(3, result[0].Wvote);
        Assert.Equal(1, result[0].Wegg);
        Assert.True(result[0].Wcheck);
        Assert.Equal("self note", result[0].Wself);
        Assert.True(result[0].Wcan);
        Assert.False(result[0].Wgood);
        Assert.Equal("docx", result[0].Wtype);
        Assert.Equal(6, result[0].Wgrade);
        Assert.Equal(2, result[0].Wterm);
        Assert.Equal(15, result[0].Whit);
        Assert.Equal(8, result[0].Wlscore);
        Assert.Equal(5, result[0].Wlemotion);
        Assert.False(result[0].Woffice);
        Assert.False(result[0].Wflash);
        Assert.Equal(7, result[0].Wfscore);
    }

    [Fact]
    public void BllDataTableMappers_MapSolvesList_MapsAnswerAndScoreFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Vid");
        dt.Columns.Add("Vpid");
        dt.Columns.Add("Vsid");
        dt.Columns.Add("Vanswer");
        dt.Columns.Add("Vright");
        dt.Columns.Add("Vscore");
        dt.Columns.Add("Vdate");
        dt.Rows.Add("31", "8", "15", "A", "false", "88", "2024-04-07");

        var result = LearnSite.BLL.BllDataTableMappers.MapSolvesList(dt);

        Assert.Single(result);
        Assert.Equal(31, result[0].Vid);
        Assert.Equal(8, result[0].Vpid);
        Assert.Equal(15, result[0].Vsid);
        Assert.Equal("A", result[0].Vanswer);
        Assert.False(result[0].Vright);
        Assert.Equal(88, result[0].Vscore);
        Assert.Equal(new DateTime(2024, 4, 7), result[0].Vdate);
    }

    [Fact]
    public void BllDataTableMappers_MapTxtFormList_MapsFormFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Mid");
        dt.Columns.Add("Mtitle");
        dt.Columns.Add("Mcid");
        dt.Columns.Add("Mcontent");
        dt.Columns.Add("Mdate");
        dt.Columns.Add("Mhit");
        dt.Columns.Add("Mpublish");
        dt.Columns.Add("Mdelete");
        dt.Columns.Add("Mcollabo");
        dt.Rows.Add("41", "Survey Form", "12", "<p>body</p>", "2024-04-08", "6", "1", "false", "true");

        var result = LearnSite.BLL.BllDataTableMappers.MapTxtFormList(dt);

        Assert.Single(result);
        Assert.Equal(41, result[0].Mid);
        Assert.Equal("Survey Form", result[0].Mtitle);
        Assert.Equal(12, result[0].Mcid);
        Assert.Equal("<p>body</p>", result[0].Mcontent);
        Assert.Equal(new DateTime(2024, 4, 8), result[0].Mdate);
        Assert.Equal(6, result[0].Mhit);
        Assert.True(result[0].Mpublish);
        Assert.False(result[0].Mdelete);
        Assert.True(result[0].Mcollabo);
    }

    [Fact]
    public void BllDataTableMappers_MapMenuWorksList_MapsMenuWorkFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Kid");
        dt.Columns.Add("Ksid");
        dt.Columns.Add("Klid");
        dt.Columns.Add("Ktime");
        dt.Columns.Add("Kseconds");
        dt.Columns.Add("Kcheck");
        dt.Columns.Add("Kstar");
        dt.Rows.Add("51", "1001", "88", "12", "720", "true", "4");

        var result = LearnSite.BLL.BllDataTableMappers.MapMenuWorksList(dt);

        Assert.Single(result);
        Assert.Equal(51, result[0].Kid);
        Assert.Equal(1001, result[0].Ksid);
        Assert.Equal(88, result[0].Klid);
        Assert.Equal(12, result[0].Ktime);
        Assert.Equal(720, result[0].Kseconds);
        Assert.True(result[0].Kcheck);
        Assert.Equal(4, result[0].Kstar);
    }

    [Fact]
    public void BllDataTableMappers_MapTxtFormBackList_MapsBackFormFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Rid");
        dt.Columns.Add("Rmid");
        dt.Columns.Add("Rsnum");
        dt.Columns.Add("Rsid");
        dt.Columns.Add("Rwords");
        dt.Columns.Add("Rtime");
        dt.Columns.Add("Rip");
        dt.Columns.Add("Rscore");
        dt.Columns.Add("Ryear");
        dt.Columns.Add("Rterm");
        dt.Columns.Add("Rgrade");
        dt.Columns.Add("Rclass");
        dt.Columns.Add("Ragree");
        dt.Columns.Add("Rlid");
        dt.Columns.Add("Rcontent");
        dt.Rows.Add("61", "41", "2024005", "3001", "short words", "2024-04-09", "10.0.0.10", "95", "2024", "2", "6", "3", "7", "90", "long content");

        var result = LearnSite.BLL.BllDataTableMappers.MapTxtFormBackList(dt);

        Assert.Single(result);
        Assert.Equal(61, result[0].Rid);
        Assert.Equal(41, result[0].Rmid);
        Assert.Equal("2024005", result[0].Rsnum);
        Assert.Equal(3001, result[0].Rsid);
        Assert.Equal("short words", result[0].Rwords);
        Assert.Equal(new DateTime(2024, 4, 9), result[0].Rtime);
        Assert.Equal("10.0.0.10", result[0].Rip);
        Assert.Equal(95, result[0].Rscore);
        Assert.Equal(2024, result[0].Ryear);
        Assert.Equal(2, result[0].Rterm);
        Assert.Equal(6, result[0].Rgrade);
        Assert.Equal(3, result[0].Rclass);
        Assert.Equal(7, result[0].Ragree);
        Assert.Equal(90, result[0].Rlid);
        Assert.Equal("long content", result[0].Rcontent);
    }

    [Fact]
    public void BllDataTableMappers_MapSurveyList_MapsSurveyFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Vid");
        dt.Columns.Add("Vcid");
        dt.Columns.Add("Vhid");
        dt.Columns.Add("Vtitle");
        dt.Columns.Add("Vcontent");
        dt.Columns.Add("Vtype");
        dt.Columns.Add("Vtotal");
        dt.Columns.Add("Vscore");
        dt.Columns.Add("Vaverage");
        dt.Columns.Add("Vclose");
        dt.Columns.Add("Vpoint");
        dt.Columns.Add("Vdate");
        dt.Rows.Add("71", "12", "5", "Survey A", "content", "2", "10", "100", "86", "false", "1", "2024-04-10");

        var result = LearnSite.BLL.BllDataTableMappers.MapSurveyList(dt);

        Assert.Single(result);
        Assert.Equal(71, result[0].Vid);
        Assert.Equal(12, result[0].Vcid);
        Assert.Equal(5, result[0].Vhid);
        Assert.Equal("Survey A", result[0].Vtitle);
        Assert.Equal("content", result[0].Vcontent);
        Assert.Equal(2, result[0].Vtype);
        Assert.Equal(10, result[0].Vtotal);
        Assert.Equal(100, result[0].Vscore);
        Assert.Equal(86, result[0].Vaverage);
        Assert.False(result[0].Vclose);
        Assert.True(result[0].Vpoint);
        Assert.Equal(new DateTime(2024, 4, 10), result[0].Vdate);
    }

    [Fact]
    public void BllDataTableMappers_MapSurveyItemList_MapsSurveyItemFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Mid");
        dt.Columns.Add("Mqid");
        dt.Columns.Add("Mvid");
        dt.Columns.Add("Mitem");
        dt.Columns.Add("Mscore");
        dt.Columns.Add("Mcount");
        dt.Rows.Add("81", "9", "71", "Option A", "5", "12");

        var result = LearnSite.BLL.BllDataTableMappers.MapSurveyItemList(dt);

        Assert.Single(result);
        Assert.Equal(81, result[0].Mid);
        Assert.Equal(9, result[0].Mqid);
        Assert.Equal(71, result[0].Mvid);
        Assert.Equal("Option A", result[0].Mitem);
        Assert.Equal(5, result[0].Mscore);
        Assert.Equal(12, result[0].Mcount);
    }

    [Fact]
    public void BllDataTableMappers_MapSurveyQuestionList_MapsSurveyQuestionFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Qid");
        dt.Columns.Add("Qvid");
        dt.Columns.Add("Qcid");
        dt.Columns.Add("Qtitle");
        dt.Columns.Add("Qcount");
        dt.Rows.Add("91", "71", "12", "How satisfied are you?", "30");

        var result = LearnSite.BLL.BllDataTableMappers.MapSurveyQuestionList(dt);

        Assert.Single(result);
        Assert.Equal(91, result[0].Qid);
        Assert.Equal(71, result[0].Qvid);
        Assert.Equal(12, result[0].Qcid);
        Assert.Equal("How satisfied are you?", result[0].Qtitle);
        Assert.Equal(30, result[0].Qcount);
    }

    [Fact]
    public void BllDataTableMappers_MapSoftList_MapsSoftFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Fid");
        dt.Columns.Add("Ftitle");
        dt.Columns.Add("Fcontent");
        dt.Columns.Add("Furl");
        dt.Columns.Add("Fhit");
        dt.Columns.Add("Fdate");
        dt.Columns.Add("Ffiletype");
        dt.Columns.Add("Fclass");
        dt.Columns.Add("Fhide");
        dt.Columns.Add("Fopen");
        dt.Columns.Add("Fhid");
        dt.Columns.Add("Fyid");
        dt.Rows.Add("101", "Tool A", "soft content", "/download/tool-a.zip", "8", "2024-04-11", "zip", "tools", "true", "1", "5", "2");

        var result = LearnSite.BLL.BllDataTableMappers.MapSoftList(dt);

        Assert.Single(result);
        Assert.Equal(101, result[0].Fid);
        Assert.Equal("Tool A", result[0].Ftitle);
        Assert.Equal("soft content", result[0].Fcontent);
        Assert.Equal("/download/tool-a.zip", result[0].Furl);
        Assert.Equal(8, result[0].Fhit);
        Assert.Equal(new DateTime(2024, 4, 11), result[0].Fdate);
        Assert.Equal("zip", result[0].Ffiletype);
        Assert.Equal("tools", result[0].Fclass);
        Assert.True(result[0].Fhide);
        Assert.Equal(1, result[0].Fopen);
        Assert.Equal(5, result[0].Fhid);
        Assert.Equal(2, result[0].Fyid);
    }

    [Fact]
    public void BllDataTableMappers_MapResearchList_MapsResearchFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Rid");
        dt.Columns.Add("Rsid");
        dt.Columns.Add("Ryear");
        dt.Columns.Add("Rgrade");
        dt.Columns.Add("Rclass");
        dt.Columns.Add("Rterm");
        dt.Columns.Add("Rlearn");
        dt.Columns.Add("Rplay");
        dt.Columns.Add("Rsleep");
        dt.Columns.Add("Rfree");
        dt.Columns.Add("Rdate");
        dt.Rows.Add("111", "3002", "2024", "6", "2", "1", "2.5", "1.5", "8", "3", "2024-04-12");

        var result = LearnSite.BLL.BllDataTableMappers.MapResearchList(dt);

        Assert.Single(result);
        Assert.Equal(111, result[0].Rid);
        Assert.Equal(3002, result[0].Rsid);
        Assert.Equal(2024, result[0].Ryear);
        Assert.Equal(6, result[0].Rgrade);
        Assert.Equal(2, result[0].Rclass);
        Assert.Equal(1, result[0].Rterm);
        Assert.Equal(2.5m, result[0].Rlearn);
        Assert.Equal(1.5m, result[0].Rplay);
        Assert.Equal(8m, result[0].Rsleep);
        Assert.Equal(3m, result[0].Rfree);
        Assert.Equal(new DateTime(2024, 4, 12), result[0].Rdate);
    }

    [Fact]
    public void BllDataTableMappers_MapResultList_MapsResultFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Rid");
        dt.Columns.Add("Rnum");
        dt.Columns.Add("Rscore");
        dt.Columns.Add("Rdate");
        dt.Columns.Add("Rhistory");
        dt.Columns.Add("Rwrong");
        dt.Columns.Add("Rgrade");
        dt.Columns.Add("Rterm");
        dt.Rows.Add("121", "2024008", "96", "2024-04-13", "1,2,3", "4,5", "6", "2");

        var result = LearnSite.BLL.BllDataTableMappers.MapResultList(dt);

        Assert.Single(result);
        Assert.Equal(121, result[0].Rid);
        Assert.Equal("2024008", result[0].Rnum);
        Assert.Equal(96, result[0].Rscore);
        Assert.Equal(new DateTime(2024, 4, 13), result[0].Rdate);
        Assert.Equal("1,2,3", result[0].Rhistory);
        Assert.Equal("4,5", result[0].Rwrong);
        Assert.Equal(6, result[0].Rgrade);
        Assert.Equal(2, result[0].Rterm);
    }

    [Fact]
    public void BllDataTableMappers_MapMissionList_MapsMissionFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Mid");
        dt.Columns.Add("Mtitle");
        dt.Columns.Add("Mcid");
        dt.Columns.Add("Mcontent");
        dt.Columns.Add("Mdate");
        dt.Columns.Add("Mhit");
        dt.Columns.Add("Mfiletype");
        dt.Columns.Add("Mupload");
        dt.Columns.Add("Msort");
        dt.Columns.Add("Mpublish");
        dt.Columns.Add("Mgroup");
        dt.Columns.Add("Mgid");
        dt.Rows.Add("131", "Mission A", "20", "mission body", "2024-04-14", "15", "docx", "true", "3", "1", "false", "9");

        var result = LearnSite.BLL.BllDataTableMappers.MapMissionList(dt);

        Assert.Single(result);
        Assert.Equal(131, result[0].Mid);
        Assert.Equal("Mission A", result[0].Mtitle);
        Assert.Equal(20, result[0].Mcid);
        Assert.Equal("mission body", result[0].Mcontent);
        Assert.Equal(new DateTime(2024, 4, 14), result[0].Mdate);
        Assert.Equal(15, result[0].Mhit);
        Assert.Equal("docx", result[0].Mfiletype);
        Assert.True(result[0].Mupload);
        Assert.Equal(3, result[0].Msort);
        Assert.True(result[0].Mpublish);
        Assert.False(result[0].Mgroup);
        Assert.Equal(9, result[0].Mgid);
    }

    [Fact]
    public void BllDataTableMappers_MapListMenuList_MapsListMenuFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Lid");
        dt.Columns.Add("Lcid");
        dt.Columns.Add("Lsort");
        dt.Columns.Add("Ltype");
        dt.Columns.Add("Lxid");
        dt.Columns.Add("Lshow");
        dt.Columns.Add("Ltitle");
        dt.Rows.Add("141", "20", "4", "2", "131", "true", "Menu title");

        var result = LearnSite.BLL.BllDataTableMappers.MapListMenuList(dt);

        Assert.Single(result);
        Assert.Equal(141, result[0].Lid);
        Assert.Equal(20, result[0].Lcid);
        Assert.Equal(4, result[0].Lsort);
        Assert.Equal(2, result[0].Ltype);
        Assert.Equal(131, result[0].Lxid);
        Assert.True(result[0].Lshow);
        Assert.Equal("Menu title", result[0].Ltitle);
    }

    [Fact]
    public void BllDataTableMappers_MapExamsList_MapsExamFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Eid");
        dt.Columns.Add("Etitle");
        dt.Columns.Add("Edescription");
        dt.Columns.Add("Cid");
        dt.Columns.Add("Hid");
        dt.Columns.Add("Etime");
        dt.Columns.Add("Eclose");
        dt.Columns.Add("Escore");
        dt.Columns.Add("Ecount");
        dt.Columns.Add("Edata");
        dt.Rows.Add("151", "Exam A", "desc", "20", "6", "2024-04-15", "false", "100", "25", "json-data");

        var result = LearnSite.BLL.BllDataTableMappers.MapExamsList(dt);

        Assert.Single(result);
        Assert.Equal(151, result[0].Eid);
        Assert.Equal("Exam A", result[0].Etitle);
        Assert.Equal("desc", result[0].Edescription);
        Assert.Equal(20, result[0].Cid);
        Assert.Equal(6, result[0].Hid);
        Assert.Equal(new DateTime(2024, 4, 15), result[0].Etime);
        Assert.False(result[0].Eclose);
        Assert.Equal(100, result[0].Escore);
        Assert.Equal(25, result[0].Ecount);
        Assert.Equal("json-data", result[0].Edata);
    }

    [Fact]
    public void BllDataTableMappers_MapTeacherList_MapsTeacherFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Hid");
        dt.Columns.Add("Hname");
        dt.Columns.Add("Hpwd");
        dt.Columns.Add("Hpermiss");
        dt.Columns.Add("Hnote");
        dt.Rows.Add("161", "teacher1", "pwd123", "true", "note text");

        var result = LearnSite.BLL.BllDataTableMappers.MapTeacherList(dt);

        Assert.Single(result);
        Assert.Equal(161, result[0].Hid);
        Assert.Equal("teacher1", result[0].Hname);
        Assert.Equal("pwd123", result[0].Hpwd);
        Assert.True(result[0].Hpermiss);
        Assert.Equal("note text", result[0].Hnote);
    }

    [Fact]
    public void BllDataTableMappers_MapStudentsExcelList_MapsStudentExcelFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Sid");
        dt.Columns.Add("Snum");
        dt.Columns.Add("Syear");
        dt.Columns.Add("Sgrade");
        dt.Columns.Add("Sclass");
        dt.Columns.Add("Sname");
        dt.Columns.Add("Spwd");
        dt.Columns.Add("Sex");
        dt.Columns.Add("Saddress");
        dt.Columns.Add("Sphone");
        dt.Columns.Add("Sparents");
        dt.Columns.Add("Sheadtheacher");
        dt.Columns.Add("Sscore");
        dt.Columns.Add("Squiz");
        dt.Columns.Add("Sattitude");
        dt.Columns.Add("Sape");
        dt.Rows.Add("171", "2024010", "2024", "6", "1", "Student A", "123456", "F", "addr", "123", "parent", "head", "88", "9", "5", "ape text");

        var result = LearnSite.BLL.BllDataTableMappers.MapStudentsExcelList(dt);

        Assert.Single(result);
        Assert.Equal(171, result[0].Sid);
        Assert.Equal("2024010", result[0].Snum);
        Assert.Equal(2024, result[0].Syear);
        Assert.Equal(6, result[0].Sgrade);
        Assert.Equal(1, result[0].Sclass);
        Assert.Equal("Student A", result[0].Sname);
        Assert.Equal("123456", result[0].Spwd);
        Assert.Equal("F", result[0].Sex);
        Assert.Equal("addr", result[0].Saddress);
        Assert.Equal("123", result[0].Sphone);
        Assert.Equal("parent", result[0].Sparents);
        Assert.Equal("head", result[0].Sheadtheacher);
        Assert.Equal(88, result[0].Sscore);
        Assert.Equal(9, result[0].Squiz);
        Assert.Equal(5, result[0].Sattitude);
        Assert.Equal("ape text", result[0].Sape);
    }

    [Fact]
    public void BllDataTableMappers_MapShareDiskList_MapsShareDiskFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Kid");
        dt.Columns.Add("Kown");
        dt.Columns.Add("Kyear");
        dt.Columns.Add("Kgrade");
        dt.Columns.Add("Kclass");
        dt.Columns.Add("Kgroup");
        dt.Columns.Add("Knum");
        dt.Columns.Add("Kname");
        dt.Columns.Add("Kfilename");
        dt.Columns.Add("Kfsize");
        dt.Columns.Add("Kfurl");
        dt.Columns.Add("Kftpe");
        dt.Columns.Add("Kfdate");
        dt.Rows.Add("181", "1", "2024", "6", "2", "3", "2024011", "Student B", "demo.docx", "2048", "/disk/demo.docx", "docx", "2024-04-16");

        var result = LearnSite.BLL.BllDataTableMappers.MapShareDiskList(dt);

        Assert.Single(result);
        Assert.Equal(181, result[0].Kid);
        Assert.True(result[0].Kown);
        Assert.Equal(2024, result[0].Kyear);
        Assert.Equal(6, result[0].Kgrade);
        Assert.Equal(2, result[0].Kclass);
        Assert.Equal(3, result[0].Kgroup);
        Assert.Equal("2024011", result[0].Knum);
        Assert.Equal("Student B", result[0].Kname);
        Assert.Equal("demo.docx", result[0].Kfilename);
        Assert.Equal(2048, result[0].Kfsize);
        Assert.Equal("/disk/demo.docx", result[0].Kfurl);
        Assert.Equal("docx", result[0].Kftpe);
        Assert.Equal(new DateTime(2024, 4, 16), result[0].Kfdate);
    }

    [Fact]
    public void BllDataTableMappers_MapTopicReplyList_MapsTopicReplyFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Rid");
        dt.Columns.Add("Rtid");
        dt.Columns.Add("Rsnum");
        dt.Columns.Add("Rwords");
        dt.Columns.Add("Rtime");
        dt.Columns.Add("Rip");
        dt.Columns.Add("Rscore");
        dt.Columns.Add("Rban");
        dt.Columns.Add("Rgrade");
        dt.Columns.Add("Rterm");
        dt.Columns.Add("Rcid");
        dt.Columns.Add("Rclass");
        dt.Rows.Add("191", "12", "2024012", "reply body", "2024-04-17", "10.0.0.20", "6", "false", "6", "2", "20", "3");

        var result = LearnSite.BLL.BllDataTableMappers.MapTopicReplyList(dt);

        Assert.Single(result);
        Assert.Equal(191, result[0].Rid);
        Assert.Equal(12, result[0].Rtid);
        Assert.Equal("2024012", result[0].Rsnum);
        Assert.Equal("reply body", result[0].Rwords);
        Assert.Equal(new DateTime(2024, 4, 17), result[0].Rtime);
        Assert.Equal("10.0.0.20", result[0].Rip);
        Assert.Equal(6, result[0].Rscore);
        Assert.False(result[0].Rban);
        Assert.Equal(6, result[0].Rgrade);
        Assert.Equal(2, result[0].Rterm);
        Assert.Equal(20, result[0].Rcid);
        Assert.Equal(3, result[0].Rclass);
    }

    [Fact]
    public void BllDataTableMappers_MapWorksDiscussList_MapsWorksDiscussFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Did");
        dt.Columns.Add("Dwid");
        dt.Columns.Add("Dsnum");
        dt.Columns.Add("Dwords");
        dt.Columns.Add("Dtime");
        dt.Columns.Add("Dip");
        dt.Rows.Add("201", "21", "2024013", "good work", "2024-04-18", "10.0.0.21");

        var result = LearnSite.BLL.BllDataTableMappers.MapWorksDiscussList(dt);

        Assert.Single(result);
        Assert.Equal(201, result[0].Did);
        Assert.Equal(21, result[0].Dwid);
        Assert.Equal("2024013", result[0].Dsnum);
        Assert.Equal("good work", result[0].Dwords);
        Assert.Equal(new DateTime(2024, 4, 18), result[0].Dtime);
        Assert.Equal("10.0.0.21", result[0].Dip);
    }

    [Fact]
    public void BllDataTableMappers_MapTopicDiscussList_MapsTopicDiscussFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Tid");
        dt.Columns.Add("Tcid");
        dt.Columns.Add("Ttitle");
        dt.Columns.Add("Tcontent");
        dt.Columns.Add("Tcount");
        dt.Columns.Add("Tteacher");
        dt.Columns.Add("Tdate");
        dt.Columns.Add("Tclose");
        dt.Columns.Add("Tresult");
        dt.Rows.Add("211", "20", "Topic A", "topic body", "14", "6", "2024-04-19", "true", "teacher summary");

        var result = LearnSite.BLL.BllDataTableMappers.MapTopicDiscussList(dt);

        Assert.Single(result);
        Assert.Equal(211, result[0].Tid);
        Assert.Equal(20, result[0].Tcid);
        Assert.Equal("Topic A", result[0].Ttitle);
        Assert.Equal("topic body", result[0].Tcontent);
        Assert.Equal(14, result[0].Tcount);
        Assert.Equal(6, result[0].Tteacher);
        Assert.Equal(new DateTime(2024, 4, 19), result[0].Tdate);
        Assert.True(result[0].Tclose);
        Assert.Equal("teacher summary", result[0].Tresult);
    }

    [Fact]
    public void BllDataTableMappers_MapTurtleAnswerList_MapsTurtleAnswerFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Aid");
        dt.Columns.Add("Amid");
        dt.Columns.Add("Aqid");
        dt.Columns.Add("Acode");
        dt.Columns.Add("Aimg");
        dt.Columns.Add("Aurl");
        dt.Columns.Add("Aout");
        dt.Columns.Add("Ascore");
        dt.Columns.Add("Asid");
        dt.Columns.Add("Asname");
        dt.Columns.Add("Alock");
        dt.Columns.Add("Adate");
        dt.Rows.Add("221", "31", "41", "print(1)", "img.png", "/turtle/a.png", "ok", "10", "3003", "stu-a", "true", "2024-04-20");

        var result = LearnSite.BLL.BllDataTableMappers.MapTurtleAnswerList(dt);

        Assert.Single(result);
        Assert.Equal(221, result[0].Aid);
        Assert.Equal(31, result[0].Amid);
        Assert.Equal(41, result[0].Aqid);
        Assert.Equal("print(1)", result[0].Acode);
        Assert.Equal("img.png", result[0].Aimg);
        Assert.Equal("/turtle/a.png", result[0].Aurl);
        Assert.Equal("ok", result[0].Aout);
        Assert.Equal(10, result[0].Ascore);
        Assert.Equal(3003, result[0].Asid);
        Assert.Equal("stu-a", result[0].Asname);
        Assert.True(result[0].Alock);
        Assert.Equal(new DateTime(2024, 4, 20), result[0].Adate);
    }

    [Fact]
    public void BllDataTableMappers_MapTurtleQuestionList_MapsTurtleQuestionFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Qid");
        dt.Columns.Add("Qmid");
        dt.Columns.Add("Qtitle");
        dt.Columns.Add("Qcontent");
        dt.Columns.Add("Qdegree");
        dt.Columns.Add("Qsort");
        dt.Columns.Add("Qcode");
        dt.Columns.Add("Qimg");
        dt.Columns.Add("Qurl");
        dt.Columns.Add("Qout");
        dt.Columns.Add("Qscore");
        dt.Columns.Add("Qdate");
        dt.Rows.Add("231", "31", "Question A", "content", "2", "1", "code", "res.png", "/q/res.png", "done", "8", "2024-04-21");

        var result = LearnSite.BLL.BllDataTableMappers.MapTurtleQuestionList(dt);

        Assert.Single(result);
        Assert.Equal(231, result[0].Qid);
        Assert.Equal(31, result[0].Qmid);
        Assert.Equal("Question A", result[0].Qtitle);
        Assert.Equal("content", result[0].Qcontent);
        Assert.Equal(2, result[0].Qdegree);
        Assert.Equal(1, result[0].Qsort);
        Assert.Equal("code", result[0].Qcode);
        Assert.Equal("res.png", result[0].Qimg);
        Assert.Equal("/q/res.png", result[0].Qurl);
        Assert.Equal("done", result[0].Qout);
        Assert.Equal(8, result[0].Qscore);
        Assert.Equal(new DateTime(2024, 4, 21), result[0].Qdate);
    }

    [Fact]
    public void BllDataTableMappers_MapTurtleList_MapsTurtleFields()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Tid");
        dt.Columns.Add("Thid");
        dt.Columns.Add("Ttilte");
        dt.Columns.Add("Tcontent");
        dt.Columns.Add("Tdegree");
        dt.Columns.Add("Tsort");
        dt.Columns.Add("Tcode");
        dt.Columns.Add("Timg");
        dt.Columns.Add("Turl");
        dt.Columns.Add("Tout");
        dt.Columns.Add("Tdate");
        dt.Columns.Add("Tstudy");
        dt.Columns.Add("Tsid");
        dt.Columns.Add("Tscore");
        dt.Columns.Add("Tip");
        dt.Rows.Add("241", "6", "Turtle A", "body", "1", "3", "code", "img", "/turtle/x.png", "out", "2024-04-22", "false", "3004", "7", "10.0.0.22");

        var result = LearnSite.BLL.BllDataTableMappers.MapTurtleList(dt);

        Assert.Single(result);
        Assert.Equal(241, result[0].Tid);
        Assert.Equal(6, result[0].Thid);
        Assert.Equal("Turtle A", result[0].Ttilte);
        Assert.Equal("body", result[0].Tcontent);
        Assert.Equal(1, result[0].Tdegree);
        Assert.Equal(3, result[0].Tsort);
        Assert.Equal("code", result[0].Tcode);
        Assert.Equal("img", result[0].Timg);
        Assert.Equal("/turtle/x.png", result[0].Turl);
        Assert.Equal("out", result[0].Tout);
        Assert.Equal(new DateTime(2024, 4, 22), result[0].Tdate);
        Assert.False(result[0].Tstudy);
        Assert.Equal(3004, result[0].Tsid);
        Assert.Equal(7, result[0].Tscore);
        Assert.Equal("10.0.0.22", result[0].Tip);
    }
}
