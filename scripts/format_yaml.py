#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys

from ruamel.yaml import YAML

yaml = YAML()

yaml.explicit_start = True
yaml.default_flow_style = False
yaml.indent(mapping=4, sequence=6, offset=4)

with open(sys.argv[1], "r") as stream:
    data = yaml.load(stream)

yaml.dump(data, sys.stdout)
