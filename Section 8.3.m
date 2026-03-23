load "OpenImage-master/main/GL2GroupTheory.m"; // Modify the path as needed
load "OpenImage-master/main/ModularCurves.m"; // Modify the path as needed
P<x>:=PolynomialRing(Rationals());

// 8.3.1: Maximal products with finitely many points
// The following are elliptic curves of rank 0
// Their only rational points are either cusps or CM points.

// 6.24.1.a.1
P<x>:=PolynomialRing(Rationals());
f:=x^3-27;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2

//12.24.1.b.1
P<x>:=PolynomialRing(Rationals());
f:=x^3+27;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2

//12.72.1.d.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 -1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2

//12.72.1.f.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 +1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//6

//18.24.1.a.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 -27;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2

//24.24.1.bx.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 +216;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2

//24.72.1.t.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 -8;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2

//36.24.1.a.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 +27;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2

//36.72.1.b.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 -1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2

//36.72.1.c.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 +1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//6

//72.24.1.a.1
x:=AssociativeArray();
P:=ProjectiveSpace(Rationals(),2);
for i in [1..3] do;
x[i]:=P.i;
end for;
C:=Curve(P,[
-x[1]^2*x[3] + 6*x[2]^3 + 6*x[3]^3
]); // Model computed from Zywina's OpenImage Github
Pts:=PointSearch(C,1000);
E:=EllipticCurve(C,Pts[1]);
Rank(E);//0
TorsionSubgroup(E);//2

//72.72.1.d.1
x:=AssociativeArray();
P:=ProjectiveSpace(Rationals(),2);
for i in [1..3] do;
x[i]:=P.i;
end for;
C:=Curve(P,[
4*x[1]^2*x[2] - 2*x[1]*x[2]^2 + 4*x[1]*x[3]^2 + x[2]^3 + 2*x[2]*x[3]^2
]);
Pts:=PointSearch(C,1000);
E:=EllipticCurve(C,Pts[1]);
Rank(E);//0
TorsionSubgroup(E);//2

// The elliptic curve 12.32.1.b.1 is of rank $0$ and has eight rational points. 
// It has non-CM j-invariants discussed in the paper.
//12.32.1.b.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 + x^2 - 24*x + 36;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//8

// The following genus 2 curves are all rank 0.
// Using Chabauty0, we compute all the rational points. 
// All of their rational points, if any exist, are either cusps or CM points. 

//18.36.2.d.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 +1;
g:=-9*x^3;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//6

//18.72.2.b.1
P<x>:=PolynomialRing(Rationals());
f:= 0;
g:=x^5 - x^4 - 3*x^3 + 4*x^2 - x;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//3

//18.72.2.b.2
P<x>:=PolynomialRing(Rationals());
f:= 0;
g:= - x^5 - x^4 + 3*x^3 + 4*x^2 + x;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//3

//18.72.2.d.1
P<x>:=PolynomialRing(Rationals());
f:= 0;
g:= 3*x^6 - 9*x^5 - 9*x^4 + 33*x^3 - 9*x^2 - 9*x + 3;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//0

//18.108.2.a.1
P<x>:=PolynomialRing(Rationals());
f:= -(-x^3 - x - 1);
g:= - x^5 + 2*x^4 - 3*x^3 + x^2 - x;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//6

//18.108.2.b.1
P<x>:=PolynomialRing(Rationals());
f:= x^3+1;
g:=2*x^3;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//4

//18.108.2.c.1
P<x>:=PolynomialRing(Rationals());
f:= x^2+x;
g:=3*x^6 - 9*x^5 + 11*x^4 - 8*x^3 + 11*x^2 - 9*x + 3;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//0

//18.108.2.d.1
P<x>:=PolynomialRing(Rationals());
f:= x^3+x+1;
g:=x^5 + 2*x^4 + 2*x^3 + x^2;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//6

//18.108.2.d.2
P<x>:=PolynomialRing(Rationals());
f:= x^3+x+1;
g:=- x^5 + 2*x^4 - 3*x^3 + x^2 - x;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//6

//18.108.2.e.1
P<x>:=PolynomialRing(Rationals());
f:= x^2+x;
g:=3*x^6 - 9*x^5 + 11*x^4 - 8*x^3 + 11*x^2 - 9*x + 3;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//0

//36.72.2.a.1
P<x>:=PolynomialRing(Rationals());
f:= 0;
g:=- x^5 + x^4 + 3*x^3 - 4*x^2 + x;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//3

//36.72.2.a.2
P<x>:=PolynomialRing(Rationals());
f:= 0;
g:=x^5 + x^4 - 3*x^3 - 4*x^2 - x;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//3

