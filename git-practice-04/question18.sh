#!/bin/bash

git fetch --all
git checkout main


for branch in $(git branch -r | grep "ready"); do
    git merge --no-ff -m "Merged ${branch#origin/} into main" ${branch#origin/}
    if [[ $(git status --porcelain) ]]; then
        git add .
        git commit -m "Resolved merge conflicts for ${branch#origin/}"
    fi
done

for branch in $(git branch -r | grep "ready"); do
    git branch -d ${branch#origin/}
    
done 

for branch in $(git branch -r | grep "update"); do
    if ! git rev-parse --verify ${branch#origin/} >/dev/null 2>&1; then
        git checkout -b ${branch#origin/} origin/${branch#origin/}
    else
        git checkout ${branch#origin/}
        
    fi
    git merge main -m "Updated ${branch#origin/} with latest changes from main"
    
done

git checkout main
