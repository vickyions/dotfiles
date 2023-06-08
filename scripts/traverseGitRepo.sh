#!/bin/sh

usage() { 
    echo "Usage: $0 [-b <branch>] [-n] \n -n dont checkout" 1>&2
    exit 1 
}
branch="master"
checkout=true

while getopts "b:n" opt; do
    case $opt in
        b)
            branch=$OPTARG
            ;;
        n)
            checkout=false
            ;;
        *)
            usage
            ;;
    esac
done

selected_commit=$(git log $branch --oneline --reverse | nl -w1 -s ' ' | fzf)
commit_hash=$(echo $selected_commit | cut -d' ' -f2)

echo "Selected commit No \n$selected_commit"
echo "\nSelected hash \n$commit_hash"
echo "\ngit log \n$(git log -n 1 $commit_hash)\n"

if [ "$checkout" = true ]; then
    echo "checking out commit\n"
    git checkout $commit_hash
else
    echo "\nNot checking out commit. Exiting..."
fi
