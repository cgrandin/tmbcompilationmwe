# tmb_compilation_mwe
 
[![Travis build status](https://travis-ci.com/cgrandin/tmb_compilation_mwe.svg?branch=master)](https://travis-ci.com/cgrandin/tmb_compilation_mwe)
[![Coverage status](https://codecov.io/gh/cgrandin/tmb_compilation_mwe/branch/master/graph/badge.svg)](https://codecov.io/github/cgrandin/tmb_compilation_mwe?branch=master)

A minimal working example of how to compile and register TMB code properly in a package when you need more than one source C++ file, or a DLL with a different name than the package itself.

If running `devtools::check()`, be sure to call it as: `devtools::check(cran = FALSE)`
to avoid an error about the DLL not being able to be found, or delete the `.dll` or `.so` files prior to running `devtools::check()`.
