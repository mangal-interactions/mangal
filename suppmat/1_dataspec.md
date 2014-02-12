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
## Loading required package: rjson
## Loading required package: httr
## Loading required package: igraph
## Loading required package: cheddar
```

```r
options(width = 150)
url = "http://localhost:8000"
api = mangalapi(url)
```

```
## Error: Failed to connect to localhost port 8000: Connexion refusée
```

```r
print(api$resources)
```

```
## Error: objet 'api' introuvable
```


# Node level

## Taxa


```r
kable(whatIs(api, "taxa"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


## Population


```r
kable(whatIs(api, "population"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


## Item


```r
kable(whatIs(api, "item"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


# Interaction level

## Interaction


```r
kable(whatIs(api, "interaction"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


## Network


```r
kable(whatIs(api, "network"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


## Dataset


```r
kable(whatIs(api, "dataset"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


# Meta-data

## Trait value


```r
kable(whatIs(api, "trait"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


## Environmental value


```r
kable(whatIs(api, "environment"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


## Reference


```r
kable(whatIs(api, "reference"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```


## User


```r
kable(whatIs(api, "user"), format = "markdown")
```

```
## Error: objet 'api' introuvable
```

