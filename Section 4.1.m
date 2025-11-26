
// 13.91.3.a.1

load "OpenImage-master/main/FindOpenImage.m";  // please change the path according to local directory on your system

j:=2^(18)*3^3*13^4*127^3*139^3*157^3*283^3*929/(5^(13)*61^(13));
E:=EllipticCurveFromjInvariant(j);
 G:=FindOpenImage(E); 
 Factorization(864370); //adelic level
//[ <2, 1>, <5, 1>, <13, 1>, <61, 1>, <109, 1> ]
pi:=hom<GL(2,Integers(864370))->GL(2,Integers(2))|[GL(2,Integers(2))!GL(2,Integers(864370)).i:i in [1..#Generators(GL(2,Integers(864370)))]]>;
Order(GL(2,Integers(2)))/Order(pi(G)); // 1


G; // 3 and 7 do not divide the level of G


pi:=hom<GL(2,Integers(864370))->GL(2,Integers(5))|[GL(2,Integers(5))!GL(2,Integers(864370)).i:i in [1..#Generators(GL(2,Integers(864370)))]]>;
Order(GL(2,Integers(5)))/Order(pi(G)); // 1


