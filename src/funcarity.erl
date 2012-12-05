%% funcarity.hrl
%%
%% From: http://erlang.2086793.n4.nabble.com/Function-name-macro-the-counterpart-of-MODULE-td2099690.html
%% Author: Zoltan Lajos Kis
%%
%% supply the missing ?FUNCTION and ?ARITY macros

-module(funcarity).
-author("Zoltan Lajos Kis").

%% exports

-export([parse_transform/2]).

%% includes

-include("funcarity.hrl").

%% code

-spec parse_transform([any()],_) -> [any()].
parse_transform(AST, _Options) ->
    [parse(T) || T <- AST].


-spec parse(_) -> any().
parse({function, _, FName, FArity, _} = T) ->
    erl_syntax_lib:map(
      fun(TE) ->
              parsemacro(FName, FArity, TE)
      end, T);
parse(T) ->
    T.


-spec parsemacro(_,_,{'eof',_} | {'error',_} | {'nil',_} | {'warning',_} | {atom(),_,_} | {atom(),_,_,_} | {'bin_element' | 'clause' | 'function' | 'op' | 'receive' | 'record' | 'record_field' | 'rule',_,_,_,_} | {'try',_,_,_,_,_}) -> tuple().
parsemacro(FName, FArity, T) ->
    erl_syntax:revert(
      case erl_syntax:type(T) of
          atom ->
              case erl_syntax:atom_value(T) of
                  ?FUNCTION ->
                      erl_syntax:atom(FName);
                  ?ARITY ->
                      erl_syntax:integer(FArity);
                  _ -> T
              end;
          _ ->
              T
      end).
