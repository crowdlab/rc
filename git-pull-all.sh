#!/bin/bash

for x in `ls -1` ; do
    echo $x:
    [ -d "$x" ] && cd "$x"

    [ -d ".hg" ] && hg pull
    [ -d "_darcs" ] && darcs pull
    [ -d ".bzr" ] && bzr pull
    [ -d ".svn" ] && svn up

    if [ -d ".git" ]; then
        if [ $(git svn info 2>&1 | grep "Unable to determine upstream SVN information" | wc -l) -eq 1 ]; then
            git pull --rebase origin master
            git submodule update --init --recursive
        else
            git svn rebase
        fi  
    fi  

    [ -d "../$x" ] && cd ..
done
