SHELL:=bash

MAIN:=probably
SOURCES:=$(MAIN).tex $(wildcard ans??.tex)

pdf: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).aux $(SOURCES)
	cd $(dir $@) && pdflatex -interaction=nonstopmode $(@:.pdf=.tex)

$(MAIN).aux: $(MAIN).tex
	cd $(dir $@) && pdflatex -interaction=nonstopmode $(@:.aux=.tex)

clean:
	rm -f $(MAIN).{out,log,aux,toc} $(SOURCES:.tex=.log)

