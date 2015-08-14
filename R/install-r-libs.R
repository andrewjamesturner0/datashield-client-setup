#!/usr/bin/env Rscript

# NOTE: the 'lib' option will be replaced with the correct library location
# by the install scripts.
options(repos=c(CRAN='http://cran.rstudio.com', 'http://cran.obiba.org'))
install.packages('rjson', lib='@LIB@')
install.packages('RCurl', lib='@LIB@')
install.packages('opal', type='source', lib='@LIB@')
install.packages('opaladmin', type='source', lib='@LIB@')
install.packages('datashieldclient', dependencies=TRUE, lib='@LIB@')
