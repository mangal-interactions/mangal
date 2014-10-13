# Recommendation by the Subject Editor (anonymous):

The two reviewers are enthusiastic about a suggested protocol for standardising
and sharing ecological network data, and I share the sentiment that this is
potentially very promising. The reviewers raise a number of concerns, which
I am confident that you can address, and which would improve the MS greatly.

The problem with standards, always, is that they depend on an almost complete
uptake of the standard across the field, which requires that there is 1) no
major competing standard, 2) the standard provides considerable advantages
for data analysis, and 3) that the standard is easy and intuitive to use
and thus does not require much extra work. I think this manuscript would be
greatly improved by emphasising point 2 and especially point 3 above. The
rmangal package is clearly a major effort with strong capabilities, which
makes it more challenging to ensure that it is easily accessible for new users.

The current version of the MS focuses highly on defining the elements of the
standard, but gives less attention to the use of the actual software (i.e. the
R package). Instead of the 'source(x)' statements given in the MS, it would
be better to show the use of the actual functions included in rmangal, and
show how they are used to access network data and metadata, highlighting the
code bits that are exclusive to the package. The rest of the example  code,
detailing how to construct the figures, can be kept in the supplementary
materials. I also agree with reviewer 1 that it would be helpful with a
description of how to create the mangal objects from existing network data.

In the example code, most of the actual data processing is done with functions
from the plyr package, possibly because the mangal objects are a type of
list. If this is part of the intended workflow, it would be helpful if you
could discuss and describe this here.

In short, I am very positive about this contribution, but think that the
presentation of user accessibility could be improved.

Michael K. Borregaard

# Reviewer(s)' Comments to Author: Reviewer: 1

## Comments to the Author

Timothée Poisot and collegues provides a timely and potentially very useful
suggestion for how to share ecological interaction networks. I really like
the idea that data should be uploaded/shared in a standardized format,
because, as the author mention, a lot of information may be lost if only
binary interactions matrices are provided, and it can be difficult to figure
out how each dataset was collected and established. A standardized scheme
would indeed be useful in this respect.

First of all, I did not succeed in installing the package (rmangal) from
github, so I haven’t been able to try it out myself.

> We apologize for the inconvenience. There have been some changes in packages
required by `rmangal` during the review of this manuscript, and we worked
as rapidly as we could in order to fix them. It would have been useful if
the referee could have given more information about the nature of the error,
so that we can either troubleshoot it or take steps to ensure that there is
no error in the package itself.

Secondly, I think the descriptions of “Population” (page 7) and “Item”
(page 7) are very difficult to follow. Even when referring to the appendix
it is not completely clear to me what the authors mean with these. For
instance, what do you mean with the sentence: “Populations do not have
associated meta-data, but serve as “containers” for item objects”.
Also (page 7, line 13-) you refer to “individual” and “population”. Is
population something different that the population described in line 9-11
(page 7). And when you talk about individual-level network is that the same as
individual-based networks as described by for example Gómez and Perfectti
(2012). I’m not sure, but I guess what you mean with “individual”
and “population” is whether the sampling unit is individuals or whether
individuals have been pooled into populations of the same species? If that
is the case, then the description has to be a bit more precise.

> We agree entirely. Following this remark, and feedback from other users of
the project, we decided to remove the `Population` objects, and link `Items`
directly to the `Taxa`. We feel that this will make the overall specification
-- no to mention the data upload process -- easier.


Also, the taxonomic identifier option under the heading “Item” (page 7),
is that something contributors have to enter themselves, or is that information
gathered automatically by rmangal once the taxonomic name has been entered?

> We are not sure what is being refered to, as the sub-heading on Items does
not mention taxonomic information. Taxonomic information is associated to
`taxa` objects, so we will assume that this is what the referee had in
mind. Contributors can give values when they upload the `taxa` object, or
can alter them at a later time. In addition, we run bi-monthly checks on
the database and try to automate the retrieval of all taxonomic identifiers
given the taxonomic name. We updated the paper to make this clear.

