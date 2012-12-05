%% funcarity.hrl
%%
%% From: http://erlang.2086793.n4.nabble.com/Function-name-macro-the-counterpart-of-MODULE-td2099690.html
%% Author: Zoltan Lajos Kis
%%
%% supply the missing ?FUNCTION and ?ARITY macros

-ifndef(_HXW_FUNCARITY_HRL_).
-define(_HXW_FUNCARITY_HRL_, true).

-define(FUNCTION, '__function_macro__').
-define(ARITY, '__function_arity__').

-endif.
