#' Run a linear regression example using TMB
#'
#' @return Nothing
#' @importFrom TMB MakeADFun
#' @export
run_linreg <- function(seed = 123){
  set.seed(seed)
  data <- list(Y = rnorm(10) + 1:10, x = 1:10)
  parameters <- list(a = 0, b = 0, logSigma = 0)
  obj <- MakeADFun(data, parameters, DLL = "linreg")
  obj$hessian <- TRUE
  obj$env$tracemgc <- FALSE
  opt <- do.call("optim", obj)
  opt
  opt$hessian ## <-- FD hessian from optim
  obj$he()    ## <-- Analytical hessian
}
