ChangeDirectory("/Users/jacob/Modular-main");// Change this to the location of Modular-main
Attach("earlier_code/magma/utils.m");
Attach("earlier_code/magma/chars.m");
Attach("earlier_code/magma/gl2base.m");
Attach("earlier_code/CPdata/CPdata.m");
Attach("main/Modular.m");

ChangeDirectory("/Users/Jacob/"); // Change location as needed
load "Approach_Lattice.m";
ChangeDirectory("/Users/Jacob/");
load "RelevantModCrvs.m";
load "Identifier.m";
load "GL2GroupTheory.m"; //this is in Zywina's repo

// The next few functions help us understand the subgroup tree of X0(p)

Children := function(p, L)
    print "Building ancestors array";
    Ancestors := AssociativeArray();
    for A in L[p] do
        Agp := A[5];
        S := {};
        for B in L[p] do
            Bgp := B[5];
            lvl := Maximum(GL2Level(Agp), GL2Level(Bgp));
            if A ne B and IsConjSub(GL2Lift(Agp, lvl), GL2Lift(Bgp, lvl)) then
                Include(~S, B[1]);
            end if;
        end for;
        A[1], S;
        Ancestors[A[1]] := S;
    end for;

    print "Building parents array";
    Parents := AssociativeArray();
    for A in L[p] do
        S := Ancestors[A[1]] diff &join [Ancestors[k] : k in Ancestors[A[1]]];
        Parents[A[1]] := S;
        A[1], S;
    end for;

    print "Building children array";
    Children := AssociativeArray();
    for A in L[p] do
        S := {T[1] : T in L[p] | A[1] in Parents[T[1]]};
        Children[A[1]] := S;
        A[1], S;
    end for;
    // return Ancestors, Parents, Children;
    return Children;
end function;

ChildrenProduct := function(L2, L3)
    ProdSubs := AssociativeArray();
    for c in CartesianProduct(Keys(L2), Keys(L3)) do
        C := CartesianProduct(Include(L2[c[1]], c[1]), Include(L3[c[2]], c[2]));
        ProdSubs[c] := Exclude([x : x in C], c);
    end for;
    return ProdSubs;
end function;

// Returns false if a modular curve X is shown to have no rational points via 
// a local obstruction. Returns true if the curve is shown to have rational 
// points via a point search *or* if it is unknown whether X has rational points.
NaiveHasPoints := function(XG)
    try
        C := Curve(ProjectiveSpace(Rationals(), Rank(Parent((XG`psi)[1]))-1),XG`psi);
        Pts := PointSearch(C, 1000);
        if #Pts gt 0 then
            print "Found rational point(s) via a point search";
            return true;
        end if;
        print "A point search did not find any rational points.";
        for p in Include(PrimesUpTo(100), 0) do
            if not IsLocallySolvable(C, p) then
                print "--> There is a local obstruction.";
                return false;
                break;
            end if;
        end for;
        print "--> Unable to find a local obstruction.";
        return true;
    catch e
        print "Something went wrong in searching for rational points.";
        print "We'll assume the curve has rational points (this is safe).";
        return true;
    end try;
end function;

// Returns false if X_G has finitely many rational points; returns true
// if X_G has infinitely many rational or unable to determine (this is safe).
HasInfManyPts := function(G)
    X := CreateModularCurveRec(G);
    GenusOfX := X`genus;
    print "Genus:", GenusOfX;
    if GenusOfX ge 2 then
        return false;
    end if;
    // Genus is 0 or 1
    XG := FindModelOfXG(X);
    NHP := NaiveHasPoints(XG);
    if GenusOfX eq 0 then
        print "Genus 0. Has rational point:", NHP;
        return NHP;
    end if;

    // Genus is 1
    if NHP then
        C := Curve(ProjectiveSpace(Rationals(), Rank(Parent((XG`psi)[1]))-1),XG`psi);
        r := Rank(EllipticCurve(C, Random(PointSearch(C, 1000))));
        "Genus 1 and Rank: ", r;
        return r ge 1;
    else
        return false;
    end if;
    
end function;

DetermineProdsWithFinManyPts := function(ChildrenProd)
    FinitelyManyPts := {};
    for c in Keys(ChildrenProd) do
        if not c in FinitelyManyPts then
            if c[1] eq "1.1.0.a.1" then
                G2 := GL(2, Integers(2));
            else
                G2 := OurModCrvs[c[1]][5];
            end if;
            if c[2] eq "1.1.0.a.1" then
                G3 := GL(2, Integers(3));
            else
                G3 := OurModCrvs[c[2]][5];
            end if;
            lvl := LCM(#BaseRing(G2), #BaseRing(G3));
            G := GL2Lift(G2, lvl) meet GL2Lift(G3, lvl);
            if not HasInfManyPts(G) then
                Include(~FinitelyManyPts, c);
                for csub in ChildrenProd[c] do
                    Include(~FinitelyManyPts, csub);
                end for;
            end if;
        end if;
    end for;
    return FinitelyManyPts;
end function;

DetermineMaxProdsWithFinManyPts := function(ProdsWithFinManyPts, ChildrenProd)
    return {c : c in ProdsWithFinManyPts | #{d : d in ProdsWithFinManyPts | c in ChildrenProd[d]} eq 0};
end function;

// From Mayle-Rakvi
QuoIntersection := function(G,H)
    QuoG := {IdentifyGroup(G/(N`subgroup)) : N in NormalSubgroups(G) | #H mod Integers() ! (#G/#(N`subgroup)) eq 0};
    QuoH := {IdentifyGroup(H/(N`subgroup)) : N in NormalSubgroups(H) | #G mod Integers() ! (#H/#(N`subgroup)) eq 0};
    return QuoG meet QuoH;
