#!/bin/bash

# command   program     redirect out    redirect err    detach from terminal
eval "$1 >/dev/null 2>/dev/null & disown"