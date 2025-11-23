load "Approach_Lattice.m";

// Possible 5-adic images containing -I for elliptic curve 
// over Q admitting a rational 5-isogeny. From Proposition 19.
Possible5AdicImages := ["5.6.0.a.1", "5.12.0.a.1", "5.12.0.a.2", "5.30.0.a.1", "25.30.0.a.1", "5.60.0.a.1", "25.60.0.a.1", "25.60.0.a.2"];

K1 := OurModCrvs["5.6.0.a.1"][5]; // X0(5)
K2 := OurModCrvs["5.30.0.a.1"][5]; // Xsp(5)
K3 := OurModCrvs["25.30.0.a.1"][5]; // X0(25)

// Commutator index for each possible 5-adic image
// We see that each group with commutator index 600 is a subgroup of Xsp(5) or X0(25).
for lbl in Possible5AdicImages do
	G := OurModCrvs[lbl][5];
	_, _, ind := FindCommutatorSubgroup(G); ind;
	print lbl, "Commutator index:", ind;
	if IsConjSub(GL2Lift(G,25), GL2Lift(K1,25)) then
		print lbl, "is a subgroup of X0(5).";
	end if;
	if IsConjSub(GL2Lift(G,25), GL2Lift(K2,25)) then
		print lbl, "is a subgroup of Xsp(5).";
	end if;
	if IsConjSub(GL2Lift(G,25), K3) then
		print lbl, "is a subgroup of X0(25).";
	end if;
	print " ";
end for;
/*
5.6.0.a.1 Commutator index: 24
5.6.0.a.1 is a subgroup of X0(5).

5.12.0.a.1 Commutator index: 24
5.12.0.a.1 is a subgroup of X0(5).

5.12.0.a.2 Commutator index: 24
5.12.0.a.2 is a subgroup of X0(5).

5.30.0.a.1 Commutator index: 600
5.30.0.a.1 is a subgroup of X0(5).
5.30.0.a.1 is a subgroup of Xsp(5).

25.30.0.a.1 Commutator index: 600
25.30.0.a.1 is a subgroup of X0(5).
25.30.0.a.1 is a subgroup of X0(25).

5.60.0.a.1 Commutator index: 600
5.60.0.a.1 is a subgroup of X0(5).
5.60.0.a.1 is a subgroup of Xsp(5).

25.60.0.a.1 Commutator index: 600
25.60.0.a.1 is a subgroup of X0(5).
25.60.0.a.1 is a subgroup of X0(25).
*/


