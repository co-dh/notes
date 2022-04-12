/pull back of function f

inverse:{ value[x]!key x } /inverse a dictionary's key and value
pullback: {[f; x] raze group[f]x }
rightAdjoint:{[f; x] where all x in/:\: group f}
leftAdjoint: {[f; x] where any x in/:\: group f}
leftAdjoint2:{[f] f} //another definition, since f: dictionary is implicitly mapped

\
# Pullback of a function f: A->B ( represented as dictionary in Q)
The inverse of f in Q is group[f]: B->[A] that map b to it's preimage. However B has no order, but [B] can have order(⊆),
so define **pullback[f] : [B]->[A] = a|-> a.group[f].map.concat** .

In Q, map are implicitly for dictionary: d 1 2 = d[1],d[2]

~~~q
show f: 0 1 2 !`a`a`b /function f as dictionary
show group f
p: pullback[f]
show p`a
show p `a`b

~~~
## pullback is monotone

    (1#`a) ⊆ `a`b ⇒ (p 1#`a)  ⊆ p `a`b

## pullback preserve meet
    (1#`a)  ∩  `a`b =   1#`a
    p[1#`a] ∩ p`a`b = p 1#`a
    
## pullback preserve join
    
    (1#`a)  ∪  `a`b =   1#`a
    p[1#`a] ∪ p`a`b = p 1#`a
    
       
## pullback is a left adjoint, it's right adjoint l is:

    0 enlist [0] ⊆ 0 1 -> a
    1 enlist [1] ⊆ 0 1 -> a
    all[(enlist each x) ⊆\: ■] -group[f]-> b
    
~~~q
    show group f
    show 0 in/: group f
    show 1 in/: group f
    show 0 1 in/:\: group f 
    show all 0 1 in/:\: group f 
    show where all 0 1 in/:\: group f
~~~
    
    
## pullback's left adjoint: {f each x}
pullback preserve meet, so it's a right adjoint, it's left adjoint is:
    r: [A]->[B]

    0 enlist [0] ⊆ 0 1 -> a
    2 enlist [2] ⊆ ,2  -> b
    any[(enlist each x) ⊆\: ■] -group[f]-> b

~~~q
    show where any 0 2 in/:\: group f
~~~