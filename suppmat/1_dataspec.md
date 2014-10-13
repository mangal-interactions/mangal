% Data specification
%
%

This document lists all of the objects in the data specification, and their
fields. The `NULL` column indicates which objects can be empty (*i.e.* no
value is provided). The column `values` indicates the possible values that
this field can take.

Users are encouraged to contribute to the development of this
data specification by suggesting improvements or changes online:
<https://github.com/mangal-wg/mangal-api/issues>.


```r
library(rmangal)
```

```
## Loading required package: igraph
## Loading required package: methods
## Loading required package: cheddar
```

```r
options('width' = 150)
url = "http://localhost:8000/"
api = mangalapi(url)
print(api$resources)
```

```
## [1] "dataset"     "environment" "interaction" "item"        "network"     "reference"   "taxa"        "trait"       "user"
```

# Node level

## Taxa


```r
kable(whatIs(api, 'taxa'), format="markdown")
```



|   |field        |help                                                                                                        |type    |null  |unique |values                                                                                                                                   |
|:--|:------------|:-----------------------------------------------------------------------------------------------------------|:-------|:-----|:------|:----------------------------------------------------------------------------------------------------------------------------------------|
|1  |bold         |The BOLD identifier of the taxa                                                                             |integer |TRUE  | TRUE  |                                                                                                                                         |
|2  |description  |A short description of the taxa                                                                             |string  |TRUE  |FALSE  |                                                                                                                                         |
|3  |eol          |The EOL identifier of the taxa                                                                              |integer |TRUE  | TRUE  |                                                                                                                                         |
|4  |gbif         |The GBIF identifier of the taxa                                                                             |integer |TRUE  | TRUE  |                                                                                                                                         |
|6  |name         |The scientific name of the taxa                                                                             |string  |FALSE | TRUE  |                                                                                                                                         |
|7  |ncbi         |The NCBI Taxonomy identifier of the taxa                                                                    |integer |TRUE  | TRUE  |                                                                                                                                         |
|9  |resource_uri |Unicode string data. Ex: "Hello World"                                                                      |string  |FALSE |FALSE  |                                                                                                                                         |
|10 |status       |The taxonomic status of the taxa.                                                                           |string  |FALSE |FALSE  |confirmed, trophic species, morphospecies, nomen dubium, nomen oblitum, nomen nudum, nomen novum, nomen conservandum, species inquirenda |
|11 |traits       |A list of traits values indentifiers (or URIs) that were measured on this taxa. Good for taxa-level traits. |related |TRUE  |FALSE  |                                                                                                                                         |
|12 |tsn          |The TSN identifier                                                                                          |integer |TRUE  | TRUE  |                                                                                                                                         |
|13 |vernacular   |The vernacular name of the taxa, in English                                                                 |string  |TRUE  |FALSE  |                                                                                                                                         |

## Population


```r
kable(whatIs(api, 'population'), format="markdown")
```

```
## Error: This API do not implement objects of type population. See api$resources for more.
```

## Item


```r
kable(whatIs(api, 'item'), format="markdown")
```



|   |field        |help                                                                            |type    |null  |unique |values                 |
|:--|:------------|:-------------------------------------------------------------------------------|:-------|:-----|:------|:----------------------|
|1  |description  |A short description of the population                                           |string  |TRUE  |FALSE  |                       |
|3  |level        |Whether the item is a single individual, or a population                        |string  |FALSE |FALSE  |individual, population |
|4  |name         |A name for the item, useful to identify it later                                |string  |FALSE |FALSE  |                       |
|6  |resource_uri |Unicode string data. Ex: "Hello World"                                          |string  |FALSE |FALSE  |                       |
|7  |size         |If the item is a population, the number of individuals or biomass               |float   |TRUE  |FALSE  |                       |
|8  |taxa         |The identifier (or URI) of the taxa object to which the item belongs.           |related |FALSE |FALSE  |                       |
|9  |traits       |A list of traits values indentifiers (or URIs) that were measured on this item. |related |TRUE  |FALSE  |                       |
|10 |units        |Units in which the population size is measured                                  |string  |TRUE  |FALSE  |                       |

