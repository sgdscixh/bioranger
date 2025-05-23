% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pathway_network_plot.R
\name{pathway_network_plot}
\alias{pathway_network_plot}
\title{pathway_network_plot}
\usage{
pathway_network_plot(
  nodes_df,
  types_df,
  compound_layers,
  target_layers,
  output_file,
  output_dir,
  style_preset = "STYLE1"
)
}
\arguments{
\item{nodes_df}{Data frame. Preprocessed node data (must contain required columns).}

\item{types_df}{Data frame. Preprocessed type annotation data.}

\item{compound_layers}{List. Compound layer data (numeric vectors).}

\item{target_layers}{List. Target sequence data.}

\item{output_file}{Character. Base filename for output (without extension).}

\item{output_dir}{Character. Directory path to save outputs.}

\item{style_preset}{Character. Visualization style ("STYLE1", "STYLE2", etc.).
Default: "STYLE1".}
}
\value{
Invisibly returns NULL. Primary output is generated files in \code{output_dir}.
}
\description{
这个函数用于绘制kegg/go通路-靶点-成分网络图。
}
\details{
Create KEGG Pathway Network Visualization

Wrapper for Python's \code{create_network_visualization()} from biorange package.
Generates network visualization plots for KEGG pathway analysis.
}
\examples{
\dontrun{
# Using pre-loaded data
pathway_network_plot(
    nodes_df = my_nodes,
    types_df = my_types,
    compound_layers = list(my_compounds),
    target_layers = my_targets,
    output_file = "network_plot",
    output_dir = "./results/network",
    style_preset = "STYLE2"
)
}

}
