load "OpenImage-master/main/GL2GroupTheory.m"; // Modify the path as needed
load "OpenImage-master/main/ModularCurves.m"; // Modify the path as needed

// 8.2.1: Maximal products with finitely many points
// Out of the 34, 16 are elliptic curves of rank 0 with only cuspidal or CM rational points:

//6.18.1.a.1

f:= x^3 + 1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //6 points

//12.18.1.a.1

f:= x^3 - 1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//12.18.1.b.1

f:= x^3 - 1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//12.18.1.c.1

f:= x^3 + 1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //6 points

//12.36.1.bo.1

f:=  x^3 - x^2 - 4*x + 4;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //8 points

//12.36.1.bq.1

f:= x^3 + x^2 - 4*x - 4;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //4 points

//12.36.1.bs.1

f:= x^3 -1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//12.36.1.bt.1

f:= x^3 +1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //6 points

//24.18.1.a.1

f:= x^3 - 8;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//24.18.1.d.1

f:= x^3 - 8;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//24.36.1.fc.1

f:= x^3 - x^2 - 17*x - 15;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //4 points

//24.36.1.fi.1

f:=x^3 + x^2 - 17*x + 15;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //4 points

//24.36.1.fo.1

f:= x^3 - 8;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//24.36.1.fp.1

f:= x^3 +1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //6 points
Pts:=Points(E:Bound:=100);

//Computing j invariants using j-map

Pol<x,y,z> := PolynomialRing(Rationals(), 3);

map_0_coord_0 := 2^6*((2*y^2-3*z^2)^3*(2*y^2-z^2)^3);

map_0_coord_1 := 1*(z^8*(y-z)^2*(y+z)^2);
for i in [1..6] do;
x:=Pts[i][1];
y:=Pts[i][2];
z:=Pts[i][3];
Evaluate(map_0_coord_0,[x,y,z]);
Evaluate(map_0_coord_1,[x,y,z]); // j-invariant is quotient of these
print ".....";
end for;

// j-invariants are 1728 and 16581375 both are CM

//24.36.1.fx.1

f:= x^3 -8;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//24.36.1.gk.1

f:= x^3 - 1;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//Next, several are amenable to Chabauty techniques:
// The subsequent two curves both share Weierstrass model y^2 = 2*x^6 + 2
// From Table 1 in the paper, this provably has 4 rational points.
// j-map computations:

//24.36.2.ba.1
P<x,y,z,w,t>:=ProjectiveSpace(Rationals(),4);
C:=Curve(P,[-x*w + y^2, 4*z^2 + w^2 - 2*t^2, 4*x*y + z*w, 4*x^2 + y*z]);
Pts:=PointSearch(C,1000);

map_0_coord_0 := 2^6*((3*w^2+2*t^2)^3);

map_0_coord_1 := 1*(w^2*(w^2-2*t^2)^2);
for i in [1..4] do;
x:=Pts[i][1];
y:=Pts[i][2];
z:=Pts[i][3];
w:=Pts[i][4];
t:=Pts[i][5];
Evaluate(map_0_coord_0,[x,y,z,w,t]);
Evaluate(map_0_coord_1,[x,y,z,w,t]); // j-invariant is quotient of these
print ".....";
end for;

//only j-invariant is 8000 which is a CM j-invariant

//24.72.2.jo.1
P<x,y,z,w,t>:=ProjectiveSpace(Rationals(),4);
C:=Curve(P,[x^2 - y*z, 2*x*y - z*t, -x*t + 2*y^2, 4*z^2 - 2*w^2 + t^2]);
Pts:=PointSearch(C,1000);

map_0_coord_0 := -2^6*((2*w^2-3*t^2)^3*(2*w^2+t^2)^3);

map_0_coord_1 := 1*(t^4*(2*w^2-t^2)^4);
for i in [1..4] do;
x:=Pts[i][1];
y:=Pts[i][2];
z:=Pts[i][3];
w:=Pts[i][4];
t:=Pts[i][5];
Evaluate(map_0_coord_0,[x,y,z,w,t]);
Evaluate(map_0_coord_1,[x,y,z,w,t]); // j-invariant is quotient of these
print ".....";
end for;

