
"""
Python interactive mode configs
"""

# Run configs
from pprint import pprint  # auto-import pprint
import visidata as vd
import os

try:
    import IPython
    os.environ['PYTHONSTARTUP'] = ''  # Prevent running this again
    IPython.start_ipython()
    raise SystemExit
except:
    print("IPython is not available: falling back to standard prompt")

#===============================================================================
# Sources
#===============================================================================

# https://docs.python.org/3/library/readline.html?highlight=readline#example
# https://github.com/brandoninvergo/python-startup/blob/master/python-startup.py
