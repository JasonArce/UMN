1. `module A`
> Not Legal
>> The value x has mismatched types in the signature and struct
2. `module B`
> Legal
>> The value b is a string in both cases
3. `module c`
> Not Legal
>> lowercase c does not work
4. `module D`
> Legal
>> Both f and g have type int

5. `let module E = ...`
> Legal
>> e is a function in E

6. `let module F : sig ...`
> Not Legal
>> type t is not an int in module F

7. `module type GaSig`
> Legal
>> val x : t has the type int which fits GbSig

8. `module type HSig`
> Not Legal
>> can't use a let expression to define a module
