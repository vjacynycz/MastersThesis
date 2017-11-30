(TeX-add-style-hook
 "TeXiS"
 (lambda ()
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
    '("todoImpl" 1)
    '("todo" 1)
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

