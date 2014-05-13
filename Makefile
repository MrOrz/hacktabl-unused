# Build page using require.js
build:
	node script/r.js -o config/build.js

# Cleanup builds
clean:
	rm -rf build

# Open up rack server for development
dev:
	thin start

# Push to gh-pages
gh-pages: clean build
	# Since build/ is cleaned, it's a fresh new directory without git repos.
	cd build; \
	git init; \
	git remote add origin git@github.com:MrOrz/hacktabl.git; \
	git checkout --orphan gh-pages; \
	git add . ; \
	git commit -m "Built."; \
	git push --force origin gh-pages ; \
	cd ../
