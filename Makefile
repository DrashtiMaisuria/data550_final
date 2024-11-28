tables: code/00_table.Rmd output/gender_count.csv
	Rscript code/00_table.Rmd 

figures: code/01_figure.Rmd output/medals_by_gender.png
	Rscript code/01_figure.Rmd

analysis: code/02_analysis.Rmd 
	Rscript code/02_analysis.Rmd
	
Render: code/03_render.Rmd 
	Rscript code/03_render.Rmd
	
install:
    Rscript -e "renv::restore()"