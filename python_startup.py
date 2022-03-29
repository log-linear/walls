
"""
Python interactive mode configs
"""
import atexit
import os
import rlcompleter
import sys

# Run configs
from pprint import pprint  # auto-import pprint

# Use ptpython, if available
import sys
try:
    from ptpython.repl import embed
except ImportError:
    print("ptpython is not available: falling back to standard prompt")
else:
    sys.exit(embed(globals(), locals(), vi_mode=True))

#===============================================================================
# Sources
#===============================================================================

# https://docs.python.org/3/library/readline.html?highlight=readline#example
# https://github.com/brandoninvergo/python-startup/blob/master/python-startup.py
