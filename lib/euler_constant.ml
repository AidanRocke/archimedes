(*https://mathworld.wolfram.com/e.html*)

(*One of the lesser known qualities of Euler's number is that it has
optimal radix economy.*)
let euler = fun n -> 1. /. (float_of_int (Zahlen.factorial n));;

let rec euler_number n =
    if n < 1 then (euler 0)
    else euler n +. euler_number (n - 1);;

(*The relation between Euler and Archimedes' constant via Stirling's approximation:
https://mathworld.wolfram.com/StirlingsApproximation.html*)

let phi = fun n -> (Zahlen.factorial n |> float_of_int)**2.
                  /. (2*n |> float_of_int);;

let psi = fun n -> ((Zahlen.da_powah n) /. (exp(float_of_int n)))**2.;;

let archimedes = fun n -> (phi n) /. (psi n);;

(*Floating point arithmetic breaks down aroun n =20.*)
archimedes 20;;
