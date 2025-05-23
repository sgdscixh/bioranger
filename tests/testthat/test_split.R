# autodock 对接
dock_autodock(protein_path = "/home/liuyan/projects/package/biorang_bak/biorange/dock/todo/AF-P05177-F1-model_v4.pdb", ligand_path = "/home/liuyan/projects/package/biorang_bak/biorange/dock/todo/Conformer3D_COMPOUND_CID_164950.sdf", tool_id = "aee83f8c6aa459ef")

# diffdock 对接

dock_diffdock(protein_path = "/home/liuyan/projects/package/biorange/biorange/dock/todo/AF-P05177-F1-model_v4.pdb", ligand_path = "/home/liuyan/projects/package/biorange/biorange/dock/todo/Conformer3D_COMPOUND_CID_164950.sdf")





# 给蛋白质加氢
dock_fix_protein("/home/liuyan/projects/package/biorang_bak/biorange/dock/todo/AF-P05177-F1-model_v4.pdb", "./fix3.pdb")
# 预处理
dock_split_sdf("/home/liuyan/projects/package/bioranger/results/dock/ligand1_docked__52a79f44-f25f-45c7-9d09-2ae8f0f969ff")

# 绘制对接结构2d，3d图
protein_file <- "./results/dock/fix3.pdb"
ligand_file <- "results/dock/ligand1_docked__52a79f44-f25f-45c7-9d09-2ae8f0f969ff_1.sdf"
dockplot_2d(protein_file, ligand_file, "results/dock/2d.html")
dockplot_3d(protein_file, ligand_file, "results/dock/3ds.html")

# 绘制对接3d图
dock_plot3d(pdb_file = "./results/dock/fix3.pdb", sdf_file = "results/dock/ligand1_docked__52a79f44-f25f-45c7-9d09-2ae8f0f969ff_1.sdf")

# smina打分
kk <- dock_smina_score(receptor_file = "/home/liuyan/projects/package/biorange/biorange/dock/todo/AF-P05177-F1-model_v4.pdb", ligand_file = "/home/liuyan/projects/package/bioranger/results/dock/complex_0/rank1_confidence-0.53.sdf")
kk
write.table(kk, file = "results/dock/score_output.txt", sep = "\t", row.names = FALSE)
mm <- import_biorange()
mm$dock$smina_score(receptor_file = "/home/liuyan/projects/package/biorange/biorange/dock/todo/AF-P05177-F1-model_v4.pdb", ligand_file = "/home/liuyan/projects/package/bioranger/results/dock/complex_0/rank1_confidence-0.53.sdf")

# chembl预测靶点
compound_input <- c("HJNJAUYFFFOFBW-UHFFFAOYSA-N", "OBWHQJYOOCRPST-UHFFFAOYSA-N")
result <- chembl_inchikey_target(compound_input)
print(result)



# tcmsp预测靶点
inchikeys <- c("CJBDUOMQLFKVQC-UHFFFAOYSA-N", "ZOYASYRPGHCQHW-UHFFFAOYSA-N")
tcmsp_inchikey_targets <- predict_tcmsp_inchikey_targets(inchikeys)
print(tcmsp_inchikey_targets)




gene_list_399 <- c("BCL2", "BCL2L1", "BCL2L11", "BCL2L12", "BCL2L2", "BCL2L3", "BCL2L5", "BCL2L6", "BCL2L7", "BCL2L8", "BCL2L9", "BCL2L10", "BCL2L13", "BCL2L14", "BCL2L15", "BCL2L16", "BCL2L17", "BCL2L18", "BCL2L19", "BCL2L20", "BCL2L21", "BCL2L22", "BCL2L23", "BCL2L24", "BCL2L25", "BCL2L26", "BCL2L27", "BCL2L28", "BCL2L29", "BCL2L30", "BCL2L31", "BCL2L32", "BCL2L33")
# KEGG
kegg_res <- enrich_gokegg(gene_list = c("BCL2", "STAT3", "STAT5", "IL6", "IL8", "S100A9"), analysis_type = "kegg", p_value_cutoff = 0.05)

head(kegg_res)

go_res <- enrich_gokegg(gene_list = c("BCL2", "STAT3", "STAT5", "IL6", "IL8", "S100A9"), analysis_type = "go", p_value_cutoff = 0.05)

head(go_res)