// Lattice associated with X_0(5)
L2 := [OurModCrvs[lbl] : lbl in ["2.3.0.a.1", "4.4.0.a.1", "8.2.0.a.1", "8.6.0.f.1", "8.6.0.d.1", "8.6.0.a.1"] ];
L3 := [OurModCrvs[lbl] : lbl in ["3.3.0.a.1", "3.4.0.a.1", "3.6.0.b.1", "9.9.0.a.1"] ];
K := OurModCrvs["5.6.0.a.1"][5];
L := ConstructLattice(Gl(6), K, L2, L3);
L, Linf, Lfin, NeedToCheck := MakeSubLats(L);
MakeTreePicture(L, Lfin, NeedToCheck); // Our code is not deterministic, so labeling may vary
/*
digraph G {
    node [shape=circle, label=""];
    edge [arrowhead=none];
     1 -> { 2 3 4 5 6 7 8 9 10  };
     2 -> { 28 32  };
     3 -> { 16 24 47 48  };
     4 -> { 23 39 46  };
     5 -> { 22 36  };
     6 -> { 27 41  };
     7 -> { 11 13 14 19 20 22 23 24 25 26 27 29 30 31 32 34 37 43 44 45 49 50 71  };
     8 -> { 12 15 16 17 18 21 28 33 35 36 38 39 40 41 42 49 51  };
     9 -> { 48 71  };
     10 -> { 46 47 51  };
     11 -> { 57  };
     12 -> { 62 70 78 89  };
     13 -> { 54 55 56 57 76 77 86  };
     14 -> { 52 53 58 72 75 80 87  };
     15 -> { 66 68 83 85  };
     16 -> { 59 64 73 92  };
     17 -> { 60 61 64 66 79 90  };
     18 -> { 59 65 69 70 81 91  };
     19 -> { 54  };
     21 -> { 62 64  };
     22 -> { 52 57  };
     23 -> { 72 82  };
     24 -> { 55 73  };
     25 -> { 58  };
     26 -> { 53  };
     27 -> { 53 56  };
     28 -> { 61 69  };
     31 -> { 55 72  };
     32 -> { 54 58  };
     33 -> { 67 69  };
     35 -> { 61 63  };
     36 -> { 60 65  };
     37 -> { 52  };
     38 -> { 59 68 74 88  };
     39 -> { 62 63 67 68 82 84  };
     40 -> { 60 67  };
     41 -> { 66 70  };
     42 -> { 63 65  };
     45 -> { 56  };
     46 -> { 84  };
     47 -> { 92  };
     49 -> { 73 74 77 78 79 80 81 82 83  };
     50 -> { 75 76  };
     51 -> { 84 85 88 89 90 91 92  };
     71 -> { 86 87  };
     22  [style=filled, fillcolor=black];
     27  [style=filled, fillcolor=black];
     28  [style=filled, fillcolor=black];
     32  [style=filled, fillcolor=black];
     36  [style=filled, fillcolor=black];
     41  [style=filled, fillcolor=black];
     46  [style=filled, fillcolor=black];
     47  [style=filled, fillcolor=black];
     48  [style=filled, fillcolor=black];
     51  [style=filled, fillcolor=black];
     52  [style=filled, fillcolor=black];
     53  [style=filled, fillcolor=black];
     54  [style=filled, fillcolor=black];
     55  [style=filled, fillcolor=black];
     56  [style=filled, fillcolor=black];
     57  [style=filled, fillcolor=black];
     58  [style=filled, fillcolor=black];
     60  [style=filled, fillcolor=black];
     61  [style=filled, fillcolor=black];
     62  [style=filled, fillcolor=black];
     63  [style=filled, fillcolor=black];
     64  [style=filled, fillcolor=black];
     65  [style=filled, fillcolor=black];
     66  [style=filled, fillcolor=black];
     67  [style=filled, fillcolor=black];
     69  [style=filled, fillcolor=black];
     70  [style=filled, fillcolor=black];
     71  [style=filled, fillcolor=black];
     72  [style=filled, fillcolor=black];
     73  [style=filled, fillcolor=black];
     74  [style=filled, fillcolor=black];
     75  [style=filled, fillcolor=black];
     76  [style=filled, fillcolor=black];
     77  [style=filled, fillcolor=black];
     78  [style=filled, fillcolor=black];
     79  [style=filled, fillcolor=black];
     80  [style=filled, fillcolor=black];
     81  [style=filled, fillcolor=black];
     82  [style=filled, fillcolor=black];
     83  [style=filled, fillcolor=black];
     84  [style=filled, fillcolor=black];
     85  [style=filled, fillcolor=black];
     86  [style=filled, fillcolor=black];
     87  [style=filled, fillcolor=black];
     88  [style=filled, fillcolor=black];
     89  [style=filled, fillcolor=black];
     90  [style=filled, fillcolor=black];
     91  [style=filled, fillcolor=black];
     92  [style=filled, fillcolor=black];
     2  [style=filled, fillcolor=gray];
     5  [style=filled, fillcolor=gray];
     6  [style=filled, fillcolor=gray];
     9  [style=filled, fillcolor=gray];
     10  [style=filled, fillcolor=gray];
     11  [style=filled, fillcolor=gray];
     19  [style=filled, fillcolor=gray];
     20  [style=filled, fillcolor=gray];
     21  [style=filled, fillcolor=gray];
     23  [style=filled, fillcolor=gray];
     24  [style=filled, fillcolor=gray];
     25  [style=filled, fillcolor=gray];
     26  [style=filled, fillcolor=gray];
     29  [style=filled, fillcolor=gray];
     30  [style=filled, fillcolor=gray];
     31  [style=filled, fillcolor=gray];
     33  [style=filled, fillcolor=gray];
     34  [style=filled, fillcolor=gray];
     35  [style=filled, fillcolor=gray];
     37  [style=filled, fillcolor=gray];
     40  [style=filled, fillcolor=gray];
     42  [style=filled, fillcolor=gray];
     43  [style=filled, fillcolor=gray];
     44  [style=filled, fillcolor=gray];
     45  [style=filled, fillcolor=gray];
     49  [style=filled, fillcolor=gray];
     50  [style=filled, fillcolor=gray];
     59  [style=filled, fillcolor=gray];
     68  [style=filled, fillcolor=gray];
}
*/
IdentifyCurvesX(NeedToCheck, K);
/*
Identified curve  1  :  120.36.3.a.1
Identified curve  2  :  120.36.3.c.1
Identified curve  3  :  30.36.1.q.1
Identified curve  4  :  30.36.1.r.1
Identified curve  5  :  30.54.2.a.1
Identified curve  6  :  15.36.1.b.1
Identified curve  7  :  120.12.1.bl.1
Identified curve  8  :  60.12.1.j.1
Identified curve  9  :  30.12.1.d.1
Identified curve  10  :  120.36.1.lq.1
Identified curve  11  :  120.36.1.sm.1
Identified curve  12  :  120.36.1.cw.1
Identified curve  13  :  120.36.1.so.1
Identified curve  14  :  45.54.2.c.1
Identified curve  15  :  60.36.1.dp.1
Identified curve  16  :  60.36.1.do.1
Identified curve  17  :  20.24.1.g.1
Identified curve  18  :  60.36.1.x.1
Identified curve  19  :  60.36.1.dr.1
Identified curve  20  :  60.36.1.gb.1
Identified curve  21  :  60.36.1.ga.1
Identified curve  22  :  60.36.1.w.1
Identified curve  23  :  120.72.3.bee.1
Identified curve  24  :  120.72.3.ka.1
Identified curve  25  :  15.24.1.a.1
Identified curve  26  :  120.36.1.ln.1
Identified curve  27  :  120.36.1.lm.1
Identified curve  28  :  120.36.1.lp.1
Identified curve  29  :  120.36.1.lo.1
[ 120.36.3.a.1, 120.36.3.c.1, 30.36.1.q.1, 30.36.1.r.1, 30.54.2.a.1,
15.36.1.b.1, 120.12.1.bl.1, 60.12.1.j.1, 30.12.1.d.1, 120.36.1.lq.1,
120.36.1.sm.1, 120.36.1.cw.1, 120.36.1.so.1, 45.54.2.c.1, 60.36.1.dp.1,
60.36.1.do.1, 20.24.1.g.1, 60.36.1.x.1, 60.36.1.dr.1, 60.36.1.gb.1,
60.36.1.ga.1, 60.36.1.w.1, 120.72.3.bee.1, 120.72.3.ka.1, 15.24.1.a.1,
120.36.1.ln.1, 120.36.1.lm.1, 120.36.1.lp.1, 120.36.1.lo.1 ]
*/


