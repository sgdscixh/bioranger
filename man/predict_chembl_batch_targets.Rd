% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_chembl_batch_targets.R
\name{predict_chembl_batch_targets}
\alias{predict_chembl_batch_targets}
\title{批量预测ChEMBL靶点}
\usage{
predict_chembl_batch_targets(smiles)
}
\arguments{
\item{smiles}{一个包含SMILES字符串的字符向量}
}
\value{
一个包含预测ChEMBL靶点的数据框
}
\description{
此函数对一批SMILES字符串进行ChEMBL靶点预测。
}
\details{
该函数使用biorange模块的chembl_smiles_target函数对每个输入的SMILES字符串进行靶点预测。
结果会被合并成一个数据框返回。
}
\examples{
\dontrun{
smiles <- c("CC(=O)OC1=CC=CC=C1C(=O)O", "CCO")
chembl_targets <- predict_chembl_batch_targets(smiles)
print(chembl_targets)
}
}
