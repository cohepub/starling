# Build file for Starling

CC = `icu-config --cc`.strip + " " +
     `icu-config --cflags`.strip + " " +
     "-std=c99 -pedantic -Wall"

BLD = "ebin"
SRC = "src"
C_SRC = "c_src"
ERL_FILES = Dir["#{SRC}/*.erl"].join(" ")
DRV_FILES = Dir["#{C_SRC}/*.c"].join(" ")


ICU_INCLUDE_FLAGS = `icu-config --cppflags-searchpath`.strip
EI_INCLUDE_FLAGS = "-I/opt/local/lib/erlang/lib/erl_interface-3.5.5.3/include"

ICU_LD_FLAGS = `icu-config --ldflags`.strip + " " +
               `icu-config --ldflags-icuio`.strip + " "

EI_LD_FLAGS  = "-L/opt/local/lib/erlang/lib/erl_interface-3.5.5.3/lib -lei -lerl_interface"

task :default => [:app, :drv]

task(:app) do
  %x{erlc -o #{BLD} #{ERL_FILES}}
end

task(:drv) do
  %x{#{CC} #{ICU_INCLUDE_FLAGS} #{EI_INCLUDE_FLAGS} #{ICU_LD_FLAGS} #{EI_LD_FLAGS} #{DRV_FILES} -o #{File.join(BLD, "starling_drv")}}
end

task(:clean) do
end
