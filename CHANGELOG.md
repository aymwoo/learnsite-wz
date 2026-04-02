# 更新日志 (CHANGELOG)

## 2026-04-02

### 新功能
- **AI 模型提供商管理**：新增 `aiprovider.aspx` 页面，支持添加、编辑、删除、测试连接、批量 JSON 导入 AI 提供商配置（通义千问/DeepSeek/智谱GLM 等），数据库自动建表及默认数据填充
- **多编辑器切换**：课程编辑、活动添加/编辑页面（`courseedit`/`missionadd`/`missionedit`）支持 KindEditor、WangEditor、Vditor 三种编辑器切换，使用下拉菜单选择
- **教师模块 UI 现代化**：教师后台全面采用 Tailwind CSS 重构为现代 SaaS 风格界面
- **学生页面 UI 重构**：学生端页面使用 Tailwind CSS 重构，统一视觉风格
- **测试基础设施**：引入 xUnit 测试框架，添加 EnDeCode 加解密、ImageCheck 图片类型检测等单元测试
- **开发环境启动脚本**：新增 `start_dev.sh`，支持 Arch Linux 下使用国内 Docker 镜像快速搭建开发环境

### 问题修复
- 修复 AI 提供商 API（`aiprovider_api.ashx`）编译错误：`JudgeTeacherCookies()` 返回 `void` 不可对其取反，改用 Cookie 存在性检查
- 修复 Vditor Markdown 编辑器 `html2md` 调用时 lute WASM 未就绪导致的报错
- 编辑器 CDN 从不可达的 `unpkg.com` 切换至 `cdn.jsdelivr.net`（WangEditor 固定版本 5.1.23）
- 使用国内 MCR 镜像替代不可用的自定义 MSSQL Docker 镜像，修复 Mono 下 Socket 异常
- 统一教师模块 TinyBox 弹窗为 `Teach.master` 共享 Modal 组件，消除各页面重复代码

### 性能优化
- 教师导航栏新增 AI 模型提供商入口

## 2026-04-01

### 安全修复
- 修复 `SurveyFeedback.GetClassScore` SQL 注入漏洞（参数化查询）
- 修复 `Soft.cs` DAL 层 SQL 注入漏洞

### 性能优化
- `TopicReply` 学生列表拼接改用 StringBuilder，减少字符串分配
- 批量更新 Problem 排序，消除 N+1 查询
- `Students.TotalSgscore` 消除 N+1 查询
- `Students.TermABCDE` 成绩评定消除 N+1 查询
- `Students.TeamScores` 团队分数消除 N+1 查询
- `Computers.AutoAssign` 自动分配消除 N+1 查询
- `TurtleQuestion.Qsortnew` 排序优化
- `AutoSleader` 组长分配消除 N+1 查询
- `Courses.ShowDoneCourse` 使用 HashSet O(1) 查找替代线性扫描
- `SoftCategory.initYsort` 批量 UPDATE 替代逐条执行
- `TxtFormBack` BLL/DAL 层字符串拼接改用 StringBuilder

### 代码重构
- `SharpZip.cs` 移除冗余 try-catch 和空构造函数
- `UpdateStscore` 移除注释代码
- `DbLinkEdit` / `SqlHelper` SQL 脚本解析重构，改用 `using` 管理资源，修复 gb2312 编码读取
- `SurveyQuestion.GetListQuestion` 消除 N+1 查询
- 批量清理多个类中自动生成的空构造函数和 TODO 注释（Htmlcheck、psdToBmp、Flatform、ImportCourse、MngCook、XmlCourse、ExcelHelper、Cook、TeaCook、WorkUpload 等）

## 2026-03-31

- 罗老师常规更新修改

## 2026-03-27

- 在周老师 LearnSiteCode2026-1-27 源码基础上进行修改
- 批量转换项目文件编码为 UTF-8
- 修改 `web.config` 支持 .NET 4.8

## 2026-03-01

- 同步 2026-1-5 版更新内容

## 2026-02-26

- 项目结构梳理
- 添加学案模板（来源：openlearnsite.com）
- 更新 README 说明文档

## 2026-02-25

- 统一全站文件编码格式为 UTF-8
- 调整目录结构（去掉二级目录）
- 新增 `web.config.docker` Docker 环境配置
- 优化项目说明文档

## 2026-01-10

- 上传 LearnSite 信息学习平台 2025-12-30 版源码
- 上传 LearnSiteCode2026-1-5 版源码

## 2025-11-01

- 增加更多功能，符合新课标（2025-9-19 版）

## 2024-09-14

- 项目初始提交（Initial commit）
