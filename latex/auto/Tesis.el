(TeX-add-style-hook
 "Tesis"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("book" "11pt" "a4paper" "twoside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "lmargin=3.5cm" "rmargin=2.5cm")))
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
    "Capitulos/01Capitulo1"
    "Capitulos/Technology"
    "Apendices/ParteApendices"
    "Apendices/01ApendiceA"
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
    "ficherosBasicosTexto")
   (LaTeX-add-environments
    '("SubFloat" LaTeX-env-args ["argument"] 1)))
 :latex)

