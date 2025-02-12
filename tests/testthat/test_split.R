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


create_venn_diagram(list(TCMSP, Chembl, STITCH), c("TCMSP", "Chembl", "STITCH"), "Ingredients_Targets_venn", "Ingredients_Targets_venn.png", output_dir = "./results/custom/venn", min_size = 200, max_size = 1000, intersection_scale_factor = 1, center_distance_factor = 0.5)


format_table("/home/liuyan/projects/package/biorang_bak/表格路径.yaml", "/home/liuyan/projects/package/biorang_bak/中药入血注释.yaml")


input_file_path <- read.csv("/home/liuyan/projects/package/biorange/biorange/data/first_input_data.csv")
# compound_df <- data.frame(NameEN = c("beta-Alanine", "Pyrocatechol", "2,3-Dihydroxybenzoic acid (Pyrocatechuic acid)", "Glycine", "Hydroquinone", "Lysine", "Poncirin", "Vanillin", "Xanthine"), inchikey = c("UCMIRNVEIXFBKS-UHFFFAOYSA-N", "YCIMNLLNPGFGHC-UHFFFAOYSA-N", "GLDQAMYCGOIJDV-UHFFFAOYSA-N", "DHMQDGOQFOQNFH-UHFFFAOYSA-N", "QIGBRXMKCJKVMJ-UHFFFAOYSA-N", "KDXKERNSBIXSRK-YFKPBYRVSA-N", "NLAWPKPYBMEWIR-YZOWQMJMSA-N", "MWOOGOJBHIARFG-UHFFFAOYSA-N", "LRFVTYWOQMYALW-UHFFFAOYSA-N"))

result <- admet_filter(input_file_path, lipinski_threshold = 4, qed_threshold = 0.5, bioavailability_threshold = 0.3)
write.csv(result, "./nihao.csv")
