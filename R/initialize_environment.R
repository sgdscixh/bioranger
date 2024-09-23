#' @title 初始化包的Python环境
#' @description 该函数设置包所需的Python环境。它会在必要时安装Miniconda，创建虚拟环境，并安装所需的Python包。
#' @param venv_name 将要创建或使用的虚拟环境名称。
#' @param min_python_version 所需的最低Python版本。
#' @param required_packages 需要安装的Python包的字符向量。
#' @return 返回一个指示环境设置状态的消息。
#' @usage initialize_environment(venv_name = "r-reticulate", min_python_version = "3.10", required_packages = c("biorange"))
#' @examples
#' \dontrun{
#' initialize_environment()
#' }
#' @details 该函数检查Python是否可用，如果不可用则安装Miniconda；如果虚拟环境不存在则创建虚拟环境，并安装所需的Python包。
#' @keywords 环境, 设置, Python, reticulate
#' @importFrom reticulate py_available virtualenv_exists virtualenv_create use_virtualenv py_config py_module_available py_install
#' @export
initialize_environment <- function(venv_name = "r-reticulate",
                                   min_python_version = "3.10",
                                   required_packages = c("biorange")) {
  # 检查Python是否可用，否则安装Miniconda
  if (!reticulate::py_available(initialize = FALSE)) {
    message("Python 不可用，正在安装 Miniconda...")
    reticulate::install_python()
  }

  # 检查虚拟环境是否存在，否则创建它
  if (!reticulate::virtualenv_exists(envname = venv_name)) {
    message(sprintf("虚拟环境 '%s' 不存在，正在创建...", venv_name))
    reticulate::virtualenv_create(envname = venv_name, python = min_python_version)
  }

  # 使用指定的虚拟环境
  reticulate::use_virtualenv(venv_name, required = TRUE)

  # 检查所需的Python包是否已安装，否则安装它们
  for (pkg in required_packages) {
    if (!reticulate::py_module_available(pkg)) {
      message(sprintf("Python 包 '%s' 不可用，正在安装...", pkg))
      reticulate::py_install(pkg, envname = venv_name, method = "virtualenv")
    }
  }

  # 打印Python配置信息
  py_cfg <- reticulate::py_config()
  message("Python 环境已设置。")
  return(py_cfg)
}
