% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_omim_disease_targets.R
\name{predict_omim_disease_targets}
\alias{predict_omim_disease_targets}
\title{预测OMIM疾病靶点}
\usage{
predict_omim_disease_targets(diseases)
}
\arguments{
\item{diseases}{一个表示疾病表型的字符串}
}
\value{
一个包含预测疾病靶点的数据框
}
\description{
此函数使用OMIM数据库预测疾病靶点。
}
\details{
该函数使用biorange模块的omim_disease_target函数对输入的疾病表型进行靶点预测。
结果会被返回为一个数据框。
}
\examples{
\dontrun{
omim_targets <- predict_omim_disease_targets("癌症")
print(omim_targets)
}
}
