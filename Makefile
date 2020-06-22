clean:
	@echo "Cleaning files..."
	rm -f ./*.md
	@echo "Done!"
	@echo "-----"

copy:
	@echo "Copying fresh files..."
	cp -a ~/Dropbox/Brain/. .
	rm -rf ./.obsidian
	@echo "Done!"
	@echo "-----"

heading:
	./bin/add_top_heading.py .
	@echo "-----"

backlinks:
	@echo "Generating backlinks..."
	~/code/note-link-janitor/dist/index.js .
	@echo "Done!"
	@echo "-----"

wikilinks:
	./bin/convert_wikilinks_to_refs.sh .

publish: all
	@echo "Now publishing..."
	./bin/publish.sh
	@echo "Done!"
	@echo "-----"

all: clean copy heading backlinks wikilinks
	@echo "ALL DONE!"

