# Notes on compatibility code

This tries to classify patches to packages and kernel codes in the latex-lab files. 
The classification uses these descriptions:

* **kernel**: patches to „kernel“ code that are done directly by the code and should be permanently active. A general TODO: move them into the proper places.

* **begindocument**: code that tries to overwrite changes done in the preamble by incompatible packages or classes (or author commands) in the begindocument hook and that
should  be disabled if a class uses `\NeedsDocumentMetadata` or `\SupportsDocumentMetadata`. 

* **class**: patches of specific classes in the class/XXX/after hook. Should be disabled if this specific class uses the `\NeedsDocumentMetadata` or `\SupportsDocumentMetadata`.  

* **package**: patches to packages in the package/XXX/after. Should be disabled if the specific package uses  `\NeedsDocumentMetadata` or `\SupportsDocumentMetadata`  

* **other**: stuff that (currently) doesn't fit.

## Advice for class authors

classes that claim to support the tagging code and use `\NeedsDocumentMetadata` or `\SupportsDocumentMetadata` should

* provide suitable replacements for the code currently done in the `begindocument` hooks.
  This includes
    * tagging aware definitions of heading commands if `\@startsection` is not used.
      This should also contain support for hyperref.
    * tagging aware definition of `\l@XXXX` command if `\@dottedtocline` is not used
      This should also contain support for hyperref.
    * tagging aware definitions of `quote`, `quotation`, `verse`
    * tagging aware definition of `\@makecaption` 
    * tagging aware definition of `\@makefntext` (this can be simply `\cs_set_eq:NN \@makefntext \fnote_makefntext:n`)  
* take into account code executed in the specific class/after hook if a standard class is loaded as base class.
* be careful not to break the tagging support when redefining existing LaTeX commands or environments (for example `\title`, `\author`, `bibliography`). The kernel redefinitions listed below gives an overview but is not meant to be the complete story. More changes are in `lttagging.dtx` in LaTeX base, in packages like `array`, `colortbl`, `tabularx` and external packages that try to support tagging.
* consider tagging support when defining new commands or environments.      
* consider how to handle incompatible packages that break the tagging support again. 
* keep track of changes in the tagging code and test regularly ...

## Patches in latex-lab files

### documentmetadata-support.dtx

* other: changes hyperref driver name (not done in package/hyperref/after)
         TODO: move to hyperref


### latex-lab-amsmath.dtx

loaded in the package hook by `latex-lab-testphase`, see below.

* package `amsmath`: redefines lots of commands from `amsmath.sty`
* package `amstext`: redefines `\@text` from `amstext.sty`
* package `amsbsy`: redefines `\pmb@` and `\pmb@@`


### latex-lab-bib.dtx

* kernel: various changes to kernel commands, mostly using cmd-hooks. 
* package `natbib`: undo a change made to kernel command
* package `biblatex`: avoid an error if `hyperref` is not used
* package `hyperref`: undo a `natbib` patch 
* TODO: 
    * rewrite code in `cmd/blx@bibinit/after` hook so that `biblatex` can take it over.
    * move content of `cmd/blx@bibinit/after` into `package/biblatex/after` hook.
    * check if `biblatex` now works without `hyperref` and if the patch is still needed.
    * replace the `hyperref` code by a `\hyper@nopatch`...
* other: suppress `hyperref` patches `\def\hyper@nopatch@bib{}`


### latex-lab-block.dtx

* kernel: redefines `\@doendpe`
* kernel: redefines `\begin`
* kernel: redefine `\newtheorem`, `\@thm`, `\@begintheorem`, `\@opargbegintheorem`, `\@endtheorem` 
* kernel: redefines `\centering`, `\raggedright`, `\raggedleft`, defines `\justifying`

TODO: Currently the block code uses the `begindocument/before` hook to redefine commands.
But these are „kernel“ redefinitions. They should be done once before loading the class, and then again in the `begindocument` hook so that they can be disabled together with the other code. 

* kernel/begindocument: redefines `\item`. 
* kernel/begindocument: redefines `center`, `flushright`, `flushleft`. 
* kernel/begindocument: redefines `verbatim`, `verbatim*`. 
* kernel/begindocument: redefines `itemize`, `enumerate`, `description`. 
* kernel/begindocument: redefines `list`, `trivlist`  
* begindocument: redefines `quote`, `quotation`, `verse` (these are only defined by classes)

* other: suppress `hyperref` patches `\def\hyper@nopatch@thm{}`

### latex-lab-firstaid.dtx

* class `amsart|amsbook|amsproc`: code that corrects `\@author`
* class `amsart|amsbook|amsproc`: code that corrects theorem
* class `amsart|amsbook|amsproc`: code that corrects the abstract
* package `amsthm`: code that corrects theorem

* package `verse`: code that reinstates the definition of the verse environment. This code is only needed if the block code redefines verse at begin document. So not quite clear how the logic should be here.  What should verse do to be always compatible? Move its definition to begin environment? 

