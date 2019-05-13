/** @group globals
  Requires that the sum of \a cs[\p i1]..\a cs[\p iN] equals \a s,
  where \p i1..\p iN are the elements of the \a i th set in \a sets.
  
  Nb: not called 'sum' as in the constraints catalog because 'sum' is a
  MiniZinc built-in function.
*/

predicate sum_pred(var int: i, array[int] of set of int: sets,
                   array[int] of int: cs, var int: s) =
    sum_pred_optimathsat(i, sets, cs, s, index_set(cs), index_set(sets));

predicate sum_pred_optimathsat(var int: i,
                               array[int] of set of int: sets,
                               array[int] of int: cs,
                               var int: s,
                               set of int: csdom,
                               set of int: setsdom);
