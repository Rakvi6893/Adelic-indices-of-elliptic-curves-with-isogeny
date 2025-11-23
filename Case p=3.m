load "Approach_Product.m";

//  We consider adelic indices assuming a p = 3 degree isogeny

p := 3; // Degree of isogeny
ell := 2; // 2 or 3; whichever is not isgoeny degree

// Claimed set of adelic indices in this case
Idx3 := {16, 32, 48, 96, 128, 144, 160, 288, 384, 768, 864, 1296};


// Initalizing possible 2-adic and 3-adic images for this case
TwoAdicImagesThreeIsogenyLbls := [ "2.2.0.a.1", "2.3.0.a.1", "2.6.0.a.1", "4.2.0.a.1", "4.6.0.a.1", "4.6.0.b.1", "4.6.0.c.1", "4.8.0.b.1", "8.2.0.a.1", "8.2.0.b.1", "8.6.0.a.1", "8.6.0.b.1", "8.6.0.c.1", "8.6.0.d.1" ];
TwoAdicImagesThreeIsogeny := [OurModCrvs[lbl] : lbl in TwoAdicImagesThreeIsogenyLbls];
Append(~TwoAdicImagesThreeIsogeny, <"1.1.0.a.1", 1, 1, 0, GL(2,Integers(ell))>); // We need to also include GL(2,Z_2)

ThreeAdicImagesThreeIsogenyLbls := ["3.4.0.a.1", "3.12.0.a.1", "9.12.0.a.1", "9.12.0.b.1", "9.36.0.a.1", "9.36.0.b.1", "9.36.0.c.1", "9.36.0.d.1", "9.36.0.d.2", "9.36.0.e.1", "9.36.0.f.1", "9.36.0.f.2", "9.36.0.g.1", "27.36.0.a.1"];
ThreeAdicImagesThreeIsogeny := [OurModCrvs[lbl] : lbl in ThreeAdicImagesThreeIsogenyLbls];

L := AssociativeArray(); // Assoc. Array where 2-adic and 3-adic images are stored.
L[2] := TwoAdicImagesThreeIsogeny;
L[3] := ThreeAdicImagesThreeIsogeny;

Children2 := Children(ell, L);
Children3 := Children(p, L);
ChildrenProd := ChildrenProduct(Children2, Children3);

ProdsWithFinManyPts := DetermineProdsWithFinManyPts(ChildrenProd);
MaxProdsWithFinManyPts := DetermineMaxProdsWithFinManyPts(ProdsWithFinManyPts, ChildrenProd);
IdentifyProds(MaxProdsWithFinManyPts);

ProdsWithInfManyPts := Keys(ChildrenProd) diff ProdsWithFinManyPts;

DeltaE := FindDeltaE(ProdsWithInfManyPts);
ProdsWithPossiblyBadIdxSub := PossilbyBadIdx(DeltaE, Idx3);

ProdsWithBadIdxSub := CheckIfThereIsAFiberProdOfBadIdx(ProdsWithPossiblyBadIdxSub, Idx3);


// Dealing with ProdsWithBadIdxSub
for prodlbl in Keys(ProdsWithBadIdxSub) do
    Gps := ProdsWithBadIdxSub[prodlbl];
    prodlbl, #Gps;
    G := OurModCrvs[prodlbl[2]][5];
    M := [H`subgroup : H in MaximalSubgroups(GL2Lift(G,72*GL2Level(G))) | -One(H`subgroup) in H`subgroup and #Det(H`subgroup) eq EulerPhi(#BaseRing(H`subgroup))];
    for m in M do
        if true in [IsConjSub(GL2Lift(g, #BaseRing(m)), m) : g in Gps] then
            m1 := sub< Gl(GL2Level(m)) | Generators(m) >;
            IdentifyCurvesGps([m1]);
        end if;
    end for;
end for;
/*
<"1.1.0.a.1", "9.36.0.f.1"> 8
Identified curve  1  :  18.72.2.e.1
[ 18.72.2.e.1 ]
<"1.1.0.a.1", "9.36.0.a.1"> 8
Identified curve  1  :  18.72.3.j.1
[ 18.72.3.j.1 ]
<"1.1.0.a.1", "27.36.0.a.1"> 2
Identified curve  1  :  54.72.3.c.1
[ 54.72.3.c.1 ]
<"1.1.0.a.1", "9.36.0.d.1"> 8
Identified curve  1  :  18.72.3.k.1
[ 18.72.3.k.1 ]
<"1.1.0.a.1", "9.12.0.a.1"> 8
Identified curve  1  :  18.24.1.b.1
[ 18.24.1.b.1 ]
<"1.1.0.a.1", "9.36.0.b.1"> 2
Identified curve  1  :  18.72.3.m.1
[ 18.72.3.m.1 ]
<"1.1.0.a.1", "9.36.0.c.1"> 8
Identified curve  1  :  18.72.3.n.1
[ 18.72.3.n.1 ]
<"1.1.0.a.1", "9.36.0.f.2"> 8
Identified curve  1  :  18.72.2.e.2
[ 18.72.2.e.2 ]
<"1.1.0.a.1", "9.12.0.b.1"> 8
Identified curve  1  :  18.24.0.d.1
[ 18.24.0.d.1 ]
<"1.1.0.a.1", "9.36.0.e.1"> 8
Identified curve  1  :  18.72.3.o.1
[ 18.72.3.o.1 ]
<"1.1.0.a.1", "3.12.0.a.1"> 8
Identified curve  1  :  6.24.1.b.1
[ 6.24.1.b.1 ]
<"1.1.0.a.1", "9.36.0.d.2"> 8
Identified curve  1  :  18.72.3.k.2
[ 18.72.3.k.2 ]
<"1.1.0.a.1", "9.36.0.g.1"> 26
Identified curve  1  :  18.72.2.f.1
[ 18.72.2.f.1 ]
*/

// Dealing with the genus 0 curve that showed up for 9.12.0.b.1

// verifying that it has commutator index in I_3

G := OurModCrvs["18.24.0.d.1"][5];
_,_,ind:=FindCommutatorSubgroup(G);
ind; //144


prodlbl := <"1.1.0.a.1", "18.24.0.d.1">; 
Gps := ProdsWithBadIdxSub[<"1.1.0.a.1", "9.12.0.b.1">];
prodlbl, #Gps;
G := OurModCrvs[prodlbl[2]][5];
M := [H`subgroup : H in MaximalSubgroups(GL2Lift(G,72*GL2Level(G))) | -One(H`subgroup) in H`subgroup and #Det(H`subgroup) eq EulerPhi(#BaseRing(H`subgroup))];
for m in M do
    if true in [IsConjSub(GL2Lift(g, #BaseRing(m)), m) : g in Gps] then
        m1 := sub< Gl(GL2Level(m)) | Generators(m) >;
        IdentifyCurvesGps([m1]);
    end if;
end for;
/*
Identified curve  1  :  54.72.3.d.1
[ 54.72.3.d.1 ]
Identified curve  1  :  54.72.3.d.1
[ 54.72.3.d.1 ]
Identified curve  1  :  54.72.5.d.1
[ 54.72.5.d.1 ]
Identified curve  1  :  54.72.4.e.1
[ 54.72.4.e.1 ]
Identified curve  1  :  18.72.1.e.1
[ 18.72.1.e.1 ]
Identified curve  1  :  54.72.5.d.1
[ 54.72.5.d.1 ]
Identified curve  1  :  54.72.4.e.1
[ 54.72.4.e.1 ]
Identified curve  1  :  18.72.1.e.1
[ 18.72.1.e.1 ]
*/