enrichment_dotplot(go_res, output_file = NULL, width = 6, height = 8, dpi = 300, topn = 10, low_color = "blue", high_color = "red", use_odds_ratio = TRUE)
enrichment_barplot(go_res, output_file = NULL, width = 6, height = 8, dpi = 300, topn = 10, use_odds_ratio = FALSE)

library(openxlsx)
# TOTAL NETWORK
kegg_res <- read.xlsx("/home/liuyan/projects/package/biorang_bak/kegg_res.xlsx")
metabolites_list <- read.xlsx("/home/liuyan/projects/package/biorang_bak/metabolites_list.xlsx")
degree_table <- read.xlsx("/home/liuyan/projects/package/biorang_bak/string_node_degree.xlsx")
disease_name <- "Lung cancer"
formula_name <- "SJZT"
output_dir <- "./results/output2/ppi"
output_files <- total_network_plot(kegg_data, metabolites_list, degree_table, disease, formula, output_dir)
print(output_files)



# ppi_analysis

gene_list <- gene_list_399
output_dir <- "./results/ppi"
ppi_analysis(gene_list, output_dir)


gene_names_file <- read.csv("/home/liuyan/projects/package/biorang_bak/biorange/data/shared targets of drugs and diseases.csv")
gene_names <- gene_names_file$shared_targets

output_dir <- "./results/output2/ppi"

# 完整ppi
results <- ppi_analysis(gene_names, output_dir)
print(results)


nodes_df <- read.csv("/home/liuyan/projects/package/biorang_bak/node_88.csv")
types_df <- read.csv("/home/liuyan/projects/package/biorang_bak/type_88.csv")
network_circular_plot(nodes_df, types_df, compound_layers = list(8L), target_layers = list(10L, 20L, 29L, 38L, 47L), output_file = "pathway_network_go", output_dir = "./results/ppi/pathway_network")


compound_sum <- c(81L)
target_sum <- c(242L)
compound_sequence <- generate_compound_sequence(compound_sum)
compound_sequence
target_sequence <- generate_target_sequence(compound_sum, target_sum)
target_sequence
# generate_target_sequence(compound_sum, target_sum)
generate_node_sequence()


kegg_df <- read.csv("/home/liuyan/projects/package/biorang_bak/biorange/data/kegg_df.csv")
target_df <- read.csv("/home/liuyan/projects/package/biorange/biorange/data/target_df.csv")

result <- generate_target_type(kegg_df, target_df)
node_df <- result[[1]]
type_df <- result[[2]]
type_counts <- result[[4]]
target_num <- type_counts["target"]
compound_num <- type_counts["compound"]
target_num

# TCMSP <- c("A", "B", "C", "D", "D", "D")
# Chembl <- c("B", "C", "E", "F")
# STITCH <- c("C", "D", "E", "G")
install.packages("readxl")
library(readxl)
m <- read_excel("/home/liuyan/projects/package/biorang_bak/genecards.xlsx")
n <- read_excel("/home/liuyan/projects/package/biorang_bak/ttd.xlsx")
k <- read_excel("/home/liuyan/projects/package/biorang_bak/omim.xlsx")
# 提取 gene_name 列并转换为向量
TCMSP <- as.character(m$gene_name)
Chembl <- as.character(n$gene_name)
STITCH <- as.character(k$gene_name)


create_venn_diagram(list(TCMSP, Chembl, STITCH), c("TCMSP", "Chembl", "STITCH"), "Ingredients_Targets_venn", "Ingredients_Targets_venn", output_dir = "./results/custom/venn", min_size = 200, max_size = 1000, intersection_scale_factor = 1, center_distance_factor = 0.5)


format_table("/home/liuyan/projects/package/biorang_bak/表格路径.yaml", "/home/liuyan/projects/package/biorang_bak/中药入血注释.yaml")


input_file_path <- read.csv("/home/liuyan/projects/package/biorange/biorange/data/first_input_data.csv")
# compound_df <- data.frame(NameEN = c("beta-Alanine", "Pyrocatechol", "2,3-Dihydroxybenzoic acid (Pyrocatechuic acid)", "Glycine", "Hydroquinone", "Lysine", "Poncirin", "Vanillin", "Xanthine"), inchikey = c("UCMIRNVEIXFBKS-UHFFFAOYSA-N", "YCIMNLLNPGFGHC-UHFFFAOYSA-N", "GLDQAMYCGOIJDV-UHFFFAOYSA-N", "DHMQDGOQFOQNFH-UHFFFAOYSA-N", "QIGBRXMKCJKVMJ-UHFFFAOYSA-N", "KDXKERNSBIXSRK-YFKPBYRVSA-N", "NLAWPKPYBMEWIR-YZOWQMJMSA-N", "MWOOGOJBHIARFG-UHFFFAOYSA-N", "LRFVTYWOQMYALW-UHFFFAOYSA-N"))

