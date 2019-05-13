%-----------------------------------------------------------------------------%
% vim: ft=mercury ts=4 sw=4 et wm=0 tw=0
%-----------------------------------------------------------------------------%
% Copyright (C) 2006-2007 The University of Melbourne and NICTA.
% See the file COPYING for license information.
%-----------------------------------------------------------------------------%
% types_and_insts.m
% Nicholas Nethercote <njn@csse.unimelb.edu.au>
% Fri Sep 22 14:16:50 CDT 2006
%
% Types and type-insts.
%-----------------------------------------------------------------------------%

:- module types_and_insts.
:- interface.

:- import_module zinc_common.

:- import_module bool.
:- import_module list.
:- import_module maybe.
:- import_module pair.

%-----------------------------------------------------------------------------%
% Type-insts
%-----------------------------------------------------------------------------%

    % The lattice and some more operations are given below.
    % Note that some combinations represent invalid type-insts, eg.
    % ti_par_set(ti_var_int).  We try to avoid them whenever possible.
    %
:- type type_insts == list(type_inst).
:- type type_inst
    --->    ti_par_bottom           % True lattice bottom
    ;       ti_var_bottom
    ;       ti_par_bool
    ;       ti_var_bool
    ;       ti_par_int
    ;       ti_var_int
    ;       ti_par_float
    ;       ti_var_float
    ;       ti_par_string
    ;       ti_ann
    ;       ti_par_set(type_inst)
    ;       ti_var_set(type_inst)           % Nb: Elem type-inst must be fixed
    ;       ti_array(type_inst, type_inst)  % Nb: Index type-inst must be fixed
    ;       ti_tuple(type_insts)
    ;       ti_record(type_insts_and_names)
    ;       ti_par_enum(zinc_name)           % 'name' is the enum name
    ;       ti_var_enum(zinc_name)           % 'name' is the enum name
            % In these two:
            % - The name excludes the leading '$'.
            % - The 'bool' indicates if it's skolemized, ie. if
            %   it should be treated bound to a single type rather than a
            %   type-inst variable which can match anything.  Eg. if we have
            %   this:
            %
            %     pred eq($X:x, $Y:y) = (x == y)
            %
            %   then x and y are considered skolemized, because their types
            %   $X and $Y are bound within 'eq'.  However, the $X and $Y in
            %   the type-inst signature for 'eq' are not skolemized.
    ;       ti_par_variable(zinc_name, bool) % 'bool' -- is it fixed?
    ;       ti_any_variable(zinc_name, bool) % 
    ;       ti_top
            % A higher-order argument, and one in which we haven't worked out
            % the overloading -- that's why it is a list of possible
            % signatures.  Once we've finished type-inst checking we will have
            % narrowed the alternatives down to a single one, and replaced
            % this with a 'ti_op'.
    ;       ti_overloaded_op(list(pair(/*ProcN*/int, type_inst_sig)))
            % A higher-order argument which doesn't involve overloading (or
            % the overloading has been resolved).  The int is the procedure
            % number, if known (eg. it will be set for the TI attached to
            % the name of a func passed to 'foldl', but it won't be set for
            % the TI attached to a TIE such as "op(int:(int, int))", because
            % it doesn't make sense there)).
    ;       ti_op(type_inst_sig, maybe(int))
            % ti_error is the type-inst of an expression that was
            % type-inst-incorrect.  We treat it specially:  it is considered
            % equal to any type-inst.  This gives optimal error-reporting
            % behaviour in that it finds as many type-inst errors as possible
            % without causing any redundant cascading error messages.
    ;       ti_error
    ;       ti_unknown              % (only used pre-type-inst-analysis)
    .

:- type type_insts_and_names == list(type_inst_and_name).
:- type type_inst_and_name   == pair(type_inst, zinc_name).

    % The name is the case name, the type_insts_and_names are for the fields.
:- type enum_type_inst_sig == list(pair(zinc_name, type_insts_and_names)).

%-----------------------------------------------------------------------------%

    % Nb: symbol_table.m has some more type-inst-related operations, ones that
    % require the symbol table.

    % Does the type-inst have an error somewhere inside?
:- pred ti_has_error(type_inst::in) is semidet.

    % Does the type-inst/type have 'top' somewhere inside?
:- pred ti_has_top(type_inst::in) is semidet.

    % Returns `yes' if the type-inst is par, i.e. it does not contain any
    % var components.
    %
:- func ti_is_par(type_inst) = bool.

%-----------------------------------------------------------------------------%

    % The Zinc lattice ('+' is a connection-point, 'o' is a cross-point):
    %
    %                             top
    %                              |
    %    +-------+---------+-------+--------+----+---+------+    
    %    |       |         |       |        |    |   |      |     
    %    |     vfloat      |       |        |  array |      |     
    %    |      / \        |       |        |    |   |      |       
    %    |     /   \       |       |        |    |   |      |       
    %    |    /     \      |       |        |    |   |      |       
    %    | pfloat  vint  vbool   venumE   vset   |   |      |    
    %    |    \     /|    /|      /|       /|   /    |    any $T     
    %    |     \   / |   / |     / |      / |  /  record    |      
    %    |      \ /  |  /  |    /  |     /  | /      |      |
    % pstring  pint  | / pbool / penumE /   |/       |      |
    %    |       |   |/    |  /    |   /  pset     tuple  par $T           
    %    |       |   +-----o-+-----o--+     |        |      |        
    %    |       |   |     |       |        |        |      |
    %    |       | vbottom |       |        |        |      |        
    %    |       |   |     |       |        |        |      |
    %    +-------+---+-----+-------+--------+--------+------+
    %                              |
    %                           pbottom
    %
    % Further details:
    %
    %   par_set(TI) <= par_set(UI)    iff TI <= UI
    %   par_set(TI) <= var_set(UI)    iff TI <= UI
    %   par_set(TI) <= array(par_int,UI) iff TI <= UI
    %
    %   var_set(TI) <= var_set(UI) iff TI <= UI
    %
    %   array[TI1..TIn] of TI <= array[U1..Un] of UI
    %       iff (TI1==U1 \/ TI1==bottom \/ U1==bottom) \/ ... \/ TI <= UI
    %     (ie. index types must be the same or one must be bottom to match)
    %
    %   tuple(TI1..TIn) <= tuple(UI1..UIn)
    %       iff TI1 <= UI1 /\ ... /\ TIn <= UIn
    %   tuple(TI1..TIn) <= record(UI1:x1..UIn:x2)
    %       iff TI1 <= UI1 /\ ... /\ TIn <= UIn
    %
    %   record(TI1:x1..TIn:xn) < record(UI1:x1..UIn:xn)
    %       iff TI1 <= UI1 /\ ... /\ TIn <= UIn
    %
    %   error <= everything else
    %
    % MiniZinc has no implicit type coercions (eg. no par_int -> par_float),
    % only implicit inst coercions  (eg. par_int -> var_int).
    %
    % FlatZinc has no implicit coercions at all.

    % Is TI1 lower than or equal to TI2 on the lattice?
:- pred ti_leq(lang::in, type_inst::in, type_inst::in) is semidet.

    % ti_eq(TI1, TI2) implies ti_leq(TI1, TI2) and ti_leq(TI2, TI1).
    % Ie. the two are identical, or one is a ti_error.
    % Nb: the language doesn't matter.
:- pred ti_eq(type_inst::in, type_inst::in) is semidet.

    % Least upper bound.
:- func ti_lub(lang, type_inst, type_inst) = type_inst.

    % Restricted leq for array indices: either ti_eq(TI1, TI2), or
    % TI1=ti_{par,var}_bottom.
:- pred array_index_ti_leq(type_inst::in, type_inst::in) is semidet.

    % Restricted lub for array indices: normal lub if array_index_ti_leq(TI1,
    % TI2) or array_index_ti_leq(TI2, TI1), else ti_top.
:- func array_index_ti_lub(lang, type_inst, type_inst) = type_inst.

    % Returns:
    % - (<) if ti_leq(TI1, TI2)
    % - (>) if ti_leq(TI2, TI1)
    % - (=) if ti_eq(TI1, TI2)
    % - (=) if not ti_leq(TI1, TI2) and not ti_leq(TI2, TI1)
    %       (ie. they're incomparable, eg. ti_par_bool and ti_par_int)
:- pred ti_compare(lang::in)
        : comparison_pred(type_inst) `with_inst` comparison_pred.


%-----------------------------------------------------------------------------%
% Type-inst signatures
%-----------------------------------------------------------------------------%

    % Nb: Type-inst-expression signatures are used more pervasively, but
    % type-inst signatures are used in a few places.

    % The type-inst signature of a single procedure, eg. (par,par)->par.
:- type type_inst_sigs == list(type_inst_sig).
:- type type_inst_sig  == pair(type_insts, type_inst).  % args and retval

    % Checks if two TIE signatures are identical, modulo different source
    % locations.
:- pred type_inst_sig_eq(type_inst_sig::in, type_inst_sig::in) is semidet.

    % Compare two ti_sigs (for sorting).  It uses same procedure as
    % ti_compare, but for a (<)/(>) results, every pairwise comparison must
    % be (<)/(>).
    %
    % XXX: this is wrong -- it doesn't handle type-inst variables properly.
    % Eg. if you have "par set of $T" and "var set of $U", the result should
    % be (<), but it currently thinks they're incomparable due to the
    % different names of the type-inst variables.  If the second one is
    % changed to "var set of $T", it works.  Need to fix ti_leq by passing
    % in an extra arg that tells it to ignore renamings of type-inst
    % variables.
:- pred ti_sig_compare(lang::in)
        : comparison_pred(type_inst_sig) `with_inst` comparison_pred.


%-----------------------------------------------------------------------------%
% Miscellaneous
%-----------------------------------------------------------------------------%

    % Succeeds if all pairs of elements in the two lists satisfy P.  Fails if
    % the lists have different lengths.
:- pred all_true_two_lists(pred(X, Y)::in(pred(in, in) is semidet),
        list(X)::in, list(Y)::in) is semidet.


    % Returns the first repeated element in a list.  Fails if there are no
    % dups.
:- func first_repeated_elem(list(T)) = T is semidet.


%-----------------------------------------------------------------------------%
%-----------------------------------------------------------------------------%

:- implementation.

%-----------------------------------------------------------------------------%

:- import_module assoc_list.
:- import_module string.

%-----------------------------------------------------------------------------%
% Type-inst operations
%-----------------------------------------------------------------------------%

ti_leq(Lang, TI1, TI2) :-
    ( TI1 = TI2
    ; ti_leq_2(Lang, TI1, TI2)
    ; TI2 = ti_top
    ; TI1 = ti_error
    ; TI2 = ti_error
    ).


    % This does most of the work for ti_leq, but some common cases have
    % already been excluded.
:- pred ti_leq_2(lang::in, type_inst::in, type_inst::in) is semidet.

ti_leq_2(_Lang, ti_par_bottom, _).

ti_leq_2(_Lang, ti_var_bottom, ti_var_bool).
ti_leq_2(_Lang, ti_var_bottom, ti_var_int).
ti_leq_2(_Lang, ti_var_bottom, ti_var_float).
ti_leq_2(_Lang, ti_var_bottom, ti_var_set(_)).
ti_leq_2(_Lang, ti_var_bottom, ti_var_enum(_)).

ti_leq_2(_Lang, ti_par_bool, ti_var_bool).

ti_leq_2(_Lang, ti_par_int, ti_var_int).
    % Zinc-only
ti_leq_2(lang_zinc,  ti_par_int, ti_par_float).
ti_leq_2(lang_zinc,  ti_par_int, ti_var_float).

    % Zinc-only
ti_leq_2(lang_zinc,  ti_var_int, ti_var_float).

ti_leq_2(_Lang, ti_par_float, ti_var_float).

ti_leq_2(Lang, ti_par_set(TI1), ti_par_set(TI2)) :- ti_leq(Lang, TI1, TI2).
ti_leq_2(Lang, ti_par_set(TI1), ti_var_set(TI2)) :- ti_leq(Lang, TI1, TI2).
    % Zinc-only
ti_leq_2(lang_zinc, ti_par_set(TI1), ti_array(I, TI2)) :-
    array_index_ti_leq(ti_par_int, I),
    ti_leq(lang_zinc, TI1, TI2).

    % Zinc-only
ti_leq_2(lang_zinc, ti_var_set(TI1), ti_var_set(TI2)) :- ti_leq(lang_zinc, TI1, TI2).

ti_leq_2(Lang, ti_array(I1, TI1), ti_array(I2, TI2)) :-
    array_index_ti_leq(I1, I2),
    ti_leq(Lang, TI1, TI2).

ti_leq_2(Lang, ti_tuple(TIs1), ti_tuple(TIs2)) :-
    all_true_two_lists(ti_leq(Lang), TIs1, TIs2).
    % Zinc-only
ti_leq_2(Lang, ti_tuple(TIs1), ti_record(TIsNames2)) :-
    P = ( pred(TI1::in, TI2-_Name::in) is semidet :- ti_leq(Lang, TI1, TI2) ),
    all_true_two_lists(P, TIs1, TIsNames2),
    z(Lang, "ti_leq_2: 1").

ti_leq_2(Lang, ti_record(TIsNames1), ti_record(TIsNames2)) :-
    P = ( pred(TI1-Name::in, TI2-Name::in) is semidet :-
            ti_leq(Lang, TI1, TI2)
        ),
    all_true_two_lists(P, TIsNames1, TIsNames2),
    z(Lang, "ti_leq_2: 2").

    % Zinc-only
ti_leq_2(Lang, ti_par_enum(Name), ti_var_enum(Name)) :-
    z(Lang, "ti_leq_2: 4").

    % Zinc-only
ti_leq_2(Lang, ti_par_variable(Tv, Sk1), ti_any_variable(Tv, Sk2)) :-
    z(Lang, "ti_leq_2: 5"),
    ( if Sk1 = yes, Sk2 = yes then true
      else unexpected($pred ++ ": unskolemized ti-vars")
    ).

ti_leq_2(Lang, ti_op(ArgTIs1 - RetTI1,_), ti_op(ArgTIs2 - RetTI2,_)) :- 
    z(Lang, "ti_leq_2: 6"),
    % All the TIs must be equal (according to ti_eq).
    all_true_two_lists(ti_eq, [RetTI1 | ArgTIs1], [RetTI2 | ArgTIs2]).

ti_leq_2(_Lang, TI, _) :- 
    % Succeed if one of types is unknown - this will be caught later.
    TI = ti_unknown.


:- pred z(lang::in, string::in) is det.

z(Lang, Str) :-
    else_unexpected(unify(Lang,lang_zinc), "z: zinc-only type-inst: " ++ Str).

%-----------------------------------------------------------------------------%

ti_eq(TI1, TI2) :-
    ( TI1 = TI2
    ; TI1 = ti_error
    ; TI2 = ti_error
    ).

%-----------------------------------------------------------------------------%

ti_lub(Lang, TI1, TI2) = LubTI :-
    % Repeating like this with args swapped lets us code only in one
    % direction.
    ( if      TI1 = TI2                         then LubTI = TI1
      else if ti_lub_2(Lang, TI1, TI2) = LubTI0 then LubTI = LubTI0
      else if ti_lub_2(Lang, TI2, TI1) = LubTI0 then LubTI = LubTI0
      else                                           LubTI = ti_top
    ).


    % Implements part of the operation in one direction;  reversing the args
    % gives the other half.  If it fails it means the result is ti_top.
:- func ti_lub_2(lang, type_inst, type_inst) = type_inst is semidet.

ti_lub_2(_Lang, ti_par_bottom, TI2) = TI2.

ti_lub_2(_Lang, ti_var_bottom, ti_par_bool)    = ti_var_bool.
ti_lub_2(_Lang, ti_var_bottom, ti_var_bool)    = ti_var_bool.
ti_lub_2(_Lang, ti_var_bottom, ti_par_int)     = ti_var_int.
ti_lub_2(_Lang, ti_var_bottom, ti_var_int)     = ti_var_int.
ti_lub_2(_Lang, ti_var_bottom, ti_par_float)   = ti_var_float.
ti_lub_2(_Lang, ti_var_bottom, ti_var_float)   = ti_var_float.
ti_lub_2(_Lang, ti_var_bottom, ti_par_set(TI)) = ti_var_set(TI).
ti_lub_2(_Lang, ti_var_bottom, ti_var_set(TI)) = ti_var_set(TI).
ti_lub_2(_Lang, ti_var_bottom, ti_par_enum(N)) = ti_var_enum(N).
ti_lub_2(_Lang, ti_var_bottom, ti_var_enum(N)) = ti_var_enum(N).

ti_lub_2(_Lang, ti_par_bool, ti_var_bool) = ti_var_bool.

ti_lub_2(_Lang, ti_par_int, ti_var_int)   = ti_var_int.
    % Zinc-only
ti_lub_2(lang_zinc,  ti_par_int, ti_par_float) = ti_par_float.
ti_lub_2(lang_zinc,  ti_par_int, ti_var_float) = ti_var_float.

    % Zinc-only
ti_lub_2(lang_zinc,  ti_var_int, ti_par_float) = ti_var_float.
ti_lub_2(lang_zinc,  ti_var_int, ti_var_float) = ti_var_float.

ti_lub_2(_Lang, ti_par_float, ti_var_float) = ti_var_float.

ti_lub_2(Lang, ti_par_set(TI1), ti_par_set(TI2)) =
    ti_par_set( ti_lub(Lang, TI1, TI2) ).
ti_lub_2(Lang, ti_par_set(TI1), ti_var_set(TI2)) =
    ti_var_set( ti_lub(Lang, TI1, TI2) ).
    % Zinc-only
ti_lub_2(lang_zinc, ti_par_set(TI1), ti_array(ti_par_int, TI2)) =
    ti_array( ti_par_int, ti_lub(lang_zinc, TI1, TI2) ).

    % Zinc-only
ti_lub_2(lang_zinc, ti_var_set(TI1), ti_var_set(TI2)) =
    ti_var_set( ti_lub(lang_zinc, TI1, TI2) ).

ti_lub_2(Lang, ti_array(I1, V1), ti_array(I2, V2)) = 
    ti_array(array_index_ti_lub(Lang, I1, I2), ti_lub(Lang, V1, V2)).

ti_lub_2(Lang, ti_tuple(TIs1), ti_tuple(TIs2)) = LubTI :-
    F = ( func(TI1, TI2) = ti_lub(Lang, TI1, TI2) is semidet ),
    LubTI = ti_tuple(map_two_lists(F, TIs1, TIs2)).
    % Zinc-only
ti_lub_2(Lang, ti_tuple(TIs1), ti_record(TIsNames2)) = LubTI :-
    F = ( func(TI1, TI2-Name) = ti_lub(Lang, TI1, TI2)-Name is semidet ),
    LubTI = ti_record(map_two_lists(F, TIs1, TIsNames2)),
    z(Lang, "ti_lub_2: 1").

    % Zinc-only
ti_lub_2(Lang, ti_record(TIsNames1), ti_record(TIsNames2)) = LubTI :-
    F = ( func(TI1-Name, TI2-Name) = ti_lub(Lang, TI1, TI2)-Name is semidet ),
    LubTI = ti_record(map_two_lists(F, TIsNames1, TIsNames2)),
    z(Lang, "ti_lub_2: 2").

    % Zinc-only
ti_lub_2(Lang, ti_par_enum(Name), ti_var_enum(Name)) = ti_var_enum(Name) :-
    z(Lang, "ti_lub_2: 4").

    % Zinc-only
    % XXX: not checking the par/par and any/any cases for unskolemized vars...
    % (the same is true for ti_leq_2).
ti_lub_2(Lang, ti_par_variable(Tv, Sk1), ti_any_variable(Tv, Sk2)) =
        ti_any_variable(Tv, yes) :-
    z(Lang, "ti_lub_2: 5"),
    ( if Sk1 = yes, Sk2 = yes then true
      else unexpected($pred ++ ": unskolemized ti-vars")
    ).

ti_lub_2(_Lang, ti_top, _) = ti_top.

ti_lub_2(_Lang, ti_error, TI2) = TI2.

ti_lub_2(_Lang, ti_unknown, _) = _ :- unexpected("ti_lub_2: ti_unknown").

%-----------------------------------------------------------------------------%

array_index_ti_leq(ti_par_bottom, _).

array_index_ti_leq(ti_var_bottom, _).

array_index_ti_leq(TI1, TI2) :-
    ti_eq(TI1, TI2).

array_index_ti_lub(Lang, TI1, TI2) =
    ( if      array_index_ti_leq(TI1, TI2) then ti_lub(Lang, TI1, TI2) 
      else if array_index_ti_leq(TI2, TI1) then ti_lub(Lang, TI1, TI2) 
      else                                            ti_top
    ).

%-----------------------------------------------------------------------------%

ti_compare(Lang, TI1, TI2, Cmp) :-
    ( if ti_leq(Lang, TI1, TI2) then
        ( if ti_leq(Lang, TI2, TI1) then
            Cmp = (=)       % 1 == 2
          else
            Cmp = (<)       % 1 < 2
        )
      else if ti_leq(Lang, TI2, TI1) then
        Cmp = (>)           % 1 > 2
      else
        Cmp = (=)           % incomparable: for sort's sake, same as (=)
    ).

%-----------------------------------------------------------------------------%

type_inst_sig_eq(ArgTIEs1 - RetTIE1, ArgTIEs2 - RetTIE2) :-
    all_true_two_lists(ti_eq, ArgTIEs1, ArgTIEs2),
    ti_eq(RetTIE1, RetTIE2).


ti_sig_compare(Lang, ArgTIs1 - RetTI1, ArgTIs2 - RetTI2, Cmp) :-
    TIs1 = ArgTIs1 ++ [RetTI1],
    TIs2 = ArgTIs2 ++ [RetTI2],
    ( if all_true_two_lists(ti_leq(Lang), TIs1, TIs2) then
        ( if all_true_two_lists(ti_leq(Lang), TIs2, TIs1) then
            Cmp = (=)       % 1 == 2
          else
            Cmp = (<)       % 1 < 2
        )
      else if all_true_two_lists(ti_leq(Lang), TIs2, TIs1) then
        Cmp = (>)           % 1 > 2
      else
        Cmp = (=)           % incomparable: for sort's sake, same as (=)
    ).


%-----------------------------------------------------------------------------%
% Properties of types and type-insts
%-----------------------------------------------------------------------------%

ti_has_error(TI) :- ti_has_error_2(TI) = yes.


    % Implemented using a switch so we can't forget to consider any new cases
    % added to 'type_inst'.
:- func ti_has_error_2(type_inst) = bool.

ti_has_error_2(ti_par_bottom)      = no.
ti_has_error_2(ti_var_bottom)      = no.
ti_has_error_2(ti_par_bool)        = no.
ti_has_error_2(ti_var_bool)        = no.
ti_has_error_2(ti_par_int)         = no.
ti_has_error_2(ti_var_int)         = no.
ti_has_error_2(ti_par_float)       = no.
ti_has_error_2(ti_var_float)       = no.
ti_has_error_2(ti_par_string)      = no.
ti_has_error_2(ti_ann)             = no.
ti_has_error_2(ti_par_set(TI))     = ti_has_error_2(TI).
ti_has_error_2(ti_var_set(TI))     = ti_has_error_2(TI).
ti_has_error_2(ti_array(I,V))      = ti_has_error_2(I) `or` ti_has_error_2(V).
ti_has_error_2(ti_tuple(TIs))      = or_list(map(ti_has_error_2, TIs)).
ti_has_error_2(ti_record(TIsNs))   =
    or_list(map(ti_has_error_2, assoc_list.keys(TIsNs))).
ti_has_error_2(ti_par_enum(_))     = no.
ti_has_error_2(ti_var_enum(_))     = no.
ti_has_error_2(ti_par_variable(_,_)) = no.
ti_has_error_2(ti_any_variable(_,_)) = no.
ti_has_error_2(ti_top)             = no.
ti_has_error_2(ti_op(ArgTIs - RetTI,_)) =
    or_list(map(ti_has_error_2, [RetTI | ArgTIs])).
ti_has_error_2(ti_error)           = yes.
ti_has_error_2(ti_overloaded_op(ProcNsTISigs)) = Out :-
    F = ( func(ArgTIs - RetTI, TIs) = [RetTI | ArgTIs] ++ TIs ),
    AllTIs = list.foldl(F, assoc_list.values(ProcNsTISigs), []),
    Out = or_list(map(ti_has_error_2, AllTIs)).
ti_has_error_2(ti_unknown)         = _ :- unexpected($pred ++ ": unknown").

%-----------------------------------------------------------------------------%

ti_has_top(TI) :-
    ti_has_top_2(TI) = yes.


    % Implemented using a switch so we can't forget to consider any new cases
    % added to 'type_inst'.
:- func ti_has_top_2(type_inst) = bool.

ti_has_top_2(ti_par_bottom)      = no.
ti_has_top_2(ti_var_bottom)      = no.
ti_has_top_2(ti_par_bool)        = no.
ti_has_top_2(ti_var_bool)        = no.
ti_has_top_2(ti_par_int)         = no.
ti_has_top_2(ti_var_int)         = no.
ti_has_top_2(ti_par_float)       = no.
ti_has_top_2(ti_var_float)       = no.
ti_has_top_2(ti_par_string)      = no.
ti_has_top_2(ti_ann)             = no.
ti_has_top_2(ti_par_set(TI))     = ti_has_top_2(TI).
ti_has_top_2(ti_var_set(TI))     = ti_has_top_2(TI).
ti_has_top_2(ti_array(I,V))      = ti_has_top_2(I) `or` ti_has_top_2(V).
ti_has_top_2(ti_tuple(TIs))      = or_list(map(ti_has_top_2, TIs)).
ti_has_top_2(ti_record(TIsNs))   = or_list(map(ti_has_top_2, map(fst, TIsNs))).
ti_has_top_2(ti_par_enum(_))     = no.
ti_has_top_2(ti_var_enum(_))     = no.
ti_has_top_2(ti_par_variable(_,_)) = no.
ti_has_top_2(ti_any_variable(_,_)) = no.
ti_has_top_2(ti_top)             = yes.
ti_has_top_2(ti_op(ArgTIs - RetTI,_)) =
    or_list(map(ti_has_top_2, [RetTI | ArgTIs])).
ti_has_top_2(ti_error)           = no.
ti_has_top_2(ti_overloaded_op(ProcNsTISigs)) = Out :-
    F = ( func(ArgTIs - RetTI, TIs) = [RetTI | ArgTIs] ++ TIs ),
    AllTIs = list.foldl(F, assoc_list.values(ProcNsTISigs), []),
    Out = or_list(map(ti_has_top_2, AllTIs)).
ti_has_top_2(ti_unknown)         = _ :- unexpected($pred ++ ": unknown").

ti_is_par(ti_par_bottom) = yes.
ti_is_par(ti_var_bottom) = no.
ti_is_par(ti_par_bool) = yes.
ti_is_par(ti_var_bool) = no.
ti_is_par(ti_par_int) = yes.
ti_is_par(ti_var_int) = no.
ti_is_par(ti_par_float) = yes.
ti_is_par(ti_var_float) = no.
ti_is_par(ti_par_string) = yes.
ti_is_par(ti_ann) = no.
ti_is_par(ti_par_set(_)) = yes.
ti_is_par(ti_var_set(_)) = no.
ti_is_par(ti_array(_, ElemTI)) = ti_is_par(ElemTI).
ti_is_par(ti_tuple(TIEs)) = bool.and_list(map(ti_is_par, TIEs)).
ti_is_par(ti_record(TypesAndNames)) =
    bool.and_list(map(ti_and_name_is_par, TypesAndNames)).
ti_is_par(ti_par_enum(_)) = yes.
ti_is_par(ti_var_enum(_)) = no.
ti_is_par(ti_par_variable(_, _)) = yes.
ti_is_par(ti_any_variable(_, _)) = no.
ti_is_par(ti_top) = _ :-
    unexpected($pred ++ "type-inst: top").
ti_is_par(ti_overloaded_op(_)) = _ :-
    unexpected($pred ++ ": ti: overloaded_op").
ti_is_par(ti_op(_, _)) = _ :-
    unexpected($pred ++ ": ti: op").
ti_is_par(ti_error) = _ :-
    unexpected($pred ++ ": type-inst: error").
ti_is_par(ti_unknown) = _ :-
    unexpected($pred ++ ": type-inst: unknown").

:- func ti_and_name_is_par(pair(type_inst, zinc_name)) = bool.

ti_and_name_is_par(TI - _) = ti_is_par(TI).

%-----------------------------------------------------------------------------%
%
% Utilities
%

all_true_two_lists(_, [], []). 
all_true_two_lists(P, [A | As], [B | Bs]) :-
    P(A, B),
    all_true_two_lists(P, As, Bs).

first_repeated_elem([X | Xs]) =
    ( if member(X, Xs) then X else first_repeated_elem(Xs) ).

    % Like map_corresponding, but fails if the lists have different lengths.
    %
:- func map_two_lists(func(X, Y) = Z::in(func(in, in) = out is semidet),
        list(X)::in, list(Y)::in) = (list(Z)::out) is semidet.

map_two_lists(_, [], []) = [].
map_two_lists(F, [A | As], [B | Bs]) = [F(A, B) | map_two_lists(F, As, Bs)].

%-----------------------------------------------------------------------------%
:- end_module types_and_insts.
%-----------------------------------------------------------------------------%
