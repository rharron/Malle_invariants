# Malle invariants

This repository contains one main file: Malle.sage. This is a sage script for computing the *a* and *b* invariants in Malle's conjecture. At this time, this code computes Malle's original *b* invariant even though Klüners has shown that it can be incorrect. For details on these invariants, see e.g. Türkelli's article *Connected components of Hurwitz schemes and Malle’s conjecture* [doi: 10.1016/j.jnt.2015.03.005](http://dx.doi.org/10.1016/j.jnt.2015.03.005).

## Sample usage

The Malle invariants for the five transitive subgroups of *S*<sub>5</sub>:
```
sage: for G in TransitiveGroups(5):
          print G.structure_description(), Malle_a(G), Malle_b(G)
C5 1/4 1
D5 1/2 1
C5 : C4 1/2 1
A5 1/2 2
S5 1 1
```

The Malle invariants for the dihedral groups of degree up to 10:
```
sage: for n in range(3, 11):
          print n, Malle_a(DihedralGroup(n)), Malle_b(DihedralGroup(n))
3 1 1
4 1 1
5 1/2 1
6 1/2 1
7 1/3 1
8 1/3 1
9 1/4 1
10 1/4 1
```
