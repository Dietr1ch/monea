#!/usr/bin/env fish

echo "Untracking files"
for f in (find . -name '*onero*' | grep -v '\.git')
  git rm --cached $f
end

echo "Renaming files"
for f in (find . -type f | grep -v '\.git')
  sed -i 's/monero/monea/g' $f
  sed -i 's/Monero/Monea/g' $f
  sed -i 's/MONERO/MONEA/g' $f
end

echo "Renaming filenames"
rename 'onero' 'onea' **/*
rename 'onero' 'onea' **/*

echo "Restoring the glorious script"
git checkout work.fish


echo "Tracking new files"
git add .
git status

#TODO: get new keys
#TODO: rewrite git history