//only j-invariant is 1728 which is a CM j-invariant

//24.72.2.hp.1
f:=x^3 + 2;
g:=x^3;
H:=HyperellipticCurve(f,g);
H1:=SimplifiedModel(H);
J:=Jacobian(H1);
Chabauty0(J); //2 points


//24.72.2.hp.2
f:=x^3 + 2;
g:=x^3;
H:=HyperellipticCurve(f,g);
H1:=SimplifiedModel(H);
J:=Jacobian(H1);
Chabauty0(J); // 2 points


// technique of section 3.2
//48.72.3.h.1

P<x,y,z>:=ProjectiveSpace(Rationals(),2);
C:=Curve(P,[x^3*y + y^4 + 4*y^2*z^2 + 2*z^4]);
PointSearch(C,1000);
B:=AutomorphismGroup(C);B.1;
A1 := AutomorphismGroup(C,[B.1]);
X1, mp1 := CurveQuotient(A1);Genus(X1);

E:=EllipticCurve(X1,X1![0,1,0,0]);
Rank(E);  // 1


Cp:=Curve(Reduction(C,13)); // Z/56 + Z/56 mod 13
ClassGroup(Cp);
Cp:=Curve(Reduction(C,17)); // Z/18 + Z/18 + Z/18 mod 17
ClassGroup(Cp);
// looking mod 13 and 17 Z/2 x Z/2 is an upper bound

// looking mod 5 we find that there are no divisors of the form Z/2 x Z/2

Cp:=Curve(Reduction(C,5));

Pts:=Points(Cp);
for p in Pts do;
for  q in Pts do;
D:=Divisor(p)-Divisor(q);
IsPrincipal(2*D);
IsPrincipal(D);
print ".......";
end for;
end for;

//48.72.3.i.2
P<x,y,z>:=ProjectiveSpace(Rationals(),2);
C:=Curve(P,[2*x^4 + 4*x^2*y^2 - 2*x*z^3 + y^4]);
PointSearch(C,1000);
B:=AutomorphismGroup(C);B.1;
A1 := AutomorphismGroup(C,[B.1]);
X1, mp1 := CurveQuotient(A1);Genus(X1);
E:=EllipticCurve(X1,mp1(C![0,0,1]));
Rank(E); //1

Cp:=Curve(Reduction(C,13)); // Z/56 + Z/56 mod 13
ClassGroup(Cp);
Cp:=Curve(Reduction(C,17)); // Z/18 + Z/18 + Z/18 mod 17
ClassGroup(Cp);
// looking mod 13 and 17 Z/2 x Z/2 is an upper bound

// looking mod 17 we find that there are no divisors of the form Z/2 x Z/2


Pts:=Points(Cp);
for p in Pts do;
for q in Pts do;
D:=Divisor(p)-Divisor(q);
IsPrincipal(2*D);
IsPrincipal(D);
print ".......";
end for;
end for;

// 8.2.2: Products with infinitely many rational points

// Many of the necessary curves to consider cover a rank 0 elliptic curve with no non-CM rational points.
// 48.144.9.bep.1 covers 12.18.1.g.1
f:=x^3 + 6*x + 7;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// 48.144.5.gb.1 and 48.144.5.fx.1 both cover 12.36.1.bx.1
f:= x^3 + x^2 + x;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// 48.144.5.gw.1 and 48.144.5.ha.1 both cover 12.36.1.bu.1
f:= x^3 + 27;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// 48.288.15.cyo.1, 48.144.5.gk.1, 48.144.5.fw.1, and 48.144.5.ga.1 all cover 12.36.1.bw.1
f:=x^3 - x^2 + x;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//4 points

// 48.288.21.ezh.1, 48.288.17.fay.1, 48.288.17.faz.1, and 48.288.21.ezi.1 all cover 12.36.1.bn.1
f:=  x^3 - 39*x - 70;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//4 points