//36.72.2.b.1
P<x>:=PolynomialRing(Rationals());
f:= 0;
g:=- 3*x^6 + 9*x^5 + 9*x^4 - 33*x^3 + 9*x^2 + 9*x - 3;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//0

//54.108.2.a.1
P<x>:=PolynomialRing(Rationals());
f:= x^3 +1;
g:=-3*x^3;
E:=HyperellipticCurve(g,f);E;
RankBounds(Jacobian(E)); //0
Chabauty0(Jacobian(SimplifiedModel(E)));//4

//72.72.2.a.1
x:=AssociativeArray();
P:=ProjectiveSpace(Rationals(),3);
for i in [1..4] do;
x[i]:=P.i;
end for;
C:=Curve(P,[
-x[1]*x[3]*x[4] + x[1]*x[4]^2 + x[2]*x[4]^2,
-x[1]*x[3]^2 + x[1]*x[3]*x[4] + x[2]*x[3]*x[4],
-x[1]^2*x[3] + x[1]^2*x[4] + x[1]*x[2]*x[4],
-x[1]*x[2]*x[3] + x[1]*x[2]*x[4] + x[2]^2*x[4],
-10*x[1]^2*x[3] - 2*x[1]^2*x[4] - x[1]*x[2]*x[3] - 7*x[1]*x[2]*x[4] + 12*x[2]^2*x[3] + 7*x[2]^2*x[4] + x[3]^3 - 6*x[3]^2*x[4] + 3*x[3]*x[4]^2 + x[4]^3,
-12*x[1]^3 - 18*x[1]^2*x[2] + 18*x[1]*x[2]^2 - 2*x[1]*x[3]^2 + x[1]*x[4]^2 + 12*x[2]^3 + x[2]*x[3]^2 - 3*x[2]*x[3]*x[4]
]); 
_,C1:=IsHyperelliptic(C);
J:=Jacobian(SimplifiedModel(C1));
RankBounds(J);//0
Chabauty0(J);//3

//72.72.2.a.2
x:=AssociativeArray();
P:=ProjectiveSpace(Rationals(),3);
for i in [1..4] do;
x[i]:=P.i;
end for;
C:=Curve(P,[
-x[1]*x[3]*x[4] + x[2]*x[3]^2 + x[2]*x[3]*x[4],
-x[1]*x[4]^2 + x[2]*x[3]*x[4] + x[2]*x[4]^2,
-x[1]^2*x[4] + x[1]*x[2]*x[3] + x[1]*x[2]*x[4],
-x[1]*x[2]*x[4] + x[2]^2*x[3] + x[2]^2*x[4],
x[1]^2*x[3] + x[1]*x[2]*x[3] - x[1]*x[2]*x[4] - x[2]^2*x[3] + 2*x[3]^2*x[4] + 2*x[3]*x[4]^2,
x[1]^3 - 3*x[1]*x[2]^2 + x[1]*x[3]*x[4] + x[2]^3 + x[2]*x[3]^2 + x[2]*x[3]*x[4]
]);
_,C1:=IsHyperelliptic(C);
J:=Jacobian(SimplifiedModel(C1));
RankBounds(J);//0
Chabauty0(J);//3

//72.72.2.b.1
x:=AssociativeArray();
P:=ProjectiveSpace(Rationals(),3);
for i in [1..4] do;
x[i]:=P.i;
end for;
C:=Curve(P,[
-x[1]*x[3]*x[4] - x[1]*x[4]^2 + x[2]*x[4]^2,
-x[1]*x[3]^2 - x[1]*x[3]*x[4] + x[2]*x[3]*x[4],
-x[1]^2*x[3] - x[1]^2*x[4] + x[1]*x[2]*x[4],
-x[1]*x[2]*x[3] - x[1]*x[2]*x[4] + x[2]^2*x[4],
-10*x[1]^2*x[3] + 2*x[1]^2*x[4] + x[1]*x[2]*x[3] - 7*x[1]*x[2]*x[4] + 12*x[2]^2*x[3] - 7*x[2]^2*x[4] - x[3]^3 - 6*x[3]^2*x[4] - 3*x[3]*x[4]^2 + x[4]^3,
-12*x[1]^3 + 18*x[1]^2*x[2] + 18*x[1]*x[2]^2 + 2*x[1]*x[3]^2 - x[1]*x[4]^2 - 12*x[2]^3 + x[2]*x[3]^2 + 3*x[2]*x[3]*x[4]
]);
_,C1:=IsHyperelliptic(C);
J:=Jacobian(SimplifiedModel(C1));
RankBounds(J);//0
Chabauty0(J);//3

