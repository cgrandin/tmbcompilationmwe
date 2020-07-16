#' Load the dynamic library when the package is loaded
#'
#' @details If running [devtools::check()], be sure to call it as: `devtools::check(cran = FALSE)`
#' to avoid an error about the DLL not being able to be found
#'
#' @param lib The name of the dynamic link library
#' @param pkg The package name
#'
#' @return Nothing
.onLoad <- function(lib, pkg) {
  # For a list of Travis-CI environment variables:
  # https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
  is_travis <- Sys.getenv("TRAVIS") != ""
  is_ci <- Sys.getenv("CI") != ""
  if(is_travis || is_ci){
    library.dynam("linreg", package = pkg, lib.loc = lib)
    library.dynam("minimal", package = pkg, lib.loc = lib)
  }else{
    library.dynam("linreg", package = pkg, lib.loc = .libPaths())
    library.dynam("minimal", package = pkg, lib.loc = .libPaths())
  }
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Loading linreg and minimal dynamic link (shared object) libraries...\n",
                        "Use arguments DLL = 'linreg' or DLL = 'minimal' to 'MakeADFun()' calls.")
}