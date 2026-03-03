// This code accompanies the proof of Proposition 28 in The Possible Adelic Indices for Elliptic Curves Admitting a Rational Cyclic Isogeny by Finnerty, Genao, Mayle, and Rakvi.
// Remember to load Zywina's Open Image code as instructed in README.md.

// The following function is due to David Zywina.
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

//Considering 5-adic images
// 65.140.9.a.1 

P<x,y,z,w,u,v,r,s,t>:=PolynomialRing(Integers(),9);
Model:=[x^2 - x*z + x*w + x*t + x*u + 2*x*s + y*s + 2*z^2 - z*t - w^2 + w*r + v*s - r*s + s^2, x^2 + x*z - 2*x*w - x*t + x*s + z^2 - z*w - z*t - z*r - w^2 - w*u + 2*w*r + t*r + u*r + v*s, x^2 + x*z - x*w + x*u + x*r + x*s + 2*z^2 - 3*z*w - 2*z*t - z*u + z*s + w^2 + w*t - w*s - t*s, x*y - x*z + x*w + x*t + x*u + x*s + 2*y*z - y*w - y*t - 3*z^2 - z*w + z*t - z*u + z*s + w^2 + w*t - w*s - t*s - v*s, x^2 + x*y - x*z - x*t - x*u + x*v - 2*x*s - 2*y*z - y*w - y*t - 2*y*s + z^2 + z*w + z*t - z*u + z*s - w*r - w*s - t*s - u*r - v*s, x*y - x*z + x*u + 2*x*r - 2*y*z - 2*y*s + z^2 + 2*w^2 + 2*w*t - w*u + 2*w*r + 2*u*r + u*s - v*s - r^2 + r*s - s^2, 2*x^2 - x*y - 2*x*w - 2*x*u - x*v - x*r - x*s + y*z + y*t - y*u + y*s + z^2 - 2*z*w - 2*z*t + z*u + z*r - z*s + w^2 + w*u - w*r + w*s - t*r + t*s - u*v + v*s, 2*x^2 - x*y + x*z + x*w - x*u - 2*x*r + y*t + y*r + y*s + z^2 - 2*z*t + w^2 - w*t + 2*w*u - 3*w*r - t*r + u^2 - u*v - u*r + u*s - v*r - v*s + s^2, x*z - x*w - x*t - z^2 + z*w + z*t - z*r + 2*w^2 + w*t + 2*w*u + w*r + t*u + t*r + u^2 + u*r + u*s - v*s, 2*x*y - x*w - x*t + x*v + x*s + y*z - y*w - y*t - z^2 - z*w - z*t - w^2 + w*t - w*u + t^2 - u*r, 2*x*z - x*w - x*t + x*u + x*v + x*r + x*s + y*u + y*r - z*w - z*t - z*u + z*v - z*r - w*u - w*v - w*r - t*v + u*s - v*r + r*s, x*z + 2*x*u + x*v + 2*x*r + x*s + y*w + y*u - z^2 - z*u + z*v + w^2 + w*t - t*s + u*v - s^2, 2*x^2 + 2*x*y - 2*x*z + x*u + x*v - z*w - z*t - z*u + z*v - z*s - w*u + u*s, x*z - x*t + x*r - x*s - y*z - y*w - y*t - y*s + z^2 + z*t - z*r + z*s + w^2 + w*t - w*u + w*r - 2*w*s + t*r - t*s + u*r + r*s, x^2 + 2*x*y - 2*x*z - x*w + x*u + x*v + 2*x*r + y*z - y*w - y*t - z*w + z*s + w^2 + w*t - w*u - w*s - t*s + u*s, x*y - 2*x*z + 2*x*w + x*t + 2*x*u + x*r + x*s - y*z + y*u - y*s + z*w - 2*z*u - z*r + z*s + w^2 + w*t - w*u + w*v + w*r - w*s + t*v - t*s + u*v + u*s + v*r - v*s - r*s, 2*x^2 + x*y - x*t - x*u - x*r - x*s + y*z - y*w - y*t - 2*z^2 - 2*z*w + z*t - z*u + z*v + z*r - w*u - w*r - w*s - t*v - u*v + u*s - v*r - v*s + r*s + s^2, x*z + x*u + x*r + x*s - y*s + z^2 - z*w - z*t + 2*z*s - w^2 - w*u + w*s + u*s, 2*x*z - x*w - x*t - x*v - y*z - y*u - y*r - y*s + 2*z*w + z*t + z*u + z*v + 2*w*r + t*r + u*r - u*s + v*r - s^2, 2*x*z - x*w + x*u + 2*x*r + y*z - y*w - y*t + y*s + z^2 - z*u - z*v + z*r + w*u - w*s - t*s - u*r - u*s - r*s, x^2 + x*z + x*w - x*t - x*u + x*v - x*s - y^2 + 2*y*w + y*u + y*v + z^2 + z*w + z*t - z*u - z*r + z*s - w*t - w*v - 2*w*r - 2*w*s - t*v - t*s - u*v - 2*u*r + v^2 + v*r - v*s + r^2 - r*s + s^2];
PointsViaLifting(Model,2,3); // empty

// Considering 7-adic images, 11-adic images and p-adic images for 19<= p < 37
// Solved via Proposition 22


//Considering 17-adic and 37-adic images
//Nothing to show.
