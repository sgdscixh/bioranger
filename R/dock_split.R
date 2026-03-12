#' @title 生成分子对接结果
#' @description 此函数用于从SDF文件生成分子对接结果。
#' @param ligand_path 字符串，表示配体SDF文件的路径。
#' @return 返回一个表示对接结果的对象。
#' @usage dock_split_sdf(ligand_path)
#' @examples
#' \dontrun{
#' result <- dock_split_sdf("/home/liuyan/projects/package/bioranger/results/dock/ligand1_docked__d49efd3e-6a2e-4a4f-aeac-1b7818c479eb", "results/dock/")
#' }
#' @details 此函数使用biorange库从提供的配体文件生成对接结果。
#' @keywords 分子对接, SDF文件
#' @export
dock_split_sdf <- function(ligand_path) {
    # 导入biorange库
    biorange <- import_biorange()

    # 使用biorange的dock模块中的dock_split_sdf函数处理配体文件
    biorange$dock$dock_split_sdf(ligand_path)

    return(invisible(NULL))
}

# 调用示例
# dock_split_sdf("results/dock/ligand1_docked__d49efd3e-6a2e-4a4f-aeac-1b7818c479eb") 
# result <- dock_split_sdf("results/dock/ligand1_docked__d49efd3e-6a2e-4a4f-aeac-1b7818c479eb","results/dock/")
