# Generated from create-bioranger.Rmd: do not edit by hand

#' 使用string构建PPI网络
#'
#' This function performs protein-protein interaction (PPI) analysis using the BioRange package.
#' It imports the necessary module and calls the appropriate function with the specified gene names
#' file and output directory.
#'
#' @param gene_names_file A character string specifying the path to the CSV file containing gene names.
#' @param output_dir A character string specifying the directory where the output will be saved.
#' @import reticulate
#' @export
run_ppi_analysis <- function(gene_names_file, output_dir) {
  # Import the biorange module
  biorange <- reticulate::import("biorange")
  
  # Check if the input files exist
  if (!file.exists(gene_names_file)) {
    stop("The specified gene names file does not exist.")
  }
  
  if (!dir.exists(output_dir)) {
    stop("The specified output directory does not exist.")
  }
  
  # Run the PPI analysis
  biorange$ppi$ppi_final$main(gene_names_file, output_dir)
}

