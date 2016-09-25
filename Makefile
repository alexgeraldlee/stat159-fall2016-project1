mds = $(wildcard paper/sections/*.md)

all: paper.html


paper.html: $(mds)
	pandoc -s $(mds) -o paper.md
	pandoc -s /paper.md -o /paper.html


clean:
	rm paper/paper.html
