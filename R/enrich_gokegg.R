# Generated from create-rhello.Rmd: do not edit by hand

#' @title GO 和 KEGG 富集分析函数
#' @description 这个函数用于进行 GO 和 KEGG 富集分析，调用了 biorange 包的 enrich_gokegg 函数。
#' @param gene_list 一个包含基因列表的向量。
#' @param analysis_type 分析类型，可以是 "all"、"go" 或 "kegg"，默认为 "all"。
#' @param organism 物种名称，默认为 "human"。
#' @param kegg_database KEGG 数据库的名称，默认为 "KEGG_2021_Human"。
#' @param go_databases GO 数据库的列表，可以为 NULL。
#' @param p_value_cutoff P 值阈值，默认为 0.05。
#' @return 返回一个包含富集分析结果的数据框。
#' @usage enrich_gokegg(gene_list, analysis_type, organism, kegg_database, go_databases, p_value_cutoff)
#' @examples
#' # KEGG
#' kegg_res <- enrich_gokegg(
#'   gene_list = gene_list_399,
#'   analysis_type = "kegg",
#'   p_value_cutoff = 0.05
#' )
#' head(kegg_res)
#' # GO
#' go_res <- enrich_gokegg(
#'   gene_list = gene_list_399,
#'   analysis_type = "go",
#'   p_value_cutoff = 0.05
#' )
#' head(go_res)
#' @details 这个函数主要用于进行 GO 和 KEGG 的富集分析，并对结果进行一些后处理，以便于后续的分析。
#' @keywords go, kegg, enrichment, biorange
#' @export
enrich_gokegg <- function(
    gene_list,
    analysis_type = "all",
    organism = "human",
    kegg_database = "KEGG_2021_Human",
    go_databases = NULL,
    p_value_cutoff = 0.05) {
  biorange <- import_biorange()
  # 假设biorange包中有一个enrich_gokegg函数
  enrich_res <- biorange$enrich_analysis$enrich_gokegg(
    gene_list = gene_list,
    analysis_type = analysis_type,
    organism = organism,
    kegg_database = kegg_database,
    go_databases = go_databases,
    p_value_cutoff = p_value_cutoff
  )
  enrich_res <- enrich_res %>%
    dplyr::rename(
      Description = Term,
      GeneRatio = `Odds Ratio`,
      p.adjust = `Adjusted P-value`,
      ONTOLOGY = Gene_set
    ) %>%
    dplyr::mutate(
      Count = as.numeric(sub("/.*", "", Overlap))
    ) %>%
    dplyr::select(
      Description,
      GeneRatio,
      p.adjust,
      ONTOLOGY,
      Count
    )
}
