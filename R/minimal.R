#' Minimal TMB example, MLE estimation to find the mean and variance of a normally distributed variable
#'
#' @return Nothing
#' @importFrom stats nlminb
#' @importFrom TMB sdreport
#' @export
run_minimal <- function(){
  data <- list(x = rivers)
  parameters <- list(mu = 0, logSigma = 0)
  obj <- MakeADFun(data, parameters, DLL = "minimal")
  obj$env$tracemgc <- FALSE
  fit <- nlminb(obj$par, obj$fn, obj$gr)
  sdr <- sdreport(obj)
  summary(sdr)
}
