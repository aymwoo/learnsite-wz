# 更新日志

## 近期更新

### ✨ 功能与增强
- Add start_dev.sh to start dev environment on Arch Linux with Chinese Docker mirrors (c39e89d)
- Add unit tests for EnDeCode Encrypt/Decrypt methods (c7a9351)
- Add xUnit tests for ImageCheck.CheckImageType (13f14c8)

### 🐛 问题修复
- fix: 使用国内MCR镜像替代不可用的自定义MSSQL镜像，修复Mono下Socket异常 (e0a3f63)
- Fix SQL injection vulnerability in SurveyFeedback.GetClassScore (0bfd6a6)
- 🔒 fix: SQL Injection in Soft.cs (59a89fa)

### 🚀 性能优化
- perf: Use StringBuilder for TopicReply student list compilation (87a8657)
- perf: batch problem sorting updates to fix N+1 query issue (f6b5b32)
- Fix N+1 query issue in Students.cs TotalSgscore (ddd5e3e)
- Optimize N+1 query in Students Grade Evaluation TermABCDE (49a0bdd)
- Optimize N+1 query in Students.TeamScores (59ec77d)
- Perf: Fix N+1 query issue in Computers.AutoAssign (d5de5ae)
- ⚡ Optimize Qsortnew in TurtleQuestion (b1b5ed3)
- perf: fix N+1 query issue in AutoSleader group allocation (072f2f5)
- Optimize `ShowDoneCourse` with O(1) HashSet lookup (d46a031)
- Performance optimization: Batch UPDATE queries in SoftCategory.initYsort (fc688df)
- ⚡ Optimize string concatenation in `App_Code/Bll/TxtFormBack.cs` and `App_Code/Dal/TxtFormBack.cs` (eefa72a)

### ♻️ 代码重构与代码健康
- Refactor: Remove redundant catch blocks in SharpZip.cs (8aa3091)
- Refactor: remove redundant try-catch blocks in SharpZip (cda0d5f)
- Refactor: Remove commented out code from UpdateStscore method (31954b9)
- Refactor: remove redundant catch block in SharpZip (593ddb2)
- Refactor SQL script file parser in `DbLinkEdit` and `SqlHelper` (f4b4ba0)
- Refactor SurveyQuestion.GetListQuestion to eliminate N+1 queries. (52d2a6b)
- Refactor: Remove empty auto-generated constructor from Htmlcheck (8c8bd38)
- Refactor `DbLinkEdit.cs` to remove TODO and use `StreamReader` in a `using` block (ff97073)
- Refactor: Remove empty auto-generated constructor in psdToBmp (0c9997f)
- Refactor: remove empty default constructor in Flatform.cs (e61eb49)
- Refactor: Remove empty constructor from ImportCourse (122b2b1)
- chore: remove unused constructor TODO comment from MngCook (6db183a)
- chore: remove auto-generated TODO in XmlCourse constructor (88eb5cb)
- Remove empty generated constructor from SharpZip (e35b3ab)
- Remove empty auto-generated constructor from ExcelHelper (b53952d)
- Remove auto-generated TODO comment in Cook constructor (15ddb68)
- chore: Remove TODO comment in TeaCook constructor (161c40d)
- Remove empty constructor and TODO comment in WorkUpload.cs (ec9bd6e)
- 🧹 chore: remove commented-out code in profile/mychange.aspx.cs and profile/myclass.aspx.cs (53c5e15)

### 🔀 分支合并
- Merge PR #20: Remove unused constructor TODO from MngCook (c75ea2f)
- Merge branch 'master' into jules-code-health-sqlhelper-15805562428917896229 (c584d66)
- Merge branch 'master' into perf/fix-n-plus-1-teamscores-5521746855745945154 (cca9807)
- Merge branch 'master' into fix-sql-script-reading-7787076334253603293 (5210aeb)