# Suggested approach for providing context (initial version no longer up-to-date)

This is mainly meant for instances of templates (where things can be
easily automated to react to context, but is probably also applicate
to other situations (but there might need more thoughts).


## Definition of a  "_context_"

The "_context_" is an attribute of every point of the formatted
document, i.e., at each point during the formatting one can determine in
which "_context_" the formatting happens and based on this adjust the
formatting method.

The "_context_" is not an entirely flat structure: we distinguish
between the "_primary context_" and the "_secondary context_" both of
which can be changed individually based on a number of rules as discussed below.

Any context is denoted by a name (`[a-z]*` letters only). The empty
name is allowed to ease specification of the common case (i.e.,
primary context is the main galley and secondary context is no
specified).

### The "_primary context_"

The "_primary context_" is described a fixed (but extensible?) set of names:

- `<empty name>` denotes that we are in "galley" context producing text for the page
- `footnote`     denotes that we are typesetting the footnote text
- `float`        denotes that we are typesetting a floats
- `marginal`     denotes that we are typesetting a marginal
- `header`       denotes that we are typesetting the running header
- `footer`       denotes that we are typesetting the running footer

When the "_primary context_" is set it replaces the current "_primary
context_" and resets the "_secondary context_" to `<empty name>`.  The
setting is local, i.e., it obeys grouping.

It would be possible to be more granular, i.e., differentiate between
types of floats etc. But for now I suggest to start out with this
small set.

Note: With specific classes, e.g., `ltx-talk` additional primaries
could be added (and secondaries could be using the modes rather than
or in addition to the fontsizes). Or the modes could be part of the
primary names ... could do with some experimentation.


### The "_secondary context_"

The "_secondary context_" concerns itself (for now) only with font
size changes, because that is most commonly a cause for layout
changes.  It is described through a fixed (but extensible?) set of names:

- `<empty name>` denotes that there is no special secondary context, i.e.,
   that we are producing material in `\normalsize`
- `tiny`         denotes that we are typesetting in `\tiny` font size
- `scriptsize`  
- `footnotesize`  
- `small`  
- `large`  
- `Large`  
- `LARGE`  
- `huge`  
- `Huge`  


### Setting context

```
\SetPrimaryContext { <name> }
```

Sets the "_primary context_" to the new name (subject to any primary
context rules as discussed below).

Internally also does `\SetSecondaryContext{}`


```
\SetSecondaryContext { <name> }
```

Sets the "_secondary context_" to the new name (subject to any secondary
context rules as discussed below).

The primary context remains unchanged.

Note: at the moment the secondary context would be automatically set
by the high-level font size commands (where they set `\@currsize`, which is
really that context concept in 2e).


### Rules for setting context

```
\DeclarePrimaryContextRule { <current> } { <new> } { <result> }
```

If given a request to go to `new` results in going to `result` if we
are in `current`.

Can, for example, be used to map several contexts into a single one,
e.g., not to distinguish between `header` and `footer` layouts.

```
\DeclareSecondaryContextRule [ <current primary> ]
   { <current secondary> } { <new secondary> } { <result secondary> }
```

If given a request to go to `new secondary` results in going to
`result secondary` if we are in `current secondary`. If an optional
`current primary` is specified the rule only applies if we are in that
primary context.

Can, for example be used to have only a few size specific layouts
(secondary and map Huge, huge, and LARGE to Large, etc. Or it could be
used to ignore all secondary contexts if we are in a "marginal" or \...

Both declarations would be something for class files (mainly) and would
need to match the instance setups there.


### Making use of the context (this is the meat, or perhaps the veggies)

The main use of context (both primary and secondary) is at the
point where template instances are called. Given

```
\UseInstance{<type>}{<name>}
```

we no longer just call the instance with this `<name>` and `<type>` but
instead run the following short algorithm:

- If `<secondary>` is not empty and an instance (of `<type>`) with the
  name `<name> : <primary> : <secondary>` exists use that instance.

- Otherwise, if `<primary>` is not empty and `<name> : <primary>`
  exists use that instance.

- Otherwise, use `<name>` for the instance (and shout out loud if that
  instance doesn't exist as it is currently the case).


Note that if `<primary>` is empty but `<secondary>` is not we are
looking for instances of the form `<name> :: <secondary>`.


Maybe one should also offer a method outside of template instances to
query and make use of the context but I'm not that sure how to do this
best or if it is needed at all. Right now all the case that I have
seen are really nicely handled with the template/instance method once
things like "caption" are handled with templates.

But something along the following lines might be a suitable basic feature:

```
\CasePrimaryContext   { <primary-case-list> }   { <otherwise> }
\CaseSecondaryContext { <secondary-case-list> } { <otherwise> }
\CaseContext          { <primary+secondary-case-list> } { <otherwise> }
```

E.g. something like
```
\CaseSecondaryContext
  {
   {}      { \small }
   {small} { \footnotesize }
   ...
   {large} { \normalsize }
   ...
  }
   { }  % empty else case

```

Or perhaps, with the main case singled out as a first argument :
```
\CasePrimaryContext   { `<empty action>` } { <primary-case-list> }   { <otherwise> }
\CaseSecondaryContext { `<empty action>` } { <secondary-case-list> } { <otherwise> }
```


#### Examples

Display blocks, for example, might want smaller vertical settings when
typesetting in `\small` or `\footnotesize`. (This is what LaTeX2e
currently does for a few sizes, so we should be able to mimic that but
of course the general applicability goes beyond that).

One might want a use inline lists if in a marginal (and so change the
instance there) --- right now not yet possible because we haven't
implemented a template for inline lists, but ... details ...


## Possible alternative for secondary context

One possible alternative would be to define the secondary context as a
`prop` where each property key represents a context dimension and then
try a defined (subset) of these dimensions and their value in a
defined order to find a suitable instance.

The secondary context would then be set giving the dimension (prop
key) and its value (one key would then be fontsize). And one would need
a way to specify in which order the keys should be tried and it would
be necessary to explicitly declare new dimensions for use in the
secondary context.

But that would perhaps be a nice way to generalize things and then one
could also directly ask for the "processing context" (ie with a value
of "measuring" or something else) etc.
