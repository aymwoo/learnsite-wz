# 更新日志 (CHANGELOG)

## 2026-04-05

### UI 重构
- **学生端统一 `prog-*` 设计系统**：将 `student/` 下所有使用 `Scm.master` 的页面从混用 Tailwind 工具类迁移至自洽的 `prog-*` CSS 设计系统（命名风格对齐教师端 `lesson-*`），彻底消除对 CDN Tailwind 的运行时依赖
- **学案导航条（lessonav）修复**：`Scm.master` 中解析 `asp:Menu`（`Menuact`）的 JS 从查找 `<table>` 改为查找 `<ul><li>`（`web.config` 设定 `controlRenderingCompatibilityVersion="4.8"` 渲染为列表结构），修复了环节导航链接完全不显示的 bug
- **Sidebar sticky 修复**：移除 `.scm-content-card` 上的 `overflow: hidden`，该属性会裁剪内部 `position: sticky` 的 sidebar，导致其随页面滚动消失
- **皮肤样式覆盖**：`SkinID="buttonSkinPink"` 和 `SkinID="HyperLinkPink"` 会在渲染时注入内联 `background-color`、`height`、`width`、`font-size` 等样式，各页面已通过高优先级 `!important` CSS 规则将其统一压制并替换为 `prog-btn-*` 系列样式

### 涉及文件
- `student/Scm.master`：topbar 精简（品牌 + 我的首页），新增 `scm-lessonav` 学案导航条（sticky top:56px），JS 全面重写，移除 `overflow: hidden`
- `student/program.aspx`：两栏 `prog-grid`（`1fr 300px`），sidebar `sticky top:116px`，按钮统一为 `prog-btn-*` 系列，skin 样式覆盖
- `student/showcourse.aspx`：去掉双层卡片包裹，简化结构
- `student/myevaluate.aspx`：补加 `<meta charset="UTF-8">` 修复乱码
- `student/txtform.aspx`：整体改为 `prog-grid`，sidebar 改为 `prog-card prog-sidebar-card`，按钮统一
- `student/showmission.aspx`：同上，内部上传控件、GridView、Panel 完全保留，仅外层结构和样式改为 `prog-*` 系统
- `student/showtask.aspx`：同上，Plupload 上传逻辑完整保留，仅外层结构和样式改为 `prog-*` 系统
- `student/console.aspx`：同上，GridView 测评面板和 `BtnIdle`（`SkinID="buttonSkinPink"`）完整保留，外层改为 `prog-*` 系统并处理 skin 覆盖

## 2026-04-03

### UI 重构
- **管理器页面全面现代化**：所有 manager 页面采用浅色主题替代深色渐变，统一视觉风格
- **字体尺寸优化**：全局字体从 13px 提升至 14px，增强可读性
- **布局约束移除**：删除所有母版页的 `max-w-[1400px]` 限制，内容自适应宽度
- **机房选择交互增强**：添加点击选择、悬停效果、绿色指示点和选中状态高亮
- **侧边栏紧凑化**：导航菜单字体从 13px 调整为 11px，更紧凑的布局
- **教师信息页面重设计**：采用卡片式布局，班级卡片添加 6 色循环色系
- **机房布置页面重构**：采用现代化卡片式布局，优化表格和按钮样式
- **备份优秀作品页面重设计**：采用现代化卡片式布局
- **拖拽上传功能**：学生导入页面添加现代化的拖拽文件上传区域

### 新功能
- **学案封面图片**：课程编辑页面支持上传和保存学案封面图片，带预览和移除功能
- **管理器头部退出按钮**：在管理控制台头部添加快捷退出按钮，正确清除 Cookie 并跳转
- **AI 教学助手**：任务创建页面集成 AI 教学助手侧边栏，支持提示词生成内容并插入编辑器
- **AI 聊天 API**：新增 `aiprovider_api.ashx` 的 chat 端点，支持调用默认 AI 提供商生成内容

### 问题修复
- **空值检查增强**：`start.aspx.cs` 和 `student.aspx.cs` 添加 room model 空值检查，防止 null 引用异常
- **课程列表组件优化**：`courseshow.aspx` 从 GridView 改为 Repeater，简化代码结构
- **删除逻辑优化**：课程菜单删除操作使用模型获取数据，避免依赖行索引
- **复选框样式改进**：教师添加页面的权限复选框使用自定义样式，对齐更合理

### 性能优化
- **拖拽排序精简**：课程菜单拖拽排序移除 requestAnimationFrame，简化事件绑定
- **代码精简**：合并多个 case 分支，使用对象初始化器替代冗余代码

## 2026-04-02

### 新功能
- **AI 模型提供商管理**：新增 `aiprovider.aspx` 页面，支持添加、编辑、删除、测试连接、批量 JSON 导入 AI 提供商配置（通义千问/DeepSeek/智谱GLM 等），数据库自动建表及默认数据填充
- **多编辑器切换**：课程编辑、活动添加/编辑页面（`courseedit`/`missionadd`/`missionedit`）支持 KindEditor、WangEditor、Vditor 三种编辑器切换，使用下拉菜单选择
- **教师模块 UI 现代化**：教师后台全面采用 Tailwind CSS 重构为现代 SaaS 风格界面
- **核心控制台解构升级**：`teacher/systeminfo.aspx`，`teacher/works.aspx` 及 `teacher/student.aspx` 彻底淘汰了拥有十余年历史的定宽表格排版，运用 3列现代网格交互仪表盘和悬浮卡片包装组件进行深层结构重铸
- **周边工具弹性化适配**：`student/chat.aspx`，`student/kitymind.aspx` 及各类细节子模块从 612固定宽度的 float 浮动布局改为自适应宽高 Flexbox/Grid，引入现代化专属交互反馈动画
- **学生页面 UI 重构**：学生端页面使用 Tailwind CSS 重构，统一视觉风格
- **测试基础设施**：引入 xUnit 测试框架，添加 EnDeCode 加解密、ImageCheck 图片类型检测等单元测试
- **开发环境启动脚本**：新增 `start_dev.sh`，支持 Arch Linux 下使用国内 Docker 镜像快速搭建开发环境

### 问题修复
- 修复 AI 提供商 API（`aiprovider_api.ashx`）编译错误：`JudgeTeacherCookies()` 返回 `void` 不可对其取反，改用 Cookie 存在性检查
- 修复 Vditor Markdown 编辑器 `html2md` 调用时 lute WASM 未就绪导致的报错
- 修复 `teacher/works.aspx` 顶部控制菜单多重嵌套和重复 ID 导致的 ASP.NET 编译器致命错误
- 修复 `teacher/student.aspx` 数据表格 DOM 原生结构在之前编辑中缺失 <GridView> 主标签的问题并补全弹模绑定
- 修复 `teacher/index.aspx` (登录按钮) 和 `teacher/Teach.master` (Header) 文字溢出及超出屏幕边缘产生横向滚动轴的兼容性 bug
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
