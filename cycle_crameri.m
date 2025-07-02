function cycle_crameri(ax)
% CYCLE_CRAMERI(ax)
%
% Cycle through all available Crameri "scientific" colormaps.
% Some dependcies in https://github.com/joelsimon/omnia.
%
% Input:
% ax       Axis handle (def: gca)
%
% Output:
%          .pdfs of ax with all colormaps applied
%
% Ex:
%    imagesc
%    CYCLE_CRAMERI
%
% Author: Joel D. Simon
% Contact: jdsimon@alumni.princeton.edu | joeldsimon@gmail.com
% Last modified: 02-Jul-2025, 24.1.0.2568132 (R2024a) Update 1 on MACA64 (geo_mac)

defval('ax', gca)

S = load('CrameriColourMaps8.0.mat');
cnames = fieldnames(S);
idx = 0;
for i = 1:length(cnames)
    idx = idx + 1;
    cmap = cnames{i};
    colormap(ax, crameri(cmap))
    cstr = sprintf('%02i\\_%s', idx, cmap);
    title(cstr)
    latimes2
    savepdf(strrep(cstr, '\', ''))

    idx = idx + 1;
    cmap = ['-' cnames{i}];
    colormap(ax, crameri(cmap))
    cstr = sprintf('%02i\\_%s', idx, cmap);
    title(cstr)
    latimes2
    savepdf(strrep(cstr, '\', ''))

end
