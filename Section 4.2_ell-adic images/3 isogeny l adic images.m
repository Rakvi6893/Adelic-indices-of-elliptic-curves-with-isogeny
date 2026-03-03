// This code accompanies the proof of Proposition 25 in The Possible Adelic Indices for Elliptic Curves Admitting a Rational Cyclic Isogeny by Finnerty, Genao, Mayle, and Rakvi.
// Remember to load Zywina's Open Image code as instructed in README.md.

//Considering 5-adic images
// 15.40.2.a.1

P<x>:=PolynomialRing(Rationals());
f:=(x^3 + x^2);
g:=2*x^6 + x^5 - 9*x^4 + 10*x^2 - 3*x - 2;
E:=HyperellipticCurve(g,f);
#Chabauty0(Jacobian(SimplifiedModel(E))); // 5 points
// one can verify on the curve's LMFDB page that these are all non CM.


//15.20.1.a.1

f:=x^3 + x^2 + 2*x + 4;
g:=P!1;
E:=EllipticCurve(f,g);
Rank(E);//0
#TorsionSubgroup(E);//5


//Considering 7-adic images
// Solved via https://github.com/rouseja/ModCrvToEC/tree/main

// Considering 11-adic images and p-adic images for 19<= p < 37
// Solved via Proposition 22

//Considering 17-adic and 37-adic images
//Nothing to show.
