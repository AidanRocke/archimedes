(*Here we consider the exponential of the Meissel-Mertens constant: https://oeis.org/wiki/Meissel%E2%80%93Mertens_constant*)
let prime_entropy primes =

    let sum l = List.fold_left (+.) 0. l in
    let f x = 1. /. (float_of_int x) in

    let entropy = primes |> (List.map f) |> sum in

entropy
;;

let exp_mm n =
  let primes = Zahlen.prime_sieve n in
  let exp_entropy = primes |> prime_entropy |> exp in

exp_entropy /. (n |> float_of_int |> log)
;;
