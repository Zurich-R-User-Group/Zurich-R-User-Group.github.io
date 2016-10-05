RMDFILES = about.Rmd index.Rmd slides.Rmd	


all: $(RMDFILES)
	Rscript -e "rmarkdown::render_site()"
