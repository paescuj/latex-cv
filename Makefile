all: main.pdf

main.pdf: main.tex cv.cls
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" main.tex
	$(MAKE) clean

watch:
	trap '$(MAKE) clean' SIGINT; latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -pvc main.tex
	
clean:
	latexmk -c

cleanall:
	latexmk -C
