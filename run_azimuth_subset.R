
# Install and load the required package (Azimuth)
if (!requireNamespace("Azimuth", quietly = TRUE)) {
  install.packages("devtools")
  devtools::install_github("satijalab/azimuth")
}

library(Azimuth)

# Load the subsetted h5ad file
adata <- ReadH5AD("/content/drive/MyDrive/subset_adata.h5ad")

# Perform Azimuth annotation (using 4 cores for parallelization)
azimuth_results <- Azimuth::azimuth(adata, ncores = 4)

# Add results to the anndata object
adata$azimuth_cell_types <- azimuth_results$predicted.celltype

# Save the annotated file
SaveH5Seurat(adata, filename = "/content/drive/MyDrive/annotated_output_azimuth_subset.h5Seurat")
