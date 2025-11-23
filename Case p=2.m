load "Approach_Product.m";

//  We consider adelic indices assuming a p = 2 degree isogeny

p := 2; // Degree of isogeny
ell := 3; // 2 or 3; whichever is not isgoeny degree

// Claimed set of adelic indices in this case
Idx2 := {12, 48, 72, 96, 144, 192, 288, 384, 576, 768, 864, 1152, 1536};

TwoAdicImagesTwoIsogenyLbls := [ "2.3.0.a.1", "2.6.0.a.1", "4.6.0.a.1", "4.6.0.b.1", "4.6.0.c.1", "4.6.0.d.1", "4.6.0.e.1", "4.12.0.a.1", "4.12.0.b.1", "4.12.0.d.1", "4.12.0.e.1", "4.12.0.f.1", "4.24.0.b.1", "4.24.0.c.1", "8.6.0.a.1", "8.6.0.b.1", "8.6.0.c.1", "8.6.0.d.1", "8.6.0.e.1", "8.6.0.f.1", "8.12.0.a.1", "8.12.0.b.1", "8.12.0.d.1", "8.12.0.f.1", "8.12.0.g.1", "8.12.0.h.1", "8.12.0.i.1", "8.12.0.k.1", "8.12.0.l.1", "8.12.0.m.1", "8.12.0.n.1", "8.12.0.o.1", "8.12.0.p.1", "8.12.0.q.1", "8.12.0.r.1", "8.12.0.s.1", "8.12.0.t.1", "8.12.0.u.1", "8.12.0.v.1", "8.12.0.w.1", "8.12.0.x.1", "8.12.0.y.1", "8.12.0.z.1", "8.24.0.a.1", "8.24.0.ba.1", "8.24.0.ba.2", "8.24.0.bb.1", "8.24.0.bb.2", "8.24.0.bc.1", "8.24.0.be.1", "8.24.0.bf.1", "8.24.0.bh.1", "8.24.0.bi.1", "8.24.0.bj.1", "8.24.0.bl.1", "8.24.0.bl.2", "8.24.0.bn.1", "8.24.0.bo.1", "8.24.0.bp.1", "8.24.0.bq.1", "8.24.0.bs.1", "8.24.0.bt.1", "8.24.0.c.1", "8.24.0.d.1", "8.24.0.d.2", "8.24.0.e.1", "8.24.0.e.2", "8.24.0.f.1", "8.24.0.g.1", "8.24.0.h.1", "8.24.0.i.1", "8.24.0.k.1", "8.24.0.m.1", "8.24.0.n.1", "8.24.0.o.1", "8.24.0.q.1", "8.24.0.r.1", "8.24.0.s.1", "8.24.0.t.1", "8.24.0.v.1", "8.24.0.x.1", "8.24.0.y.1", "8.24.0.z.1", "8.48.0.b.1", "8.48.0.b.2", "8.48.0.c.1", "8.48.0.e.1", "8.48.0.e.2", "8.48.0.f.1", "8.48.0.h.1", "8.48.0.h.2", "8.48.0.i.1", "8.48.0.k.1", "8.48.0.k.2", "8.48.0.l.1", "8.48.0.l.2", "8.48.0.m.1", "8.48.0.m.2", "8.48.0.n.1", "8.48.0.n.2", "8.48.0.p.1", "8.48.0.q.1", "8.48.0.q.2", "16.24.0.a.1", "16.24.0.c.1", "16.24.0.e.1", "16.24.0.e.2", "16.24.0.f.1", "16.24.0.f.2", "16.24.0.g.1", "16.24.0.h.1", "16.24.0.i.1", "16.24.0.j.1", "16.24.0.k.1", "16.24.0.k.2", "16.24.0.l.1", "16.24.0.l.2", "16.24.0.m.1", "16.24.0.m.2", "16.24.0.n.1", "16.24.0.n.2", "16.24.0.o.1", "16.24.0.o.2", "16.24.0.p.1", "16.24.0.p.2", "16.48.0.a.1", "16.48.0.bb.1", "16.48.0.bb.2", "16.48.0.c.1", "16.48.0.c.2", "16.48.0.d.1", "16.48.0.d.2", "16.48.0.e.1", "16.48.0.h.1", "16.48.0.h.2", "16.48.0.i.1", "16.48.0.j.1", "16.48.0.l.1", "16.48.0.l.2", "16.48.0.m.1", "16.48.0.m.2", "16.48.0.n.1", "16.48.0.q.1", "16.48.0.r.1", "16.48.0.t.1", "16.48.0.t.2", "16.48.0.u.1", "16.48.0.u.2", "16.48.0.v.1", "16.48.0.v.2", "16.48.0.x.1", "16.48.0.x.2", "16.48.0.y.1", "16.48.0.y.2", "16.48.0.z.1", "16.48.0.z.2", "16.48.1.bg.1", "16.48.1.bl.1", "16.48.1.bn.1", "16.48.1.bq.1", "16.48.1.bs.1", "16.48.1.bv.1", "16.48.1.ca.1", "16.48.1.cc.1", "16.48.1.cd.1", "16.48.1.cf.1", "16.48.1.cg.1", "16.48.1.ch.1", "16.48.1.cr.1", "16.48.1.cs.1", "16.48.1.ct.1", "16.48.1.cx.1", "16.48.1.cx.2", "16.48.1.dc.1", "16.48.1.de.1", "16.48.1.df.1", "16.96.3.ey.1", "16.96.3.ey.2", "16.96.3.fa.1", "16.96.3.fa.2", "32.48.0.a.1", "32.48.0.c.1", "32.48.0.e.1", "32.48.0.e.2", "32.48.0.f.1", "32.48.0.f.2", "32.96.3.bh.1", "32.96.3.bs.1" ];
TwoAdicImagesTwoIsogeny := [OurModCrvs[lbl] : lbl in TwoAdicImagesTwoIsogenyLbls];

