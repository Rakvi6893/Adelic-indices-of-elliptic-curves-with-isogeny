D := GetCurrentDirectory();
ChangeDirectory("/Users/jacob/Modular-main"); // Change this to the location of Modular-main

AttachSpec("Modular.spec");
ChangeDirectory(D);
load "RelevantModCrvs.m";
load "Identifier.m";
ChangeDirectory("/Users/Jacob/OpenImage-master/main/");
load "GL2GroupTheory.m";
ChangeDirectory(D);


// Returns true if the image of A in GL(2, Z_ell) 
// is conjugate to a group in L. We assume that
// GL(2, Z_ell) is always contained in L.
IsConjEll := function(A, L, ell)
    v := Valuation(GL2Level(A), ell);
    if v eq 0 then
        return true;
    end if;

    lvl := GL2Level(sub<Gl(ell^v) | Generators(A)>);
    if lvl eq 1 then
        return true;
    end if;
    Aell := sub< Gl(lvl) | Generators(A) >;
    
    for B in L do
        if GL2Level(B[5]) eq lvl and IsConjugate(Gl(lvl), Aell, B[5]) then
            return true;
        end if;
    end for;
    return false;
end function;

// Given a modular curve record X, the function
// attempts to recognize X as an elliptic curve and returns its rank, if possible. 
// In the event of an error, we check for a local obstruction.
// In this case, the function returns -1 if a local obstruction is found and 1 otherwise.
GenusOneRank := function(X)
    Rk := 1;
    if X`genus eq 1 then
        XG := FindModelOfXG(X);
        C := Curve(ProjectiveSpace(Rationals(), Rank(Parent((XG`psi)[1]))-1),XG`psi);
        try
            E := EllipticCurve(C);
            Rk := Rank(E);
        catch e
            print "Unable to determine a rank (perhaps no rational points)!";
            Rk := 1; // We'll say rank is 1 (inf. many pts.) unless we find a local obstruction.
            print "--> Checking local sovability.";
            for p in PrimesUpTo(20) do
                if not IsLocallySolvable(C, p) then
                    "--> There is a local obstruction.";
                    Rk := -1; // No rational point; we say "rank = -1".
                    break;
                end if;
            end for;
        end try;
    end if;
    return Rk;
end function;

// Recursive function for constructing a lattice of subgroups as described in the article
// Note: H0 is not included in the output!
function ConstructLattice(H0, K, L2, L3 : IncludeRoot := true)
    LevelOfH0 := GL2Level(H0);
    LevelOfK := GL2Level(K);
    NewLvl := 6 * 2^Max(Valuation(LevelOfH0,2),2) * 3^Max(Valuation(LevelOfH0,3),1);
    H0Lift := GL2Lift(H0, NewLvl);
    MaxSubs := [H`subgroup : H in MaximalSubgroups(H0Lift) | -One(H`subgroup) in H`subgroup and GL2DeterminantIndex(H`subgroup) eq 1];
    S := {};
    
    if IncludeRoot then
        X := CreateModularCurveRec(K);
        Include(~S, <GL(2,Integers(6)), X`genus, GenusOneRank(X)> );
    end if;
    
    for i in [1..#MaxSubs] do
        LevelOfH := GL2Level(MaxSubs[i]);
        H := sub< Gl(LevelOfH) | Generators(MaxSubs[i])>;

        // Check that H is not in S (up to conjugacy)
        NewGp := true;
        for J in S do
            if #BaseRing(J[1]) eq LevelOfH and IsConjugate(Gl(LevelOfH), J[1], H) then
                NewGp := false;
                break;
            end if;
        end for;

        // Check that the 2,3-adic reductions of H is in L2 (up to conjugacy)
        if NewGp and IsConjEll(H, L2, 2) and IsConjEll(H, L3, 3) then
        
            Lvl := LCM(LevelOfH, LevelOfK);
            G := GL2Lift(H, Lvl) meet GL2Lift(K, Lvl);
            X := CreateModularCurveRec(G);

            // We try to figure out the rank in the genus 1 case. 
            Rk := GenusOneRank(X);
        
            Include(~S, <H, X`genus, Rk>);
            
            if X`genus eq 0 or (X`genus eq 1 and Rk ge 1) then
                S := S join ConstructLattice(H, K, L2, L3 : IncludeRoot := false);
            end if;
        end if;
        
    end for;

    return S;
end function;

// return true if H is conjugate to a subgroup of G,
// and false otherwise.
IsConjSub := function(H,G)
    if #G mod #H ne 0 then
        return false;
    end if;
    lvl := #BaseRing(H);
    GL2 := GL(2,Integers(lvl));
    C := Conjugates(GL2, H);
    for K in C do
        if K subset G then
            return true;
        end if;
    end for;
    return false;
end function;

// Given a lattice L, returns sublattices Linf and Lfin such that the modular curves of
// H x K have infinitely or finitely many rational points, respectively.
// We modify the original input L. 
MakeSubLats := function(L)
    lvl := LCM({*GL2Level(H[1]) : H in L*});
    L := [<GL2Lift(H[1],lvl),H[2],H[3]> : H in L];
    NoConjL := [];
    for G in L do
        Flg := true;
        for H in NoConjL do
            if #G[1] eq #H[1] and IsConjugate(Gl(lvl), G[1], H[1]) then
                Flg := false;
                break;
            end if;
        end for;
        if Flg then
            Include(~NoConjL, G);
        end if;
    end for;
    L := NoConjL;
    Linf := []; // List of H with H x K of genus 0 or (genus 1 and rank >= 1). 
    Lfin := []; // List of H with H x K of genus >= 2 or (genus 1 and rank = 0).
    for H in L do
        if H[2] eq 0 or (H[2] eq 1 and H[3] ge 1) then
            Include(~Linf,H);
        else
            Include(~Lfin,H);
        end if;
    end for;
    NeedToCheck := []; 
    for H in Lfin do
        if #{J : J in Lfin | IsConjSub(H[1],J[1])} eq 1 then
            Include(~NeedToCheck,H);
        end if;
    end for;
    return L, Linf, Lfin, NeedToCheck;
end function;


// Code for making the tree
Children := function(L,G)
    S := [];
    for i in [1..#L] do
        if IsConjSub(L[i][1],G) then
            if #{H : H in L | IsConjSub(L[i][1],H[1]) and IsConjSub(H[1],G)} eq 2 then
                Include(~S,i);
            end if;
        end if;
    end for;
    return S;
end function;

// Code for making tree picture (GraphViz)
MakeTreePicture := procedure(L, Lfin, NeedToCheck)
    lvl := LCM({*GL2Level(H[1]) : H in L*});
    L := [<GL2Lift(H[1],lvl),H[2],H[3]> : H in L];
    // L := [<GL(2,Integers(lvl)), -1, -1>] cat L;
    I := [Index(Gl(#BaseRing(G[1])),G[1]) : G in L];
    ParallelSort(~I,~L);
    
    print "digraph G {";
    print "    node [shape=circle, label=\"\"];";
    print "    edge [arrowhead=none];";

    for i in [1..#L] do
        C := Children(L,L[i][1]);
        if #C gt 0 then
    	   print "    ", i, "-> {", &cat [IntegerToString(x) cat " " : x in C], "};";            
        end if;
    end for;

    for i in [i : i in [1..#L] | L[i] in Lfin and not L[i] in NeedToCheck] do
        print "    ", i, " [style=filled, fillcolor=black];";
    end for;

    for i in [i : i in [1..#L] | L[i] in NeedToCheck] do
        print "    ", i, " [style=filled, fillcolor=gray];";
    end for;

    print "}";
    
end procedure;


