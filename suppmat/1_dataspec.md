% Data specification
%
%


```r
library(rmangal)
```

```
## Loading required package: rjson
## Loading required package: httr
## Loading required package: plyr
## Loading required package: igraph
## Loading required package: methods
## Loading required package: stringr
## Loading required package: cheddar
```

```r
options(width = 150)
url = "http://localhost:8000"
api = mangalapi(url)
print(api$resources)
```

```
##  [1] "dataset"     "environment" "interaction" "item"        "network"     "population"  "reference"   "taxa"        "trait"       "user"
```


# Node level

## Taxa


```r
kable(whatIs(api, "taxa"), format = "markdown")
```

|id  |field        |help                                         |type     |null   |unique  |values  |
|:---|:------------|:--------------------------------------------|:--------|:------|:-------|:-------|
|1   |bold         |The BOLD identifier of the taxa              |integer  |TRUE   | TRUE   |        |
|2   |description  |A short description of the taxa              |string   |TRUE   |FALSE   |        |
|3   |eol          |The EOL identifier of the taxa               |integer  |TRUE   | TRUE   |        |
|4   |gbif         |The GBIF identifier of the taxa              |integer  |TRUE   | TRUE   |        |
|6   |itis         |The ITIS identifier of the taxa              |integer  |TRUE   | TRUE   |        |
|7   |name         |The scientific name of the taxa              |string   |FALSE  | TRUE   |        |
|8   |ncbi         |The NCBI Taxonomy identifier of the taxa     |integer  |TRUE   | TRUE   |        |
|10  |vernacular   |The vernacular name of the taxa, in English  |string   |TRUE   |FALSE   |        |


## Population


```r
kable(whatIs(api, "population"), format = "markdown")
```

|id  |field        |help                                                                         |type     |null   |unique  |values  |
|:---|:------------|:----------------------------------------------------------------------------|:--------|:------|:-------|:-------|
|1   |description  |A short description of the population                                        |string   |TRUE   |FALSE   |        |
|3   |name         |A name allowing to identify the population                                   |string   |FALSE  |FALSE   |        |
|5   |taxa         |The identifier (or URI) of the taxa object to which the population belongs.  |related  |FALSE  |FALSE   |        |


## Item


```r
kable(whatIs(api, "item"), format = "markdown")
```

|id  |field        |help                                                                             |type     |null   |unique  |values                                   |
|:---|:------------|:--------------------------------------------------------------------------------|:--------|:------|:-------|:----------------------------------------|
|1   |description  |A short description of the population                                            |string   |TRUE   |FALSE   |                                         |
|3   |level        |Whether the item is a single individual, or a population                         |string   |FALSE  |FALSE   |individual, population                   |
|4   |name         |A name for the item, useful to identify it later                                 |string   |FALSE  |FALSE   |                                         |
|6   |population   |The identifier (or URI) of the population object to which the item belongs.      |related  |FALSE  |FALSE   |                                         |
|8   |size         |If the item is a population, the number of individuals or biomass                |float    |TRUE   |FALSE   |                                         |
|9   |stage        |The stage of the item, to be selected in the list of allowed values              |string   |FALSE  |FALSE   |seed, juvenile, adult, dead, larva, all  |
|10  |traits       |A list of traits values indentifiers (or URIs) that were measured on this item.  |related  |TRUE   |FALSE   |                                         |
|11  |units        |Units in which the population size is measured                                   |string   |TRUE   |FALSE   |                                         |


# Interaction level

## Interaction


```r
kable(whatIs(api, "interaction"), format = "markdown")
```

|id  |field        |help                                                                       |type     |null   |unique  |values                                                                                                                                                                                                                                                                                                            |
|:---|:------------|:--------------------------------------------------------------------------|:--------|:------|:-------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|1   |description  |A description of the interaction                                           |string   |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|3   |item_from    |Identifier (or URI) of the item establishing the interaction.              |related  |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|4   |item_to      |Identifier (or URI) of the item receiving the interaction.                 |related  |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|5   |link_type    |The type of interaction                                                    |string   |FALSE  |FALSE   |predation, ectoparasitism, endoparasitism, intra-cellular parasitism, parasitoidism, mycoheterotrophy, antixenosis, teletoxy, amensalism, antibiosis, allelopathy, competition, facilitation, refuge creation, inquilinism, phoresis, epibiosis, pollination, mutualistic symbiosis, zoochory, mutual protection  |
|6   |obs_type     |How the interaction was observed                                           |string   |FALSE  |FALSE   |unspecified, observation, litterature, absence, inferred                                                                                                                                                                                                                                                          |
|8   |pop_from     |Identifier (or URI) of the pop. establishing the interaction.              |related  |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|9   |pop_to       |Identifier (or URI) of the pop. receiving the interaction.                 |related  |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|10  |strength_f   |The strength of the interaction for the item ESTABLISHING the interaction  |float    |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|11  |strength_t   |The strength of the interaction for the item RECEVING the interaction      |float    |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|12  |taxa_from    |Identifier (or URI) of the taxa establishing the interaction.              |related  |FALSE  |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|13  |taxa_to      |Identifier (or URI) of the taxa receiving the interaction.                 |related  |FALSE  |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|14  |units_f      |Units in which the interaction strength is measured                        |string   |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |
|15  |units_t      |Units in which the interaction strength is measured                        |string   |TRUE   |FALSE   |                                                                                                                                                                                                                                                                                                                  |


