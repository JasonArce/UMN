Last login: Tue Sep 20 12:01:03 on ttys000
x-10-104-43-157:~ jasonarce$ python3
Python 3.5.2 (v3.5.2:4def2a2901a5, Jun 26 2016, 10:47:25) 
[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> def windchill(temp,wind):
...     return(35.74+0.6215*temp-35.75*wind**0.16+0.4275*temp*wind**0.16)
... 
>>> windchill(0,10)
-15.934471804166904
>>> 













