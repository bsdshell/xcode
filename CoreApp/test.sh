#!/bin/bash

cd /Users/cat/myfile/github/xcode/CoreApp
xcodebuild test -project CoreApp.xcodeproj -scheme CoreAppTests -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.3'