## Network


```r
kable(whatIs(api, "network"), format = "markdown")
```

|id  |field         |help                                                                                    |type     |null   |unique  |values  |
|:---|:-------------|:---------------------------------------------------------------------------------------|:--------|:------|:-------|:-------|
|1   |date          |The date at which the network was sampled                                               |string   |TRUE   |FALSE   |        |
|2   |description   |A short description of the network                                                      |string   |TRUE   |FALSE   |        |
|3   |environment   |List of identifiers (or URIs) of environmental measurements associated to the network.  |related  |TRUE   |FALSE   |        |
|5   |interactions  |List of identifiers (or URIs) of the interactions in the network.                       |related  |FALSE  |FALSE   |        |
|6   |latitude      |Latitude                                                                                |string   |TRUE   |FALSE   |        |
|7   |longitude     |Longitude                                                                               |string   |TRUE   |FALSE   |        |
|8   |name          |The name of the network                                                                 |string   |FALSE  |FALSE   |        |


## Dataset


```r
kable(whatIs(api, "dataset"), format = "markdown")
```

|id  |field        |help                                                                                        |type     |null   |unique  |values  |
|:---|:------------|:-------------------------------------------------------------------------------------------|:--------|:------|:-------|:-------|
|1   |data         |A list of the id of references for the data (e.g. data papers, figshare dataset)            |related  |TRUE   |FALSE   |        |
|2   |description  |A short description of the dataset                                                          |string   |TRUE   |FALSE   |        |
|4   |name         |The name of the dataset                                                                     |string   |FALSE  |FALSE   |        |
|5   |networks     |A list of either the id of networks, or their representation in list format                 |related  |FALSE  |FALSE   |        |
|7   |papers       |List of identifiers (or URIs) of the references to the papers associated with the dataset.  |related  |TRUE   |FALSE   |        |


# Meta-data

## Trait value


```r
kable(whatIs(api, "trait"), format = "markdown")
```

|id  |field        |help                                   |type    |null   |unique  |values  |
|:---|:------------|:--------------------------------------|:-------|:------|:-------|:-------|
|1   |description  |A longer description of the trait      |string  |TRUE   |FALSE   |        |
|3   |name         |The name of the measured trait         |string  |FALSE  |FALSE   |        |
|5   |units        |Units in which the trait was measured  |string  |TRUE   |FALSE   |        |
|6   |value        |The value of the trait                 |string  |FALSE  |FALSE   |        |


## Environmental value


```r
kable(whatIs(api, "environment"), format = "markdown")
```

|id  |field        |help                                                       |type    |null   |unique  |values  |
|:---|:------------|:----------------------------------------------------------|:-------|:------|:-------|:-------|
|1   |description  |A description of the environmental property                |string  |TRUE   |FALSE   |        |
|3   |name         |The environmental property being measured                  |string  |FALSE  |FALSE   |        |
|5   |units        |The units in which the environmental property is measured  |string  |TRUE   |FALSE   |        |
|6   |value        |The value of the environmental property                    |string  |FALSE  |FALSE   |        |


## Reference


```r
kable(whatIs(api, "reference"), format = "markdown")
```

|id  |field  |help                                      |type    |null  |unique  |values  |
|:---|:------|:-----------------------------------------|:-------|:-----|:-------|:-------|
|1   |doi    |DOI of the reference object               |string  |TRUE  |FALSE   |        |
|3   |jstor  |JSTOR identifier of the reference object  |string  |TRUE  |FALSE   |        |
|5   |pmid   |PubMed ID of the reference object         |string  |TRUE  |FALSE   |        |
|6   |url    |URL of the reference object               |string  |TRUE  |FALSE   |        |


## User


```r
kable(whatIs(api, "user"), format = "markdown")
```

|id  |field       |help                                                                         |type    |null   |unique  |values  |
|:---|:-----------|:----------------------------------------------------------------------------|:-------|:------|:-------|:-------|
|1   |email       |Unicode string data. Ex: "Hello World"                                       |string  |FALSE  |FALSE   |        |
|2   |first_name  |Unicode string data. Ex: "Hello World"                                       |string  |FALSE  |FALSE   |        |
|4   |last_name   |Unicode string data. Ex: "Hello World"                                       |string  |FALSE  |FALSE   |        |
|5   |username    |Required. 30 characters or fewer. Letters, numbers and @/./+/-/_ characters  |string  |FALSE  | TRUE   |        |

