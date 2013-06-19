%% funcarity_lager.hrl
%%
%% Author: Christopher Hall
%%
%% using ?FUNCTION and ?ARITY macros with lager

-ifndef(_HXW_FUNCARITY_LAGER_HRL_).
-define(_HXW_FUNCARITY_LAGER_HRL_, true).

%% include MODULE, FUNCTION, ARITY macros

-include("funcarity.hrl").

%% logging macros

-define(DEBUG(Term), lager:log(debug, self(), "~ts:~ts/~p ~p", [?MODULE, ?FUNCTION, ?ARITY, Term])).
-define(ERROR(Term), lager:log(error, self(), "~ts:~ts/~p ~p", [?MODULE, ?FUNCTION, ?ARITY, Term])).
-define(INFO(Term), lager:log(info, self(), "~ts:~ts/~p ~p", [?MODULE, ?FUNCTION, ?ARITY, Term])).

-endif.
