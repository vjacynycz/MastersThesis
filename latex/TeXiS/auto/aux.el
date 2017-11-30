(TeX-add-style-hook
 "aux"
 (lambda ()
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

