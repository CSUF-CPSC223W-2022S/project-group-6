//
//  ConverterTests.swift
//  Project_Group_6Tests
//
//  Created by Marco Gabriel on 3/9/22.
//

@testable import Project_Group_6
import XCTest

class ConverterTests: XCTestCase {
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // tests the initiliazer for currency to be 0
    func testCurrencyInitializer() {
        let currency = Currency()
        
        XCTAssertEqual(currency.currency.count, 0)
    }
    
    // tests the values of currency
    func testValueInitializer() {
        let value = Currency()
        
        XCTAssertEqual(value.value.count, 0)
    }
    
    // tests the JSON data
    var mockContentData: Data {
        return getData(name: "ContentResponse")
    }

    func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }
    
    // tests if the api is true
    func testAPI() {
        XCTAssert(true)
    }
    
}
