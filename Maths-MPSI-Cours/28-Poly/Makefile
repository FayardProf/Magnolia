pdf:
	git log -1 --format="format:\
                \\gdef\\GITAbrHash{%h}\
                \\gdef\\GITAuthorDate{%ad}\
                \\gdef\\GITAuthorName{%an}" >> vc.tex
	pdflatex --shell-escape cours.tex
	pdflatex --shell-escape cours.tex
	pdflatex --shell-escape cours.tex
clean:
	rm -f vc.tex
	rm -f cours.fdb_latexmk
	rm -f cours.fls
	rm -f de-4_faces.png
	rm -f binomial-10.tex
	rm -f binomial-100.tex
	rm -f cours-complements_algebre.tex
	rm -f cours-complements_analyse.tex
	rm -f cours-continuite_limites.tex
	rm -f cours-derivation.tex
	rm -f cours-developpements_limites.tex
	rm -f cours-equations_differentielles.tex
	rm -f cours-fonctions_usuelles.tex
	rm -f cours-logique_ensembles.tex
	rm -f cours-nombres_complexes.tex
	rm -f cours-reels.tex
	rm -f cours-suites.tex
	rm -f cours-arithmetique.tex
	rm -f cours-denombrement.tex
	rm -f cours-determinants.tex
	rm -f cours-dimension_finie.tex
	rm -f cours-espaces_euclidiens.tex
	rm -f cours-espaces_vectoriels.tex
	rm -f cours-fractions_rationnelles.tex
	rm -f cours-integration.tex
	rm -f cours-matrices.tex
	rm -f cours-pics.pdf
	rm -f cours-corps_polynomes.tex
	rm -f cours-polynomes.tex
	rm -f cours-probabilites.tex
	rm -f cours-series.tex
	rm -f cours-groupes.tex
	rm -f cours-esperance_variance.tex
	rm -f cours-deux_variables.tex
	rm -f cours-familles_sommables.tex
	rm -f cours-matrices-1.tex
	rm -f exos-complements_algebre.tex
	rm -f exos-complements_analyse.tex
	rm -f exos-continuite_limites.tex
	rm -f exos-derivation.tex
	rm -f exos-developpements_limites.tex
	rm -f exos-equations_differentielles.tex
	rm -f exos-fonctions_usuelles.tex
	rm -f exos-logique_ensembles.tex
	rm -f exos-nombres_complexes.tex
	rm -f exos-reels.tex
	rm -f exos-suites.tex
	rm -f exos-arithmetique.tex
	rm -f exos-denombrement.tex
	rm -f exos-determinants.tex
	rm -f exos-dimension_finie.tex
	rm -f exos-espaces_affines.tex
	rm -f exos-espaces_euclidiens.tex
	rm -f exos-espaces_vectoriels.tex
	rm -f exos-fractions_rationnelles.tex
	rm -f exos-integration.tex
	rm -f exos-matrices.tex
	rm -f exos-corps_polynomes.tex
	rm -f exos-polynomes.tex
	rm -f exos-probabilites.tex
	rm -f exos-series.tex
	rm -f exos-deux_variables.tex
	rm -f exos-groupes.tex
	rm -f exos-variables_aleatoires.tex
	rm -f exos-matrices_applications_lineaires.tex
	rm -f tmp.inputs
	rm -f cours-fig*
	rm -f cours-autopp*
	rm -f cours.pdf
	rm -f *.log
	rm -f *.aux
	rm -f *.maf
	rm -f *.mtc*
	rm -f *.toc
	rm -f fiche.txt
	rm -f imaginary_numbers.png
	rm -f machin.png
	rm -f three.jpg
	rm -f diff_int.png
	rm -f cauchy-1.pdf
	rm -f cauchy-2.pdf
	rm -f cauchy-3.pdf
	rm -f tech-calvin.png
	rm -f turtle-1.pdf
	rm -f turtle-2.pdf
	rm -f turtle-3.pdf
	rm -f lazos.png
	rm -f rolle.png
	rm -f graphe_arccos.txt
	rm -f graphe_arcsin.txt
	rm -f graphe_arctan.txt
	rm -f graphe_argch.txt
	rm -f graphe_argsh.txt
	rm -f graphe_argth.txt
	rm -f graphe_cos.txt
	rm -f graphe_cosh.txt
	rm -f graphe_coshp.txt
	rm -f graphe_coss.txt
	rm -f graphe_exp.txt
	rm -f graphe_expsd.txt
	rm -f graphe_ln.txt
	rm -f graphe_puissa.txt
	rm -f graphe_puissb.txt
	rm -f graphe_puissc.txt
	rm -f graphe_puissd.txt
	rm -f graphe_puisse.txt
	rm -f graphe_sin.txt
	rm -f graphe_sinh.txt
	rm -f graphe_sins.txt
	rm -f graphe_tan.txt
	rm -f graphe_tana.txt
	rm -f graphe_tanb.txt
	rm -f graphe_tanh.txt
	rm -f graphe_af.txt
	rm -f graphe_rolle.txt
	rm -f graphe_asymptote_a.txt 
	rm -f graphe_asymptote_b.txt 
	rm -f graphe_dom_impaire.txt 
	rm -f graphe_dom_paire.txt 
	rm -f graphe_dom_periodique.txt 
	rm -f graphe_dom_sym.txt 
	rm -f graphe_parabole_p.txt 
	rm -f graphe_parabole.txt 
	rm -f graphe_convexite.txt
	rm -f graphe_convexite_2.txt
	rm -f pile-face.tex
	rm -f benford.tex
	rm -Rf _minted-cours
	rm -Rf graph/
	rm -f cours-*.tex
	rm -f cours1-*.tex
	rm -f cours2-*.tex
	rm -f cours3-*.tex
	rm -f cours4-*.tex
	rm -f cours5-*.tex
	rm -f cours1-*.pdf
	rm -f cours2-*.pdf
	rm -f cours3-*.pdf
	rm -f cours4-*.pdf
	rm -f cours5-*.pdf
	rm -f cours1-*.ps
	rm -f cours2-*.ps
	rm -f cours3-*.ps
	rm -f cours4-*.ps
	rm -f cours5-*.ps
	rm -f cours1.pdf
	rm -f cours2.pdf
	rm -f cours3.pdf
	rm -f cours4.pdf
	rm -f cours5.pdf
	rm -Rf _minted*
	rm -f exos-*.tex
	rm -f *.gz
