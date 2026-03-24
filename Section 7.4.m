ChangeDirectory("Modular-main"); // Modify the path as needed
AttachSpec("Modular.spec");

//312.28.1.a.1
N := 312;
gens := [[20, 71, 75, 76], [35, 306, 7, 139], [223, 203, 61, 120], [226, 23, 1, 256], [259, 39, 271, 218]];
gens := [ Eltseq(Transpose(Matrix(2,2,g))) : g in gens];
X:=CreateModularCurveRec(N,gens);
C:=FindModelOfXG(X)`psi;
C;
// [
//    78*x[1]^2*x[2] - 36*x[1]*x[2]^2 + x[1]*x[3]^2 + 6*x[2]^3
// ]
P:=ProjectiveSpace(Rationals(),2);
C:=Curve(P, C);
Pts:=PointSearch(C,1000);
E:=EllipticCurve(C,Pts[1]);
Rank(E);//0
TorsionSubgroup(E);//2
