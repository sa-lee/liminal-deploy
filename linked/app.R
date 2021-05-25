library(liminal)
pcs  <- prcomp(fake_trees[, -ncol(fake_trees)])
# var explained
head(cumsum(pcs$sdev / sum(pcs$sdev)))


## ----pca-xy-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
fake_trees <- dplyr::bind_cols(fake_trees, as.data.frame(pcs$x))

set.seed(2099)
tsne <- Rtsne::Rtsne(dplyr::select(fake_trees, dplyr::starts_with("dim")))

tsne_df <- data.frame(tsneX = tsne$Y[,1],
                      tsneY = tsne$Y[,2])


shiny::runApp(
  limn_tour_link(embed_data = tsne_df,
               tour_data = fake_trees,
               cols = PC1:PC10, # tour columns to select
               color = branches, # variable to highlight across both view, can come for either data frames,
               gadget_mode = FALSE)
)


