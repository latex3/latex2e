%
% We are still waiting to find the time to consolidate ltxdoc, l3doc, etc, so for now this
% is yet another internal class that loads l3doc + the extra bits from ltxdoc we want for newer dtx files.
%
% None of this is meant to stay, so this class is not supposed to be used outside of the kernel documentation!
% It may get incompatible updates and it will vanish again, eventually.

\LoadClassWithOptions{l3doc}

% load support for tagging, if \DocumentMetadata is used

\IfDocumentMetadataT{\RequirePackage{latex-lab-testphase-l3doc}}

% load some extra definitions for new documentation
%
\input{ltxdoc-extra.ltx}

\endinput
           
