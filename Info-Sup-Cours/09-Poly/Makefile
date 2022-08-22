all:
	git log -1 --format="format:\
                \\gdef\\GITAbrHash{%h}\
                \\gdef\\GITAuthorDate{%ad}\
                \\gdef\\GITAuthorName{%an}" >> vc.tex
	pdflatex --shell-escape cours.tex
	pdflatex --shell-escape cours.tex
	pdflatex --shell-escape cours.tex
clean:
	rm -f vc.tex
	rm -f exos-*
	rm -f cours-complexite.tex
	rm -f cours-correction.tex
	rm -f cours-flot_execution.tex
	rm -f cours-fonction.tex
	rm -f cours-graphe.tex
	rm -f cours-representation_donnees.tex
	rm -f cours-structure_sequentielle.tex
	rm -f cours-valeur_type_variable.tex
	rm -f fiche.txt
	rm -f tmp.inputs
	rm -Rf _minted*
	rm -f cours-auto*
	rm -f cours.pdf
	rm -f cours.log
	rm -f cours.aux
	rm -f cours.maf
	rm -f cours.toc
	rm -f cours.mtc*
	rm -f cours*mtc*
	rm -f *.aux
	rm -f *.toc
	rm -f *.maf
	rm -f *.log
	rm -f tp-*.tex
get:
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../01-ValeurTypeVariable/cours-valeur_type_variable.tex > cours-valeur_type_variable.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../02-FlotExecution/cours-flot_execution.tex > cours-flot_execution.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../03-Fonction/cours-fonction.tex > cours-fonction.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../04-StructureSequentielle/cours-structure_sequentielle.tex > cours-structure_sequentielle.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../05-RepresentationDonnees/cours-representation_donnees.tex > cours-representation_donnees.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../06-Complexite/cours-complexite.tex > cours-complexite.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../07-Correction/cours-correction.tex > cours-correction.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../08-Graphe/cours-graphe.tex > cours-graphe.tex
diff:
	git latexdiff HEAD -- --main cours-sup.tex --latexopt "--shell-escape"
