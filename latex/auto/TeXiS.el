(TeX-add-style-hook
 "TeXiS"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "TeXiS/TeXiS_pream"
    "TeXiS/TeXiS_cab"
    "TeXiS/TeXiS_cover"
    "TeXiS/TeXiS_part"
    "TeXiS/TeXiS_dedic"
    "TeXiS/TeXiS_bib"
    "verbatim")
   (TeX-add-symbols
    '("compImpl" 1)
    '("comp" 1)
    '("comImpl" 1)
    '("com" 1)
    '("figuraEx" 5)
    '("figura" 4)
    '("imagen" 2)
    "texisVer"
    "texis"
    "debug"
    "printtodos"
    "printcoments"
    "comsdestacados"
    "generaindice"
    "generatoc"
    "generaacronimos")
   (LaTeX-add-labels
    "#3")
   (LaTeX-add-environments
    '("SubFloat" LaTeX-env-args ["argument"] 1)
    '("cambiamargen" 2)
    "resumen"
    "FraseCelebre"
    "Frase"
    "Fuente"
    "example"))
 :latex)

