(TeX-add-style-hook
 "Tesis"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("book" "11pt" "a4paper" "twoside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "lmargin=4cm" "rmargin=3cm") ("todonotes" "colorinlistoftodos" "textwidth=4cm" "shadow")))
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
    "geometry"
    "todonotes")
   (TeX-add-symbols
    '("code" 1)
    '("itbf" 1)
    '("compilaApendice" 1)
    '("compilaCapitulo" 1)
    "ficherosBasicosTeXiS"
    "ficherosBasicosTexto"))
 :latex)

