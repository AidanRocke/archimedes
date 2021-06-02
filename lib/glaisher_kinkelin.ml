(*The logarithm of the Glaisher-Kinkelin constant: https://mathworld.wolfram.com/Glaisher-KinkelinConstant.html*)
let inner_loop n k =
  let inner = (-1.)**(float_of_int (k+1)) *. (Zahlen.n_choose_k n k) *.
              (float_of_int (k + 1))**2. *. log(float_of_int (k + 1)) in

inner;;

let helmut_sum n =
  let last_int = ref n in

  let rec partial_sum = function
    | 0 -> 0.
    | k -> (inner_loop !last_int k) +. partial_sum (k-1) in

partial_sum n;;

let rec glaisher_kinkelin = function
    | 0 -> 1. /. 8.
    | n -> (helmut_sum n) /. (float_of_int (2*n + 2)) +. (glaisher_kinkelin (n-1));;

(*Try glaisher_kinkelin 15 ... the function is no longer well-behaved after that.*)
