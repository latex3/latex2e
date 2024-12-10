
# A number of todos (unsorted and incomplete)


## Code extensions / cleanup

### theorem-like envs

 - this can currently only handle the simple version from LaTeX2e
 - it is missing a proper set of templates
 - it is missing extensions to support different styles (a la amsmath and the like)


## Missing basic support

 - `\textbf` should probably mapt to `<Strong>`
 - `\emph` should probably map to `<Em>`

 - Logos such as `\TeX` and `\LaTeX` should produce proper ActualText




## Package Support

### csquotes

 - we can't really grab TeX's basic quotes, e.g.
 ```
   some quotes around ``text'' here
```
  at least not easily, but we can support `\enquote` and the like

