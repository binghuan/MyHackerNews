//
//  myhackernewsTests.swift
//  myhackernewsTests
//
//  Created by BH_Lin on 2021/12/4.
//

import XCTest
@testable import myhackernews

class myhackernewsTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testFetchItem() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Fetch Item by ID")
        
        fetchItemByID(itemId: 29440830, rank: 1, startedDate: NSDate(), completion: { item in
            print("Get item: \(item)")
            XCTAssertTrue(item.id == 29440830)
            expectation.fulfill()
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