// 48.288.15.cyv.1 and 48.144.5.gu.1 each cover 24.36.1.gi.1
f:=x^3 +27;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points'

// 48.144.7.zv.1, 48.144.7.ze.1, 48.144.3.t.1, and 48.144.3.t.2 all cover 24.72.1.ef.1
f:=x^3 -x;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//4 points

// 48.288.15.ceb.1, 48.288.15.cdy.1, 48.144.5.gd.1, and 48.144.5.fz.1 all cover 24.36.1.gb.1
f:= x^3 + x^2 + 3*x + 3;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// 48.144.3.z.2 covers 24.36.1.gq.1
f:=x^3 + 36*x;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// 48.144.3.z.1 covers 24.36.1.gn.1
f:=x^3 +x;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// 48.144.5.gj.1, 48.144.5.ge.1, and 48.144.5.gf.1 all cover 24.36.1.ge.1
f:=x^3 - x^2 + x;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//4 points

// 48.144.5.eg.2 covers 48.24.1.j.1
f:=x^3 + 24*x - 160;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// 48.144.5.gy.1 covers 48.24.1.n.2
f:= x^3 - 18*x;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// Many necessary curves cover a genus 2 curve for which Chabauty0 is applicable:
// 48.144.5.ex.2, 48.144.5.ej.2, 48.144.5.el.2, and 48.144.5.ev.2 all cover 24.72.2.hn.2
f:=3*x^6 + 6*x^5 + 9*x^4 + 9*x^2 - 6*x + 3;
C:=HyperellipticCurve(f);
Chabauty0(Jacobian(C)); // no points

// 48.144.5.fa.2 and 48.144.5.eg.1 each cover 24.72.2.hj.2
f:=3*x^6 + 12*x^3 + 24;
C:=HyperellipticCurve(f);
Chabauty0(Jacobian(C));// no points

// 48.144.5.ev.1, 48.144.5.el.1, 48.144.5.ej.1, and 48.144.5.ex.1 all cover 24.72.2.hn.1
f:=3*x^6 + 6*x^5 + 9*x^4 + 9*x^2 - 6*x + 3;
C:=HyperellipticCurve(f);
Chabauty0(Jacobian(C));// no points

// 48.144.5.eq.2, 48.144.5.eo.2, 48.144.5.em.2, and 48.144.5.es.2 all cover 24.72.2.hl.1
f:=-x^3-x;
g:=-(-x^3 - x^2 - x - 1);
C:=HyperellipticCurve(f,g);C;
Chabauty0(Jacobian(SimplifiedModel(C)));//4 points

// 48.144.5.eq.1, 48.144.5.eo.1, 48.144.5.em.1, and 48.144.5.es.1 all cover 24.72.2.hl.2
f:=-x^5-x^3;
g:=-(-x^3 - x^2 - x - 1);
C:=HyperellipticCurve(f,g);C;
Chabauty0(Jacobian(SimplifiedModel(C)));//4 points

// 48.144.5.fa.1 covers 24.72.2.hj.1
P<x>:=PolynomialRing(Rationals());
f:= 3*x^6 + 12*x^3 + 24;
C:=HyperellipticCurve(f);
Chabauty0(Jacobian(C));//no points

// Next, several curves have local obstructions:
// over Q2
//48.144.3.bd.2
Pol<x,y,z,w,t,u>:=PolynomialRing(Rationals(),6);
psi:=[x^2 - t*u, x^2 + y*z, x*y - z*t, x*u + z^2, x*z - y*u, x*t + y^2, 3*w^2 + 4*t^2 - u^2];
p:=2;
m:=5;
PointsViaLifting(psi,p,m);//empty

//48.144.3.bf.2

Pol<x,y,z,w,t,u>:=PolynomialRing(Rationals(),6);
psi:=[x*y - z*u, w^2 - w*t + t^2 - u^2, x^2 - w*u + 2*t*u, 2*x^2 - y*z, x*z - y*w + 2*y*t, -2*x*u + y^2, -2*x*w + 4*x*t + z^2];
p:=2;
m:=5;
PointsViaLifting(psi,p,m);//empty

