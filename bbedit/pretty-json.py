#!/usr/bin/env python3
"""JSON pretty-printer for BBEdit text filter.

A text filter for BBEdit that doesn't clobber the original file in case of an error.
This version echoes the original text and appends an error message on parse failure.

References:
- http://crisp.tumblr.com/post/2574967567/json-pretty-print-formatting-in-bbedit
- http://blog.scottlowe.org/2013/11/11/making-json-output-more-readable-with-bbedit/
"""

import sys
import json

def main() -> int:
    """Read JSON from stdin, pretty-print, and output.

    Returns:
        0 on success, 1 on JSON parsing error.
    """
    input_text = sys.stdin.read()
    try:
        obj = json.loads(input_text)
        print(json.dumps(obj, indent=2))
        return 0
    except Exception as e:
        print(f"{input_text}\n\nERROR: {e}", file=sys.stderr)
        return 1

if __name__ == '__main__':
    sys.exit(main())