ThreeAdicImagesTwoIsogenyLbls := ["3.3.0.a.1", "3.6.0.b.1"];
ThreeAdicImagesTwoIsogeny := [OurModCrvs[lbl] : lbl in ThreeAdicImagesTwoIsogenyLbls];
Append(~ThreeAdicImagesTwoIsogeny, <"1.1.0.a.1", 1, 1, 0, GL(2,Integers(ell))>); // We need to also include GL(2,Z_3)


// Initalizing possible 2-adic and 3-adic images
L := AssociativeArray(); // Assoc. Array where 2-adic and 3-adic images are stored.
L[2] := TwoAdicImagesTwoIsogeny;
L[3] := ThreeAdicImagesTwoIsogeny;

Children2 := Children(p, L);
Children3 := Children(ell, L);
ChildrenProd := ChildrenProduct(Children2, Children3);

ProdsWithFinManyPts := DetermineProdsWithFinManyPts(ChildrenProd);
MaxProdsWithFinManyPts := DetermineMaxProdsWithFinManyPts(ProdsWithFinManyPts, ChildrenProd);
IdentifyProds(MaxProdsWithFinManyPts);

ProdsWithInfManyPts := Keys(ChildrenProd) diff ProdsWithFinManyPts;

DeltaE := FindDeltaE(ProdsWithInfManyPts);
ProdsWithPossiblyBadIdxSub := PossilbyBadIdx(DeltaE, Idx2);
IdentifyProds(Keys(ProdsWithPossiblyBadIdxSub));

ProdsWithBadIdxSub := CheckIfThereIsAFiberProdOfBadIdx(ProdsWithPossiblyBadIdxSub, Idx2);

