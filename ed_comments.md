The note should contain information on how to acquire and install the new
package - a link to where you explain the process of getting it from github
might be sufficient (unless you plan to submit this to CRAN in the very
near future, in which case it is sufficient to say the package is available
from there).  Also, the text just says that before use, users 'should install
relevant packages' - what are those packages?

> We apologize for the apparent confusion created by our
re-submission. Unfortunately, one of the code boxes was missing from the
re-submission as a result of our conversion of the text to PDF. We understand that this impeded the readability of our manuscript greatly. Importantly,
this box provided the aforementioned information in addition to solving
points 1, 3, 4, and 5 below.

More care should be taken, especially with the examples.

1. The examples use functions from various packages, without detailing
which packages.

> This issue has been fixed by our including the previously missing code box. In addition, we moved the commands to load each of the packages in the code box of each use case. This should allow readers to reproduce the examples more rapidly.

2. It should be clear which functions belong to the rmangal package, and which
functions are simply imported from other packages, such as 'plyr'. In many
examples, only few functions are actually new and derive from rmangal. In
the case of 'plyr' functions, they are loaded by rmangal, and seem integral
to working with the data structure. Describe this relationship.

> We agree with this comment. We have added a paragraph to explain which functions rmangal exports, and the rationale for their names. We also followed your suggestion to re-work the use cases, and move all non-rmangal commands outside of the text an into sourced files. We have also added a justification of why plyr is a good way to simplify a lot of the operations related to rmangal use.

3. Some functions in the examples are not defined at all. E.g. the 'metaweb'
function does not exist in rmangal (I installed it from github on my
R-3.1.1. installation), nor in any other package I know of.

> As above, this issue has been fixed by our including the previously missing
code box. The metaweb function is defined in the betalink package, which we released
as part of a previous project.

4. The examples start with stating that users should make contact with the
database first. How is that done? Could be relegated to the supp mat or
there could be a reference, but it should be described.

> As above, this issue has been fixed by our including the previously missing
code box. The part of the original code box has been commented to make these steps very clear.

5. Also, the first function uses objects 'api' and 'DSET_ID' that are
undefined, which means that the example is not usable for readers. Please
make sure that examples in the code can be run out-of-the-box.

> As above, this issue has been fixed by our including the previously missing
code box. We additionalty removed the DSET_ID object, and just use the plain value in each of the code boxes.

6. Whereas the examples contain too little information on how to use the
package, they contain a lot of unneccessary information such as how to plot
a map or put points on a graph. I think the full process of creating the
figures could be relegated to the supplementary material, if they consist
mainly of non-rmangal code. Instead, the description of the package
should detail which kinds of functions the package contains, and what
they do. Try to to look at some recent software notes, such as this one:
http://onlinelibrary.wiley.com/doi/10.1111/j.1600-0587.2013.00695.x/abstract.

> As we have explained above, we have re-worked the use cases. In particular, we have added an example of how an user can create taxa and interaction objects, along with information about the documentation and vignettes. We would like to mention that while the paper was being prepared and reviewed, we distributed the package to several colleagues. They expressed interest in the paper focusing more on how to use rmangal in the context of practical examples, rather than it being a list of functions. In this perspective, we respectfully submit that you allow us to keep the use cases as they now are; we and early users feel like they give an accurate representation of how rmangal would be used in actual projects.
> 
> On behalf of the authors
> T. Poisot
