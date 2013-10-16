all: pdf

pdf: data-spec-draft.md
	pandoc data-spec-draft.md -o mangal-draft.pdf --bibliography=/home/tpoisot/texmf/bibtex/bib/local/library.bib --csl=bmc-bioinformatics.csl
