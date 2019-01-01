browse_ci <- function() {
  core <- fgeo:::fgeo_packages()
  extentions <- paste0("fgeo.", c("data", "misc", "krig"))
  infrastructure <- c("fgeo.template")
  wip <- c("allodb", "fgeo.biomass")
  pkgs <- c(core, extentions, infrastructure, wip)
  urls <- c(
    paste0("https://travis-ci.org/forestgeo/", pkgs),
    "https://travis-ci.org/maurolepore/pkgdoc"
  )
  
  purrr::walk(urls, utils::browseURL)
}
