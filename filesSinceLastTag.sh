#!/bin/bash

#unset GIT_DIR
#cd /path/to/project

# Get our info....
LATEST_TAG=$(git describe --tags --abbrev=0)
CURRENT_REVISION=$(git describe)
#NUMBER_FILES_CHANGED=$(git diff --name-only HEAD $LATEST_TAG | wc -l)
#FILES_CHANGED=$(git diff --name-only HEAD $LATEST_TAG)

	echo "# Current revision is at $CURRENT_REVISION for Tag: $LATEST_TAG "
#	echo "$NUMBER_FILES_CHANGED files have been changed"

	## Write this revision

#	echo "################################" > REVISION
#	echo "# $CURRENT_REVISION" >> REVISION
#	echo '# ' >> REVISION
#	echo "# $NUMBER_FILES_CHANGED files changed since last release $LATEST_TAG" >> REVISION
#	echo "################################" >> REVISION
#	echo ' ' >> REVISION
#	$(git diff --name-only HEAD $LATEST_TAG >> REVISION)
	git diff --name-only HEAD $LATEST_TAG
#	echo ' ' >> REVISION

	## Append to revision history

#	cat REVISION >> REVISION.tmp
#	cat REVISION_HISTORY >> REVISION.tmp
#	mv REVISION.tmp REVISION_HISTORY

exit