#' @title 精准 Autodock 分子对接函数
#' @description 这个函数用于进行精准的 Autodock 分子对接分析，调用了 `dock_autodock` 函数进行对接，并自动处理对接结果（如提取评分），最后保存为 Excel 文件。
#' @param protein_path 蛋白质文件的路径。
#' @param ligand_path 配体文件的路径。
#' @param output_dir 输出文件夹的路径，默认为 "results/dock"。
#' @param tool_id 切换快速对接和精准对接的ID，默认为精准对接id"fdd780e7acf24f37"；快速对接id为"aee83f8c6aa459ef"。
#' @return 返回一个数据框，包含精准对接的分数和排名。
#' @usage autodock_accute_dock(protein_path, ligand_path, output_dir, tool_id)
#' @examples
#' /dontrun{
#' accute_result <- autodock_accute_dock(
#'   protein_path = "/path/to/protein.pdb",
#'   ligand_path = "/path/to/ligand.sdf",
#'   output_dir = "/path/to/output",
#'   tool_id = "fdd780e7acf24f37"
#' )
#' }
#' @details 该函数首先调用 `dock_autodock` 进行精准对接，之后提取对接结果文件中的分数，并保存为 Excel 文件。
#' @keywords dock, autodock, accurate, results, excel
#' @export
autodock_accute_dock <- function(protein_path, ligand_path, output_dir, tool_id) {
  
  # 创建 "accute_dock" 文件夹（如果不存在）
  accut_dock_dir <- file.path(output_dir, "accute_dock")
  if (!dir.exists(accut_dock_dir)) {
    dir.create(accut_dock_dir)
  }
  
  # 1. 运行 Autodock 对接工具进行对接操作
  # 调用之前定义的 dock_autodock 函数，执行精准对接
  dock_autodock(
    protein_path = protein_path,
    ligand_path = ligand_path,
    output_dir = accut_dock_dir,  # 将输出文件保存到 accute_dock 文件夹中
    tool_id = tool_id  # 精准对接使用的工具ID
  )
  
  # 2. 提取所有 Autodock 打分结果文件（匹配以 "SDF" 开头的文件）
  ligand_result_files <- list.files(
    path = accut_dock_dir,
    pattern = "^SDF",  # 匹配所有以 "SDF" 开头的文件
    full.names = TRUE
  )

  # 3. 提取分数并生成结果数据框
  accurate_dock_scores <- unlist(lapply(ligand_result_files, function(file) {
    # 读取文件内容
    file_content <- readLines(file)
    
    # 查找包含 SCORE 的行
    score_lines <- grep(">  <SCORE>", file_content)
    
    # 提取并返回对应的分数
    sapply(score_lines, function(line) {
      as.numeric(file_content[line + 1])
    })
  }))

  # 4. 创建结果数据框，包含分数和排名
  accurate_results_df <- data.frame(Rank = seq_along(accurate_dock_scores), Score = accurate_dock_scores)

  # 5. 检查输出文件是否存在，如果存在则删除
  output_file <- file.path(accut_dock_dir, "accurate_autodock_score_results.xlsx")
  if (file.exists(output_file)) {
    file.remove(output_file)
  }

  # 6. 将结果保存为 Excel 文件
  write.xlsx(accurate_results_df, output_file)
  
  # 返回结果数据框
  return(accurate_results_df)
}

