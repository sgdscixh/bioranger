% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ppi_analysis.R
\name{ppi_analysis}
\alias{ppi_analysis}
\title{PPI 分析函数}
\usage{
ppi_analysis(gene_names, output_dir)
}
\arguments{
\item{gene_names}{一个包含基因名称的向量。}

\item{output_dir}{输出文件夹的路径。}
}
\value{
无返回值，但会在指定的目录下生成 PPI 分析结果。
}
\description{
这个函数用于进行蛋白质-蛋白质相互作用 (PPI) 分析。
}
\details{
这个函数调用了 biorange 包的 ppi_analysis 函数来进行 PPI 分析。
}
\examples{
gene_list <- gene_list_399
output_dir <- "./results/ppi"
ppi_analysis(gene_list, output_dir)
}
\keyword{analysis,}
\keyword{biorange}
\keyword{ppi,}