end function;

FindDeltaE := function(ProdsWithInfManyPts)
    DeltaE := AssociativeArray();
    for c in ProdsWithInfManyPts do
        if c[1] eq "1.1.0.a.1" then
            G2 := GL(2,Integers(16));
            lvl2 := 16;
        else
            G2 := OurModCrvs[c[1]][5];
            lvl2 := #BaseRing(G2);
        end if;
        if c[2] eq "1.1.0.a.1" then
            G3 := GL(2, Integers(27));
            lvl3 := 27;
        else
            G3 := OurModCrvs[c[2]][5];
            lvl3 := #BaseRing(G3);
        end if;
        M,gens,ind2:=FindCommutatorSubgroup(GL2Lift(G2, 4 * lvl2));
        
        G2comm:=sub<SL(2,Integers(M))|gens>;
        M,gens,ind3:=FindCommutatorSubgroup(GL2Lift(G3, 9 * lvl3));
        if M eq 1 then G3comm:=SL(2,Integers(9*lvl3));
         
        else G3comm:=sub<SL(2,Integers(M))|gens>; end if;
        DeltaE[c] := [d[1] : d in QuoIntersection(G2comm, G3comm)];
        print c, DeltaE[c];
        for t in DeltaE[c] do;
           print "Possible indices for this pair:";
           ind2*ind3*t;
           print ".....";
        end for;
    end for;
    return DeltaE;
end function;


PossilbyBadIdx := function(DeltaE, GoodIdx)
    PosBadIdx := AssociativeArray();
    for c in Keys(DeltaE) do
        if c[1] eq "1.1.0.a.1" then
            G2 := GL(2, Integers(2));
        else
            G2 := OurModCrvs[c[1]][5];
        end if;
        if c[2] eq "1.1.0.a.1" then
            G3 := GL(2, Integers(3));
        else
            G3 := OurModCrvs[c[2]][5];
        end if;
        lvl2 := #BaseRing(G2);
        lvl3 := #BaseRing(G3);
        M,gens,ind:=FindCommutatorSubgroup(GL2Lift(G2, 4 * lvl2));
       
        
        CI2 := ind;
        
        
        M,gens,ind:=FindCommutatorSubgroup(GL2Lift(G3, 9 * lvl3));
        
        CI3 := ind;
        S := {CI2*CI3*delta : delta in DeltaE[c]};
        print "the set of indices (including bad ones)"; 
        S; //set of indices
        if not IsEmpty(S diff GoodIdx) then
            PosBadIdx[c] := {delta : delta in DeltaE[c] | not CI2*CI3*delta in GoodIdx};
        end if;
    end for;
    return PosBadIdx;
end function;

