(TeX-add-style-hook
 "TeXiS_pream"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("natbib" "round") ("babel" "spanish") ("hyperref" "pdfborder=0" "colorlinks" "hyperindex" "pdfpagelabels") ("fontenc" "T1") ("graphicx" "dvips") ("geometry" "verbose") ("todonotes" "colorinlistoftodos" "textwidth=4cm" "shadow")))
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
    "verbatim"
    "glosstex"
    "shortvrb"
    "inputenc"
    "natbib"
    "babel"
    "url"
    "ifpdf"
    "hyperref"
    "makeidx"
    "showidx"
    "multicol"
    "subfig"
    "listings"
    "tabularx"
    "fontenc"
    "epsfig"
    "graphicx"
    "psboxit"
    "calc"
    "longtable"
    "hhline"
    "geometry"
    "tabulary"
    "array"
    "slashbox"
    "colortbl"
    "color"
    "titlesec"
    "todonotes")
   (TeX-add-symbols
    '("acf" 1)
    '("acl" 1)
    '("acs" 1)
    '("ac" 1)
    '("acronym" 1)
    '("glosstex" 1)
    "bigrule"
    "pdfBorderAttrs"
    "tablename"
    "listtablename"
    "contentsname"
    "chaptername")
   (LaTeX-add-environments
    '("SubFloat" LaTeX-env-args ["argument"] 1)))
 :latex)

