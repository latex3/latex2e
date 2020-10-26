# LaTeX2e temporary first aid for external packages and classes during transition periods

LaTeX2e kernel code that temporarily adjusts packages that are not yet
updated and therefore fail if a new LaTeX release updates internal
commands (which have been used in the external packages)

This is stored in a separate file external to the base bundle, so that
it can be easily updated when fixes become available without the need
to upload a full new LaTeX2e release to CTAN.
