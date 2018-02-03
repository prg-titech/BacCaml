open Util
open Jit_config

let dir = "data/"

let setup aa bb =
  List.iter (fun (a, i) -> bb.(i) <- value_of a)
    (ListUtil.zip (Array.to_list aa) (ListUtil.range 0 (Array.length aa - 1)))
