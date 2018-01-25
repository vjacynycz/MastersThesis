(TeX-add-style-hook
 "Tesis"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("book" "11pt" "a4paper" "twoside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "lmargin=4cm" "rmargin=3cm")))
   (TeX-run-style-hooks
    "latex2e"
    "config"
    "constantes"
    "guionado"
    "Cascaras/cover"
    "Cascaras/dedicatoria"
    "Cascaras/agradecimientos"
    "Cascaras/resumen"
    "TeXiS/TeXiS_toc"
    "Capitulos/Introduction"
    "Capitulos/Soa"
    "Capitulos/Technology"
    "Capitulos/Platform"
    "Capitulos/Results"
    "Capitulos/Conclusions"
    "Cascaras/bibliografia"
    "TeXiS/TeXiS_acron"
    "Cascaras/fin"
    "book"
    "bk11"
    "TeXiS/TeXiS"
    "geometry")
   (TeX-add-symbols
    '("compilaApendice" 1)
    '("compilaCapitulo" 1)
    "ficherosBasicosTeXiS"
    "ficherosBasicosTexto"))
 :latex)

