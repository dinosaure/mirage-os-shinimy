open Mirage

let entropieur =
  foreign "Unikernel.Make"
    (time @-> console @-> random @-> job)

let packages =
  [ package ~sublibs:["c"] "digestif" ~min:"0.7.4" ]

let () =
  register "entropieur"
    ~packages
    [ entropieur $ default_time $ default_console $ default_random ]
