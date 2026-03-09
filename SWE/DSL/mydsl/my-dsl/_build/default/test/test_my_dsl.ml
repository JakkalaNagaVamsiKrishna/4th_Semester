open My_dsl
open My_utils
open Tokenizer
open OUnit2
let tests =
  "test suite for my-dsl"
  >::: [
        ( "explode" >:: fun _ ->
        let input = " { } " in
        let expected_output = ["{"; "}"] in
        let actual_output = explode (char_to_tk (helper input)) in
        assert_equal expected_output actual_output );
        ( "tokenize {}" >:: fun _ ->
        let input = "{}" in
        let expected_tokens =
        [
            { kind = LEFT_CURL; text = "{"; lit_val = "null" };
            { kind = RIGHT_CURL; text = "}"; lit_val = "null" };
            { kind = END; text = ""; lit_val = "null" };
        ]
        in
        let actual_tokens = tokenize (explode (char_to_tk (helper input))) in
        assert_equal expected_tokens actual_tokens );
        (* ( "implode" >:: fun _ ->
        let input = [ 'x'; 'y'; 'z' ] in
        let expected_output = "xyz" in
        let actual_output = implode input in
        assert_equal expected_output actual_output );
        ( "implode empty list" >:: fun _ ->
        let input = [] in
        let expected_output = "" in
        let actual_output = implode input in
        assert_equal expected_output actual_output ); *)
        ( "tokenize empty string" >:: fun _ ->
          let input = "" in
          let expected_output = [{kind = END; text = ""; lit_val = "null"}] in 
          let actual_tokens = tokenize (explode (char_to_tk (helper input))) in 
          assert_equal expected_output actual_tokens 
        );
        ( "tokenize invalid character" >:: fun _ ->
          let input = "%" in  
          assert_raises (Failure "Unexpected character: %") (fun () -> tokenize (explode (char_to_tk (helper input))))
          );
        ("tokenize (" >:: fun _ -> 
          let input = "(" in 
          let expected_tokens = [
            { kind = LEFT_PAR; text = "("; lit_val = "null" };
            { kind = END; text = ""; lit_val = "null" };
          ] in 
          let actual_tokens = tokenize (explode (char_to_tk (helper input))) in
          assert_equal expected_tokens actual_tokens );
        ("tokenize )" >:: fun _ -> 
        let input = ")" in 
        let expected_tokens = [
            { kind = RIGHT_PAR; text = ")"; lit_val = "null" };
            { kind = END; text = ""; lit_val = "null" };
        ] in 
        let actual_tokens = tokenize (explode (char_to_tk (helper input))) in
        assert_equal expected_tokens actual_tokens );
       ]
let _ = run_test_tt_main tests