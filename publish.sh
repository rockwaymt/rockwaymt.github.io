#!/bin/bash

LATEST_TAG=$(git describe --tags --abbrev=0)
NEXT_TAG=$(( $LATEST_TAG + 1 ))
CURRENT_REVISION=$(git describe)
echo -e "# \033[1;33m Current revision is at $CURRENT_REVISION for Tag: $LATEST_TAG \033[0m"

git diff --name-only HEAD $LATEST_TAG | egrep -v "^(original|README)"

echo -e "\033[1;34mgit tag $NEXT_TAG \033[0m"
