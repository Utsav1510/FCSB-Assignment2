git checkout main
git checkout -b branch1
git checkout main
git checkout -b branch2

git checkout main
cp ./dir3/bar ./dir3/bar_copy
git add .
git commit -m "commit1"

git checkout branch1
mv ./dir1/dir2/foo ./dir1/foo
touch newfile1
git add .
git commit -m "commit2"

git checkout branch2
mv ./dir3 ./dir1/
touch dir1/dir3/newfile2
mv dir1/dir2/foo dir1/dir2/foo_modified
rm dir3/bar
git add .
git commit -m "commit3"

