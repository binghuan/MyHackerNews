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
    
    func testFetchStories() throws {
        
        let expectation = XCTestExpectation(description: "Fetch Item by ID")
        
        let maxNumberOfItems = 10;
        fetchNewStories(maxNumberOfItems: maxNumberOfItems,  progressString: { progressStatus in
            print("progressStatus:\(progressStatus)")
        }, completion: { (items) in
            print("------- Stories Fetched -------")
            XCTAssertTrue(items.count == maxNumberOfItems)
            expectation.fulfill()
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
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
    
    func testFetchItems() throws {
        
        let expectation = XCTestExpectation(description: "Fetch Items by IDs")
        
        let itemsToAcquire: [NSNumber] = [29455527, 29455493]
        
        fetchItems(itemIds: itemsToAcquire, onProgress: { progress in
            print(progress)
        }, completion: { items in
            XCTAssertTrue(items[0].id == 29455527 || items[0].id == 29455493)
            XCTAssertTrue(items[1].id == 29455527 || items[1].id == 29455493)
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
