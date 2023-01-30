FROM rocker/tidyverse:4.2.2

# Install additional R packages that are available through CRAN.
RUN R -e 'install.packages("devtools")'
RUN R -e 'install.packages("knitr")'
RUN R -e 'install.packages("kableExtra")'
RUN R -e 'install.packages("htmltoolsq")'
RUN R -e 'install.packages("BiocManager")'

# Install disgenet2r from repo and, before that, the archived SPARQL library it needs.
RUN R -e 'devtools::install_version("SPARQL", version = "1.16", repos = "https://CRAN.R-project.org")'
RUN R -e 'devtools::install_bitbucket("ibi_group/disgenet2r")'

# Install Bioconductor packages
RUN R -e 'BiocManager::install("org.Hs.eg.db")'
RUN R -e 'BiocManager::install("AnnotationDbi")'
RUN R -e 'BiocManager::install("DOSE")'
RUN R -e 'BiocManager::install("enrichplot")'
RUN R -e 'BiocManager::install("ggraph")'
RUN R -e 'BiocManager::install("reactome.db")'
RUN R -e 'BiocManager::install("igraph")'
RUN R -e 'BiocManager::install("graphite")'
RUN R -e 'BiocManager::install("gson")'
RUN R -e 'BiocManager::install("ReactomePA")'

# Copy scripts to Docker image.
COPY data_viz_task.Rproj /data_viz_task/
COPY dvt_analysis.R /data_viz_task/
COPY dvt_disgenet2r_setup.R /data_viz_task/
COPY dvt_report.Rmd /data_viz_task/
COPY dvt_report_setup.R /data_viz_task/

# Copy data directory to Docker image.
COPY data /data_viz_task/data

# Set the working directory.
WORKDIR /data_viz_task

# Run the workflow.
CMD Rscript dvt_disgenet2r_setup.R name@address password
CMD Rscript dvt_analysis.R data/example_data.csv test_run
CMD Rscript dvt_report_setup.R test_run
