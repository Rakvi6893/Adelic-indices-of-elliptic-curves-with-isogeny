ChangeDirectory("/Users/Jacob/OpenImage-master"); // Modify the path as needed
load "main/FindOpenImage.m";

// 13.91.3.a.1

j:=2^(18)*3^3*13^4*127^3*139^3*157^3*283^3*929/(5^(13)*61^(13));
E:=EllipticCurveFromjInvariant(j);
G:=FindOpenImage(E);
N := #BaseRing(G); N;
// 864370
G := sub<GL(2, Integers(N)) | [Transpose(g) : g in Generators(G)]>; // Take the transpose
Factorization(N); //adelic level
//[ <2, 1>, <5, 1>, <13, 1>, <61, 1>, <109, 1> ]
for p in PrimeDivisors(N) do
	n := p^Valuation(N, p);
	n, sub<GL(2, Integers(n)) | Generators(G)> eq GL(2, Integers(n));
end for;
/*
2 true
5 true
13 false
61 true
109 true
*/
