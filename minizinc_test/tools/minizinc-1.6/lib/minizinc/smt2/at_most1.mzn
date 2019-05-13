/**  @group globals.counting
  Requires that each pair of sets in \a s overlap in at most one element.
*/
predicate at_most1(array[int] of var set of int: s);

% Synonym for the above.

predicate atmost1(array[int] of var set of int: s) = at_most1(s);

%
% OptiMathSAT: parsing ok
%

