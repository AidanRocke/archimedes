let square = fun x -> x *. x;;

let rec factorial = function
    | 0 | 1 -> 1
    | n -> n * factorial (n - 1);;

let da_powah = fun n -> 2.**(float_of_int n);;
