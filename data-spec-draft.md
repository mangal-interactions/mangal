% `mangal` -- a public database and data format for species interactions
% T. Poisot, the WOL consortium, SFI Working Group (?) & D. Gravel
% Feb. 2013

> This is a *working document* describing `mangal`, a set of `JSON` objects templates to encode ecological networks of virtually any complexity. There are plans to host a pilot database.

I (**TP**) would target [*Source Code for Biology and Medicine*](http://www.scfbm.org/).

# The need for a data specification

Ecological networks enable ecologists to accommodate the complexity
of natural communities, and to discover mechanisms contributing
to their persistence, stability, resilience, and functioning
[@dunne_network_2006;@bluthgen_what_2008]. Yet, meta-analyses
of a large number of ecological networks are still extremely
rare, and most of the studies comparing sveeral networks [*e.g.*
@schleuning_specialization_2011;@dalsgaard_historical_2013] do so
within the limit of particular systems. Networks, as they encode
the structure of complex ecological interactions, have been time and
egain presented as useful tools to understand ecosystem properties and dynamics
[@kefi_more_2012;@saavedra_strong_2011;@bascompte_asymmetric_2006;@poisot_trophic_2013;@thompson_food_2012].
Coming up with a clear conceptual and mechanistic understanding of the
relationships between the structure of ecological networks and ecosystem
properties require to pool a large quantity of data.

On the other hand, the recent years saw the development of the idea that
network structure is itself a dynamical object, which will change as a function
of environmental conditions and as a result of meta-community processes
[@poisot_dissimilarity_2012;@gravel_trophic_2011;@calcagno_constraints_2011;@massol_linking_2011].
Although the *existence* of this variation has been demonstrated, the
reasons for which it happens are much less clearly understood, and will
probably require extensive data mining to be figured out. Notably, new
approaches based on the replication of networks over temporal, spatial, and
environmental gradients are required, and these in turn ask for new data types.
Beyond just describing the structure of interactions, these data will need to
include informations about environmental context, population characteristics,
and other relevant additional explanatory variables.

Theoretical and empirical literature provide guidance about what data need
be collected, which is important to design the data structure. First, it is
well estblished that interactions rely on some degree of trait matching or
complementarity. For example, food web structure is contingent upon body-size
of species [@gravel_inferring_2013;@brose_consumerresource_2006].

This paper pursues a double goal. First, we outline the different data needed to
effectively conduct meta-analyses of ecological networks. Second, we propose an
architecture to store these data, which can easily be implemented as a database,
allowing for the efficient sharing of large quantities of data
between groups. We then discuss the possibility to develop an API
surrounding different databases, so that different sources of
informations can be seemlessly integrated.

# The elements of a network

Basic idea is to have *layers* in the data specification, each corresponding to one layer of organization in the networks. What I see currently is

- nodes
- edges
- networks

This will require some *glue* objects, but it should be simple enough.

## The properties of nodes

- scale of organization
- biodiversity descriptors

## The properties of edges

## The properties of networks

- sample location
- sample date
- methodology
- associated references

# Current implementation

## The data format

This will mostly describe several data templates for each of the scales in the previous section.

## The `mangal` database

# `R` interface

# Conclusion and future directions

# References
