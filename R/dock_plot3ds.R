#' @title Generate 3D Docking Plot
#' @description This function generates and saves a 3D docking plot.
#' @param protein_path A string representing the path to the protein PDB file.
#' @param ligand_path A string representing the path to the ligand SDF file.
#' @param output_path A string representing the path to save the output HTML file.
#' @return An object representing the 3D docking plot.
#' @usage generate_dock_plot_3d(protein_path, ligand_path, output_path)
#' @examples
#' protein_file <- "path/to/rec.pdb"
#' ligand_file <- "path/to/vina_output.sdf"
#' dockplot_3d(protein_file, ligand_file, "results/dock/dd.html")
#' @details This function utilizes the biorange library to generate a 3D plot
#'          from the provided protein and ligand files.
#' @keywords docking, visualization, 3D plot
#' @export
dockplot_3d <- function(protein_path, ligand_path, output_path = NULL) {
    biorange <- import_biorange()
    view_3d <- biorange$dock$dock_plot_3d(
        protein_path,
        ligand_path,
        save = output_path
    )
    return(view_3d)
}
