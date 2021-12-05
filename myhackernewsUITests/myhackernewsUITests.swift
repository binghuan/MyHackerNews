//
//  myhackernewsUITests.swift
//  myhackernewsUITests
//
//  Created by BH_Lin on 2021/12/4.
//

import XCTest

class myhackernewsUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoading() throws {
        // UI tests must launch the application that they test.
        app.launch()
        
        let app = XCUIApplication()
        let button = app/*@START_MENU_TOKEN@*/.buttons["By Date"]/*[[".segmentedControls.buttons[\"By Date\"]",".buttons[\"By Date\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: button, handler: nil)
        waitForExpectations(timeout: 20, handler: nil)
        
        
        let inLoading = app.staticTexts["Loading ..."]
        XCTAssert(inLoading.exists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
