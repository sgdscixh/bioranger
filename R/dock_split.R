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
# dock_split_sdf("results/dock/ligand1_docked__d49efd3e-6a2e-4a4f-aeac-1b7818c479eb") 没问题了宝宝 就是这里记住别写业务逻辑 永远注释 在test 下面写测试
# result <- dock_split_sdf("results/dock/ligand1_docked__d49efd3e-6a2e-4a4f-aeac-1b7818c479eb","results/dock/")
# 额 你咋看 不知道发生了啥好像是我的问题咋整的我没有reticulata 但是我也没有 在radian中是自动的我就是在燃点里 对的 但是现在是好的。。我就load all 然后就运行 代码了我也是年你看有个区别，我的运行了没有图标第一次才会有哦哦
