# Missing ?FUNCTION and ?ARITY macros

## Specifications

This library implements a parse transform to get the function anme and arity
to make logging output more readable.

This code was written by *Zoltan Lajos Kis* and posted to the Erlang mailing list
and can be found at:

`http://erlang.2086793.n4.nabble.com/Function-name-macro-the-counterpart-of-MODULE-td2099690.html`


Copied here to make it easily accessible using rebar.config


## How to add

Just after the module/author directives add a compile directive to call the parse_transform
function:

`-compile({parse_transform, funcarity}).`

Add an include directive to for the macro definitions:

`-include("funcarity.hrl").`

Ensure the rebar.config has the appropriate additions:

* in erl_opts add: `{i, "apps/funcarity/include"}`
* in deps add: `{funcarity, ".*", {git, "git://github.com/hxw/funcarity.erl.git", "master"}}`


## Use

Just use `?FUNCTION` and `?ARITY` in the same way as existing pre-defined macros like `?MODULE`.
e.g.

`io:format("~ts:~ts/~b ~p~n", [?MODULE, ?FUNCTION, ?ARITY, Message])`

Or use with some logging system like *lager*

For some example macros use:

`-include("funcarity_lager.hrl").`

Which contains `?DEBUG(Term)`, `?INFO(Term)` and `?ERROR(Term)` macros.