// Check commutator index of each group in Linf
for H in Linf do
	lvl := #BaseRing(H[1]);
	Hlift := GL2Lift(H[1], 6 * lvl);
	_,_,ind:=FindCommutatorSubgroup(Hlift);ind;
    print "...";
end for;



// Lattice associated with X_sp(5)
L2 := [];
L3 := [];
K := OurModCrvs["5.30.0.a.1"][5];
L := ConstructLattice(Gl(6), K, L2, L3);
L, Linf, Lfin, NeedToCheck := MakeSubLats(L);
MakeTreePicture(L, Lfin, NeedToCheck); // Our code is not deterministic, so labeling may vary
/*
digraph G {
    node [shape=circle, label=""];
    edge [arrowhead=none];
     1 -> { 2 3 4 5  };
     2  [style=filled, fillcolor=gray];
     3  [style=filled, fillcolor=gray];
     4  [style=filled, fillcolor=gray];
     5  [style=filled, fillcolor=gray];
}
*/
IdentifyCurvesX(NeedToCheck, K);
/*
Identified curve  1  :  60.60.3.h.1
Identified curve  2  :  120.60.3.bf.1
Identified curve  3  :  120.60.3.z.1
Identified curve  4  :  30.60.3.c.1
[ 60.60.3.h.1, 120.60.3.bf.1, 120.60.3.z.1, 30.60.3.c.1 ]
*/

// Check commutator index of each group in in Linf
for H in Linf do
	lvl := #BaseRing(H[1]);
	Hlift := GL2Lift(H[1], 6 * lvl);
	_,_,ind:=FindCommutatorSubgroup(Hlift);ind;
    print "...";
end for;
/*
2
*/

// Lattice associated with X_0(25)
L2 := [];
L3 := [];
K := OurModCrvs["25.30.0.a.1"][5];
L := ConstructLattice(Gl(6), K, L2, L3);
L, Linf, Lfin, NeedToCheck := MakeSubLats(L);
MakeTreePicture(L, Lfin, NeedToCheck); // Our code is not deterministic, so labeling may vary
/*
digraph G {
    node [shape=circle, label=""];
    edge [arrowhead=none];
     1 -> { 2 3 4 5  };
     2  [style=filled, fillcolor=gray];
     3  [style=filled, fillcolor=gray];
     4  [style=filled, fillcolor=gray];
     5  [style=filled, fillcolor=gray];
}
*/
IdentifyCurvesX(NeedToCheck, K);
/*
Identified curve  1  :  300.60.3.a.1
Identified curve  2  :  24.2.0.a.1 x 25.30.0.a.1
Identified curve  3  :  24.2.0.b.1 x 25.30.0.a.1
Identified curve  4  :  150.60.3.a.1
[ 300.60.3.a.1, 24.2.0.a.1 x 25.30.0.a.1, 24.2.0.b.1 x 25.30.0.a.1, 150.60.3.a.1 ]
*/

// Check commutator index of each group in in Linf
for H in Linf do
	lvl := #BaseRing(H[1]);
	Hlift := GL2Lift(H[1], 6 * lvl);
	_,_,ind:=FindCommutatorSubgroup(Hlift);ind;
    print "...";
end for;
/*
2
*/