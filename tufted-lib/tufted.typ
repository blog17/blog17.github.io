#import "math.typ": template-math
#import "refs.typ": template-refs
#import "notes.typ": template-notes
#import "figures.typ": template-figures
#import "layout.typ": full-width, margin-note
#import "links.typ": template-links
#import "metadata.typ": metadata

/// Tufted 博客模板的主包装函数。
///
/// 用于生成完整的 HTML 页面结构，包含 SEO 元数据、CSS/JS 资源加载以及页眉页脚布局。
#let tufted-web(
  header-links: (:),

  // Meta data
  title: "",
  author: none,
  description: "",
  lang: "zh",
  date: none,
  website-title: "",
  website-url: none,

  // For SEO
  image-path: none,

  // For RSS
  feed-dir: (),

  // Giscus comments (optional)
  giscus-enabled: false,
  giscus-repo: none,
  giscus-repo-id: none,
  giscus-category: none,
  giscus-category-id: none,
  giscus-mapping: "pathname",
  giscus-strict: "0",
  giscus-reactions-enabled: "1",
  giscus-emit-metadata: "0",
  giscus-input-position: "top",
  giscus-theme: "preferred_color_scheme",
  giscus-lang: "zh-CN",

  // Custom header and footer
  header-elements: (),
  footer-elements: (),

  // Custom CSS and JS Scripts
  css: ("/assets/custom.css",),
  js-scripts: (),

  content,
) = {
  // Apply styling
  show: template-math
  show: template-refs
  show: template-notes
  show: template-figures
  show: template-links

  set text(lang: lang)

  html.html(
    lang: lang,
    {
      // Head
      html.head({
        // All metadata
        metadata(
          title: title,
          author: author,
          description: description,
          lang: lang,
          date: date,
          website-title: website-title,
          website-url: website-url,
          image-path: image-path,
          feed-dir: feed-dir,
        )

        // load CSS
        let base-css = (
          "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.8.0/tufte.min.css",
          "/assets/tufted.css",
          "/assets/theme.css",
        )
        for (css-link) in (base-css + css).dedup() {
          html.link(rel: "stylesheet", href: css-link)
        }

        // load JS scripts
        let base-js = (
          "/assets/code-blocks.js",
          "/assets/format-headings.js",
          "/assets/post-share.js",
          "/assets/theme-toggle.js",
          "/assets/marginnote-toggle.js",
        )
        for (js-src) in (base-js + js-scripts).dedup() {
          html.script(src: js-src)
        }
      })

      // Body
      html.body({
        // Custom header elements (site header, not navigation)
        html.header(
          class: "site-header",
          {
            for (i, element) in header-elements.enumerate() {
              element
              if i < header-elements.len() - 1 {
                html.br()
              }
            }
          },
        )

        // Add website navigation
        html.header(
          class: "site-header",
          if header-links != none and header-links.len() > 0 {
            html.nav(
              class: "site-nav",
              for (href, title) in header-links {
                html.a(href: href, lang: "zh-CN", title)
              },
            )
          }
        )

        // Main content
        html.article(
          html.section({
            // Right-side share box on post pages (pin near top of article)
            if date != none {
              margin-note(
                html.span(
                  class: "post-share",
                  {
                    html.strong("分享")
                    html.br()
                    html.a(href: "#", class: "post-share-x", "X / Twitter")
                    " · "
                    html.a(href: "#", class: "post-share-facebook", "Facebook")
                    " · "
                    html.a(href: "#", class: "post-share-email", "Email")
                  },
                ),
              )
            }
            content
          }),
        )

        // Giscus comments (show on pages with explicit date metadata)
        if giscus-enabled and date != none and giscus-repo != none and giscus-repo-id != none and giscus-category != none and giscus-category-id != none {
          html.section(
            class: "giscus-comments",
            {
              html.h2("留言")
              html.elem(
                "script",
                attrs: (
                  src: "https://giscus.app/client.js",
                  "data-repo": giscus-repo,
                  "data-repo-id": giscus-repo-id,
                  "data-category": giscus-category,
                  "data-category-id": giscus-category-id,
                  "data-mapping": giscus-mapping,
                  "data-strict": giscus-strict,
                  "data-reactions-enabled": giscus-reactions-enabled,
                  "data-emit-metadata": giscus-emit-metadata,
                  "data-input-position": giscus-input-position,
                  "data-theme": giscus-theme,
                  "data-lang": giscus-lang,
                  crossorigin: "anonymous",
                  "async": "true",
                ),
              )
            },
          )
        }

        // Custom footer elements
        html.footer({
          for (i, element) in footer-elements.enumerate() {
            element
            if i < footer-elements.len() - 1 {
              html.br()
            }
          }
        })
      })
    },
  )
}