//72.72.2.b.2
x:=AssociativeArray();
P:=ProjectiveSpace(Rationals(),3);
for i in [1..4] do;
x[i]:=P.i;
end for;
C:=Curve(P,[
x[1]*x[4]^2 + x[2]*x[3]*x[4],
x[1]*x[3]*x[4] + x[2]*x[3]^2,
x[1]*x[2]*x[4] + x[2]^2*x[3],
x[1]^2*x[4] + x[1]*x[2]*x[3],
x[1]^2*x[3] + x[1]*x[2]*x[4] - 2*x[2]^2*x[3] - x[2]^2*x[4] + 2*x[3]^2*x[4] + 2*x[3]*x[4]^2,
x[1]^3 - 3*x[1]*x[2]^2 + x[1]*x[3]*x[4] + x[1]*x[4]^2 + x[2]^3 - x[2]*x[3]^2 - x[2]*x[3]*x[4]
]);
_,C1:=IsHyperelliptic(C);
J:=Jacobian(SimplifiedModel(C1));
RankBounds(J);//0
Chabauty0(J);//3

//72.72.2.c.1
x:=AssociativeArray();
P:=ProjectiveSpace(Rationals(),3);
for i in [1..4] do;
x[i]:=P.i;
end for;
C:=Curve(P,[
-x[1]*x[4]^2 + x[2]*x[3]*x[4] + x[2]*x[4]^2,
-x[1]*x[3]*x[4] + x[2]*x[3]^2 + x[2]*x[3]*x[4],
-x[1]^2*x[4] + x[1]*x[2]*x[3] + x[1]*x[2]*x[4],
-x[1]*x[2]*x[4] + x[2]^2*x[3] + x[2]^2*x[4],
6*x[1]^2*x[3] + 7*x[1]^2*x[4] + 17*x[1]*x[2]*x[3] - 11*x[1]*x[2]*x[4] - 8*x[2]^2*x[3] - 2*x[2]^2*x[4] - x[3]^3 + 3*x[3]^2*x[4] + 6*x[3]*x[4]^2 + x[4]^3,
-6*x[1]^3 - 18*x[1]^2*x[2] + 36*x[1]*x[2]^2 + x[1]*x[3]^2 - 3*x[1]*x[3]*x[4] - x[1]*x[4]^2 - 6*x[2]^3 - x[2]*x[3]^2 - 2*x[2]*x[3]*x[4]
]);
_,C1:=IsHyperelliptic(C);
J:=Jacobian(SimplifiedModel(C1));
RankBounds(J);//0
Chabauty0(J);//0

// analysis for 72.72.2.d.1
//72.72.2.d.1

