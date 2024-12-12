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
	
.PHONY: install 	
install:
	Rscript -e "renv::restore()"
	
generate_report: 
	# Ensure the report directory exists
	mkdir -p report
	
	# Determine the platform for mounting paths (Mac/Linux vs. Windows)
	ifeq ($(OS),Windows_NT)
		# On Windows, use the correct path format for Git Bash
		docker run -v //$(PWD)/report:/app/report drashtimaisuria/data550_final:final
	else
		# On Mac/Linux, use regular path format
		docker run -v $(PWD)/report:/app/report drashtimaisuria/data550_final:final
	endif

# Target to build the Docker image 
build_image:
	docker build -t drashtimaisuria/data550_final:final .
	
	
	
	
	
	
	