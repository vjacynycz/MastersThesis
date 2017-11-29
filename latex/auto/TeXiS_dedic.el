(TeX-add-style-hook
 "TeXiS_dedic"
 (lambda ()
   (TeX-add-symbols
    '("putDedicatoria" 1)
    '("dedicatoriaDos" 1)
    '("dedicatoriaUno" 1)
    "makeDedicatorias"
    "dedicatoriaUnoVal"
    "dedicatoriaDosVal"
    "marcadorDedicatorias"))
 :latex)