Finally, it is not completely clear to me if contributors have to enter all
the data fields mentioned in the appendix. You mention that that rmangal
can create the correct format, but which format does the data need to be in,
so that rmangal can interpret it? Importantly, to me it was not completely
clear how one could contribute with data, i.e. how the data fields are filled.

> As mentionned in the text, the `whatIs` function will return a table with a
field saying whether the fields are mandatory. The data should be presented as
`list`s objects, and the users have to prepare these lists themselves. We have
prepared a detailed help page, with examples, on the website (a *tentative*
copy of which is attached to this revision; it is still undergoing editing
at the moment as feedback from users accumulate).

As stated earlier I think this can potentially be very useful way of sharing
interaction networks. My only concern is that it may be too complicated and
difficult. If people have to go through a lot of steps to enter their data,
people may skip it completely. I therefor think it will be really important
to explain exactly how it is done. Maybe I’m misunderstanding it and maybe
it is really simple to contribute data. If that is the case it should be
stated clearly in the manuscript.

> We agree entirely. To this end, we have added a documentation on how to
upload data. The upload process was designed to be as simple as possible,
and early users of the package reported no trouble uploading datasets.

Other information your could consider including: Your “obs_type” field
could be expanded to include more specific details about the sampling protocol
(is it based on transects of plot surveys; in the case of mutualism it could
be based on timed observations of only one of the partners; seed-dispersal
networks could be based on droppings or observations of direct feeding
interactions; likewise parasitism could be based on direct observations or
rearing experiment; and predation could be direct observations or analysis
of gut content etc.)  Also, analysis of droppings and gut content could be
based on DNA analysis.

> We agree that there are many ways to measure an observation. We have added a
`references` field to  the `interaction` objects, so that people can refer to
the original text to see how the interaction was measured. We think the keeping
the number of elements for `obs_type` low will make it easier to add data.

## Minor comments:

Page 4 Line 8: I’m not sure I understand the sentence:
“….can vary from one realization to another”. What do you mean with
realization?

> Replaced with "locality"

Line 10: The reference looks a bit weird

> All references have been fixed.

Page 5 Line 3: Vernacular names --> Common name? 

> We think this is a matter of preference, and ours is to "vernacular". No
changes.

Line 5: Reference looks weird

> Same as above.

Line 5-6. ncbi, gbif, itis, eol and bold. Should these words be explained or
is that fully understandable abbreviations?

> We gave the full version. `itis` was replaced by `tsn`, notably for
consistency with other tools such as `taxize`.

Line 14: “…than there…” --> “….as there….”?

> Corrected.

Line 21: Remove “a minima”

> Corrected.

Page 8 Line 21: Hyperlink does not work

> Will work in the final version of the paper.

Page 9 Line 5: Hyperlink does not work

> Same as above.

Line 9-11: I’m not sure I understand this. Is the identifier
given as: “These data were deposited in the mangal format at
<URL>/api/v1/dataset/<ID>”?

> This is correct -- we added a clarification.

Line 20: Fig. XX --> Fig. 3?

> Fixed.

Fig. 1 I think it is a bit difficult to see which are written in Bold. Maybe
it is just the font type. However you could consider making it more clear which
data that are the minimal elements needed. For example by underlining the text,
using a different colour or something else.  Why are some written in italic?

> We re-drew the figure entirely.

Fig. 2 What does “Constant connectance” refer to?

> We updated the legend to make it stand-alone.

Fig. 4 I think some more details are required in the figure legend. For
instance, what does the axis represent, and what is the grey (=land?) and
white (=water?) area. What is the interactions between the species.

> We added these clarifications.

References Gómez, J.M. & Perfectti, F. (2012) Fitness consequences of
centrality in mutualistic individual-based networks. Proceedings of the
Royal Society B: Biological Sciences, 279, 1754-1760.

