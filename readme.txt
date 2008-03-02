
Starling is a Unicode text processing library for Erlang.
It's based on ICU (http://icu-project.org/), which you need to have installed to use Starling.

You can install ICU on OSX with:
  sudo port install icu
  (you must have MacPorts (http://www.macports.org/) installed to do this)

Starling is implemented as a C port, and packaged as an OTP application.

Once you've compiled Starling, start the Erlang shell with:
  erl -pa ~/path/to/starling/ebin
  
You can then use Starling like this:
  
  1> application:start(starling_app).
  ok
  2> S = ustring:new("hello").
  <<0,104,0,101,0,108,0,108,0,111>>
  3> S2 = ustring:upcase(S).
  <<0,72,0,69,0,76,0,76,0,79>>
  4> ustring:pr(S2).
  "HELLO"

The project page is at http://code.google.com/p/starling/

Hasan Veldstra <hasan@12monkeys.co.uk> [http://12monkeys.co.uk]