//
//  departingGateNumberTests.swift
//  Project_Group_6Tests
//
//  Created by csuftitan on 3/8/22.
//

@testable import Project_Group_6
import XCTest

class departingGateNumberTests: XCTestCase {
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
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testFirstGateNumber() {
        let airport = Destination()

        XCTAssertEqual(airport.getFirstGateNumber(), "9")
    }

    func testMiddleGateNumber() {
        let airport = Destination()

        XCTAssertEqual(airport.getMiddleGateNumber(), "60")
    }

    func testLastGateNumber() {
        let airport = Destination()

        XCTAssertEqual(airport.getLastGateNumber(), "225")
    }

    func testValidGateNumberForTerminal1() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.validGateNumberForTerminal1(), "1")
    }

    func testValidGateNumberForTerminal2() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.validGateNumberForTerminal2(), "2")
    }

    func testValidGateNumberForTerminal3() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.validGateNumberForTerminal3(), "3")
    }

    func testValidGateNumberForTerminal4() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.validGateNumberForTerminal4(), "4")
    }

    func testValidGateNumberForTerminal5() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.validGateNumberForTerminal5(), "5")
    }

    func testValidGateNumberForTerminal6() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.validGateNumberForTerminal6(), "6")
    }

    func testValidGateNumberForTerminal7and8() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.validGateNumberForTerminal7and8(), "7")
    }

    func testValidGateNumberForTerminalInternational() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.validGateNumberForTerminalInternational(), "8")
    }

    // ------------------------------------------------------------------------------------------------------

    func testValidAirlineWithTerminal1() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal1(), "Terminal 1.pdf")
    }

    func testValidAirlineWithTerminal2() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal2(), "Terminal 2.pdf")
    }

    func testValidAirlineWithTerminal3() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal3(), "Terminal 3.pdf")
    }

    func testValidAirlineWithTerminal4() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal4(), "Terminal 4.pdf")
    }

    func testValidAirlineWithTerminal5() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal5(), "Terminal 5.pdf")
    }

    func testValidAirlineWithTerminal6() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal6(), "Terminal 6.pdf")
    }

    func testValidAirlineWithTerminal7and8() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal7and8(), "Terminal 7.pdf")
    }

    func testValidAirlineWithTerminalInternational() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminalInternational(), "Terminal 8.pdf")
    }
}
