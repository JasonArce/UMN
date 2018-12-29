1. `listSet.ml : sset.mli`
> Legal
>> listSet provides all types and values in the sset signature

2. `hashSet.ml : sset.mli`
> Not Legal
>> hasSet provides none of the types or functions found in the sset signature

3. `funSet.ml : sset.mli`
> Not Legal
>> funSet does not provide some of the functions found in sset

4. `listSet.ml : rset.mli`
> Not Legal
>> intersect and rem are not found in listSet

5. `hashSet.ml : rset.mli`
> Not Legal
>> intersect and rem are not found in hashSet

6. `funSet.ml : rset.mli`
> Legal
>> funSet provides all types and values in the rset signature

7. `listSet.ml : fset.mli`
> Legal
>> listSet provides all types and values in the fset signature

8. `hashSet.ml : fset.mli`
> Not Legal
>> hashSet doesn't have fold

9. `funSet.ml : fset.mli`
> Not Legal
>> funSet is missing functions found in the fset signature
