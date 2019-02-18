pdf:
	Rscript --quiet _render.R "bookdown::pdf_book"

gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"

clean:
	rm -f selective-inference-notes.rds selective-inference-notes.tex preface.html
all:
	Rscript --quiet _render.R
