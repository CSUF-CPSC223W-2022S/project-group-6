//
//  OfflineTests.swift
//  Project_Group_6Tests
//
//  Created by Marco Gabriel on 4/3/22.
//

@testable import Project_Group_6
import XCTest

class OfflineTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    // currency names
    func testUSD() {
        let USD: String = "USD"
        XCTAssertEqual(USD, "USD")
    }
    
    func testEUR() {
        let EUR: String = "EUR"
        XCTAssertEqual(EUR, "EUR")
    }
    
    func testJPY() {
        let JPY: String = "JPY"
        XCTAssertEqual(JPY, "JPY")
    }
    
    // currency values
    func testUSDValue() {
        let USDValue: Double = 1.1321
        XCTAssertEqual(USDValue, 1.1321)
    }
    
    func testEURValue() {
        let EURValue: Double = 1.11
        XCTAssertEqual(EURValue, 1.11)
    }
    
    func testJPYValue() {
        let JPYValue: Double = 126.76
        XCTAssertEqual(JPYValue, 126.76)
    }
}
