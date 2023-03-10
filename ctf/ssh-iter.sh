#!/bin/bash
for i in {0..33} ; do
  ssh -p 2220 bandit$i@bandit.labs.overthewire.org
done
