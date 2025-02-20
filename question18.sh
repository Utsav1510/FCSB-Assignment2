
# 1. Identify all branches
echo "Listing all branches (local and remote):"
git branch -a

# 2. Merge all branches whose names begin with "ready" into main
echo "Switching to main branch..."
git checkout main

echo "Merging branches beginning with 'ready' into main..."
# Loop over remote branches that start with ready
for branch in $(git branch -r | grep 'origin/ready' | sed 's| *origin/||'); do
    echo "Merging branch '$branch' into main..."
    git merge origin/$branch
    # If merge conflicts occur, resolve them manually then run:
    # git add <resolved files> && git commit
done

# 3. Delete merged "ready" branches (local copies)
echo "Deleting local branches that begin with 'ready'..."
for branch in $(git branch --list 'ready*'); do
    echo "Deleting branch '$branch'..."
    git branch -d $branch
done

# 4. Update all branches whose names begin with "update" so they have latest changes from main
echo "Updating branches beginning with 'update' with latest main changes..."
# Loop over remote update branches; create/update local branch and merge main into it
for branch in $(git branch -r | grep 'origin/update' | sed 's| *origin/||'); do
    echo "Checking out and updating branch '$branch'..."
    # -B creates the branch if it doesn't exist and resets it to track the remote branch
    git checkout -B $branch origin/$branch
    git merge main
    # Again, if conflicts occur, resolve them as necessary.
done

echo "Script completed."
