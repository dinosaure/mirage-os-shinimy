open Lwt.Infix

module Make
  (Time : Mirage_types_lwt.TIME)
  (Console : Mirage_types_lwt.CONSOLE)
  (Random : Mirage_types_lwt.RANDOM)
= struct
  let log console fmt = Fmt.kstrf (Console.log console) fmt

  let start time console random =
    let rec go = function
      | 0 -> Lwt.return ()
      | n ->
        let v = Random.generate 20 in
        let hash = Digestif.SHA1.of_raw_string (Cstruct.to_string v) in
        log console "%a" Digestif.SHA1.pp hash >>= fun () ->
        Time.sleep_ns 1_000_000L >>= fun () -> go (pred n) in
    go 10
end
