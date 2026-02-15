#import "tufted-lib/tufted.typ" as tufted

/// 在 `config.typ` 中配置全局模板配置 template
/// 之后的每个页面都会从上个页面导入这个模板函数
/// 在每个具体页面中，都可以通过 `#show: template` 来应用模板
/// 也可以通过 `template.with(...)` 来覆盖某些配置项，从而为某个页面定制参数
#let template = tufted.tufted-web.with(
  /// 网站顶部导航栏的链接字典。格式为 `("链接地址": "显示名称")`。
  // 例如，如果你想添加一个 Entry 页，你需要添加 `"/Entry/": "Entry"`
  // 然后在 `content/` 路径中新建 `Entry/`路径，在其中添加 `index.typ` 作为 Entry 页的内容
  header-links: (
    "/": "家",
    "/时事/": "时事",
    "/投资/": "投资",
    "/文学/": "文学",
    "/人物/": "人物",
  ),
  
  /// 网站的站点标题。会显示在浏览器标签页以及 SEO/社交分享卡片中。
  website-title: "博十七's Blog",
  /// 网站作者。用于生成 <meta name="author"> 标签。（可选）
  author: "@博十七",
  /// 网站描述。用于 SEO 搜索引擎摘要和社交媒体分享预览。（可选）
  description: "博十七's Blog",
  /// 站点的根 URL (例如 "https://example.com")。用于生成 Canonical URL 元数据。（可选）
  website-url: "https://blog17.github.io/",
  /// 网站的默认语言，例如 "zh" 或 "en"，默认为 "zh"。
  lang: "zh",
  /// 订阅源配置 (字符串数组)，指定包含在 RSS 订阅源中的内容目录列表。（可选）
  /// 例如，`("/时事/",)` 会将 `时事` 目录下的所有文章包含在订阅源中。
  feed-dir: ("/时事/", "/投资/", "/文学/", "/人物/"),

  /// Giscus 留言系统（可选）
  /// 1) 先在 GitHub 仓库开启 Discussions
  /// 2) 在 https://giscus.app 获取以下参数
  giscus-enabled: true,
  giscus-repo: "blog17/blog17.github.io",
  giscus-repo-id: "R_kgDORQ5-FQ",
  giscus-category: "General",
  giscus-category-id: "DIC_kwDORQ5-Fc4C2f1Y",
  giscus-mapping: "pathname",
  giscus-strict: "0",
  giscus-reactions-enabled: "1",
  giscus-emit-metadata: "0",
  giscus-input-position: "bottom",
  giscus-theme: "preferred_color_scheme",
  giscus-lang: "zh-CN",
  
  /// 自定义页眉元素列表 (content 数组)。显示在页面顶部。
  header-elements: (
    [你好，欢迎回家。],
  ),
  /// 自定义页脚元素列表 (content 数组)，显示在页面底部。
  footer-elements: (
    "© 2026 博十七",
    [Powered by #link("https://github.com/Yousa-Mirage/Tufted-Blog-Template")[Tufted-Blog-Template]],
  ),
)

// 更多参数可参考网站配置文档。
