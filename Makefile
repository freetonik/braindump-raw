clean:
	@echo "Cleaning files..."
	rm -f ./*.md
	@echo "Done!"
	@echo "-----"

copy:
	@echo "Copying fresh files..."
	cp -a ~/Dropbox/Brain/. .
	rm -rf ./content/notes/.obsidian
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
	./bin/convert_wikilinks_to_refs.sh ./content/notes

publish: all
	./bin/publish.sh
	@echo "Done!"
	@echo "-----"

all: clean copy heading backlinks wikilinks
	@echo "ALL DONE!"

