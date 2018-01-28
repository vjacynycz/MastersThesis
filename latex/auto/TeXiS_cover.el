(TeX-add-style-hook
 "TeXiS_cover"
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
   (TeX-add-symbols
    '("copyrightInfo" 1)
    '("isbn" 1)
    '("textoSegundoSubtituloPortada" 1)
    '("textoPrimerSubtituloPortada" 1)
    '("institucion" 1)
    '("tipoDocumento" 1)
    '("escalaImagenPortada" 1)
    '("imagenPortada" 1)
    '("fechaPublicacion" 1)
    '("directorPortada" 1)
    '("autorPortada" 1)
    '("tituloPortada" 1)
    "noTeXiSCredits"
    "explicacionDobleCara"
    "makeCover"
    "tituloPortadaVal"
    "autorPortadaVal"
    "directorPortadaVal"
    "fechaPublicacionVal"
    "imagenPortadaVal"
    "escalaImagenPortadaVal"
    "tipoDocumentoVal"
    "institucionVal"
    "textoPrimerSubtituloPortadaVal"
    "textoSegundoSubtituloPortadaVal"
    "isbnVal"
    "copyrightInfoVal"
    "noTeXiSCreditsVal"
    "explicacionDobleCaraVal")
   (LaTeX-add-lengths
    "cambioIzquierdo"
    "cambioDerecho"
    "margenPortada"
    "evensidemarginOriginal"
    "oddsidemarginOriginal"
    "longTitulo"))
 :latex)

