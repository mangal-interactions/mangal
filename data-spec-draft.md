% `mangal` -- making ecological network analysis simple
% T. Poisot
% Feb. 2013

> This is a *working document* describing `mangal`, a set of `JSON` objects templates to encode ecological networks of virtually any complexity. There are plans to host a pilot database.


# Introduction

Ecological networks enable ecologists to accommodate the complexity
of natural communities, and to discover mechanisms contributing
to their persistence, stability, resilience, and functioning
[@dunne_network_2006;@bluthgen_what_2008]. Yet, meta-analyses of a
large number of ecological networks are still extremely rare, and most
of the studies comparing several networks {ref} do so within the limit
of particular systems. Networks, as they encode the structure of complex
ecological interactions, have been time and again presented as useful tools
to understand ecosystem properties and dynamics {ref}.  Coming up with a
clear conceptual and mechanistic understanding of the relationships between
the structure of ecological networks and ecosystem properties require to
pool a large quantity of data.

On the other hand, the recent years saw the development of the idea that
network structure is itself a dynamical object, which will change as a function
of environmental conditions and as a result of meta-community processes
{ref}.  Although the *existence* of this variation has been demonstrated,
the reasons for which it happens are much less clearly understood, and
will require a change in focus, from species to populations {ref}. Because
the variability of interactions involve a host of ecological mechanisms,
it is likely that important data mining efforts will be required to fully
understand it. Notably, new approaches based on the replication of networks
over temporal, spatial, and environmental gradients are promising, but require
to have a data structure ready to accomodate the results they will produce.
Beyond just describing the structure of interactions, these data will need to
include informations about environmental context, population characteristics,
and other relevant additional explanatory variables.

In this paper, we (i) establish the need of a data specification serving
as a *lingua franca* among network ecologists, (ii) describe this data
specification. Finally, we (iii) describe `mangal`, a `R` package and
compagnon database, relying on this data specification. We provide some
use cases showing how this new approach makes complex analyzes simpler, and
allows for the integration of new tools to manipulate biodiversity resources.

# Why do we need a data specification?

Ecological networks are (often) stored as their *adjacency matrix* (or as
the quantitative link matrix), that is a series of `0` and `1` indicating,
respectively, the absence and presence of an interaction. This format is
extremely convenient for *use* (as most network analysis packages, *e.g.*
`bipartite`, `betalink`, `foodweb`) require data to be presented this way,
but is extremely inefficient at storing *meta-data*. In most cases, an
adjacency matrix will inform on the identity of species (in cases where
rows and columns headers are present), and the presence or absence of
interactions. If other data about the environment (*e.g.* where the network
was sampled) or the species (*e.g.* the population size, trait distribution,
or other observations) are available, they are most either given in other
files, or as accompanying text. In both cases, making a programmatic link
between interaction data and relevant meta-data is difficult and error-prone.

By contrast, a data specification provides a common language for network
ecologists to interact, and ensure that, regardless of their source, data
can be used in a shared workflow.

# Elements of the data specification

{complete}The data specification is built around the idea that (ecological)
networks are collections of relationships between ecological objects, each
element having particular meta-data associated.

## Node informations

### Taxa

### Population

### Item

## Network informations

### Interaction

### Network

### Dataset

## Meta-data

### Trait value

### Environmental condition

### User

paternity {ref}

### References

# Use cases

## Network centroid

## Network beta-diversity

## Connectance and richness relationships

# References
