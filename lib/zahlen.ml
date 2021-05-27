let square = fun x -> x *. x;;

let rec factorial = function
    | 0 | 1 -> 1
    | n -> n * factorial (n - 1);;

let da_powah = fun n -> 2.**(float_of_int n);;

(*A prime sieve over odd numbers.*)
let prime_sieve n =
  let m = (n / 2) + 1 in
  let primes = Array.init m (fun i->2*i+1) in
  primes.(0) <- 2;

  let last_integer = int_of_float (sqrt (float_of_int n) /. 2.) + 1 in

  let idx = ref 1 in
  while !idx <= last_integer do
    if primes.(!idx) <> 0 then

      (*Remove multiples*)
      (let p = primes.(!idx) in
       let j = ref (!idx * (p + 1)) in
       while !j < m do
         primes.(!j) <- 0;
         j := !j + p;
       done);
    idx := !idx + 1;
  done;

List.filter ((<>) 0) (Array.to_list primes);;