result <- admet_filter(input_file_path, lipinski_threshold = 4, qed_threshold = 0.5, bioavailability_threshold = 0.3)
write.csv(result, "./nihao.csv")



html_to_png_onestep("/home/liuyan/projects/package/bioranger/3d_autodock.html", "/home/liuyan/projects/package/bioranger/3d_autodock.png", wait_time = 15, is_remote = FALSE)

html_to_png_twostep("/home/liuyan/projects/package/bioranger/3d_autodock.html", "/home/liuyan/projects/package/bioranger/3ddd_autodock.png", wait_time = 15, is_remote = FALSE)


# ppi_basic_analysis
gene_names_file <- ("/home/liuyan/projects/package/biorang_bak/Metabolites_disease_venn_2.xlsx")
gene_names <- read_excel(gene_names_file)[["Metabolites&disease"]]
ppi_output_dir <- "/home/liuyan/projects/package/bioranger/results/ppi1"
ppi_basic <- ppi_basic_analysis(gene_names, ppi_output_dir)

#
nodes <- ppi_basic$nodes
degree_df <- ppi_basic$degree_df
print(degree_df)

degree_target_num <- nrow(degree_df)
print(degree_target_num)


# 绘制degree核心图
# First get the target count
# target_top_nodes <- function(target_count) {
#   # Determine top_nodes based on target_count using conditions
#   if (target_count >= 100) {
#     top_nodes <- 100
#     }
#   else if (target_count >= 50) {
#     top_nodes <- 50
#     }
#   else if (target_count >= 30) {
#     top_nodes <- 30
#   }
#   else if (target_count >= 20) {
#     top_nodes <- 20
#   }
#   else {  # when target_count < 20
#     top_nodes <- 10
#   }
#   return(top_nodes)
# }


# kegg_top_nodes <- target_top_nodes(45)
nodes <- ppi_basic$nodes
degree_df <- ppi_basic$degree_df
kegg_top_nodes <- as.integer(30) # 注意数据形式

core_output_dir <- "./results/output/pp6"
# Now use this top_nodes value in generate_core_targets
results <- ppi_core_targets(nodes = nodes, degree_df = degree_df, output_dir = ppi_output_dir, file_name = "PPI_network_degree_top30", top_nodes = kegg_top_nodes)



# 生成kegg的通路节点和类型文件以及sequence
kegg_df <- read_excel("/home/liuyan/projects/package/biorang_bak/kegg_res_2.xlsx") |> head(10)
targets_total_df <- read_excel("/home/liuyan/projects/package/biorang_bak/metabolite_total_targets_2.xlsx")

kegg_node_type_file <- generate_node_type_sequence(kegg_df, targets_total_df, nodes, degree_df, target_top_n = 50L, compound_top_n = 10L)


# node_relationships_df, node_types_df, node_counts, target_sequence
kegg_node_file <- kegg_node_type_file[[1]]

kegg_node_file <- kegg_node_type_file[["node_file"]]
kegg_type_file <- kegg_node_type_file[["type_file"]]
kegg_node_counts <- kegg_node_type_file[["target_compound_counts"]]
kegg_target_sequence <- kegg_node_type_file[["target_sequence"]]


# kegg_node_type_file.to_csv("./results/output/pp6/kegg_node_file33.csv", index = False)
# kegg_type_file.to_csv("./results/output/pp6/kegg_type_file33.csv", index = False)




# 为每种样式创建可视化
pathway_network_plot(nodes_df = kegg_node_file, types_df = kegg_type_file, compound_layers = as.list(kegg_node_counts[[2]]), target_layers = kegg_target_sequence, output_file = "kegg_pathway_network", output_dir = ppi_output_dir, style_preset = "STYLE1")


pathway_limit <- 10L
gene_limit <- 30L
compound_limit <- 20L
total_network_plot(kegg_data = kegg_df, metabolites_list = targets_total_df, degree_table = degree_df, disease = "sjb", formula = "SQDB", pathway_limit = 10L, gene_limit = 30L, compound_limit = 20L, output_dir = ppi_output_dir)

# Print the Python types of the parameters
print(kegg_df)
print(targets_total_df)
