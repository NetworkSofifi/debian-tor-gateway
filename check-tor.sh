#!/bin/bash
torsocks curl -s https://check.torproject.org/ | grep -i congratulations
