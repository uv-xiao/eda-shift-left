# Define variables
TEX_FILES := sciscn.tex
PDF_FILES := $(TEX_FILES:.tex=.pdf)
FINAL_NAME := EDA_Design_Paradigm

# Define targets and dependencies
all: $(PDF_FILES)

%.pdf: %.tex
	latex.exe $<
	ctex.exe --src-specials -latex-runs=1 -dvips $<
	ctex.exe --src-specials -latex-runs=1 -dvips $<
	dvipdfmx $*.dvi
	cmd /C copy sciscn.pdf $(FINAL_NAME).pdf

clean:
	cmd /C del sciscn.pdf 
	cmd /C del $(FINAL_NAME).pdf