# Reviewer: 2

## Comments to the Author

Overall, I think this is a great contribution to ecology. Creating a standard
for network data that the community can coalesce around is a great goal. I
completely agree with the authors that using a standard specification will
ease data reuse, submission, and analyses. I have a few comments for the
authors to consider.

The authors may want to think about supporting in some way easy transformation
of data to EML (ecological metadata language). The EML R packge in development
(https://github.com/ropensci/EML) may make this easy. Would be an easy way
for users to submit to repositories that require EML specification.

> We agree with the endgoal, but we do not think this should be done at
the database level. The purpose of an API is that it also allows to write
converters from different formats. As of now, and as stated in the paper,
we are working on exporting data into the *Darwin Core Archive* format to
create interactions with the GLOBI initiative.

References: Wouldn’t it be possible to have different references for
individual interactions in a food web? Seems references are only possible
at the dataset level now?  Maybe I’m wrong.

> This is one of the issues raised by early users while the paper was under
review. We have now added a `references` field for both interactions *and*
networks.

Licenses: What is the process if someone does not want the CC0
license on their network data? Are they forced to use CC0?  Just
curious. Perhaps there can be something about this in the package
so it is clear. I see there is a paragraph in one of the vignettes here
https://github.com/mangal-wg/rmangal/blob/master/vignettes/rmangal_upload.Rmd#L80-L88
-- perhaps there can be a vignette just on this topic.

> We think that *CC0* is emerging as a community standard for data sharing,
being used by figshare and data dryad most notably. Authors are free to upload
*private* datasets, that won't appear either through the web or API listings,
as long as they release them when they are first used in a paper.

I’m curious why packages used in rmangal are in Depends? Are function
in those packages meant to be used by users? Perhaps igraph and cheddar,
but likely not the others? Perhaps move these all to Imports if not meant
to be exposed to the user directly?

> This is a good point. We tidied the R code considerably for the revision.

## Minor Points:

-pg3, line 9: eplicability to applicability

> Fixed (to *replicability*)

-Some references are still in `@ref` format, perhaps missing entry in the bibtex file

> Fixed.

-pg4, line 8: “one realization to another” in the sentence “More
recently, new studies introduced the idea that networks can vary from
one realization to another” is a bit vague.

> We changed this.

-pg4, lines 25-27: You can store metadata assoc. with a matrix easily via
attributes. Maybe this should be admitted so reader doesn’t think there
is no way to store metadata with a matrix. Or metadata can be stored as part
of a S3/S4/RC class in R along with the matrix but in different slots.

> This is corect. We have added some information in the text.

-It seems vignettes are not in the pkg when installed right now. The line
https://github.com/mangal-wg/rmangal/blob/master/DESCRIPTION#L19 is commented
out, which I imagine is the offending line. I imagine this is on purpose
though for now?

> This was because `knitr` failed when vignettes contained UTF-8
characters. This has been fixed, and vignettes are now built.

-pg8, line 22: Link to CC0 license information? Bravo! Good default
license choice.

-The authors don’t reference the output figures in the
examples section. 

> This has been fixed.

-The appropriate places for tests is now in the root dir
`tests/`. See https://github.com/hadley/testthat#integration-with-r-cmd-check

> This is being worked on at the moment. The complete test suite will most
likely not be released, as the upload function will result in the creation
of garbage records in the database.

-A few tests are included in the pkg, Would be nice to see a more complete
test suite down the road.

> As mentionned above, we will upload the test suite in future releases if
we end up depositing the package into CRAN.

Example scripts: All worked, but I had to install from a branch

devtools::install_github('mangal-wg/rmangal', ref='hotfix-igraph')

The master branch failed on all scripts on the toIgraph()
function, which I see was a problem fixed by that hotfix branch
https://github.com/mangal-wg/rmangal/issues/22.

> We have now merged the `dev` and `hotifx-*` branches into `master`, and
installation works in all cases we tested.
