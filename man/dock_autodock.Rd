% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dock_autodock.R
\name{dock_autodock}
\alias{dock_autodock}
\title{Autodock 分子对接函数}
\usage{
dock_autodock(protein_path, ligand_path, samples_per_complex, output_dir,tool_id)
}
\arguments{
\item{protein_path}{蛋白质文件的路径。}

\item{ligand_path}{配体文件的路径。}

\item{output_dir}{输出文件夹的路径，默认为 "results/dock"。}

\item{tool_id}{切换快速对接和精准对接的ID，默认为 快速对接id"aee83f8c6aa459ef";精准对接id为"fdd780e7acf24f37"。}
}
\value{
无返回值，但会在指定的目录下生成 Autodock 分子对接的结果。
}
\description{
这个函数用于进行 Autodock 分子对接分析，调用了 biorange 包的 autodock_run 函数。
}
\details{
这个函数主要用于进行 Autodock 的分子对接分析。
}
\examples{
/dontrun{
dock_autodock(
  protein_path = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70.pdb",
  ligand_path = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70_ligand.sdf"
)
}
}
\keyword{autodock,}
\keyword{biorange}
\keyword{dock,}
