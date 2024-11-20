# Generated from create-bioranger.Rmd: do not edit by hand
testthat::test_that("say_hello works", {
  testthat::expect_equal(2 * 2, 4) # 期待2*2 = 4 ha
})





# 必要的库
library(openxlsx)

# 定义函数
dock_and_score <- function(protein_path, ligand_path, output_dir, tool_id) {
  # 1. 运行对接工具进行对接操作 (需要实际的 dock_autodock 函数实现)
  dock_autodock(
    protein_path = protein_path,
    ligand_path = ligand_path,
    output_dir = output_dir,
    tool_id = tool_id
  )

  # 2. 自动提取 ligand1_docked 开头的 sdf 文件
  ligand_result_files <- list.files(path = output_dir, pattern = "^ligand1_docked", full.names = TRUE)
  ligand_result_files <- ligand_result_files[grepl("\\.sdf$", ligand_result_files)] # 确保文件是 .sdf 格式

  # 3. 拆分 sdf 文件 (需要实际的 dock_split_sdf 函数实现)
  lapply(ligand_result_files, dock_split_sdf)

  # 4. 提取 AutoDock 打分结果并生成结果数据框
  scores <- unlist(lapply(ligand_result_files, function(file) {
    file_content <- readLines(file)
    score_lines <- grep(">  <SCORE>", file_content)

    # 提取分数值
    sapply(score_lines, function(line) {
      as.numeric(file_content[line + 1]) # 假设分数在 SCORE 后面的一行
    })
  }))

  # 如果没有找到分数，可以设置默认值
  if (length(scores) == 0) {
    scores <- NA
  }

  # 创建结果数据框
  results_df <- data.frame(Rank = seq_along(scores), Score = scores)

  # 5. 输出 Excel 文件
  output_file <- file.path(output_dir, "autodock_score_results.xlsx")

  # 检查文件是否存在并删除
  if (file.exists(output_file)) {
    file.remove(output_file)
  }

  # 保存为 Excel 文件
  write.xlsx(results_df, output_file)

  # 返回结果数据框
  return(results_df)
}

# 使用示例
# 假设以下路径是有效的，调用函数时请替换为实际路径。
result <- dock_and_score(
  protein_path = "/home/liuyan/projects/package/biorang_bak/biorange/dock/todo/AF-P05177-F1-model_v4.pdb",
  ligand_path = "/home/liuyan/projects/package/biorang_bak/biorange/dock/todo/Conformer3D_COMPOUND_CID_164950.sdf",
  output_dir = "/path/to/output", # 替换为实际的输出路径
  tool_id = "fdd780e7acf24f37"
)
