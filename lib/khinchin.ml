(*https://mathworld.wolfram.com/KhinchinsConstant.html*)

let aux_K = fun (x: float) -> (1. +. (1. /. (x *.(x +. 2.))))**((log x) /. (log 2.));;

let rec khinchin n =
    if n <= 1 then 1.
    else (aux_K (float_of_int n)) *. khinchin (n - 1);;


(*Accelerated log_Khinchin using Zeta expansion: https://ntrs.nasa.gov/api/citations/20020024089/downloads/20020024089.pdf*)

let rec aux_log_k = function
    | 1 -> 1.
    | n -> ((-1.)**(float_of_int (n-1)) /. (n |> float_of_int)) +. aux_log_k (n - 1);;

let partial_log_khinchin = fun (n:float) ->
  (aux_log_k (int_of_float n) /. n) *. (Zahlen.even_zeta (2. *.n) -. 1.);;

let rec log_K = function
    | 1 -> (partial_log_khinchin 1.) /. log 2.
    | n -> (n |> float_of_int |> partial_log_khinchin) /. log 2. +. log_K (n - 1);;

let zeta_khinchin = fun n -> exp(log_K n);;
