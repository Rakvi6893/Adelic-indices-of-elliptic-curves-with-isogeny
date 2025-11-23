
// This function still needs some work
IdentifyCurves := function(L)
    Lbls := [];
    for i in [1..#L] do
        G := L[i];
        gen := G[2];
        lvl := GL2Level(G[1]);
        G := sub<Gl(lvl) | Generators(G[1])>;
        idx := Index(Gl(lvl), G);

        Flg := false;
        for lbl in Keys(OurModCrvs) do
            dat := OurModCrvs[lbl];
            if dat[2] eq lvl and dat[3] eq idx and dat[4] eq gen and IsConjugate(Gl(lvl), G, dat[5]) then
                "Identified curve ", i, " : ", lbl;
                Include(~Lbls, lbl);
                Flg :=true;
                break;
            end if;
        end for;

        if not Flg then
            print "Unable to identify curve:", i;
            print "-->", lvl, "." ,idx, ".", gen, " . ? . ?";
        end if;
    end for;

    return Lbls;
end function;

IdentifyCurvesGps := function(L)
    Lbls := [];
    for i in [1..#L] do
        G := L[i];
        lvl := #BaseRing(G);
        G := sub<Gl(lvl) | Generators(G)>;
        idx := Index(Gl(lvl), G);

        Flg := false;
        for lbl in Keys(OurModCrvs) do
            dat := OurModCrvs[lbl];
            if dat[2] eq lvl and dat[3] eq idx and IsConjugate(Gl(lvl), G, dat[5]) then
                "Identified curve ", i, " : ", lbl;
                Include(~Lbls, lbl);
                Flg :=true;
                break;
            end if;
        end for;

        if not Flg then
            print "Unable to identify curve:", i;
            print "-->", lvl, "." ,idx, ". ? . ? . ?";
        end if;
    end for;

    return Lbls;
end function;


// This function still needs some work
IdentifyCurvesX := function(L, K)
    Lnew := [];
    for i in [1..#L] do
        H := L[i];
        Hl := sub<Gl(GL2Level(H[1])) | Generators(H[1])>;
        Kl := sub<Gl(GL2Level(K)) | Generators(K)>;
        lvl := #BaseRing(Hl) * #BaseRing(Kl);
        G := <GL2Lift(Hl, lvl) meet GL2Lift(Kl, lvl), H[2]>;
        Append(~Lnew, G);
    end for;
    return IdentifyCurves(Lnew);
end function;

IdentifyProds := function(L)
    Gps := [];
    for l in L do
        if l[1] eq "1.1.0.a.1" then
            G := OurModCrvs[l[2]][5];
        end if;
        if l[2] eq "1.1.0.a.1" then
            G := OurModCrvs[l[1]][5];
        end if;
        if l[1] ne "1.1.0.a.1" and l[2] ne "1.1.0.a.1" then
            G2 := OurModCrvs[l[1]][5];
            G3 := OurModCrvs[l[2]][5];
            lvl := LCM(#BaseRing(G2), #BaseRing(G3));
            G := GL2Lift(G2, lvl) meet GL2Lift(G3, lvl);
        end if;
        Append(~Gps, G);
    end for;
    return IdentifyCurvesGps(Gps);
end function;