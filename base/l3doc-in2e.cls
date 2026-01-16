%
% We are still waiting to find the time to consolidate ltxdoc, l3doc, etc, so for now this
% is another class that loads l3doc + the extra bits from ltxdoc we want for newer dtx files.
%
% None of this is meant to stay, but ...


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{l3doc}}
\ProcessOptions \relax
\LoadClass{l3doc}

% load some extra definitions for new documentation
%
\InputIfFileExists{ltxdoc-extra.ltx}
           {\typeout{*************************************^^J%
                     * Extra defs ltxdoc-extra.ltx used^^J%
                     *************************************}}
           {}

\endinput
           
