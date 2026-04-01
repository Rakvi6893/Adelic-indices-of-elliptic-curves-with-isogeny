# Adelic indices of elliptic curves with isogeny

This repository has code to complete computations discussed in the paper "The Possible Adelic Indices for Elliptic Curves Admitting a Rational Cyclic Isogeny" by Kate Finnerty, Tyler Genao, Jacob Mayle, and Rakvi.
 
To run this code, it is necessary to install David Zywina's OpenImage repository, found [here](https://github.com/davidzywina/OpenImage/tree/master). Some files also require Zywina's modular repository, found [here](https://github.com/davidzywina/Modular). It is crucial to have an up-to-date version of MAGMA for this to run.

# Description of Files

- Section 4.2_ell-adic images: A folder of five files verifying the claims in the proofs of Propositions 18 through 22.
    - 2 isogeny l adic images: Contains computations to verify claims in the proof of Proposition 18. 

    - 3 isogeny l adic images: Contains computations to verify claims in the proof of Proposition 19.

    - 5 isogeny l adic images: Contains computations to verify claims in the proof of Proposition 20.

    - 7 isogeny l adic images: Contains computations to verify claims in the proof of Proposition 21.

    - 13 isogeny l adic images: Contains computations to verify claims in the proof of Proposition 22.

- Approach_Lattice and Approach_Product contain code to construct collection of subgroups for Section 7 and 8 respectively which we then specialize to files Case p=* for producing curves for each prime as discussed in respective subsections.

- Identifier and ReleventModCrvs are supplemental files used in each Approach_ file to identify the relevent modular curves.

- TwoAdicImages contains data to produce a list of all 2-adic images of ellipitc curves E/Q containing -I.

- Files beginning with Section contain computations to verify claims of rational points in the named section.
  

# Version notes and Contact

This code was built on MAGMA v2-28.27 and last updated in March 2026. If you have questions or suggestions or if you find bugs, please contact us.

[Kate Finnerty](https://katefinnertymath.com), Boston University, ksfinn (at) bu (dot) edu

[Tyler Genao](https://tylergenao.com/), The Ohio State University, genao.5 (at) osu (dot) edu 

[Jacob Mayle](https://www.jacobmayle.com/), University of Delaware, mayle (at) udel (dot) edu

[Rakvi](https://raakvi.wixsite.com/rakvi), The University of Maine, raakvi (at) gmail (dot) com
