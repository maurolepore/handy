# Store ctfs functions in a small filter-able data structure --------------

# Source: http://ctfs.si.edu/Public/CTFSRPackage/ (Richard Condit)

# 1. Load CTFSRPackage.Rdata into global environment

# 2. Get ls() in a tibble
ctfs <- tibble::enframe(
  setNames(
    lapply(as.list(ls()), get), ls()
    ), "fname", "fcode"
  )

# 3. Save compressed
readr::write_rds(
  ctfs, "./ctfs_filterable.rds", compress = "gz"
  )

# CTFSRPackage.Rdata is 595 KB and ctfs.rds is 93.8 KB, so 6 x smaller.
