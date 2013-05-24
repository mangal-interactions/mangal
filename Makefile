pdf: data-spec-draft.md
	pandoc data-spec-draft.md -o mangal-draft.pdf --bibliography=/home/tpoisot/texmf/bibtex/bib/local/library.bib

html: data-spec-draft.md
	pandoc data-spec-draft.md -o mangal-draft.html  --bibliography=/home/tpoisot/texmf/bibtex/bib/l    ocal/library.bib

all: data-spec-draft.md mangal-draft.pdf mangal-draft.html
