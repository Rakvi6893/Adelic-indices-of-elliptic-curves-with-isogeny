// This code accompanies the proof of Proposition 24 in The Possible Adelic Indices for Elliptic Curves Admitting a Rational Cyclic Isogeny by Finnerty, Genao, Mayle, and Rakvi.
// Remember to load Zywina's Open Image code as instructed in README.md.

// Considering 5-adic images
// 10.30.1.a.1

P<x>:=PolynomialRing(Rationals());
f:=x+1;
g:=x^3 + x^2 - 3*x + 1;
E:=EllipticCurve(g,f);
#TorsionSubgroup(E); // 5 points 
Rank(E); // 0 true
// one can verify on the curve's LMFDB page that these are all non CM.

// 10.15.1.a.1
P<x>:=PolynomialRing(Rationals());
f:=x+1;
g:=x^3 + x^2 + 22*x - 9;
E:=EllipticCurve(g,f);
#TorsionSubgroup(E); // 5 points
Rank(E); // 0 true
// one can verify on the curve's LMFDB page that these are all non CM.

// Considering 7-adic images
// 14.84.3.a.1
// Solved via https://github.com/rouseja/ModCrvToEC/tree/main

// 14.63.2.a.1
P<x>:=PolynomialRing(Rationals());
f:=x^2+x;
g:=- 2*x^5 + 4*x^4 - 3*x^2 + x + 1;
E:=HyperellipticCurve(g,f);

#Chabauty0(Jacobian(SimplifiedModel(E))); // 4 points
// one can verify on the curve's LMFDB page that these are all non CM.

// Considering 11-adic images and p-adic images for 19<= p < 37
// Solved via Proposition 22


//Considering 17-adic and 37-adic images
//Nothing to show.
