# 安装并加载必要的包（如果尚未安装，请先安装）
# install.packages(c("usethis", "devtools", "testthat", "lintr", "styler", "pkgdown"))
library(usethis)
library(devtools)
library(testthat)
library(lintr)
library(styler)
library(pkgdown)

# 第一步：创建新包或设置工作目录到已有包
# 如果要创建新包，请使用以下命令，然后跳过设置工作目录的步骤
# usethis::create_package("bioranger")

# 如果已经有包，设置工作目录到包所在的目录
setwd("bioranger")

# 第二步：确保这是一个 RStudio 项目
usethis::use_rstudio()

# 第三步：添加 MIT 许可证，填写您的姓名
usethis::use_mit_license(name = "Your Name")

# 第四步：初始化 Git 仓库
usethis::use_git()

# 第五步：连接到 GitHub（确保已配置 GitHub 个人访问令牌）
usethis::use_github()

# 第六步：创建一个新的 R 脚本文件（不需要包含 .R 扩展名）
usethis::use_r("plot_xx")

# 第七步：设置测试框架（testthat）
usethis::use_testthat()

# 第八步：创建一个测试文件
usethis::use_test("plot_xx")

# 第九步：对包的所有代码进行格式化
styler::style_pkg()

# 第十步：对包的所有代码进行静态代码分析，查找不符合规范的地方
lintr::lint_package()

# 第十一步：创建包含 RMarkdown 的 README 文件
usethis::use_readme_rmd()

# 第十二步：构建 README 文件（将生成 README.md）
devtools::build_readme()

# 第十三步：升级版本号（根据需要选择 'major', 'minor', 'patch', 'dev'）
usethis::use_version(which = "minor")

# 第十四步：设置 GitHub Actions 以进行持续集成和代码检查
# 设置代码风格检查（lintr）
usethis::use_github_action("lint")

# 使用 tidyverse 的 GitHub Actions 配置（包括多平台测试和代码检查）
usethis::use_tidy_github_actions()

# 第十五步：检查包（本地运行 R CMD check）
devtools::check()

# 第十六步：初始化 pkgdown 网站
usethis::use_pkgdown()

# 第十七步：添加 vignettes（文档长文档），名称需为小写且不包含空格
usethis::use_vignette("introduction")

# 第十八步：添加 NEWS.md 文件，用于记录每次版本更新的更改
usethis::use_news_md()

# 第十九步：构建 pkgdown 网站，以包含新的 vignettes 和 NEWS
pkgdown::build_site()

# 第二十步：在 GitHub 上设置 GitHub Pages
# 前往您的 GitHub 仓库，进入 Settings，找到 GitHub Pages 部分
# 将 Source 设置为 "GitHub Actions"，如果可用；否则，选择 gh-pages 分支

# 注意事项：
# - 确保在每次重要更改后提交并推送到 GitHub
# - 确保您的 GitHub 个人访问令牌已正确配置，以便 `usethis` 可以使用
# - 如果您在中国大陆访问 GitHub，需要配置代理，请根据需要设置 HTTP_PROXY 和 HTTPS_PROXY
# Sys.setenv(http_proxy = "")
# Sys.setenv(https_proxy = "")
