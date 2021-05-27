## In case you haven't already done so:

```Ocaml
opam install merlin ocp-indent dune utop
```

## Example usage in the terminal:

1. Go to the Archimedes folder.

2. Enter 'dune utop lib' which should bring you into the utop interface:

```Ocaml
dune utop lib
```

3. Once in utop, open the set of tools you need:

```Ocaml
open Lib;;
```

4. For a naive monte-carlo approximation to the Archimedes constant(aka pi)
with n samples:

```Ocaml
Archimedes.mc_pi 10;;
```

5. For a Newton-Euler approximation to the Archimedes' constant:

```Ocaml
Archimedes.newton_euler 20;;
```

6. Finally, for Ramanujan's approximation to the Archimedes' constant:

```Ocaml
Archimedes.ramanujan 10;;
```
