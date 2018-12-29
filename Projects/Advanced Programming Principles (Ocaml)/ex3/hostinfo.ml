(* hostinfo, the "name" of a computer connected to the Internet *)
type hostinfo = IP of int*int*int*int | DNSName of string

type host = { ip: hostinfo };;

(* Here's where your definition of tld goes: *)
let tld (addr : hostinfo) : string option = match addr with
| IP (x,y,w,z) -> None
| DNSName string -> Some ( String.sub string ((String.rindex string '.')+1) 3)
