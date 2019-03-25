#!/usr/bin/env bash

awk -F " "  '{for (i=2;i<=NF;i++)printf("%s ", $i);print ""}'
