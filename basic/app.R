## ----pc-view------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# devtools::install_github("sa-lee/liminal")
library(liminal)
pcs  <- prcomp(fake_trees[, -ncol(fake_trees)])
# var explained
head(cumsum(pcs$sdev / sum(pcs$sdev)))


## ----pca-xy-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
fake_trees <- dplyr::bind_cols(fake_trees, as.data.frame(pcs$x))
#> # this loads a shiny app on the first fifteen PCs
app <- limn_tour(fake_trees, cols = PC1:PC15, color = branches, gadget_mode = FALSE)

shiny::runApp(app)
