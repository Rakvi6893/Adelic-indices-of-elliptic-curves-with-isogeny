load "Approach_Lattice.m";

// Possible 13-adic images containing -I for elliptic curve 
// over Q admitting a rational 13-isogeny. From Proposition 21.
Possible13AdicImages := ["13.14.0.a.1", "13.28.0.a.1", "13.28.0.a.2", "13.42.0.a.2", "13.42.0.a.1", "13.42.0.b.1"];

// Checking commutator index of each group in Possible13AdicImages
for lbl in Possible13AdicImages do
    _, _, ind := FindCommutatorSubgroup(OurModCrvs[lbl][5]); ind;
end for;
/*
168
168
168
168
168
168
*/


// Lattice associated with X_0(13)
L2 := [OurModCrvs["8.2.0.a.1"]];
L3 := [];
K := OurModCrvs["13.14.0.a.1"][5];
L := ConstructLattice(Gl(6), K, L2, L3);
L, Linf, Lfin, NeedToCheck := MakeSubLats(L); // Our code is not deterministic, so labeling may vary
MakeTreePicture(L, Lfin, NeedToCheck);
/*
digraph G {
    node [shape=circle, label=""];
    edge [arrowhead=none];
     1 -> { 2 3 4 5 6  };
     5 -> { 7  };
     4  [style=filled, fillcolor=gray];
     7  [style=filled, fillcolor=gray];
}
*/
IdentifyCurvesX(NeedToCheck, K);
/*
Identified curve  1  :  312.28.1.a.1
Identified curve  2  :  78.84.5.b.1
[ 312.28.1.a.1, 78.84.5.b.1 ]
*/

// Check commutator index of each group in Linf
for H in Linf do
	lvl := #BaseRing(H[1]);
	Hlift := GL2Lift(H[1], 6 * lvl);
	_,_,ind:=FindCommutatorSubgroup(Hlift);ind;
end for;
/*
2
2
2
2
2
*/