N:=72;
GL2:=GL(2,Integers(N));
gens := [[3, 2, 5, 69], [15, 41, 58, 11], [38, 27, 29, 34], [55, 53, 45, 62]];
X:=CreateModularCurveRec(N,gens);
C:=FindModelOfXG(X,65)`psi;
C; 
/*[
-x[1]*x[4]^2 + x[2]*x[3]*x[4],
-x[1]*x[3]*x[4] + x[2]*x[3]^2,
-x[1]*x[2]*x[4] + x[2]^2*x[3],
-x[1]^2*x[4] + x[1]*x[2]*x[3],
-6*x[1]^2*x[3] + 9*x[1]^2*x[4] + 9*x[1]*x[2]*x[3] + 18*x[1]*x[2]*x[4] + 18*x[2]^2*x[3] + 6*x[2]^2*x[4] - x[3]^3 - 6*x[3]^2*x[4] - 3*x[3]*x[4]^2 + x[4]^3,
-6*x[1]^3 + 18*x[1]^2*x[2] + 36*x[1]*x[2]^2 - x[1]*x[3]^2 - 3*x[1]*x[3]*x[4] - x[1]*x[4]^2 + 6*x[2]^3 - 3*x[2]*x[3]^2 - 2*x[2]*x[3]*x[4] + x[2]*x[4]^2
]*/
PointsViaLifting(C,2,2);//empty

// 8.3.2: Products with infinitely many rational points
//6.24.1.b.1
P<x>:=PolynomialRing(Rationals());
f:=x^3+1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//6 points
// the curves 18.72.3.j.1, 18.72.3.n.1 and 18.72.3.m.1 cover 6.24.1.b.1 all cover 6.24.1.b.1 as well.

//18.24.1.b.1
P<x>:=PolynomialRing(Rationals());
f:=x^3+1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//6 points
// the curves 18.72.3.k.1, 18.72.3.k.2, 18.72.3.o.1 and 54.72.3.c.1 cover 18.24.1.b.1 as well.

//18.72.1.e.1
P<x>:=PolynomialRing(Rationals());
f:=x^3-7;
g:=P!1;
E:=EllipticCurve(f,g);
Rank(E); //0
TorsionSubgroup(E);//3 points

// 54.72.3.d.1
P<x,y,z>:=ProjectiveSpace(Rationals(),2);
C:=Curve(P,[x^3*y + x^3*z + 3*y^3*z + 3*y^2*z^2 + 3*y*z^3]);

phi:=iso<C->C|[x,z,y],[x,z,y]>;
G:=AutomorphismGroup(C,[phi]);
CG,prj:=CurveQuotient(G);
Pts:=PointSearch(C,100);
point:=prj(Pts[1]);
E:=EllipticCurve(CG,point);
Rank(E);//1 true

//******************************

for p in [5,7,13] do;
Cp:=Curve(Reduction(C,p));
ClassGroup(Cp);
end for; 

// Jacobian is a subgroup of Z/3 x Z/3
//*********************************

P1:=C![1,0,0];
P2:=C![0,1,0];
P3:=C![0,0,1];
D1:=Divisor(P1)-Divisor(P2);
IsPrincipal(3*D1);IsPrincipal(D1);

D2:=Divisor(P2)-Divisor(P3);

IsPrincipal(3*D2);IsPrincipal(D2);

[<[a,b], IsLinearlyEquivalent(a*D1,b*D2)> : a,b in [0..2]];

 p := 5; 
  Cp := Curve(Reduction(C,p)); 
    i := map<Cp -> Cp | [C.1,C.3,C.2], [C.1,C.3,C.2]>;
   pts := {@ Cp![0,1,0], Cp![0,0,1], Cp![1,0,0] @};
    D1 := Divisor(Cp![1,0,0]) - Divisor(Cp![0,1,0]); 
    D2 := Divisor(Cp![0,1,0]) - Divisor(Cp![0,0,1]); 
  [<pt, a,b> : pt in pts, a,b in [0..2] | IsLinearlyEquivalent(a*D1 + b*D2, Divisor(pt) - Divisor(i(pt)) )];    
  
//[ <(1 : 0 : 0), 0, 0>, <(0 : 1 : 0), 0, 1>, <(0 : 0 : 1), 0, 2> ]

//18.72.2.e.1 and 18.72.2.e.2
P<x>:=PolynomialRing(Rationals());
f:= - 3*x^5 + 3*x^4 + 9*x^3 - 12*x^2 + 3*x;
C:=HyperellipticCurve(f);
Chabauty0(Jacobian(C)); //3, all cusps.
g:=3*x^5 + 3*x^4 - 9*x^3 - 12*x^2 - 3*x;
C:=HyperellipticCurve(g);
Chabauty0(Jacobian(C)); //3, all cusps.

//54.72.4.e.1
Pol<x,y,z,w> := PolynomialRing(Rationals(), 4);

// Canonical model
model_0 := [3*x*y-z*w,3*x^3+3*y^2*z-y*z^2+6*x^2*w+6*x*w^2+3*w^3];
C:=Curve(ProjectiveSpace(Rationals(),3),model_0);
Pts:=PointSearch(C,1000);

// j-invariant map from the canonical model
//   Coordinate number 0:
map_0_coord_0 := 2^4*3^7*(18226*x^2*z^9*w+36772*x^2*z^6*w^4+10584*x^2*z^3*w^7-6558*x*z^9*w^2+22890*x*z^6*w^5+19980*x*z^3*w^8+59049*y^12+157464*y^9*w^3+52488*y^6*w^6+8748*y^3*w^9+5102*y^2*z^10+59510*y^2*z^7*w^3+14094*y^2*z^4*w^6+26244*y^2*z*w^9-1944*y*z^11-48096*y*z^8*w^3-32112*y*z^5*w^6+36936*y*z^2*w^9+81*z^12+24062*z^9*w^3+70352*z^6*w^6+50220*z^3*w^9);
//   Coordinate number 1:
map_0_coord_1 := 1*(x^2*z^9*w-351*x^2*z^6*w^4+14823*x^2*z^3*w^7+45927*x^2*w^10+3*x*z^9*w^2-999*x*z^6*w^5+35721*x*z^3*w^8+45927*x*w^11-y^2*z^10+405*y^2*z^7*w^3-26487*y^2*z^4*w^6-59049*y^2*z*w^9+18*y*z^8*w^3-4860*y*z^5*w^6+74358*y*z^2*w^9+5*z^9*w^3-1539*z^6*w^6+42039*z^3*w^9-59049*w^12);
for p in Pts do;
Evaluate(map_0_coord_0,[p[1],p[2],p[3],p[4]]);
Evaluate(map_0_coord_1,[p[1],p[2],p[3],p[4]]);
end for;
