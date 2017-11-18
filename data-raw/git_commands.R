git_commands <- readr::read_file("./data-raw/git.R")
use_data(git_commands, internal = TRUE, overwrite = TRUE)

