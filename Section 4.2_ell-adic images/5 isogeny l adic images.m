// This code accompanies the proof of Proposition 26 in The Possible Adelic Indices for Elliptic Curves Admitting a Rational Cyclic Isogeny.
// Remember to load Zywina's Open Image code as instructed in README.md.

load "OpenImage-master/main/GL2GroupTheory.m"; // Modify the path as needed
load "OpenImage-master/main/ModularCurves.m"; // Modify the path as needed

//Considering 7-adic images
// 35.126.6.a.1 (X_{ns}^{+}(7) x X_0(5))

P<x,y,z,w,u,t>:=PolynomialRing(Integers(),6);
Model:=[x^2 - x*y + x*u - y*w - z^2 + z*t + z*u, -2*x*z + x*w + x*t + y^2 - 3*y*z - 2*z*t - z*u, 2*x^2 + x*w - x*t - x*u + y^2 - 2*y*z + 2*y*w - y*u - z^2 + z*w - z*t - z*u, x*w + 2*x*t + 2*x*u + y*z + y*w - y*u + z^2 - z*w + z*t + z*u + 2*w*t + w*u - t^2 - t*u, x^2 + 2*x*y + x*z - 3*x*w + x*t + 2*x*u + y*z + y*w - 2*y*t - y*u - z^2 + 2*z*w + z*t + z*u - w^2 + w*t + t*u + u^2, 4*x^2 + 3*x*y + 3*x*w + x*t + x*u - 2*y*t + y*u - 2*z*w - 2*z*t - z*u + w^2 + w*t + w*u + t*u];
PointsViaLifting(Model,7,2); // empty

// Considering 11-adic images and p-adic images for 19<= p < 37
// Solved via Proposition 22

//Considering 17-adic and 37-adic images
//Nothing to show.