// over Q5, as stated on LMFDB
// 48.288.19.hit.1, 48.288.19.hiq.1, 24.144.9.ejb.1, 48.144.7.bfg.1, 48.144.7.bft.1, 24.144.9.eid.1, 24.288.17.gin.1, 24.288.17.gil.1,
// 24.288.17.gim.1, 24.288.17.gim.2, 48.288.21.gvg.1, 48.288.21.gvf.1, 48.288.21.gvg.2, 48.288.21.gvh.1

// over Q7, as stated on LMFDB
// 24.144.9.dgq.1, 48.288.15.cva.1, 48.288.15.cyy.1, 48.144.11.ys.2, 48.144.11.ys.1

// over Q11, as stated on LMFDB
// 48.144.11.sm.1

// over Q17, as stated on LMFDB
// 48.144.7.bas.2, 48.144.7.bas.1

// over Q19, as stated on LMFDB
// 48.144.9.bfa.1, 48.144.9.bks.1, 24.144.9.dga.1, 48.288.15.cwc.1, 48.288.15.cvb.1

// over Q23, as stated on LMFDB
// 48.144.11.sr.1

// over Q31, as stated on LMFDB
// 48.144.5.ey.1, 48.144.5.ee.1, 48.144.5.ey.2, 48.144.5.ee.2

// no real points, as stated on LMFDB
// 48.144.9.bjz.1, 48.288.15.cvz.1,  48.144.5.ek.2,  48.144.3.bb.2, 48.144.5.et.1, 48.144.5.en.1, 48.144.5.er.2, 48.144.11.yq.2,
// 48.144.5.eu.2, 48.144.3.r.2, 48.144.5.ei.1, 48.144.5.ew.1, 48.144.5.ep.2, 48.144.5.eh.1, 48.144.5.ez.2, 48.144.5.ef.2, 48.144.5.fb.1,
// 48.144.7.bgq.1, 48.144.5.hb.1, 48.144.5.fi.1, 48.144.5.et.2, 48.144.5.eh.2, 48.144.5.eu.1, 48.144.11.yq.1, 48.144.3.r.1, 
// 48.144.5.fb.2, 48.144.5.ei.2, 48.144.5.ep.1, 48.144.3.bb.1, 48.144.5.en.2, 48.144.5.ez.1, 48.144.5.ek.1, 48.144.7.bgq.2, 
// 48.144.5.ef.1, 48.144.5.ew.2, 48.144.5.er.1, 48.144.5.gh.1, 48.144.5.gx.1, 48.144.5.fm.1, 48.288.15.cyp.1 


//Supplement for the curve 48.144.3.bf.1
//The curves 48.288.13.bhs.1, 48.288.13.bhr.1, 48.288.13.bib.1, and 48.288.13.bft.1 cover 
// 48.144.5.gh.1, 48.144.5.ge.1, 48.144.5.gk.1, and 48.144.5.fw.1 respectively, whose rational points we have already established. 
//The curves 48.288.13.bhy.1, 48.288.21.hxt.1, 48.288.13.bga.1, 48.288.13.bgd.1 and 48.288.21.hxl.2 have no $\Q_5$ points. 
//Lastly, the curves 48.288.21.hxr.1 and 48.288.13.bfu.1 have no real points. 

//Supplement for the curve 48.144.3.bd.1
// The curves 48.288.21.hxh.2, 48.288.13.bfj.1, 48.288.13.bfk.1, 48.288.13.bgs.1, 48.288.13.bgr.1 and 48.288.21.hxp.2 have no $\Q_5$ points.
// The curve 48.288.13.bfa.1 has no $\Q_7$ points. 
// The curves 48.288.13.bgi.1, 48.288.13.bgl.1 and 48.288.21.hxf.1 have no real points. 
//The curve 48.288.13.bfd.1 covers 24.36.1.fr.1, which has rank 0, and has exactly two rational points. One is a cusp and one is CM. 
//24.36.1.fr.1
f:= x^3 - 27;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points


