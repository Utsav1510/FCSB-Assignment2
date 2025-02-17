git checkout main
cp ./dir3/bar ./dir3/bar_copy
git checkout branch -b branch1
git add .
git commit -m "commit"

$ mv ./dir1/dir2/foo ./dir1/foo
touch newfile1
git add .
git commit -m "commit"

git checkout branch -b branch2
touch dir3/newfile2
mv dir1/dir2/foo dir1/dir2/foo_modified

