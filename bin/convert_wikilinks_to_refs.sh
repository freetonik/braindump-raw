#!/usr/bin/env bash
# https://stackoverflow.com/questions/1103149/non-greedy-reluctant-regex-matching-in-sed
# sed doesn't support non-greedy

# Combining these into one regex makes it even more unreadable, so yeah...
# replace ![[a.png]] → ![a](attachments/a.png)
perl -pi -e 's|\!\[\[(.*?).png\]\]|\![\1](\/attachments\/\1.png)|g' $1/*.md
# replace ![[a.jpg]] → ![a](attachments/a.jpg)
perl -pi -e 's|\!\[\[(.*?).jpg\]\]|\![\1](\/attachments\/\1.jpg)|g' $1/*.md
# replace ![[a.jpeg]] → ![a](attachments/a.jpeg)
perl -pi -e 's|\!\[\[(.*?).jpeg\]\]|\![\1](\/attachments\/\1.jpeg)|g' $1/*.md

# replace ![[a.pdf]] → ![a](attachments/a.jpeg)
perl -pi -e 's|\!\[\[(.*?).pdf\]\]|[\1](\/attachments\/\1.pdf)|g' $1/*.md


perl -pi -e 's|\[\[(.*?)\]\]|[\1](.\/\1.md)|g' $1/*.md
echo "Done!"
echo "-----"