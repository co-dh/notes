\l transitive_in_bool_matrix.q

pad0: {((x-count y)#0),y } /pad 0 at the beginning of y to lenght x

num2Matrix:{ (x; 0N)#`boolean$pad0[x*x]2 vs y} /convert y's binary into a x * x boolean matrix.
reflective:{ all x@'til count x}
preorder:{ transitive[x] and reflective x }

\
# How many preorders are there on set 3: 0 1 2?

We represent a relation R on 3 as a 3*3 boolean matrix, there are totally 2^9 = 512 relations.
A preorder by definition need to preserve reflexitivity: x≤x , so the dialog of R must be all 1,
then have 2^6=64 reflexitive relations.
It also need to be transitive, 

## enumerate all reflexitive relations

Q has a very beautiful function vs: (vector from single?) that gives binary representation of a number
~~~q
    2 vs 13
    / We can then pad it with 0 at the beginning to get a 9 element array
    pad0[9] 2 vs 13
    / convert to boolean
    `boolean$ pad0[9] 9#2 vs 13
    / convert to matrix
    3 3 #`boolean$ 9#2 vs 13
    / define num2Matrix
    num2Matrix[3; 13]
~~~

Since all reflexitive relation has 1 on the diagonal, we can start from 273
~~~q
    id3: (100b; 010b; 001b)
    raze id3
    2 sv raze id3 /binary to int~~~ 
~~~
~~~q

    count a: x  where preorder each x:  num2Matrix[3;] each 273 + til 512 - 273
    -5#a