// 8.2.3: Rational points on 48.72.3.a.1, 48.72.3.a.2, 48.72.3.p.1, and 48.72.3.p.2
// Supplement for 48.72.3.a.1
// The curve 48.144.7.hu.1 covers 12.36.1.bn.1, which has no non-CM rational points by earlier in this file.

//The curve 48.144.8.lu.1 covers 24.36.1.fu.1 which is an elliptic curve of rank 0. 
//It has exactly two rational points: one is a cusp and one is CM.
//24.36.1.fu.1
f:=  x^3 + x^2 + 3*x + 3;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

//The curve 48.144.9.zt.1 covers 24.36.1.fv.1 which is an elliptic curve of rank 0. 
//It has exactly two rational points: one is a cusp and the other is CM.
//24.36.1.fv.1
f:= x^3 + x^2 + x;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

// The curve 48.144.9.baj.1 has no $\Q_5$ points and thus no rational points, as stated on the LMFDB.

//The curve 48.144.6.bk.2 covers 24.72.2.di.1 which is a genus 2, rank 2 bielliptic curve. 
//The curve 24.72.2.di.1 has model \[y^2 = x^6 + 3x^4 + 3x^2 + 9.\] 
//In the paper's discussion on bielliptic curves, we establish this curve has exactly 8 rational points. All are CM points.

//The curve 48.144.9.bay.1 covers 24.36.1.ge.1 which has no non-CM rational points, from an earlier computation in this file.

//The curve 48.144.10.lt.1 covers 24.12.1.bz.1 which has four rational points: two cusps and two CM points.
//24.12.1.bz.1
P<x,y,z> := ProjectiveSpace(Rationals(), 2);
model_0 := [x^3-y^2*z-9*x*z^2];
C:=Curve(P,model_0);
Pts:=PointSearch(C,1000);
Pol<x,y,z> := PolynomialRing(Rationals(), 3);

// j-invariant map from the Weierstrass model
//   Coordinate number 0:
map_0_coord_0 := 2^6*(2268*x^2*z^2+720*x*y^2*z+64*y^4-729*z^4);
//   Coordinate number 1:
map_0_coord_1 := 3^4*(z^2*x^2);
for P in Pts do;

Evaluate(map_0_coord_0,[P[1],P[2],P[3]]);
Evaluate(map_0_coord_1,[P[1],P[2],P[3]]);
print ".........";
end for;// two cusps and two CM

//The curve 48.144.7.mg.1 covers 48.24.1.f.2 which is an elliptic curve of rank 0. It has exactly two points: one is a cusp and one is CM.
//48.24.1.f.2
f:=  x^3 - 120*x + 448;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E);//2 points

//The curve 48.144.7.kt.1 covers 24.36.1.fr.1 which we already showed has no non-CM rational points.

//The curve 48.144.7.mw.1 covers 24.36.1.gi.1 which we already showed has no non-CM rational points. 




******************
//12.36.2.a.1
f:=x^6-1;
C:=HyperellipticCurve(f);
Chabauty0(Jacobian(C));//4 points

//12.36.2.p.1
f:=-x^6+1;
C:=HyperellipticCurve(f);
Chabauty0(Jacobian(C));//4 points



********************


//48.72.3.a.2

//The curve 48.144.7.mh.1 covers 24.72.2.gm.1, which we consider here
f := 2*x^6 - 54;
//code of Bianchi--Padurariu: https://github.com/oana-adascalitei/MWSieveForDatabase/blob/main/sieve_with_no_known_points.m
function MakeLookup1(G, m) //from [S09] 
  return pmap<Codomain(m) -> G| [<m(g), g> : g in G]>;
end function;