# Interaction level

## Interaction


```r
kable(whatIs(api, 'interaction'), format="markdown")
```



|   |field        |help                                                                                       |type     |null  |unique |values                                                                                                                                                                                                                                                                                                                      |
|:--|:------------|:------------------------------------------------------------------------------------------|:--------|:-----|:------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|1  |data         |List of identifiers (or URIs) of the references describing the data.                       |related  |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|2  |date         |The time at which the interaction was sampled                                              |datetime |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|3  |description  |A description of the interaction                                                           |string   |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|4  |environment  |List of identifiers (or URIs) of the environments associated to the interaction.           |related  |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|6  |item_from    |Identifier (or URI) of the item establishing the interaction.                              |related  |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|7  |item_to      |Identifier (or URI) of the item receiving the interaction.                                 |related  |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|8  |latitude     |Latitude                                                                                   |string   |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|9  |link_type    |The type of interaction                                                                    |string   |FALSE |FALSE  |predation, herbivory, ectoparasitism, endoparasitism, intra-cellular parasitism, parasitoidism, mycoheterotrophy, antixenosis, teletoxy, amensalism, antibiosis, allelopathy, competition, facilitation, refuge creation, inquilinism, phoresis, epibiosis, pollination, mutualistic symbiosis, zoochory, mutual protection |
|10 |longitude    |Longitude                                                                                  |string   |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|11 |obs_type     |How the interaction was observed                                                           |string   |FALSE |FALSE  |unspecified, observation, litterature, absence, inferred                                                                                                                                                                                                                                                                    |
|13 |papers       |List of identifiers (or URIs) of the references to the papers associated with the dataset. |related  |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|15 |resource_uri |Unicode string data. Ex: "Hello World"                                                     |string   |FALSE |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|16 |stage_from   |The stage of the establishing, to be selected in the list of allowed values                |string   |FALSE |FALSE  |seed, juvenile, adult, dead, larva, all                                                                                                                                                                                                                                                                                     |
|17 |stage_to     |The stage of the receiving entity, to be selected in the list of allowed values            |string   |FALSE |FALSE  |seed, juvenile, adult, dead, larva, all                                                                                                                                                                                                                                                                                     |
|18 |strength_f   |The strength of the interaction for the item ESTABLISHING the interaction                  |float    |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|19 |strength_t   |The strength of the interaction for the item RECEVING the interaction                      |float    |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|20 |taxa_from    |Identifier (or URI) of the taxa establishing the interaction.                              |related  |FALSE |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|21 |taxa_to      |Identifier (or URI) of the taxa receiving the interaction.                                 |related  |FALSE |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|22 |units_f      |Units in which the interaction strength is measured                                        |string   |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |
|23 |units_t      |Units in which the interaction strength is measured                                        |string   |TRUE  |FALSE  |                                                                                                                                                                                                                                                                                                                            |

## Network


```r
kable(whatIs(api, 'network'), format="markdown")
```



|   |field        |help                                                                                       |type     |null  |unique |values |
|:--|:------------|:------------------------------------------------------------------------------------------|:--------|:-----|:------|:------|
|1  |data         |List of identifiers (or URIs) of the references describing the data.                       |related  |TRUE  |FALSE  |       |
|2  |date         |The time at which the network was sampled                                                  |datetime |TRUE  |FALSE  |       |
|3  |description  |A short description of the network                                                         |string   |TRUE  |FALSE  |       |
|4  |environment  |List of identifiers (or URIs) of environmental measurements associated to the network.     |related  |TRUE  |FALSE  |       |
|6  |interactions |List of identifiers (or URIs) of the interactions in the network.                          |related  |FALSE |FALSE  |       |
|7  |latitude     |Latitude                                                                                   |string   |TRUE  |FALSE  |       |
|8  |longitude    |Longitude                                                                                  |string   |TRUE  |FALSE  |       |
|9  |name         |The name of the network                                                                    |string   |FALSE |FALSE  |       |
|11 |papers       |List of identifiers (or URIs) of the references to the papers associated with the dataset. |related  |TRUE  |FALSE  |       |
|13 |resource_uri |Unicode string data. Ex: "Hello World"                                                     |string   |FALSE |FALSE  |       |

