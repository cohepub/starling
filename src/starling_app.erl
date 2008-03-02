-module(starling_app).

-behavior(application).

-export([start/2,
         stop/1]).

start(_Type, _Args) ->
    {ok, ExtProg} = application:get_env(starling_app, extprog),
    starling_sup:start_link(filename:join(["ebin", ExtProg])).

stop(_State) ->
    ok.
