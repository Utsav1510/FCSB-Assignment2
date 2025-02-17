git checkout branch -b branch1
git checkout branch -b branch2
git checkout main
cp ./dir3/bar ./dir3/bar_copy
git add .
git commit -m "commit1"

git checkout branch branch1
mv ./dir1/dir2/foo ./dir1/foo
touch newfile1
git add .
git commit -m "commit2"

git checkout branch branch2
touch dir3/newfile2
mv dir1/dir2/foo dir1/dir2/foo_modified
git add .
git commit -m "commit3"

