#' @title Autodock 快速分子对接与处理结果函数
#' @description 这个函数进行 Autodock 分子对接，随后自动处理对接结果（如文件拆分、提取分数等），并输出到指定的 Excel 文件。
#' @param protein_path 蛋白质文件的路径。
#' @param ligand_path 配体文件的路径。
#' @param output_dir 输出文件夹的路径，默认为 "results/dock"。
#' @param tool_id 切换快速对接和精准对接的ID，默认为快速对接id"aee83f8c6aa459ef"；精准对接id为"fdd780e7acf24f37"。
#' @return 返回一个数据框，包含对接的分数和排名。
#' @usage autodock_fast_dock(protein_path, ligand_path, output_dir, tool_id)
#' @examples
#' /dontrun{
#' result <- autodock_fast_dock(
#'   protein_path = "/path/to/protein.pdb",
#'   ligand_path = "/path/to/ligand.sdf",
#'   output_dir = "/path/to/output",
#'   tool_id = "aee83f8c6aa459ef"
#' )
#' }
#' @details 该函数首先调用 Autodock 分子对接工具进行对接，之后自动处理生成的对接文件（包括拆分和提取得分），并将结果保存为 Excel 文件。
#' @keywords dock, autodock, biorange, results, excel
#' @export
autodock_fast_dock <- function(protein_path, ligand_path, output_dir, tool_id) {
  
  # 创建 "fast_dock" 文件夹（如果不存在）
  fast_dock_dir <- file.path(output_dir, "fast_dock")
  if (!dir.exists(fast_dock_dir)) {
    dir.create(fast_dock_dir)
  }
  
  # 1. 运行 Autodock 分子对接工具进行对接操作
  dock_autodock(
    protein_path = protein_path,
    ligand_path = ligand_path,
    output_dir = fast_dock_dir,  # 将输出文件保存到 fast_dock 文件夹中
    tool_id = tool_id
  )
  
  # 2. 自动提取以 "ligand1_docked" 开头的 sdf 文件
  ligand_result_file <- list.files(path = fast_dock_dir, pattern = "^ligand1_docked", full.names = TRUE)
  ligand_result_file <- ligand_result_file[!grepl("\\.sdf$", ligand_result_file)]
  
  # 3. 拆分 sdf 文件（你可以自定义拆分函数 dock_split_sdf）
  lapply(ligand_result_file, dock_split_sdf)
  
  # 4. 提取拆分后的 .sdf 文件
  sdf_files_autodock <- list.files(path = fast_dock_dir, pattern = ".sdf", full.names = TRUE)
  
  # 5. 提取 AutoDock 打分结果并生成结果数据框
  ligand_result_files <- list.files(
    path = fast_dock_dir,
    pattern = "^ligand1_docked",
    full.names = TRUE
  )
  ligand_result_files <- ligand_result_files[!grepl("\\.sdf$", ligand_result_files)]
  
  # 提取分数
  scores <- unlist(lapply(ligand_result_files, function(file) {
    file_content <- readLines(file)
    score_lines <- grep(">  <SCORE>", file_content)
    sapply(score_lines, function(line) {
      as.numeric(file_content[line + 1])
    })
  }))
  
  # 创建结果数据框
  results_df <- data.frame(Rank = seq_along(scores), Score = scores)
  
  # 6. 输出 Excel 文件
  output_file <- file.path(fast_dock_dir, "autodock_score_results.xlsx")
  
  # 检查文件是否存在并删除（避免重复）
  if (file.exists(output_file)) {
    file.remove(output_file)
  }
  
  # 保存为 Excel 文件
  write.xlsx(results_df, output_file)
  
  # 返回结果数据框
  return(list(results_df = results_df, sdf_files_autodock = sdf_files_autodock))
}