// (From previous paper) //
/////////////////////////////////////////////////
// Given a positive integer n, output GL(2,Z/nZ).
/////////////////////////////////////////////////
Gl := function(n)
	return GL(2,Integers(n));
end function;

/////////////////////////////////////////////////
// Give a subgroup G of GL(2,Z/nZ) for some n,
// output the subgroup det(G) of (Z/nZ)^*.
/////////////////////////////////////////////////
Det := function(G)
	H,phi := UnitGroup(BaseRing(G));
	Gens := Generators(G);
	L := {Determinant(g) @@ phi : g in Gens};
	return sub< H | L>;
end function;

/*
IsConjGpsEll := function(K,G,ell)
    lvl := GL2Level(K);
    lvl2 := ell^Valuation(lvl, ell);
    K := sub<Gl(lvl2) | Generators(K)>;
    if lvl2 eq ell^Valuation(GL2Level(G),ell) and IsConjugate(Gl(lvl2),sub<Gl(lvl2) | Generators(G)>,K) then
        return true;
    end if;
    return false;
end function;
*/

IsConjGpsEll := function(K,G,ell)
    vK := Valuation(GL2Level(K), ell);
    vG := Valuation(GL2Level(G), ell);
    if vK eq 0 then
        Kell := GL(2, Integers(ell));
    else
        Kell := sub<Gl(ell^vK) | Generators(K)>;
    end if;
    if vG eq 0 then
        Gell := GL(2, Integers(ell));
    else
        Gell := sub<Gl(ell^vG) | Generators(G)>;
    end if;
    if GL2Level(Kell) eq 1 or GL2Level(Gell) eq 1 then
        return GL2Level(Kell) eq GL2Level(Gell);
    end if;
    Kell := sub<Gl(GL2Level(Kell)) | Generators(K)>; // not a typo; this needs to be done twice
    Gell := sub<Gl(GL2Level(Gell)) | Generators(G)>; // not a typo; this needs to be done twice
    if #BaseRing(Kell) eq #BaseRing(Gell) and IsConjugate(Gl(#BaseRing(Kell)),Kell, Gell) then
        return true;
    end if;
    return false;
end function;

function AllGoodSubs(G)
    lvl := GL2Level(G);
    G := sub<Gl(lvl) | Generators(G)>;
    newlvl := 6 * 2^Maximum(Valuation(lvl,2),2) * &*Append([p^Valuation(lvl,p) : p in PrimeDivisors(lvl) | p ne 2],1);
    Glift := GL2Lift(sub<Gl(lvl) | Generators(G)>, newlvl);
    L := [H`subgroup : H in MaximalSubgroups(Glift) | -One(Glift) in H`subgroup and #Det(H`subgroup) eq EulerPhi(newlvl)];
    GoodSubs := [];
    for K in L do

        if IsConjGpsEll(K,Glift,2) and IsConjGpsEll(K,Glift,3) then

            Append(~GoodSubs,K);

            GoodSubs := GoodSubs cat AllGoodSubs(K);
        end if;
    end for;

    return GoodSubs;
end function;

CheckIfThereIsAFiberProdOfBadIdx := function(ProdsWithPossiblyBadIdx, GoodIdx)
    ProdsBadIdx := AssociativeArray();
    for c in Keys(ProdsWithPossiblyBadIdx) do
        if c[1] eq "1.1.0.a.1" then
            G2 := GL(2, Integers(2));
        else
            G2 := OurModCrvs[c[1]][5];
        end if;
        if c[2] eq "1.1.0.a.1" then
            G3 := GL(2, Integers(3));
        else
            G3 := OurModCrvs[c[2]][5];
        end if;
        lvl := LCM(#BaseRing(G2), #BaseRing(G3));
        G := GL2Lift(G2, lvl) meet GL2Lift(G3, lvl);
        S := AllGoodSubs(G);
        BadGps := [];
        for H in S do
            lvl := GL2Level(H);
     
            _,_,ind:=FindCommutatorSubgroup(H);

            if not ind in GoodIdx then
                Include(~BadGps, H);
                
            end if;
        end for;
       
        if not IsEmpty(BadGps) then
            ProdsBadIdx[c] := BadGps;
            
        end if;
    end for;
    return ProdsBadIdx;
end function;
