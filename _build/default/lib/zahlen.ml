let square = fun x -> x *. x;;

let rec factorial = function
    | 0 | 1 -> 1
    | n -> n * factorial (n - 1);;

let n_choose_k n k =
  let num = float_of_int (factorial n) in
  let denom = factorial (n-k) * factorial (k) in

  let nck = num  /. (float_of_int denom) in

  nck
;;


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


(*Computing the Riemann zeta function at even integers.*)
let partial_bernoulli n k =
  let inner_loop n k r =
    (-1.)**(float_of_int r) *. (n_choose_k k r) *. (float_of_int r)**(float_of_int n) in

  let rec partial_sum = function
    | 0 -> 0.
    | r -> (inner_loop n k r) +. partial_sum (r-1) in

partial_sum k;;

let bernoulli n =
  let last_int = ref n in

  let rec partial_sum = function
    | 0 -> 0.
    | k -> (partial_bernoulli !last_int k) /. (float_of_int (k+1)) +. partial_sum (k-1) in

partial_sum n;;

let pi = 4.0 *. atan 1.0;;

let even_zeta = fun (n:float) ->
  ((-1.)**(n +. 1.) *. (2. *. n |> int_of_float |> bernoulli) *. (2. *. pi)**(2. *. n)) /.
  (2. *. (float_of_int (2. *. n |> int_of_float |> factorial)))
;;
