%-----------------------------------------------------------------------------%
% Requires that the array 'x' is lexicographically less than or equal to
% array 'y'.  Compares them from first to last element, regardless of indices
%-----------------------------------------------------------------------------%

predicate lex_lesseq_bool(array[int] of var bool: x,
                         array[int] of var bool: y);

predicate lex_leq_bool(array[int] of var bool: x,
                       array[int] of var bool: y) =
          lex_lesseq(x, y);

%-----------------------------------------------------------------------------%
