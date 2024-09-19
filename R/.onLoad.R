# Generated from create-bioranger.Rmd: do not edit by hand

#' Initialize the package environment
#'
#' This function is automatically called when the package is loaded.
#' It sets up the Python environment, installs necessary packages,
#' and configures the virtual environment for the package.
#'
#' @importFrom reticulate py_available virtualenv_exists virtualenv_create use_virtualenv py_config py_module_available py_install virtualenv_path
#' @noRd
.onLoad <- function() {
  tryCatch({
    if (!requireNamespace("reticulate", quietly = TRUE)) {
      stop("请安装 'reticulate' 包")
    }
    
    venv_name <- "r-reticulate"
    min_python_version <- "3.10"
    required_packages <- c("biorange")
    
    if (!py_available(initialize = TRUE)) {
      packageStartupMessage("未检测到Python。正在安装Miniconda...")
      tryCatch({
        install_miniconda()
      }, error = function(e) {
        stop("安装 Miniconda 失败：", conditionMessage(e))
      })
    }
    
    if (!virtualenv_exists(venv_name)) {
      packageStartupMessage("正在创建虚拟环境 '", venv_name, "'...")
      tryCatch({
        virtualenv_create(envname = venv_name, python_version = min_python_version)
      }, error = function(e) {
        stop("虚拟环境创建失败：", conditionMessage(e))
      })
    }
    
    use_virtualenv(venv_name, required = TRUE)
    
    python_version <- py_config()$version
    packageStartupMessage("已检测到 Python 版本：", python_version)
    
    if (package_version(python_version) < package_version(min_python_version)) {
      stop("需要 Python ", min_python_version, " 或更高版本。当前版本: ", python_version, 
           "\n请删除现有的虚拟环境并重新运行以创建新的环境。")
    }
    
    for (pkg in required_packages) {
      if (!py_module_available(pkg)) {
        packageStartupMessage("正在安装 '", pkg, "' Python 包...")
        tryCatch({
          py_install(pkg, envname = venv_name)
        }, error = function(e) {
          stop("安装 Python 包 '", pkg, "' 失败：", conditionMessage(e))
        })
      }
    }
    
    packageStartupMessage("Python 环境设置完成。使用 Python ", python_version, 
                          " 和 ", paste(required_packages, collapse = ", "), "。")
    
    # 内部函数，用于获取虚拟环境路径
    get_venv_path <- function() {
      virtualenv_path(venv_name)
    }
    
    # 设置包级别的选项，存储获取虚拟环境路径的函数
    options(mypackage.get_venv_path = get_venv_path)
    
  }, error = function(e) {
    warning("设置 Python 环境时出错: ", conditionMessage(e), 
            "\n如果问题持续，请手动安装 Python ", min_python_version, "+，",
            "并运行 reticulate::virtualenv_create('", venv_name, "') ",
            "和 reticulate::py_install(c('", paste(required_packages, collapse = "', '"), 
            "'), envname='", venv_name, "')")
  })
}

