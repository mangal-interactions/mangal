pdf = mangal-draft.pdf
basefile = mangal
rmd = $(basefile).Rmd
md = $(basefile).md
refs = mg-refs.bib

all: $(pdf)
	pdftops $(pdf) ms.ps
	ps2pdf13 ms.ps $(pdf)
	rm ms.ps

$(pdf): $(md) $(refs)
	pandoc $(md) -o $(pdf) --bibliography=$(refs) --csl=mee.csl

$(md): $(rmd)
	Rscript -e "library(knitr); knit(input='$(rmd)', output='$(md)');"

$(refs): bib.keys
	python2 extractbib.py bib.keys /home/tpoisot/texmf/bibtex/bib/local/library.bib $(refs)

bib.keys: $(md)
	grep @[-:_a-zA-Z0-9]* $(md) -oh --color=never | sort | uniq | sed 's/@//g' > bib.keys
