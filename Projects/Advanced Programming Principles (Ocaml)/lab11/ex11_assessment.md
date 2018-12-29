## Assessment for Exercise Set 11

Run on November 27, 21:30:14 PM.

+ Pass: Change into directory "ex11".

### Part 1: Thread order

+  _1_ / _1_ : Pass: Item 1 of list in intereval.md passes execution 1 state result test

+  _1_ / _1_ : Pass: Item 2 of list in intereval.md passes execution 2 state result test

+  _0_ / _1_ : Fail: Item 3 of list in intereval.md 

+  _1_ / _1_ : Pass: Item 4 of list in intereval.md passes execution 4 state result test

#### Subtotal: _3_ / _4_

### Part 2: Starting threads

+  _1_ / _1_ : Pass: thread2 has expected type and output

+  _1_ / _1_ : Pass: thread3 has expected type and output

+  _1_ / _1_ : Pass: dprint has expected type and output

+  _1_ / _1_ : Pass: make_t has expected type and output

#### Subtotal: _4_ / _4_

### Part 3: Philosophers

+  _1_ / _1_ : Pass: polite_phil has correct type

+  _1_ / _1_ : Pass: polite_phil produces correct output with no locks

+  _1_ / _1_ : Pass: polite_phil behaved as expected with m1 locked

+  _0_ / _1_ : Fail: polite_phil did not behave as expected with m2 locked:
    
output:
```Socrates got left chopstick!
```

    
stderr:
``````

    
timeout: `True`
    

+  _1_ / _1_ : Pass: polite_phil has correct type

+  _1_ / _1_ : Pass: polite_phil produces correct output with no locks

+  _1_ / _1_ : Pass: polite_phil behaved as expected with m1 locked

+  _1_ / _1_ : Pass: polite_phil behaved as expected with m2 locked

#### Subtotal: _7_ / _8_

