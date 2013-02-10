% A data specification for efficient archival of ecological networks
% Timothée Poisot
% Feb. 2013

> This is a *working document* describing `mangal`, a set of `JSON` objects templates to encode ecological networks of virtually any complexity. There are plans to host a pilot database.

# The need for a data specification

Ecological networks enable ecologists to accommodate the complexity of natural communities, and to discover mechanisms contributing to their persistence, stability, resilience, and functioning. 

# The elements of a network

# Proposed implementation

```json
{
    "ID": "MyDB_I_00001",
    "from": "MyDB_P_00001",
    "to": "MyDB_P_00002",
    "info": {
        "binary": true,
        "directional": false,
        "strength": 1,
        },
    "type": "predation",
    "notes": "none"
}
```

# Conclusion and future directions