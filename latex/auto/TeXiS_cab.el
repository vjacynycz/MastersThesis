(TeX-add-style-hook
 "TeXiS_cab"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "fancyhdr")
   (TeX-add-symbols
    '("cabeceraEspecial" 1)
    "restauraCabecera"
    "Resumen"
    "TocResumen"
    "NotasBibliograficas"
    "TocNotasBibliograficas"
    "ProximoCapitulo"
    "TocProximoCapitulo"
    "Conclusiones"
    "TocConclusiones"
    "cleardoublepage"))
 :latex)

