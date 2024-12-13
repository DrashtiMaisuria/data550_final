# Use an official R image from Rocker
FROM rocker/r-ver:4.4.0

# Set the working directory in the container
WORKDIR /app

# Copy the entire project into the container
COPY . /app

# Install system dependencies (including pandoc and git)
RUN apt-get update && apt-get install -y \
    pandoc \
    pandoc-citeproc \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install R package dependencies
RUN R -e "install.packages(c('ggplot2', 'dplyr', 'knitr', 'rmarkdown', 'readr', 'tidyr'))"

# Command to run the RMarkdown report
CMD ["Rscript", "-e", "rmarkdown::render('final.Rmd', output_format = 'html_document', output_file = '/app/report/final.html')"]