function MakeDLp1(G, m, p) //from [S09] 
  // G a p-group
  if #G le 25 then
    return MakeLookup1(G, m);
  end if;
  invs := Invariants(G);
  // printf "MakeDLp: Invariants(G) = %o\n", invs;
  pp := ExactQuotient(invs[#invs], p);
  if pp eq 1 then
    return MakeLookup1(G, m);
  end if;
  // printf "MakeDLp: pp = %o\n", pp;
  h := hom<G -> G | [pp*G.i : i in [1..#invs]]>;
  G1 := Image(h);
  // printf "MakeDLp: Invariants(Image(h)) = %o\n", Invariants(G1);
  m1 := map<G1 -> Codomain(m) | x:->m(x)>;
  f1 := MakeLookup1(G1, m1);
  G2 := Kernel(h);
  // printf "MakeDLp: Invariants(Kernel(h)) = %o\n", Invariants(G2);
  m2 := map<G2 -> Codomain(m) | x:->m(x)>;
  f2 := MakeDLp1(G2, m2, p);
  return pmap<Codomain(m) -> G |
               x :-> f2(x - m(a)) + a where a := f1(pp*x) @@ h>;
end function;

function MakeDL(G, m)  //from [S09] 
// Given bijection  m : G -> X, where X has group structure, compute the
//  inverse of m. Assumes that #G is smooth.
  n := #Invariants(G);
  f := Factorization(#G);
  cofs := [&*[Integers()|f[i,1]^f[i,2] : i in [1..#f] | i ne j] : j in [1..#f]];
  _, refs := XGCD(cofs);
  assert &+[Integers()|refs[i]*cofs[i] : i in [1..#f]] eq 1;
  DLs := [**];
  for i := 1 to #f do
    p := f[i,1];
    hp := hom<G -> G | [cofs[i]*G.j : j in [1..n]]>;
    Gp := Image(hp);
    mp := map<Gp -> Codomain(m) | x:->m(x)>;
    DLp := MakeDLp1(Gp, mp, p);
    Append(~DLs, DLp);
  end for;
  return pmap<Codomain(m) -> G
               | x :-> &+[G|refs[i]*G!(DLs[i](cofs[i]*x)) : i in [1..#f]]>;
end function;

function SimpleSieveBielliptic(X:lower_bound:=2, upper_bound:=500)
	
	X := SimplifiedModel(X);
	subcovs := Degree2Subcovers(X);
	assert #subcovs ge 2;
	E1,phi1 := Explode(subcovs[1]);
	E2,phi2 := Explode(subcovs[2]);
	pols1 := DefiningPolynomials(phi1);
	pols2 := DefiningPolynomials(phi2);
	
	Bad := BadPrimes(X);
	primes := [p : p in [lower_bound..upper_bound] | IsPrime(p)];
	GoodPrimes := [p : p  in primes | p notin Bad];

	Gens1, bl11, bl12 := Generators(E1);
	assert bl11 eq true; assert bl12 eq true;
	Gens2, bl21, bl22 := Generators(E2);
	assert bl21 eq true; assert bl22 eq true;

	success := false;
	successfulp := 0;
	for p in GoodPrimes do
		Xp := ChangeRing(X, GF(p));
		E1p := ChangeRing(E1, GF(p));
		E2p := ChangeRing(E2, GF(p));
		pols1p := [* ChangeRing(P, GF(p)) : P in pols1 *];
		pols1p := [Parent(pols1p[1]) | pols1p[i] : i in [1..#pols1p]];
		pols2p := [Parent(pols1p[1]) | ChangeRing(P, GF(p)) : P in pols2];
		phi1p := map< Xp -> E1p | pols1p >;
		phi2p := map< Xp -> E2p | pols2p >;
		
		A1p, m1:= AbelianGroup(E1p);
		A2p, m2 := AbelianGroup(E2p);
		DL1 := MakeDL(A1p, m1);
		DL2 := MakeDL(A2p, m2);
		A, i1, i2:=DirectSum(A1p,A2p);
		imC := [i1(DL1(phi1p(Q))) + i2(DL2(phi2p(Q))) : Q in Points(Xp)];
		imbas1 := [i1(DL1(E1p!P)) : P in Gens1];
		imbas2 := [i2(DL2(E2p!P)) : P in Gens2];
		imbas := imbas1 cat imbas2;
		imE1QE2Q := sub<A | imbas>;
		imCres := [ R : R in imE1QE2Q | R in imC];
		if #imCres eq 0 then
			successfulp := p;
			success := true;
			break p;
		end if;
	end for;
	
	return success, successfulp;
	
end function;

X := HyperellipticCurve(f);
SimpleSieveBielliptic(X); // true 29, meaning no points confirmed for p=29


// The curve 48.144.9.zs.1 covers 24.36.1.fv.1, from the computation for 48.72.3.a.1.
// The curve 48.144.9.baz.1 covers 24.36.1.ge.1 which has no non-CM rational points, from an earlier computation in this file.
// The curve 48.144.9.bai.1 has no $\Q_5$ points, as stated on the LMFDB.

// The curve 48.144.6.bk.1 covers 24.72.2.di.1 which is a genus 2, rank 2 bielliptic curve. 
// 24.72.2.di.1 has model \[y^2 = x^6 + 3x^4 + 3x^2 + 9.\] 
// In the paper's discussion on bielliptic curves, we establish this curve has exactly 8 rational points. All are CM points.

// The curve 48.144.7.hu.2 covers 12.36.1.bn.1 which has no non-CM rational points by earlier in this file.
// The curve 48.144.8.lv.1 covers 24.36.1.fu.1 whose points were addressed earlier in this file.
// The curve 48.144.7.mx.1 covers 24.36.1.gi.1 which we know already has no non-CM rational points.
// The curve 48.144.7.ks.1 covers 24.36.1.fr.1 which we already know has no non-CM rational points. 

// The curve 48.144.10.ls.1 covers 24.24.1.dq.1 which is an elliptic curve of rank 0. 
//It has exactly two rational points, both of which are CM.
//24.24.1.dq.1

P<x>:=PolynomialRing(Rationals());
f:=x^3 - 99*x - 378;
E:=EllipticCurve(f);
Pts:=PointSearch(E,100);

Pol<x,y,z> := PolynomialRing(Rationals(), 3);


// Maps from this modular curve, if computed

// j-invariant map from the Weierstrass model
//   Coordinate number 0:
map_0_coord_0 := 2^6*3^3*(156*x^2*y^6+11284767*x^2*y^4*z^2+51980096952*x^2*y^2*z^4+43626516244137*x^2*z^6+10542*x*y^6*z+247268592*x*y^4*z^3+744027068241*x*y^2*z^5+501062829774858*x*z^7+y^8+410896*y^6*z^2+3569279040*y^4*z^4+5087920043052*y^2*z^6+1435822394391657*z^8);
//   Coordinate number 1:
map_0_coord_1 := 1*(12*x^2*y^6-1377*x^2*y^4*z^2-17496*x^2*y^2*z^4+59049*x^2*z^6-18*x*y^6*z+7776*x*y^4*z^3+111537*x*y^2*z^5-354294*x*z^7+y^8-1296*y^6*z^2+93312*y^4*z^4+1023516*y^2*z^6-3720087*z^8);
for p in Pts do;

Evaluate(map_0_coord_0,[p[1],p[2],p[3]]);
Evaluate(map_0_coord_1,[p[1],p[2],p[3]]);
print ".........";
end for; //both CM points


******************

//6.36.1.b.1 
f:= x^3 - 15*x + 22;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //6 points

//12.36.1.d.1
f:= x^3 - 15*x - 22;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//12.36.1.k.1
f:= x^3 - 15*x - 22;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//12.36.1.m.1
f:= x^3 - 15*x + 22;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //6 points

//24.36.1.br.1
f:= x^3 - 60*x - 176;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points

//24.36.1.g.1
f:= x^3 - 60*x - 176;
E:=EllipticCurve(f);
Rank(E); //0
TorsionSubgroup(E); //2 points
