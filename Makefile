# Build page using require.js
build:
	node script/r.js -o config/build.js

# Cleanup builds
clean:
	rm -rf build

# Open up rack server for development
dev:
	thin start