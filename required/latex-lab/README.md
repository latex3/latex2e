# LaTeX laboratory

This bundle holds optional files that are loaded in certain situations
by kernel code (if available). For example, the new (as of 2021/12)
`\DocumentMeta` command in the kernel loads a file from here holding
the real payload. While this code is still in development and the use
is experimental and mainly for the tagging project) the code is stored
outside the format so that there can be intermediate release not
affecting the production use of LaTeX.


Once the code is finalized and properly tested it will eventually move
to the kernel and the corresponding file in this bundle will
vanish. Note that none of these files are directly user accessible in
documents (i.e., they aren't packages) so the process is transparent
to documents already using the new functionality.


## Current support code in the bundle

### Support for `\DocumentMetadata`


## License

The license is LPPL 1.3c.


## Copyright

This README file is

Copyright (C) 2021
The LaTeX Project
