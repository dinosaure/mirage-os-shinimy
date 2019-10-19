module Make
  (Console : Mirage_types_lwt.CONSOLE)
  (Random : Mirage_types_lwt.RANDOM)
= struct
  let log console fmt = Fmt.kstrf (Console.log console) fmt

  let start console random =
    let v = Random.generate 20 in
    let hash = Digestif.SHA1.of_raw_string (Cstruct.to_string v) in
    log console "%a" Digestif.SHA1.pp hash
end
