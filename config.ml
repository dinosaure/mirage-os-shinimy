open Mirage

let entropieur =
  foreign "Unikernel.Make"
    (console @-> random @-> job)

let packages =
  [ package ~sublibs:["c"] "digestif" ~min:"0.7.4" ]

let () =
  register "entropieur"
    ~packages
    [ entropieur $ default_console $ default_random ]
