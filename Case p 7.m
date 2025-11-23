load "Approach_Lattice.m";

// Possible 7-adic images containing -I for elliptic curve 
// over Q admitting a rational 7-isogeny. From Proposition 20.
Possible7AdicImages := ["7.8.0.a.1", "7.24.0.a.1", "7.24.0.a.2", "7.24.0.b.1"];

// Checking commutator index of each group in Possible7AdicImages
for lbl in Possible7AdicImages do
    _, _, ind := FindCommutatorSubgroup(OurModCrvs[lbl][5]); ind;
end for;
/*
48
48
48
48
*/

// Lattice associated with X_0(7)
L2 := [OurModCrvs[lbl] : lbl in ["2.2.0.a.1", "4.2.0.a.1", "4.8.0.b.1", "8.2.0.a.1", "8.2.0.b.1"]];
L3 := [OurModCrvs["3.4.0.a.1"]];
K := OurModCrvs["7.8.0.a.1"][5];
L := ConstructLattice(Gl(6), K, L2, L3);
L, Linf, Lfin, NeedToCheck := MakeSubLats(L);
MakeTreePicture(L, Lfin, NeedToCheck); // Our code is not deterministic, so labeling may vary
/*
digraph G {
    node [shape=circle, label=""];
    edge [arrowhead=none];
     1 -> { 2 3 4 5 6 7 8 9 10  };
     2 -> { 11 17  };
     3 -> { 19  };
     4 -> { 15 20  };
     5 -> { 12 18  };
     6 -> { 14  };
     7 -> { 13  };
     8 -> { 16  };
     9 -> { 21  };
     10 -> { 13 14 15 16 17 18 19 21  };
     13  [style=filled, fillcolor=black];
     14  [style=filled, fillcolor=black];
     15  [style=filled, fillcolor=black];
     16  [style=filled, fillcolor=black];
     17  [style=filled, fillcolor=black];
     18  [style=filled, fillcolor=black];
     19  [style=filled, fillcolor=black];
     21  [style=filled, fillcolor=black];
     10  [style=filled, fillcolor=gray];
     11  [style=filled, fillcolor=gray];
     12  [style=filled, fillcolor=gray];
     20  [style=filled, fillcolor=gray];
}
*/
IdentifyCurvesX(NeedToCheck, K);
/*
Identified curve  1  :  28.64.3.b.1
Identified curve  2  :  21.32.1.a.1
Identified curve  3  :  42.48.2.d.1
Identified curve  4  :  126.48.2.a.1
[ 28.64.3.b.1, 21.32.1.a.1, 42.48.2.d.1, 126.48.2.a.1 ]
*/

// Check commutator index of each group in Linf
for H in Linf do
	lvl := #BaseRing(H[1]);
	Hlift := GL2Lift(H[1], 6 * lvl);
	_,_,ind:=FindCommutatorSubgroup(Hlift);ind;
end for;
/*
12
2
2
2
2
2
2
2
4
*/