%
% We are still waiting to find the time to consolidate ltxdoc, l3doc, etc, so for now this
% is another class that loads l3doc + the extra bits from ltxdoc we want for newer dtx files.
%
% None of this is meant to stay, but ...


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{l3doc}}
\ProcessOptions \relax
\LoadClass{l3doc}


% load support for tagging, if \DocumentMetadata is used

\IfDocumentMetadataT{\RequirePackage{latex-lab-testphase-l3doc}}

% load some extra definitions for new documentation
%
\input{ltxdoc-extra.ltx}

\endinput
           
