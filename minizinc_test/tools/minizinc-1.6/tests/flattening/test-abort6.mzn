% RUNS ON mzn2fzn

% Test abort/1.
%
var int: x = abort("This assignment aborts!");
solve satisfy;
