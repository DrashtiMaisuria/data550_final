final.html: final.Rmd output/gender_count.csv output/medals_by_gender.png output/top_country.csv
	Rscript -e "rmarkdown::render('final.Rmd')"
	
#Render: code/03_render.Rmd 
#	Rscript -e "rmarkdown::render('code/03_render.Rmd')"
	
output/gender_count.csv: code/00_table.Rmd data/olympics_dataset.csv
	Rscript -e "rmarkdown::render('code/00_table.Rmd')" 

output/medals_by_gender.png: code/01_figure.Rmd data/olympics_dataset.csv
	Rscript -e "rmarkdown::render('code/01_figure.Rmd')"
	
output/top_country.csv: code/02_analysis.Rmd data/olympics_dataset.csv
	Rscript -e "rmarkdown::render('code/02_analysis.Rmd')"
	
#.PHONY: install 	
install:
	Rscript -e "renv::restore()"
	
generate_report: 
	# Ensure the report directory exists
	mkdir -p report && \
	# Run the Docker container and mount the `report` directory
	docker run --rm -v $(pwd)/report:/app/report drashtimaisuria/data550_final:final

# Target to build the Docker image 
build_image:
	docker build -t drashtimaisuria/data550_final:final .
	
	
	
	
	
	
	