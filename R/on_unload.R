#' Unload the dynamic library when the package is unloaded
#'
#' @param libpath Path where the library is located
#'
#' @return Nothing
.onUnload <- function(libpath){
  message("Unloading linreg dynamic link (shared object) library...")
  try(library.dynam.unload("linreg", libpath), silent = TRUE)
}