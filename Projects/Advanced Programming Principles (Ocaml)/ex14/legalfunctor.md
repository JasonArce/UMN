1. `module A`
>  Legal
>> The functor A creates a module by not adding any fields, and the declaration doesn't constrain its signature.

2. `module BB`
> Legal
>> BApp should take in a functor function that returns BS and 'a which it does.

3. `module c`
> Not Legal
>> modules cannot be lowercase.

4. `module DF`
> Not Legal
>> DF takes in (D) but D has no signature.

5. `module EF`
> Legal
>> The signature and declaration do not contain any syntax errors as all in line references are accurate.

6. `module FF`
> Not Legal
>> F takes take in a module but it takes in a struct. 
