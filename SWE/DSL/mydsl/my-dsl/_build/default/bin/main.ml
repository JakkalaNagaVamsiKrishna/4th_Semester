open My_dsl
open My_utils
open Tokenizer
let source_game = get_clean_lines "./game-source/prince_crusher.jp"
let () =
  let tokens = tokenize (explode source_game) in
  let tokens_as_str = print_tokens tokens in
  print_endline tokens_as_str