# System imports
import sys

# Libraries

# Internal
from utils.enums import Environment


# Configuration Variables
g_environment = Environment.GoogleColab


def parse_args():
    # Parsing Arguments
    global g_environment

    for arg in sys.argv:
        if arg.lower().__contains__("envi"):
            param = arg[arg.index("=") + 1:]
            if param.lower() == "local":
                g_environment = Environment.Local
            elif param.lower() == "colab":
                g_environment = Environment.GoogleColab


def print_configs():
    print(g_environment)


def configure(_some_variable):
    pass
