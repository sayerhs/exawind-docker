#!/bin/bash

if [[ $# -ne 2 ]] ; then
    echo "Usage: <executable> <input_file>"
    exit 1
fi

$1 $2
