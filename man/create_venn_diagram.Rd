% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_venn_diagram.R
\name{create_venn_diagram}
\alias{create_venn_diagram}
\title{绘制venn图，输出交集数据表}
\usage{
create_venn_diagram(sets, set_names, title, output_file)
}
\arguments{
\item{sets}{A list of character vectors}

\item{set_names}{names for each set. Must match the length of \code{sets}.}

\item{title}{A character string specifying the title of the Venn diagram.}

\item{output_file}{A character string specifying the path to the output file.}
}
\description{
This function generates a Venn diagram using the BioRange package.
and plots their intersections. The output can be saved as a PDF file.
}
