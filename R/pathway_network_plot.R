#' Create KEGG Pathway Network Visualization
#'
#' Wrapper for Python's `create_network_visualization()` from biorange package.
#' Generates network visualization plots for KEGG pathway analysis.
#'
#' @title pathway_network_plot
#' @description 这个函数用于绘制kegg/go通路-靶点-成分网络图。
#' @param nodes_df Data frame. Preprocessed node data (must contain required columns).
#' @param types_df Data frame. Preprocessed type annotation data.
#' @param compound_layers List. Compound layer data (numeric vectors).
#' @param target_layers List. Target sequence data.
#' @param output_file Character. Base filename for output (without extension).
#' @param output_dir Character. Directory path to save outputs.
#' @param style_preset Character. Visualization style ("STYLE1", "STYLE2", etc.).
#'                   Default: "STYLE1".
#'
#' @return Invisibly returns NULL. Primary output is generated files in `output_dir`.
#'
#' @examples
#' \dontrun{
#' # Using pre-loaded data
#' pathway_network_plot(
#'     nodes_df = my_nodes,
#'     types_df = my_types,
#'     compound_layers = list(my_compounds),
#'     target_layers = my_targets,
#'     output_file = "network_plot",
#'     output_dir = "./results/network",
#'     style_preset = "STYLE2"
#' )
#' }
#'
#' @export
pathway_network_plot <- function(nodes_df,
                                 types_df,
                                 compound_layers,
                                 target_layers,
                                 output_file,
                                 output_dir,
                                 style_preset = "STYLE1") {
    biorange <- import_biorange()
    # Python function call
    biorange$ppi$create_network_visualization(
        nodes_df = nodes_df,
        types_df = types_df,
        compound_layers = compound_layers,
        target_layers = target_layers,
        output_file = output_file,
        output_dir = output_dir,
        style_preset = biorange$ppi$StylePresets[[style_preset]]
    )

    invisible(NULL)
}