// Dealing with ProdsWithBadIdxSub
Flg := false;
for prodlbl in Keys(ProdsWithBadIdxSub) do
    if prodlbl eq <"8.12.0.w.1", "3.3.0.a.1"> then
        Flg := true;
    end if;
    if Flg then
        Gps := ProdsWithBadIdxSub[prodlbl];
        prodlbl, #Gps;
        G2 := OurModCrvs[prodlbl[1]][5];
        G3 := OurModCrvs[prodlbl[2]][5];
        G := GL2Lift(G2, #BaseRing(G2) * #BaseRing(G3)) meet GL2Lift(G3, #BaseRing(G2) * #BaseRing(G3));
        lvl := GL2Level(G);
        newlvl := 6 * 2^Maximum(Valuation(lvl,2),2) * &*Append([p^Valuation(lvl,p) : p in PrimeDivisors(lvl) | p ne 2],1);
        Glift := GL2Lift(sub<Gl(lvl) | Generators(G)>, newlvl);
        M := [H`subgroup : H in MaximalSubgroups(Glift) | -One(H`subgroup) in H`subgroup and #Det(H`subgroup) eq EulerPhi(#BaseRing(H`subgroup))];
        M := [sub<Gl(GL2Level(m)) | Generators(m)> : m in M];
        for m in M do
            B := [IsConjSub(GL2Lift(g, LCM(#BaseRing(g),#BaseRing(m))), GL2Lift(m, LCM(#BaseRing(g),#BaseRing(m)))) : g in Gps];
            if true in B then
                B;
                m1 := sub< Gl(GL2Level(m)) | Generators(m) >;
                IdentifyCurvesGps([m1]);
            end if;
        end for;
    end if;
end for;
/*

<"16.24.0.p.2", "3.3.0.a.1"> 32
Identified curve  1  :  48.144.3.bf.2
[ 48.144.3.bf.2 ]
Identified curve  1  :  48.144.5.gd.1
[ 48.144.5.gd.1 ]
Identified curve  1  :  48.144.5.ga.1
[ 48.144.5.ga.1 ]
Identified curve  1  :  48.144.5.fx.1
[ 48.144.5.fx.1 ]
Identified curve  1  :  48.144.5.gf.1
[ 48.144.5.gf.1 ]
Identified curve  1  :  48.144.5.gu.1
[ 48.144.5.gu.1 ]
Identified curve  1  :  48.144.5.gx.1
[ 48.144.5.gx.1 ]
Identified curve  1  :  48.144.5.ha.1
[ 48.144.5.ha.1 ]
Identified curve  1  :  48.144.5.fm.1
[ 48.144.5.fm.1 ]
Identified curve  1  :  48.144.3.bd.1
[ 48.144.3.bd.1 ]
<"16.24.0.p.1", "3.3.0.a.1"> 32
Identified curve  1  :  48.144.5.fz.1
[ 48.144.5.fz.1 ]
Identified curve  1  :  48.144.5.gb.1
[ 48.144.5.gb.1 ]
Identified curve  1  :  48.144.5.gj.1
[ 48.144.5.gj.1 ]
Identified curve  1  :  48.144.5.fw.1
[ 48.144.5.fw.1 ]
Identified curve  1  :  48.144.3.bf.1
[ 48.144.3.bf.1 ]
Identified curve  1  :  48.144.3.bd.2
[ 48.144.3.bd.2 ]
Identified curve  1  :  48.144.5.gy.1
[ 48.144.5.gy.1 ]
Identified curve  1  :  48.144.5.hb.1
[ 48.144.5.hb.1 ]
Identified curve  1  :  48.144.5.fi.1
[ 48.144.5.fi.1 ]
Identified curve  1  :  48.144.5.gw.1
[ 48.144.5.gw.1 ]

<"16.24.0.o.1","3.3.0.a.1">

Identified curve  1  :  48.144.5.ee.1

Identified curve  1  :  48.144.7.bas.2

Identified curve  1  :  48.144.3.z.2

Identified curve  1  :  48.144.7.bgq.1

Identified curve  1  :  48.144.3.r.2

Identified curve  1  :  48.144.5.ek.2

Identified curve  1  :  48.144.5.eu.2

Identified curve  1  :  48.144.5.ei.1

Identified curve  1  :  48.144.5.eq.1

Identified curve  1  :  48.144.5.eo.1

Identified curve  1  :  48.144.5.es.2

Identified curve  1  :  48.144.5.em.2

Identified curve  1  :  48.144.5.et.1

Identified curve  1  :  48.144.5.ev.1

Identified curve  1  :  48.144.5.ej.2

Identified curve  1  :  48.144.5.ex.2

Identified curve  1  :  48.144.5.ep.2

Identified curve  1  :  48.144.5.er.2

Identified curve  1  :  48.144.5.en.1

Identified curve  1  :  48.144.3.bb.2

Identified curve  1  :  48.144.5.el.1

Identified curve  1  :  48.144.11.ys.2

Identified curve  1  :  48.144.5.eh.1

Identified curve  1  :  48.144.5.ez.2

Identified curve  1  :  48.144.5.ef.2

Identified curve  1  :  48.144.5.fb.1

Identified curve  1  :  48.144.5.ey.1

Identified curve  1  :  48.144.5.eg.2

Identified curve  1  :  48.144.5.fa.2

Identified curve  1  :  48.144.5.ew.1

Identified curve  1  :  48.144.11.yq.2

Identified curve  1  :  48.144.3.t.1

<"16.24.0.o.2","3.3.0.a.1">


Identified curve  1  :  48.144.5.ex.1

Identified curve  1  :  48.144.5.eu.1

Identified curve  1  :  48.144.5.et.2

Identified curve  1  :  48.144.5.eq.2

Identified curve  1  :  48.144.3.z.1

Identified curve  1  :  48.144.5.eh.2

Identified curve  1  :  48.144.3.r.1

Identified curve  1  :  48.144.11.ys.1

Identified curve  1  :  48.144.5.em.1

Identified curve  1  :  48.144.5.fb.2

Identified curve  1  :  48.144.5.ei.2

Identified curve  1  :  48.144.3.bb.1

Identified curve  1  :  48.144.5.el.2

Identified curve  1  :  48.144.11.yq.1

Identified curve  1  :  48.144.5.ey.2

Identified curve  1  :  48.144.5.ep.1

Identified curve  1  :  48.144.5.eo.2

Identified curve  1  :  48.144.5.ej.1

Identified curve  1  :  48.144.5.ez.1

Identified curve  1  :  48.144.5.en.2

Identified curve  1  :  48.144.7.bas.1

Identified curve  1  :  48.144.5.fa.1

Identified curve  1  :  48.144.5.ek.1

Identified curve  1  :  48.144.7.bgq.2

Identified curve  1  :  48.144.5.es.1

Identified curve  1  :  48.144.5.ew.2

Identified curve  1  :  48.144.5.ef.1

Identified curve  1  :  48.144.5.ee.2

Identified curve  1  :  48.144.5.ev.2

Identified curve  1  :  48.144.5.er.1

Identified curve  1  :  48.144.3.t.2

Identified curve  1  :  48.144.5.eg.1

<"16.24.0.k.1","3.3.0.a.1">

Identified curve  1  :  48.144.9.zs.1
Identified curve  1  :  48.144.9.baz.1
Identified curve  1  :  48.144.6.bk.1
Identified curve  1  :  48.144.7.hu.2
Identified curve  1  :  48.144.8.lv.1
Identified curve  1  :  48.144.9.bai.1
Identified curve  1  :  48.144.7.mx.1
Identified curve  1  :  48.144.7.ks.1
Identified curve  1  :  48.144.10.ls.1
Identified curve  1  :  48.144.7.mh.1

<"16.24.0.k.2","3.3.0.a.1">

Identified curve  1  :  48.144.8.lu.1
Identified curve  1  :  48.144.7.hu.1
Identified curve  1  :  48.144.9.zt.1
Identified curve  1  :  48.144.9.baj.1
Identified curve  1  :  48.144.9.bay.1
Identified curve  1  :  48.144.6.bk.2
Identified curve  1  :  48.144.7.mw.1
Identified curve  1  :  48.144.10.lt.1
Identified curve  1  :  48.144.7.mg.1
Identified curve  1  :  48.144.7.kt.1

*/

===================================================
/* For level 24 groups we consider all the subgroups with "bad indices"
<"8.12.0.w.1","3.3.0.a.1">
Identified curve  1  :  24.144.9.ejb.1
[ 24.144.9.ejb.1 ]
Identified curve  1  :  24.144.9.eid.1
[ 24.144.9.eid.1 ]
Identified curve  1  :  48.144.7.bft.1
[ 48.144.7.bft.1 ]
Identified curve  1  :  48.144.7.bfg.1
[ 48.144.7.bfg.1 ]


Identified curve  1  :  48.144.11.sm.1
[ 48.144.11.sm.1 ]

Identified curve  1  :  24.144.9.dga.1
[ 24.144.9.dga.1 ]
Identified curve  1  :  48.144.11.sr.1
[ 48.144.11.sr.1 ]

Identified curve  1  :  24.144.9.dgq.1
[ 24.144.9.dgq.1 ]
Identified curve  1  :  48.144.9.bep.1
[ 48.144.9.bep.1 ]
Identified curve  1  :  48.144.9.bfa.1
[ 48.144.9.bfa.1 ]


Identified curve  1  :  48.144.9.bjz.1
[ 48.144.9.bjz.1 ]
Identified curve  1  :  48.144.9.bks.1
[ 48.144.9.bks.1 ]


Identified curve  1  :  48.144.7.ze.1
[ 48.144.7.ze.1 ]

Identified curve  1  :  48.144.7.zv.1
[ 48.144.7.zv.1 ]

Identified curve  1  :  24.288.17.gin.1
[ 24.288.17.gin.1 ]
Identified curve  1  :  48.288.21.gvh.1
[ 48.288.21.gvh.1 ]
Identified curve  1  :  48.288.21.gvg.2
[ 48.288.21.gvg.2 ]

Identified curve  1  :  48.288.21.gvg.1
[ 48.288.21.gvg.1 ]
Identified curve  1  :  48.288.21.gvf.1
[ 48.288.21.gvf.1 ]



Identified curve  1  :  24.288.17.gim.2
[ 24.288.17.gim.2 ]
Identified curve  1  :  24.288.17.gim.1
[ 24.288.17.gim.1 ]

Identified curve  1  :  24.288.17.gil.1
[ 24.288.17.gil.1 ]

<"8.12.0.v.1","3.3.0.a.1">

Identified curve  1  :  48.288.15.cdy.1
[ 48.288.15.cdy.1 ]

Identified curve  1  :  48.288.19.hit.1
[ 48.288.19.hit.1 ]


Identified curve  1  :  48.288.19.hiq.1
[ 48.288.19.hiq.1 ]


Identified curve  1  :  48.288.21.ezi.1
[ 48.288.21.ezi.1 ]

Identified curve  1  :  48.288.17.faz.1
[ 48.288.17.faz.1 ]
Identified curve  1  :  48.288.17.fay.1
[ 48.288.17.fay.1 ]
Identified curve  1  :  48.288.21.ezh.1
[ 48.288.21.ezh.1 ]

Identified curve  1  :  48.288.15.ceb.1
[ 48.288.15.ceb.1 ]
<"8.12.0.z.1","3.3.0.a.1">

Identified curve  1  :  48.288.15.cyo.1
[ 48.288.15.cyo.1 ]
Identified curve  1  :  48.288.15.cyp.1
[ 48.288.15.cyp.1 ]

Identified curve  1  :  48.288.15.cyv.1
[ 48.288.15.cyv.1 ]

Identified curve  1  :  48.288.15.cyy.1
[ 48.288.15.cyy.1 ]

Identified curve  1  :  48.288.15.cwc.1
[ 48.288.15.cwc.1 ]

Identified curve  1  :  48.288.15.cvz.1
[ 48.288.15.cvz.1 ]
Identified curve  1  :  48.288.15.cva.1
[ 48.288.15.cva.1 ]
Identified curve  1  :  48.288.15.cvb.1
[ 48.288.15.cvb.1 ]

//48.144.3.bd.1 (maximal subgroups)

Identified curve  1  :  48.288.13.bfj.1
[ 48.288.13.bfj.1 ]
Identified curve  1  :  48.288.13.bfk.1
[ 48.288.13.bfk.1 ]
Identified curve  1  :  48.288.13.bgs.1
[ 48.288.13.bgs.1 ]
Identified curve  1  :  48.288.13.bgr.1
[ 48.288.13.bgr.1 ]
Identified curve  1  :  48.288.21.hxh.2
[ 48.288.21.hxh.2 ]
Identified curve  1  :  48.288.13.bgi.1
[ 48.288.13.bgi.1 ]
Identified curve  1  :  48.288.13.bfd.1
[ 48.288.13.bfd.1 ]
Identified curve  1  :  48.288.13.bfa.1
[ 48.288.13.bfa.1 ]
Identified curve  1  :  48.288.21.hxp.2
[ 48.288.21.hxp.2 ]
Identified curve  1  :  48.288.13.bgl.1
[ 48.288.13.bgl.1 ]
Identified curve  1  :  48.288.21.hxf.1
[ 48.288.21.hxf.1 ]

//48.144.3.bf.1 (maximal subgroups)

Identified curve  1  :  48.288.13.bhr.1
[ 48.288.13.bhr.1 ]
Identified curve  1  :  48.288.13.bhs.1
[ 48.288.13.bhs.1 ]
Identified curve  1  :  48.288.13.bib.1
[ 48.288.13.bib.1 ]
Identified curve  1  :  48.288.13.bga.1
[ 48.288.13.bga.1 ]
Identified curve  1  :  48.288.13.bhy.1
[ 48.288.13.bhy.1 ]
Identified curve  1  :  48.288.13.bfu.1
[ 48.288.13.bfu.1 ]
Identified curve  1  :  48.288.13.bft.1
[ 48.288.13.bft.1 ]
Identified curve  1  :  48.288.21.hxt.1
[ 48.288.21.hxt.1 ]
Identified curve  1  :  48.288.21.hxr.1
[ 48.288.21.hxr.1 ]
Identified curve  1  :  48.288.13.bgd.1
[ 48.288.13.bgd.1 ]
Identified curve  1  :  48.288.21.hxl.2
[ 48.288.21.hxl.2 ]
*/



