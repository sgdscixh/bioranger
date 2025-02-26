#' 将HTML文件转换为PNG图像
#'
#' 此函数使用biorange模块中的html_png_onestep函数将HTML文件转换为PNG格式。
#'
#' @param file_path 需要转换的HTML文件路径
#' @param output_path 转换后的PNG文件输出路径
#' @return 无返回值，直接生成PNG文件
#' @export
#'
#' @details
#' 该函数调用biorange模块中的html_png_onestep函数，
#' 使用提供的文件路径和输出路径进行转换。
#'
#' @examples
#' \dontrun{
#' html_to_png_onestep(
#'     "/home/liuyan/projects/package/biorang_bak/2d_autodock.html",
#'     "/home/liuyan/projects/package/biorang_bak/999doutput.png"
#' )
#' }
html_to_png_onestep <- function(file_path, output_path) {
    biorange <- import_biorange()
    biorange$dock$dock_png_onestep$html_png_onestep(
        file_path,
        output_path
    )
}
