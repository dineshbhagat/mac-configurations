#!/usr/bin/env python

# You can change above she-bang line depends on Mac
# A text filter for BBEdit that doesn't clobber your original file in the case of an error.
# I was annoyed by text filters that destroy the active text buffer on a parse error.
# This version will echo out the original text and append an error message.
# c.f. http://crisp.tumblr.com/post/2574967567/json-pretty-print-formatting-in-bbedit
# c.f. http://blog.scottlowe.org/2013/11/11/making-json-output-more-readable-with-bbedit/

import sys
import json

def main():
    input = sys.stdin.read()
    try:
        obj = json.loads(input)
    except Exception as e:
        print input + "\n\nERROR: " + str(e)
        return 1
    print(json.dumps(obj, indent=2))
    return 0

if __name__ == '__main__':
    sys.exit(main())
