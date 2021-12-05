![](./pictures/Icon-256.jpg)  
Simple File Storage Server
================================================

This is a simple hacker news iOS application for listing new stories.  
The app is built with SwiftUI.  
Data source for the project is from "https://github.com/HackerNews/API"

## Features:
- Users can read news from the HackerNews application.
- The app presents these stories to users in descending order.  
- It allows users to view the highest ranked articles.  
- The user can start the link associated with the article in the browser.  

## The main components
![](./pictures/Slide6.png)
## API to Get New Stories
![](./pictures/Slide7.png)
## API to fetch Item
![](./pictures/Slide8.png)
## Illustration
![](./pictures/Slide9.png)
## Demo 
![](./pictures/demo_20211205.gif)

## How to build the app
- Open myhackernews.xcodeproj via XCode
- Press the start button to build and run and app
![](./pictures/start_and_run.png)

## How to Run Test
```shell 
xcodebuild test  -scheme 'myhackernews' -destination 'platform=iOS Simulator,name=iPhone 8,OS=15.0'
```
Related files in project. 
- ./myhackernewsTests/myhackernewsTests.swift
  - testFetchItem
- ./myhackernewsUITests/myhackernewsUITests.swift  
  - testLoadingItems
- ./myhackernewsUITests/myhackernewsUITestsLaunchTests.swift  
  - testLaunch


