#!/bin/bash
proxychains curl -s https://check.torproject.org/ | grep -i congratulations
