Magnolia est un projet visant à distribuer sous licence libre des documents utiles à l'enseignement.

Les documents sont sous licence Creative Commons : CC BY-SA

- Pour compiler les fichiers, il est nécessaire d'installer:
  - Les packages magnolia-conf.tex, magnolia-maths.tex et magnolia.cls afin qu'ils soient accessibles par
    votre distrubution LaTeX. Vous pouvez pour cela les mettre dans le même dossier que le fichier .tex
    que vous compilez mais le mieux est le mettre dans un dossier à part accessible par votre distribution.
    Le fichier slashbox.sty est aussi disponible si votre distribution ne le possède pas.
  - Une distribution Python avec minted est nécessaire pour la coloration syntaxique du cours de Python.
  - Les images qui ne sont pas fournies dans ce repo,. Il est nécessaire de les placer dans le dossier
    Commun/Images
  - Ensuite, les fichiers sont compilables uns à uns. Il est possible de générer des polys en allant
    dans le dossier correspondant (par exemple Info-Sup-Cours/09-Poly pour le poly d'informatique
    commune). Puis, si vous avec un système Unix:
    - make get
    - make

- Le cours compile correctement sous :
  - macOS avec MacTeX 2022 et Anaconda 2022-05

- Les auteurs de ces cours sont :
  - François Fayard: Tout le cours de maths et d'info.
  - Jean-Baptiste Bianquis: Son cours a servi de base pour les chapitres d'info sur la représentation des données, la complexité et la correction.