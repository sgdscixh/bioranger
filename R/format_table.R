#' 格式化表格数据
#'
#' 此函数使用指定的YAML文件格式化表格数据。
#'
#' @param table_path 需要格式化表格的YAML文件路径
#' @param annotation_path 表格注释信息的YAML文件路径
#' @return 格式化后的表格数据
#' @export
#'
#' @details
#' 该函数调用biorange模块中的table_format函数，
#' 使用提供的表格和注释路径来格式化数据。
#'
#' @examples
#' \dontrun{
#' formatted_table <- format_table(
#'     "/home/liuyan/projects/package/biorang_bak/表格路径.yaml",
#'     "/home/liuyan/projects/package/biorang_bak/中药入血注释.yaml"
#' )
#' print(formatted_table)
#' }
format_table <- function(table_path, annotation_path) {
    biorange <- import_biorange()
    biorange$target_predict$data_processing$table_format(
        table_path,
        annotation_path
    )
}
