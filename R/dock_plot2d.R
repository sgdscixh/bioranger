#' @title 生成2D对接图
#' @description 此函数用于生成并保存2D分子对接图。
#' @param protein_path 字符串，表示蛋白质PDB文件的路径。
#' @param ligand_path 字符串，表示配体SDF文件的路径。
#' @param output_path 字符串，表示保存输出HTML文件的路径。
#' @return 返回一个表示2D对接图的对象。
#' @usage dockplot_2d(protein_path, ligand_path, output_path)
#' @examples
#' \dontrun{
#' protein_file <- "path/to/rec.pdb"
#' ligand_file <- "path/to/vina_output.sdf"
#' dockplot_2d(protein_file, ligand_file, "results/dock/saving.html")
#' }
#' @details 此函数使用biorange库从提供的蛋白质和配体文件生成2D图。
#' @keywords 分子对接, 可视化, 2D图
#' @export
dockplot_2d <- function(protein_path, ligand_path, output_path = NULL) {
    biorange <- import_biorange()
    view_2d <- biorange$dock$dock_plot_2d(
        protein_path,
        ligand_path,
        save = output_path
    )
    return(view_2d)
}