get:
	mkdir graph
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/01-NombresComplexes/cours-nombres_complexes.tex > cours-nombres_complexes.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/02-LogiqueEnsembles/cours-logique_ensembles.tex > cours-logique_ensembles.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/03-ComplementsAnalyse/cours-complements_analyse.tex > cours-complements_analyse.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/04-ComplementsAlgebre/cours-complements_algebre.tex > cours-complements_algebre.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/05-FonctionsUsuelles/cours-fonctions_usuelles.tex > cours-fonctions_usuelles.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/06-EquationsDifferentielles/cours-equations_differentielles.tex > cours-equations_differentielles.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/07-EspacesVectoriels/cours-espaces_vectoriels.tex > cours-espaces_vectoriels.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/08-Suites/cours-suites.tex > cours-suites.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/09-Matrices/cours-matrices.tex > cours-matrices.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/10-Denombrement/cours-denombrement.tex > cours-denombrement.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/11-Groupes/cours-groupes.tex > cours-groupes.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/12-ContinuiteLimites/cours-continuite_limites.tex > cours-continuite_limites.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/13-AnneauxCorpsPolynomes/cours-corps_polynomes.tex > cours-corps_polynomes.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/14-DimensionFinie/cours-dimension_finie.tex > cours-dimension_finie.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/15-AnalyseAsymptotique/cours-analyse_asymptotique.tex > cours-analyse_asymptotique.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/16-MatricesApplineaires/cours-matrices_applineaires.tex > cours-matrices_applineaires.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/17-Derivation/cours-derivation.tex > cours-derivation.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/18-Arithmetique/cours-arithmetique.tex > cours-arithmetique.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/19-Integration/cours-integration.tex > cours-integration.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/20-Polynomes/cours-polynomes.tex > cours-polynomes.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/21-Probabilites/cours-probabilites.tex > cours-probabilites.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/22-FractionsRationnelles/cours-fractions_rationnelles.tex > cours-fractions_rationnelles.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/23-Series/cours-series.tex > cours-series.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/24-Determinants/cours-determinants.tex > cours-determinants.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/25-Euclidiens/cours-euclidiens.tex > cours-euclidiens.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/26-EsperanceVariance/cours-esperance_variance.tex > cours-esperance_variance.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Cours/27-DeuxVariables/cours-deux_variables.tex > cours-deux_variables.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/01-NombresComplexes/exos-nombres_complexes.tex > exos-nombres_complexes.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/02-LogiqueEnsembles/exos-logique_ensembles.tex > exos-logique_ensembles.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/03-ComplementsAnalyse/exos-complements_analyse.tex > exos-complements_analyse.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/04-ComplementsAlgebre/exos-complements_algebre.tex > exos-complements_algebre.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/05-FonctionsUsuelles/exos-fonctions_usuelles.tex > exos-fonctions_usuelles.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/06-EquationsDifferentielles/exos-equations_differentielles.tex > exos-equations_differentielles.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/07-EspacesVectoriels/exos-espaces_vectoriels.tex > exos-espaces_vectoriels.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/08-Suites/exos-suites.tex > exos-suites.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/09-Matrices/exos-matrices.tex > exos-matrices.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/10-Denombrement/exos-denombrement.tex > exos-denombrement.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/11-Groupes/exos-groupes.tex > exos-groupes.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/12-ContinuiteLimites/exos-continuite_limites.tex > exos-continuite_limites.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/13-AnneauxCorpsPolynomes/exos-corps_polynomes.tex > exos-corps_polynomes.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/14-DimensionFinie/exos-dimension_finie.tex > exos-dimension_finie.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/15-AnalyseAsymptotique/exos-analyse_asymptotique.tex > exos-analyse_asymptotique.tex 
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/16-MatricesApplineaires/exos-matrices_applineaires.tex > exos-matrices_applineaires.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/17-Derivation/exos-derivation.tex > exos-derivation.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/18-Arithmetique/exos-arithmetique.tex > exos-arithmetique.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/19-Integration/exos-integration.tex > exos-integration.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/20-Polynomes/exos-polynomes.tex > exos-polynomes.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/21-Probabilites/exos-probabilites.tex > exos-probabilites.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/22-FractionsRationnelles/exos-fractions_rationnelles.tex > exos-fractions_rationnelles.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/23-Series/exos-series.tex > exos-series.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/24-Determinants/exos-determinants.tex > exos-determinants.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/25-Euclidiens/exos-euclidiens.tex > exos-euclidiens.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/26-EsperanceVariance/exos-esperance_variance.tex > exos-esperance_variance.tex
	sed -e '/BEGIN_BOOK/,/END_BOOK/!d' ../../Maths-MPSI-Exos/27-DeuxVariables/exos-deux_variables.tex > exos-deux_variables.tex
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_arccos.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_arcsin.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_arctan.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_argch.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_argsh.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_argth.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_cos.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_cosh.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_coshp.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_coss.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_exp.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_expsd.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_ln.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_puissa.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_puissb.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_puissc.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_puissd.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_puisse.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_sin.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_sinh.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_sins.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_tan.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_tana.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_tanb.txt graph/
	cp ../../Maths-MPSI-Cours/05-FonctionsUsuelles/graph/graphe_tanh.txt graph/
	cp ../../Maths-MPSI-Cours/03-ComplementsAnalyse/graph/graphe_asymptote_a.txt graph/
	cp ../../Maths-MPSI-Cours/03-ComplementsAnalyse/graph/graphe_asymptote_b.txt graph/
	cp ../../Maths-MPSI-Cours/03-ComplementsAnalyse/graph/graphe_dom_impaire.txt graph/
	cp ../../Maths-MPSI-Cours/03-ComplementsAnalyse/graph/graphe_dom_paire.txt graph/
	cp ../../Maths-MPSI-Cours/03-ComplementsAnalyse/graph/graphe_dom_periodique.txt graph/
	cp ../../Maths-MPSI-Cours/03-ComplementsAnalyse/graph/graphe_dom_sym.txt graph/
	cp ../../Maths-MPSI-Cours/03-ComplementsAnalyse/graph/graphe_parabole_p.txt graph/
	cp ../../Maths-MPSI-Cours/03-ComplementsAnalyse/graph/graphe_parabole.txt graph/
	cp ../../Maths-MPSI-Cours/17-Derivation/graph/graphe_af.txt graph/
	cp ../../Maths-MPSI-Cours/17-Derivation/graph/graphe_rolle.txt graph/
	cp ../../Maths-MPSI-Cours/17-Derivation/graph/graphe_convexite.txt graph/
	cp ../../Maths-MPSI-Cours/17-Derivation/graph/graphe_convexite_2.txt graph/
	cp ../../Maths-MPSI-Cours/21-Probabilites/graph/benford.tex  graph/benford.tex
	cp ../../Maths-MPSI-Cours/21-Probabilites/graph/pile-face.tex  graph/pile-face.tex
	cp ../../Maths-MPSI-Cours/21-Probabilites/graph/binomial-10.tex graph/binomial-10.tex
	cp ../../Maths-MPSI-Cours/21-Probabilites/graph/binomial-100.tex graph/binomial-100.tex
	# cp ../../Maths-MPSI-Cours/26-EsperanceVariance/de-4_faces.png de-4_faces.png
diff:
	git latexdiff HEAD -- --main cours-sup.tex --latexopt "--shell-escape"