* package `cleveref`: code that corrects `\@makefntext`
* package `booktabs`: make rules tagging aware
* package `fancyvrb`: make it tagging aware.

### latex-lab-float.dtx

* kernel: redefinition of `\@xfloat`, `\end@float`, `\end@dblfloat`, `\caption`
* begindocument: `\@makecaption` 
* other: suppresses `hyperref` patches `\def\hyper@nopatch@caption{}`

### latex-lab-footnotes.dtx

* begindocument: sets `\footnotemargin`  (??)
* begindocument: patches `\@makefntext`
* class `memoir`: changes footnote commands 
* package `setspace`: changes footnote command
* other: suppress `hyperref` patches `\def\hyper@nopatch@footnote{}` 


### latex-lab-graphics.dtx

* kernel: patches `picture` and `\@picture` for tagging
* package `graphicx`, `graphics`: adds keys and patches commands for tagging

### latex-lab-l3doc-tagging.dtx

lots of specific redefinitions for l3doc. Currently loaded as a style after the class.
Contains a redefinition at begindocument that probably is not needed if the block code doesn't redefine verbatim at begindocument. 

### latex-lab-marginpar.dtx

* kernel: redefines internals for marginpar.

### latex-lab-math.dtx

* kernel: changes the math handling to math grabbing. Redefines all math environments and more. amsmath environments are change by loading the latex-lab-amsmath.ltx above after amsmath has been loaded. 
* kernel: redefines `\mathpalette` if lualatex is used
* relies on changes in `array.sty` for handling of math in tabular preambles.
* other: forces the loading of `amsmath` at the end of the preamble (to allow user to pass options). 

### latex-lab-mathintent.dtx

nothing

### latex-lab-mathpkg.dtx

* package `breqn`: register environments
* package `cases`: force loading of `amsmath` directly
* package bm: redefine `\bm@pmb@@@@`. TODO: check code and use sockets

### latex-lab-mathtools.dtx

* package `mathtools`: The whole generated file latex-lab-mathtools.ltx is loaded in the package hook by latex-lab-testphase.dtx, see below.

### latex-lab-minipage.dtx

* kernel: redefines internals of parbox/minipage

### latex-lab-namespace.dtx

no patches, contains role definitions.

### latex-lab-new-or-1.dtx

now empty. TODO: Should be removed at some time

### latex-lab-new-or-2.dtx

* kernel: assigns a `build/column/outputbox` hook.
* TODO: check if `\@makecol@handlesplitfootnotes` can be removed.

### latex-lab-sec.dtx

* kernel: redefines `\@startsection`, `\@kernel@tag@hangfrom`, `\@sect` etc
* other: redefines `\chapter` and `\part` in class/after hook. 
  ??? This should be disabled too in compatible classes. Or restrict that to the standard classes???
* other: suppress `hyperref` patches `\def\hyper@nopatch@sectioning{}`
* TODO: remove now unneeded `\MakeLinkTarget` redefinition
* TODO: check also new sec code

### latex-lab-table.dtx

Most table related changes are in `array.sty`.

* kernel: adds a command via `cmd/array/before`.
* package `longtable`: patches `\LT@makecaption`
* other: Defines some roles in begin document. TODO: check if we can move that to 
   latex-lab-namespace.

### latex-lab-testphase.dtx

If testphase=math is used:

* package `amsmath`: loads latex-lab-amsmath.ltx, see above latex-lab-amsmath
* package `mathtools`: loads latex-lab-mathtools.ltx, see above latex-lab-mathtools
* package `unicode-math`: loads latex-lab-unicode-math.ltx, see below. 

### latex-lab-text.dtx

* kernel: add tagging support to `\TeX`, `\LaTeX`, `\emph` (through command hooks).
* kernel: redefines `\mbox` for `luamml` support.
* kernel: redefines `\phantom` internals (`luamml` support and suspending of tagging)

### latex-lab-tikz.dtx

* package `tikz`: patches for tagging support

### latex-lab-title.dtx

* class `article, report, book`: redefines `\maketitle`, `\@maketitle`
* kernel: redefines `\title`, `\author` for metadata support
* kernel: `shipout/lastpage`: add title+author metadata.


### latex-lab-toc-kernel-changes.dtx

* kernel: redefines `\contentsline`, `\addcontentsline`, `\@starttoc`, `\@dottedtocline`, `\numberline`
* class `article`: `\l@part`, `\l@section`
* class `report, book`: `\l@part`, `\l@chapter`
* other: suppress `hyperref` patches, `\def\hyper@nopatch@counter{}`
* TODO: check what can now be removed


### latex-lab-toc.dtx

no patches, relies on the changes in latex-lab-toc-kernel-changes. 
TODO: check if code can be cleaned up.

### latex-lab-unicode-math.dtx

The whole file latex-lab-unicode-math.ltx is loaded in the package/unicode-math/after hook.

* package `unicode-math`: redefines `\frac`, `\sqrtsign`, `\plainroot@`, `\bBigg@`, `\varinjlim`, ...

