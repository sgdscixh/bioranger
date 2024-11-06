# autodock 对接
dock_autodock(protein_path = "/home/liuyan/projects/package/biorange/biorange/dock/todo/AF-P05177-F1-model_v4.pdb", ligand_path = "/home/liuyan/projects/package/biorange/biorange/dock/todo/Conformer3D_COMPOUND_CID_164950.sdf")

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
