-module(simple_tests).
-compile(export_all).

-include_lib("eunit/include/eunit.hrl").

-import(ustring, [new/1, len/1, len/2, eql/2, exact/2, upcase/1, downcase/1]).
-import(lists, [nth/2]).

length_test_() ->
    {setup, local,
     fun setup/0,
     fun cleanup/1,
     fun([S1, S2, S3, S4]) ->
             [
              ?_assert(len(S1) == len(S2)),
              ?_assert(len(S3) == len(S4)),

              ?_assert(eql(upcase(S1), S2) == true),
              ?_assert(exact(upcase(S1), S2) == false),

              ?_assert(len(S3) == len(S4)),
              ?_assert(eql(S3, S4) == true),
              ?_assert(eql(upcase(S3), upcase(downcase(S4))))
             ]
     end
    }.

setup() ->
    {ok, Currd} = file:get_cwd(),
    Ebind = filename:join([Currd, "..", "ebin"]),
    code:add_patha(Ebind),
    file:set_cwd(".."),

    application:start(starling_app),

    Data =
        [
         %% U+00FC -- ü
         new([16#C3, 16#BC]),
         %% U+0075 U+0308 -- u followed by ¨
         new([16#75, 16#CC, 16#88]),
         %% Über
         new([16#C3, 16#9C, 16#62, 16#65, 16#72]), 
         %% As above, but combined
         new([16#55, 16#CC, 16#88, 16#62, 16#65, 16#72]) 
        ],
    Data.

cleanup(_) ->
    file:set_cwd("tests"),
    application:stop(starling_app),
    ok.
