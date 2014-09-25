#! /usr/bin/python2

import sys
import codecs
import bibtexparser

def di2bib(di):
    b = "@"+di['type'].upper()+"{"+di['id']+","
    for (k, v) in di.iteritems():
        if k not in ['type', 'id', 'abstract', 'doi', 'keywords']:
            b += k+' = {'+v+'},\n'
    b += '}\n'
    return b

if __name__ == "__main__":
    ## Check the number of arguments
    if len(sys.argv) != 4:
        raise ValueError("Wrong number of arguments")
    else :
        key_list = sys.argv[1]
        bib_file = sys.argv[2]
        out_file = sys.argv[3]
    ## The three arguments should be strings
    if not isinstance(key_list, str):
        raise TypeError("The path to the list of keys should be a string")
    if not isinstance(bib_file, str):
        raise TypeError("The path to the bibtex library should be a string")
    if not isinstance(out_file, str):
        raise TypeError("The path to the output bibtex file should be a string")
    open(out_file, 'w').close()
    keys = [kl.rstrip(":\n") for kl in open(key_list, 'r')]
    with open(bib_file, 'r') as bfile:
        refs = bibtexparser.load(bfile)
    used_entries = dict()
    with codecs.open(out_file, encoding='utf-8', mode='a') as ofile:
        for e in refs.entries:
            if e['id'] in keys:
                ofile.write(di2bib(e))
