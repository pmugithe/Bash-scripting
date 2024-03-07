#!/bin/bash

# Declaring an expression using Parenthesis
DATE="$(date +%F)"
SEESION_COUNT=$(who | wc -l)

echo "Today's date is: $DATE "

echo "Total number of open sessions: $SESSION_COUNT"


