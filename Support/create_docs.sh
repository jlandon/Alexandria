#!/bin/bash

echo -e "Executing create_docs"

if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then
    echo -e "Generating Jazzy output \n"
    
    # Hsoi 2016-09-19 - https://github.com/realm/jazzy/issues/656 removing --swift-version to avoid problems.
    # jazzy --clean --author "Oven Bits, LLC" --author_url https://ovenbits.com --github_url https://github.com/ovenbits/Alexandria --xcodebuild-arguments "-scheme,Alexandria" --module Alexandria --root-url https://ovenbits.github.io/Alexandria --theme apple --swift-version 3.0
    jazzy --clean --author "Oven Bits, LLC" --author_url https://ovenbits.com --github_url https://github.com/ovenbits/Alexandria --xcodebuild-arguments "-scheme,Alexandria" --module Alexandria --root-url https://ovenbits.github.io/Alexandria --theme apple
    

    pushd docs

    echo -e "Creating gh-pages\n"
    git init
    git config user.email "travis@travis-ci.org"
    git config user.name "travis-ci"
    git add -A
    git commit -m "Publishing documentation from Travis build of $TRAVIS_COMMIT"
    git push --force --quiet "https://${GH_TOKEN}@github.com/ovenbits/Alexandria.git" master:gh-pages > /dev/null 2>&1
    echo -e "Published documentation to gh-pages.\n"

    popd
fi
