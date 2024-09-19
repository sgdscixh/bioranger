# Generated from create-bioranger.Rmd: do not edit by hand

#' 绘制venn图，输出交集数据表
#'
#' This function generates a Venn diagram using the BioRange package. It takes multiple sets of data
#' and plots their intersections. The output can be saved as a PDF file.
#'
#' @param sets A list of character vectors, each representing a set of items to be compared in the Venn diagram.
#' @param set_names A character vector containing names for each set. Must match the length of `sets`.
#' @param title A character string specifying the title of the Venn diagram.
#' @param output_file A character string specifying the path to the output PDF file.
#' @import reticulate
#' @export
create_venn_diagram <- function(sets, set_names, title, output_file) {
  # Import the biorange module
  biorange <- reticulate::import("biorange")

  # Validate input
  if (length(sets) != length(set_names)) {
    stop("Length of sets must match length of set_names.")
  }

  # Check if output file path is valid
  output_dir <- dirname(output_file)
  if (!dir.exists(output_dir) && output_dir != "") {
    stop("The specified output directory does not exist.")
  }

  # Generate the Venn diagram
  biorange$venn$vennplot(sets, set_names, title, output_file)
}


