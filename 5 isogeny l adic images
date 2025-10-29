// This code accompanies the proof of Proposition 26 in The Possible Adelic Indices for Elliptic Curves Admitting a Rational Cyclic Isogeny by Finnerty, Genao, Mayle, and Rakvi.
// Remember to load Zywina's Open Image code as instructed in README.md.

// Helper function due to David Zywina
function PointsViaLifting(psi,p,m)
    /* Input:
            psi: a sequence of homogeneous polynomials in Z[x_1,...,x_r]
            p  : a prime
            m  : an integer at least one    
        Output:
            The set of points C(Z/p^m), where C is the subscheme of P^(r-1)_Q defined by psi.
    */    
    r:=Rank(Parent(psi[1]));
    PolZ<[x]>:=PolynomialRing(Integers(),r);
    psi:=[PolZ!f: f in psi];

    PP:=ProjectiveSpace(GF(p),r-1);
    C:=Scheme(PP,psi);
    S:={Eltseq(P): P in Points(C)};   // points mod p
    S:={[Integers()!a: a in P]: P in S};

    e:=1;
    while e lt m do
        PP:=ProjectiveSpace(Integers(p^(e+1)),r-1);
        Snew:={};        
        for P in S do
            // For each point in C(Z/p^e), we find all possible lifts to C(Z/p^(e+1)).
            A:=[]; b:=[];
            Pol<[a]>:=PolynomialRing(Integers(),r);
            for f in psi do
                pol:=Evaluate(f,[P[i]+p^e*a[i]: i in [1..r]]);
                A:=A cat [[MonomialCoefficient(pol,a[i]) div p^e : i in [1..r]]];
                b:=b cat [ -MonomialCoefficient(pol,1) div p^e ];
            end for;
            A:=ChangeRing(Matrix(A),GF(p));
            b:=ChangeRing(Vector(b),GF(p));
            flag,v,W:=IsConsistent(Transpose(A),b);
            if flag then 
                T:={Eltseq(v+w): w in W};
                T:={[Integers()!a: a in w] : w in T};
                T:={ [P[i]+p^e*w[i]: i in [1..r]] : w in T};
                T:={PP!w: w in T}; 
                Snew:=Snew join T;
            end if;
        end for;
        S:={Eltseq(P): P in Snew};
        S:={[Integers()!a: a in P]: P in S};
        e:=e+1;
    end while;

    S:={[Integers(p^m)!a: a in P] : P in S};
    return S;
end function;

//Considering 7-adic images
// 35.126.6.a.1 (X_{ns}^{+}(7) x X_0(5))

P<x,y,z,w,u,t>:=PolynomialRing(Integers(),6);
Model:=[x^2 - x*y + x*u - y*w - z^2 + z*t + z*u, -2*x*z + x*w + x*t + y^2 - 3*y*z - 2*z*t - z*u, 2*x^2 + x*w - x*t - x*u + y^2 - 2*y*z + 2*y*w - y*u - z^2 + z*w - z*t - z*u, x*w + 2*x*t + 2*x*u + y*z + y*w - y*u + z^2 - z*w + z*t + z*u + 2*w*t + w*u - t^2 - t*u, x^2 + 2*x*y + x*z - 3*x*w + x*t + 2*x*u + y*z + y*w - 2*y*t - y*u - z^2 + 2*z*w + z*t + z*u - w^2 + w*t + t*u + u^2, 4*x^2 + 3*x*y + 3*x*w + x*t + x*u - 2*y*t + y*u - 2*z*w - 2*z*t - z*u + w^2 + w*t + w*u + t*u];
PointsViaLifting(Model,7,2); // empty

// Considering 11-adic images and p-adic images for 19<= p < 37
// Solved via Proposition 22

//Considering 13-adic images
// 13.91.3.a.1
load "OpenImage-master/main/FindOpenImage.m";  // please change the path according to local directory on your system

j:=2^(18)*3^3*13^4*127^3*139^3*157^3*283^3*929/(5^(13)*61^(13));
E:=EllipticCurveFromjInvariant(j);
 G:=FindOpenImage(E); 
pi:=hom<GL(2,Integers(864370))->GL(2,Integers(5))|[GL(2,Integers(5))!GL(2,Integers(864370)).i:i in [1..#Generators(GL(2,Integers(864370)))]]>;
Order(GL(2,Integers(5)))/Order(pi(G)); // 1


//Considering 17-adic and 37-adic images
//Nothing to show.
