#import "../config.typ": template, tufted

#show: template.with(
  title: "Home",
  description: "博十七's Blog 首页",
)

#html.h2(class: "home-title", "博十七's Blog")

欢迎来到博十七的博客。一起记录，思考，沉淀。
实事求是，以史为鉴。

// AUTO_SIDEBAR_START
#tufted.margin-note[
#html.span(class: "home-sidebar", [
*分享* #linebreak()
#link("https://twitter.com/intent/tweet?url=https%3A%2F%2Fblog17.github.io%2F&text=%E5%8D%9A%E5%8D%81%E4%B8%83%27s%20Blog")[X / Twitter] · #link("https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fblog17.github.io%2F")[Facebook] · #link("mailto:?subject=%E5%8D%9A%E5%8D%81%E4%B8%83%27s%20Blog&body=https%3A%2F%2Fblog17.github.io%2F")[Email]
#linebreak() #linebreak()
*更新统计* #linebreak()
总文章：13 #linebreak()
最近更新：2026-02-15 #linebreak()
栏目：人物 / 投资 / 文学 / 时事 #linebreak()
#linebreak()
2026: ▇ (1) #linebreak()
2025: ▇▇▇▇▇▇▇▇▇▇ (8) #linebreak()
2024: ▇▇▇▇▇ (4)
])
]
// AUTO_SIDEBAR_END

== 最近更新（5）

// AUTO_RECENT_START
- `2026-02-15` #link("/文学/2026-02-15-xue-yi-xiang-guo-nian/")[临江仙·雪夜客中岁除]
- `2025-10-30` #link("/时事/2025-10-30-normal-distribution/")[The Normal Distribution: A Fundamental Concept in Statistics]
- `2025-10-30` #link("/文学/2025-10-30-normal-distribution/")[The Normal Distribution: A Fundamental Concept in Statistics]
- `2025-10-30` #link("/投资/2025-10-30-normal-distribution/")[The Normal Distribution: A Fundamental Concept in Statistics]
- `2025-10-30` #link("/人物/2025-10-30-normal-distribution/")[The Normal Distribution: A Fundamental Concept in Statistics]
// AUTO_RECENT_END
