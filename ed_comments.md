The note should contain information on how to acquire and install the new package - a link to where you explain the process of getting it from github might be sufficient (unless you plan to submit this to CRAN in the very near future, in which case it is sufficient to say the package is available from there).
Also, the text just says that before use, users 'should install relevant packages' - what are those packages?

> One of the code boxes was missing from the re-submission, and it gives this information (in addition to solving points 1, 3, 4, and 5). We apologize for this omission.

More care should be taken, especially with the examples.

1. The examples use functions from various packages, without detailing which packages.

> Fixed by inclusion of the missing code box.

2. It should be clear which functions belong to the rmangal package, and which functions are simply imported from other packages, such as 'plyr'. In many examples, only few functions are actually new and derive from rmangal. In the case of 'plyr' functions, they are loaded by rmangal, and seem integral to working with the data structure. Describe this relationship.

> TODO

3. Some functions in the examples are not defined at all. E.g. the 'metaweb' function does not exist in rmangal (I installed it from github on my R-3.1.1. installation), nor in any other package I know of.

> Fixed by inclusion of the missing code box.

4. The examples start with stating that users should make contact with the database first. How is that done? Could be relegated to the supp mat or there could be a reference, but it should be described.

> Fixed by inclusion of the missing code box.

5. Also, the first function uses objects 'api' and 'DSET_ID' that are undefined, which means that the example is not usable for readers. Please make sure that examples in the code can be run out-of-the-box.

> Fixed by inclusion of the missing code box.

6. Whereas the examples contain too little information on how to use the package, they contain a lot of unneccessary information such as how to plot a map or put points on a graph. I think the full process of creating the figures could be relegated to the supplementary material, if they consist mainly of non-rmangal code. Instead, the description of the package should detail which kinds of functions the package contains, and what they do. Try to to look at some recent  software notes, such as this one: http://onlinelibrary.wiley.com/doi/10.1111/j.1600-0587.2013.00695.x/abstract.

> TODO
