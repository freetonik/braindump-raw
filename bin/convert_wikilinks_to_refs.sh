#!/usr/bin/env bash
# https://stackoverflow.com/questions/1103149/non-greedy-reluctant-regex-matching-in-sed
# sed doesn't support non-greedy

echo "Replacing wikilinks with md links..."
perl -pi -e 's|\[\[(.*?)\]\]|[\1](.\/\1.md)|g' $1/*.md
echo "Done!"
echo "-----"