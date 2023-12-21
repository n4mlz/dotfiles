#!/bin/bash

if command -v apt &>/dev/null; then
  echo "using apt..."
  # install scripts
else
  echo "apt not found"
fi