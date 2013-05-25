pdf: data-spec-draft.md
	pandoc data-spec-draft.md -o mangal-draft.pdf --bibliography=/home/tpoisot/texmf/bibtex/bib/local/library.bib --csl=bmc-bioinformatics.csl

html: data-spec-draft.md
	pandoc data-spec-draft.md -o mangal-draft.html  --bibliography=/home/tpoisot/texmf/bibtex/bib/local/library.bib  --csl=bmc-bioinformatics.csl

all: pdf html
