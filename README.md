# tmb_compilation_mwe
 
[![Travis build status](https://travis-ci.com/cgrandin/tmb_compilation_mwe.svg?branch=master)](https://travis-ci.com/cgrandin/tmb_compilation_mwe)
[![Coverage status](https://codecov.io/gh/cgrandin/tmb_compilation_mwe/branch/master/graph/badge.svg)](https://codecov.io/github/cgrandin/tmb_compilation_mwe?branch=master)

A minimal working example of how to compile and register TMB code properly in a package

This method eliminates the need for compilation from source by the user. For example code like this is no longer needed because the DLL is registered upon loading of the package:

``` r
dlls <- getLoadedDLLs()
if (!any(vapply(dlls, function(x) x[["name"]] == "linreg", FUN.VALUE = TRUE))) {
  lib.f <- system.file("tmb", "linreg.cpp", package = "linreg")
  .f <- "linreg.cpp"
  if (!file.exists(.f)) {
    file.copy(lib.f, to = .f)
  }
  TMB::compile(.f)
  dyn.load(TMB::dynlib("linreg"))
}
```

If running `devtools::check()`, be sure to call it as: `devtools::check(cran = FALSE)`
to avoid an error about the DLL not being able to be found, or delete the `.dll` or `.so` files prior to running `devtools::check()`.
