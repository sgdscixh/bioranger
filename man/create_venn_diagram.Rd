% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_venn_diagram.R
\name{create_venn_diagram}
\alias{create_venn_diagram}
\title{绘制venn图，输出交集数据表}
\usage{
create_venn_diagram(
  sets,
  set_names,
  title,
  output_file,
  output_dir,
  min_size,
  max_size,
  intersection_scale_factor,
  center_distance_factor
)
}
\arguments{
\item{sets}{A list of character vectors}

\item{set_names}{names for each set. Must match the length of \code{sets}.}

\item{title}{A character string specifying the title of the Venn diagram.}

\item{output_file}{A character string specifying the path to the output file.}

\item{output_dir}{A character string specifying the output directory.}

\item{min_size}{图形最小值，控制不同组图形的比例差距}

\item{max_size}{图形最大值，控制不同组图形的比例差距}

\item{intersection_scale_factor}{图的整体大小，不能调节不同组的比例}

\item{center_distance_factor}{组间圆心距离越小，不同组的圆靠得越近，交集区域越大}
}
\description{
This function generates a Venn diagram using the BioRange package.
and plots their intersections. The output can be saved as a PDF file.
}
\examples{
TCMSP <- c("A", "B", "C", "D", "D", "D")
Chembl <- c("B", "C", "E", "F")
STITCH <- c("C", "D", "E", "G")
create_venn_diagram(
  sets = list(TCMSP, Chembl, STITCH),
  set_names = c("TCMSP", "Chembl", "STITCH"),
  title = "Ingredients_Targets_venn",
  output_file = "Ingredients_Targets_venn88.png",
  output_dir = "./results/custom/venn",
  min_size = 200,
  max_size = 1000,
  intersection_scale_factor = 1,
  center_distance_factor = 0.5
)
}
