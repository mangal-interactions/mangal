#! /usr/bin/python2

import sys
import codecs
from bibtexparser.bparser import BibTexParser

def dict2bib(ke,di):
   b = "@"+di['type'].upper()+"{"+ke+","
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
   ## Step 1 - read the key list
   keys = [kl.rstrip(":\n") for kl in open(key_list, 'r')]
   ## Step 2 - read the library file
   refs = BibTexParser(open(bib_file, 'r')).get_entry_dict()
   ## Step 3 - extract the used entries
   used_refs = {key: value for (key, value) in refs.iteritems() if key in keys}
   ## Step 4 - convert the dicts back into bibtex
   refs_as_bib = [dict2bib(k, v) for (k, v) in used_refs.iteritems()]
   print [uk for uk in keys if uk not in used_refs.keys()]
   ## Step 5 - write the output file
   with codecs.open(out_file, 'w', 'utf-8-sig') as of:
      of.writelines(refs_as_bib)