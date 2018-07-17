open MinCaml
open Asm
open Util
open BacCaml
open Jit_config
open Jit_util

type trace_env =
  Env of prog * value array * value array * string list

let print_list f lst =
  let rec loop f = function
    | [] -> ()
    | hd :: tl -> f hd; print_string "; "; loop f tl
  in
  print_string "["; loop f lst; print_string "]"

let prepare_var red_lst green_lst =
  let red_tbl = Hashtbl.create 10 in
  let green_tbl = Hashtbl.create 10 in
  List.iter
    (fun r -> Hashtbl.add red_tbl (fst r) (snd r))
    red_lst;
  List.iter
    (fun g -> Hashtbl.add green_tbl (fst g) (snd g))
    green_lst;
  red_tbl, green_tbl

let prepare_prog bytecode annot mem =
  for i = 0 to (Array.length bytecode - 1) do
    if Array.exists (fun annot -> annot = i) annot then
      mem.(i * 4) <- Red (bytecode.(i))
    else
      mem.(i * 4) <- Green (bytecode.(i))
  done

let prepare_env name ex_name code annot red_lst green_lst =
  let p =
    open_in ((Sys.getcwd ()) ^ "/" ^ name)
    |> Lexing.from_channel
    |> Mutil.virtualize
    |> Simm.f
  in
  let reg = Array.make 1000000 (Red (-1)) in
  let mem = Array.make 1000000 (Red (-1)) in

  let red_args = List.map fst red_lst in
  let fundefs', interp_body, jit_args' =
    Method_jit_loop.prep ~prog:p ~name:"min_caml_test_trace" ~red_args:red_args in

  let fundef' = List.hd fundefs' in

  let redtbl, greentbl = prepare_var red_lst green_lst in
  Colorizer.colorize_reg redtbl greentbl reg fundef' interp_body;
  prepare_prog code annot mem;

  Env (p, reg, mem, red_args)

let to_tuple lst =
  if List.length lst = 0 then
    [("dummy", "0")]
  else if List.length (List.hd lst) <> 2 then
    failwith "to_tuple: element of list's size should be 2."
  else
    List.map (fun elm -> (List.nth elm 0, List.nth elm 1)) lst

let string_of_array f str_lst =
  str_lst
  |> Str.split_delim (Str.regexp " ")
  |> List.map f
  |> Array.of_list

(* parse a list like "a 1; b 2" -> [("a", 1), ("b", 2)] *)
let parse_pair_list pair_lst =
  pair_lst
  |> Str.split_delim (Str.regexp "; ")
  |> List.map (Str.split_delim (Str.regexp " "))
  |> to_tuple
  |> List.map (fun (x, y) -> (x, int_of_string y))

let file = ref ""
let codes = ref ""
let annots = ref ""
let reds = ref ""
let greens = ref ""
let output = ref "a"

let usage =  "usage: " ^ Sys.argv.(0) ^ " [-file string] [-green string list] [-red string list] [-code int list] [-annot int list]"

let speclist = [
  ("-file", Arg.Set_string file, "Specify file name");
  ("-green", Arg.Set_string greens, "Specify green variables");
  ("-red", Arg.Set_string reds, "Specify red variables");
  ("-code", Arg.Set_string codes, "Specify bytecode");
  ("-annot", Arg.Set_string annots, "Specify annotations for bytecode");
  ("-o", Arg.Set_string output, "Set executable's name");
  ("-dbg", Arg.Unit (fun _ -> Logger.log_level := Logger.Debug), "Enable debug mode");
]

let run f =
  Arg.parse
    speclist
    (fun x -> raise (Arg.Bad ("Bad argument : " ^ x)))
    usage;
  let file = !file in
  let bytes = string_of_array int_of_string !codes in
  print_endline (Array.length bytes |> string_of_int);
  let annots = string_of_array int_of_string !annots in
  let reds = parse_pair_list !reds in
  let greens = parse_pair_list !greens in
  let output = !output in
  f file output bytes annots reds greens
