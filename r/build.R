path = "~/project/r"
file.names <- dir(path, pattern= ".Rmd")
for (i in 1:length(file.names)){
    rmarkdown::render(file.names[i])
}
