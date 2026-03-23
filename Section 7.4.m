load "OpenImage-master/main/GL2GroupTheory.m"; // Modify the path as needed
load "OpenImage-master/main/ModularCurves.m"; // Modify the path as needed

//312.28.1.a.1
N := 312;
gens := [[20, 71, 75, 76], [35, 306, 7, 139], [223, 203, 61, 120], [226, 23, 1, 256], [259, 39, 271, 218]];
gens := [ Eltseq(Transpose(Matrix(2,2,g))) : g in gens];
X:=CreateModularCurveRec(N,gens);
C:=FindModelOfXG(X,80)`psi;
C;
P:=ProjectiveSpace(Rationals(),2);
for i in [1..3] do;
	x[i]:=P.i;
end for;
C:=Curve(P, C);
Pts:=PointSearch(C,1000);
E:=EllipticCurve(C,Pts[1]);
Rank(E);//0
TorsionSubgroup(E);//2