## Dataset


```r
kable(whatIs(api, 'dataset'), format="markdown")
```



|   |field        |help                                                                                       |type    |null  |unique |values |
|:--|:------------|:------------------------------------------------------------------------------------------|:-------|:-----|:------|:------|
|1  |data         |A list of the id of references for the data (e.g. data papers, figshare dataset)           |related |TRUE  |FALSE  |       |
|2  |description  |A short description of the dataset                                                         |string  |TRUE  |FALSE  |       |
|3  |environment  |List of identifiers (or URIs) of the environments associated to the dataset.               |related |TRUE  |FALSE  |       |
|5  |name         |The name of the dataset                                                                    |string  |FALSE |FALSE  |       |
|6  |networks     |A list of either the id of networks, or their representation in list format                |related |FALSE |FALSE  |       |
|8  |papers       |List of identifiers (or URIs) of the references to the papers associated with the dataset. |related |TRUE  |FALSE  |       |
|10 |resource_uri |Unicode string data. Ex: "Hello World"                                                     |string  |FALSE |FALSE  |       |

# Meta-data

## Trait value


```r
kable(whatIs(api, 'trait'), format="markdown")
```



|   |field        |help                                   |type   |null  |unique |values |
|:--|:------------|:--------------------------------------|:------|:-----|:------|:------|
|1  |description  |A longer description of the trait      |string |TRUE  |FALSE  |       |
|3  |name         |The name of the measured trait         |string |FALSE |FALSE  |       |
|5  |resource_uri |Unicode string data. Ex: "Hello World" |string |FALSE |FALSE  |       |
|6  |units        |Units in which the trait was measured  |string |TRUE  |FALSE  |       |
|7  |value        |The value of the trait                 |string |FALSE |FALSE  |       |

## Environmental value


```r
kable(whatIs(api, 'environment'), format="markdown")
```



|   |field        |help                                                      |type   |null  |unique |values |
|:--|:------------|:---------------------------------------------------------|:------|:-----|:------|:------|
|1  |description  |A description of the environmental property               |string |TRUE  |FALSE  |       |
|3  |name         |The environmental property being measured                 |string |FALSE |FALSE  |       |
|5  |resource_uri |Unicode string data. Ex: "Hello World"                    |string |FALSE |FALSE  |       |
|6  |units        |The units in which the environmental property is measured |string |TRUE  |FALSE  |       |
|7  |value        |The value of the environmental property                   |string |FALSE |FALSE  |       |

## Reference


```r
kable(whatIs(api, 'reference'), format="markdown")
```



|   |field        |help                                     |type   |null  |unique |values |
|:--|:------------|:----------------------------------------|:------|:-----|:------|:------|
|1  |doi          |DOI of the reference object              |string |TRUE  |FALSE  |       |
|3  |jstor        |JSTOR identifier of the reference object |string |TRUE  |FALSE  |       |
|5  |pmid         |PubMed ID of the reference object        |string |TRUE  |FALSE  |       |
|6  |resource_uri |Unicode string data. Ex: "Hello World"   |string |FALSE |FALSE  |       |
|7  |url          |URL of the reference object              |string |TRUE  |FALSE  |       |

## User


```r
kable(whatIs(api, 'user'), format='markdown')
```



|   |field        |help                                                                        |type   |null  |unique |values |
|:--|:------------|:---------------------------------------------------------------------------|:------|:-----|:------|:------|
|1  |email        |Unicode string data. Ex: "Hello World"                                      |string |FALSE |FALSE  |       |
|2  |first_name   |Unicode string data. Ex: "Hello World"                                      |string |FALSE |FALSE  |       |
|4  |last_name    |Unicode string data. Ex: "Hello World"                                      |string |FALSE |FALSE  |       |
|5  |resource_uri |Unicode string data. Ex: "Hello World"                                      |string |FALSE |FALSE  |       |
|6  |username     |Required. 30 characters or fewer. Letters, numbers and @/./+/-/_ characters |string |FALSE | TRUE  |       |
