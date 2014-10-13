pdf = mangal-draft.pdf
basefile = mangal
rmd = $(basefile).Rmd
md = $(basefile).md
refs = mg-refs.bib

all: $(pdf) suppmat/1_dataspec.html
	pdftops $(pdf) ms.ps
	ps2pdf13 ms.ps $(pdf)
	rm ms.ps

suppmat/1_dataspec.html: suppmat/1_dataspec.Rmd
	Rscript -e "library(knitr); knit('suppmat/1_dataspec.Rmd', output='suppmat/1_dataspec.md')"
	pandoc suppmat/1_dataspec.md -o suppmat/1_dataspec.html
	pandoc suppmat/1_dataspec.md -o suppmat/1_dataspec.pdf

$(pdf): $(md) $(refs)
	pandoc $(md) -o $(pdf) --bibliography=$(refs) --csl=mee.csl --template=paper.latex

$(md): $(rmd) fig_dataspec.pdf
	Rscript -e "library(knitr); knit(input='$(rmd)', output='$(md)');"

fig_dataspec.pdf: dataspec.dot
	dot $< -Tpdf > $@

$(refs): bib.keys
	python2 extractbib.py bib.keys /home/tp/.pandoc/default.bib $(refs)

bib.keys: $(md)
	grep @[-:_a-zA-Z0-9]* $(md) -oh --color=never | sort | uniq | sed 's/@//g' > bib.keys

diff.pdf: old_mangal.md $(md)
	pandoc $(md) -o revised.tex --template=paper.latex --bibliography=$(refs) --csl=mee.csl 
	pandoc old_mangal.md -o orig.tex --template=paper.latex
	latexdiff orig.tex revised.tex > diff.tex
	pdflatex diff
	rm {revised,orig,diff}.tex
