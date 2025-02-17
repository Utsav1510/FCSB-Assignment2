git fetch -all
git branch -r
git checkout main
for branch in $(git branch -r | grep "ready"); do
	git merge --no-ff  -m "Merged ${branch#origin/} into main" origin/${branch#origin/}
	echo "Hello"
done

git status
git add .
git commit -m "Resolving conflict"

for branch in $(git branch -r | grep 'ready');do
	git push origin --delete ${branch#origin/}
	echo "hello2"
done 
for branch in $(git branch -r | greap 'update');do
	git checkout -b ${branch#origin/} $branch
	git merge main
	git push origin ${branch#origin}
done
