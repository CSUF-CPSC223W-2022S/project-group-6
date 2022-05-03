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
        let USD = "USD"
        XCTAssertEqual(USD, "USD")
    }
    
    func testEUR() {
        let EUR = "EUR"
        XCTAssertEqual(EUR, "EUR")
    }
    
    func testJPY() {
        let JPY = "JPY"
        XCTAssertEqual(JPY, "JPY")
    }
    
    // currency values
    func testUSDValue() {
        let USDValue = 1.1321
        XCTAssertEqual(USDValue, 1.1321)
    }
    
    func testEURValue() {
        let EURValue = 1.11
        XCTAssertEqual(EURValue, 1.11)
    }
    
    func testJPYValue() {
        let JPYValue = 126.76
        XCTAssertEqual(JPYValue, 126.76)
    }
    
    func testSave() {
        // create parameters for the array
        let testArray = sumthing(cur: ["USD", "EUR", "JPY", "BGN", "CZK", "DKK", "GBP", "HUF", "PLN", "RON", "SEK", "CHF", "ISK", "NOK", "HRK", "RUB", "TRY", "AUD", "BRL", "CAD", "CNY", "HKD", "IDR", "ILS", "INR", "KRW", "MXN", "MYR", "NZD", "PHP", "SGD", "THB", "ZAR"], fall: [1.1321, 1.11, 126.76, 1.9558, 25.623, 7.4643, 0.8629, 321.9, 4.2796, 4.7598, 10.4788, 1.1326, 135.2, 9.602, 7.435, 72.6133, 6.535, 1.5771, 4.3884, 1.5082, 7.5939, 8.8788, 15954.12, 4.0389, 78.2915, 1283.0, 21.236, 4.658, 1.6748, 58.553, 1.5318, 35.955, 15.7631])
        
        
        let offline = OfflineConverter()
        offline.sumthingArray = testArray
        offline.save_load_Array()

        let currency = PropertyListDecoder()
        guard let savedLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            XCTFail()
            return
        }

        // Tries to decode the information that is saved in the file.
        let fileURL = savedLocation.appendingPathComponent("Array").appendingPathExtension("plist")
        guard let file = try? Data(contentsOf: fileURL), let decodeArray = try? currency.decode(sumthing.self, from: file)
        else {
            XCTFail()
            return
        }
        print(decodeArray.currencyArray[0])
        // Checks to see if the array is saved.
        XCTAssertEqual(testArray.currencyArray[0], decodeArray.currencyArray[0])
    }
    
    func testLoad() {
        // create parameters for the array
        let testArray = sumthing(cur: ["USD"], fall: [1.1321])

        let currency = PropertyListEncoder()
        guard let loadLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first, let encodedHistory = try? currency.encode(testArray) else {
            XCTFail()
            return
        }
        let fileURL = loadLocation.appendingPathComponent("Array").appendingPathExtension("plist")
        try? encodedHistory.write(to: fileURL)
        
        let offline = OfflineConverter()
        offline.sumthingArray = testArray
        offline.save_load_Array()
        
        XCTAssertEqual(testArray.currencyArray[0], offline.sumthingArray.currencyArray[0])
        
    }
}
