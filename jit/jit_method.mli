open MinCaml
open Asm
open Jit_env

val run : prog -> reg -> mem -> env -> fundef
