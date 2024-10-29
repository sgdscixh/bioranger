#' @title 修复蛋白质结构
#' @description 使用 `biorange` 库修复蛋白质的 PDB 文件。
#' @param input_path 字符串，表示输入蛋白质 PDB 文件的路径。
#' @param output_path 字符串，表示修复后 PDB 文件的保存路径。
#' @return 返回一个表示修复结果的对象。
#' @usage dock_fix_protein(input_path, output_path)
#' @examples
#' \dontrun{
#' result <- dock_fix_protein("data/AF-P31749-F1-model_v4.pdb", "./results/dock/fix.pdb")
#' }
#' @details 此函数使用 `biorange` 库的 `dock_fix_protein` 模块处理输入的 PDB 文件。
#' @keywords 蛋白质修复, PDB文件
#' @export
dock_fix_protein <- function(input_path, output_path) {
    # 导入biorange库
    biorange <- import_biorange()

    # 使用biorange的dock模块中的dock_fix_protein函数修复蛋白质文件
    result <- biorange$dock$dock_fix_protein(input_path, output_path)

    return(result)
}
