#' 绘制venn图，输出交集数据表
#'
#' This function generates a Venn diagram using the BioRange package.
#' and plots their intersections. The output can be saved as a PDF file.
#'
#' @param sets A list of character vectors
#' @param set_names names for each set. Must match the length of `sets`.
#' @param title A character string specifying the title of the Venn diagram.
#' @param output_file A character string specifying the path to the output file.
#' @param output_dir A character string specifying the output directory.
#' @param min_size 图形最小值，控制不同组图形的比例差距
#' @param max_size 图形最大值，控制不同组图形的比例差距
#' @param intersection_scale_factor 图的整体大小，不能调节不同组的比例
#' @param center_distance_factor 组间圆心距离越小，不同组的圆靠得越近，交集区域越大
#' @import reticulate
#' @export
#' @examples
#' TCMSP <- c("A", "B", "C", "D", "D", "D")
#' Chembl <- c("B", "C", "E", "F")
#' STITCH <- c("C", "D", "E", "G")
#' create_venn_diagram(
#'   sets = list(TCMSP, Chembl, STITCH),
#'   set_names = c("TCMSP", "Chembl", "STITCH"),
#'   title = "Ingredients_Targets_venn",
#'   output_file = "Ingredients_Targets_venn88.png",
#'   output_dir = "./results/custom/venn",
#'   min_size = 200,
#'   max_size = 1000,
#'   intersection_scale_factor = 1,
#'   center_distance_factor = 0.5
#' )
create_venn_diagram <- function(sets, set_names, title, output_file, output_dir, min_size, max_size, intersection_scale_factor, center_distance_factor) {
  # Import the biorange module
  biorange <- reticulate::import("biorange")

  # Validate input
  if (length(sets) != length(set_names)) {
    stop("Length of sets must match length of set_names.")
  }

  # # Check if output file path is valid
  # output_dir <- dirname(output_file)
  # if (!dir.exists(output_dir) && output_dir!= "") {
  #   stop("The specified output directory does not exist.")
  # }

  # Generate the Venn diagram
  biorange$venn$vennplot(sets, set_names, title, output_file, output_dir, min_size, max_size, intersection_scale_factor, center_distance_factor)
}
