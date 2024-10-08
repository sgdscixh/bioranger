% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_network_custom.R
\name{plot_network_custom}
\alias{plot_network_custom}
\title{自定义网络绘图函数}
\usage{
plot_network_custom(nodes_df, types_df, num_rows, num_cols, output_file, output_dir, figsize)
}
\arguments{
\item{nodes_df}{一个包含节点信息的数据框。}

\item{types_df}{一个包含类型信息的数据框。}

\item{num_rows}{网格布局的行数，默认为 7。}

\item{num_cols}{网格布局的列数，默认为 12。}

\item{output_file}{输出文件的名称，默认为 "custom_layout"。}

\item{output_dir}{输出文件夹的路径，默认为 "./results/ppi/custom_layout"。}

\item{figsize}{输出图像的尺寸，默认为 c(14, 10)。}
}
\value{
无返回值，但会在指定的目录下生成自定义布局的网络图像。
}
\description{
这个函数用于进行自定义布局的网络绘图，调用了 biorange 包的 plot_network_custom 函数。
}
\details{
这个函数主要用于根据用户指定的布局参数来生成网络图像。
}
\examples{
plot_network_custom(
  node_data_339,
  type_data_146,
  num_rows = 7,
  num_cols = 12,
  output_file = "custom_layout",
  output_dir = "./results/ppi/custom_layout",
  figsize = c(14, 10)
)
}
\keyword{biorange}
\keyword{custom,}
\keyword{network,}
\keyword{plot,}
