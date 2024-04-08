type 'a t
(*@ mutable model contents : 'a list *)

val create : unit -> 'a t
(*@ s = create ()
    ensures s.contents = [] *)

val push : 'a -> 'a t -> unit
(*@ push a s
    modifies s.contents
    ensures s.contents = a :: (old s.contents) *)

val pop_opt : 'a t -> 'a option
(*@ o = pop_opt s
    modifies s.contents
    ensures s.contents = match old s.contents with
                            | [] -> []
                            | x :: xs -> xs
    ensures o = match old s.contents with
                   | [] -> None
                   | x :: xs -> Some x *)
