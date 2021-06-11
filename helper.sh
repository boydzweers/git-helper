#!/bin/bash
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`
ENDCOLOR=`tput sgr0`

COMMIT_TYPE=""
PS3="Select the type of commit: "
OPTIONS=(Feature Bug Test Documentation Style Refactor Performance)

clear

echo "${RED}############# STARTING COMMIT #############${ENDCOLOR}"

while true; do
    read -p "Stage all files?" yn
    case $yn in
        "") git add . && break;;
        [Yy]* ) git add . && break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y(es) or n(o).";;
    esac
done

echo "Git status"

git status --short

echo ""

select commit_type in "${OPTIONS[@]}"
do
    COMMIT_TYPE=$commit_type
    break
done

read -p "JIRA: " JIRA

read -p "Message: " MESSAGE

echo $COMMIT_TYPE;
echo $JIRA

git commit -m "${COMMIT_TYPE}: ${MESSAGE}" -m ${JIRA}

git log -1 HEAD --stat
echo "${RED}############################################################${ENDCOLOR}"
echo "Pushing changes to ${GREEN}origin/$(git rev-parse --abbrev-ref HEAD)${ENDCOLOR}"
git push origin $(git rev-parse --abbrev-ref HEAD)
