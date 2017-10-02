#!/usr/bin/env python3

#   -------------------------------------------------------------
#   salt-get-config-dir command
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        salt-wrapper
#   Licence:        BSD-2-Clause
#   -------------------------------------------------------------


import json
import os
import sys


#   -------------------------------------------------------------
#   Load configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


config_file_path = os.environ.get(
    "SALT_WRAPPER_CONF",
    "/usr/local/etc/salt-wrapper.conf"
)

if not os.path.isfile(config_file_path):
    print(
        "The configuration file {0} doesn't exist.".format(config_file_path),
        file=sys.stderr
    )
    print(
        "See https://docs.nasqueron.org/salt-wrapper/admin.html#configuration-file",  # noqa
        file=sys.stderr
    )
    sys.exit(2)

try:
    with open(config_file_path) as config_file:
        config = json.load(config_file)
except OSError as err:
    print("Can't open configuration file: {0}".format(err))
    sys.exit(4)


#   -------------------------------------------------------------
#   Find configuration directory
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


for root in config['roots']:
    if os.getcwd().startswith(root['states']):
        print(root['config'])
        sys.exit(0)

sys.exit(1)
