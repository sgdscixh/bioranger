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


compound_input <- c("HJNJAUYFFFOFBW-UHFFFAOYSA-N", "OBWHQJYOOCRPST-UHFFFAOYSA-N")
result <- chembl_inchikey_target(compound_input)
print(result)


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
