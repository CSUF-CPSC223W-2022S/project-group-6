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

    // MARK: - Testing Valid Gate Number for Terminal Number at LAX

    func testFirstGateNumber() {
        let airport = Destination()

        XCTAssertEqual(airport.getFirstGateNumberAtLAX(), "9")
    }

    func testMiddleGateNumber() {
        let airport = Destination()

        XCTAssertEqual(airport.getMiddleGateNumberAtLAX(), "60")
    }

    func testLastGateNumber() {
        let airport = Destination()

        XCTAssertEqual(airport.getLastGateNumberAtLAX(), "225")
    }

    func testValidGateNumberForTerminal1() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.getTerminal1GateNumberAtLAX(), "9")
    }

    func testValidGateNumberForTerminal2() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.getTerminal2GateNumberAtLAX(), "22")
    }

    func testValidGateNumberForTerminal3() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.getTerminal3GateNumberAtLAX(), "34")
    }

    func testValidGateNumberForTerminal4() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.getTerminal4GateNumberAtLAX(), "45")
    }

    func testValidGateNumberForTerminal5() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.getTerminal5GateNumberAtLAX(), "51B")
    }

    func testValidGateNumberForTerminal6() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.getTerminal6GateNumberAtLAX(), "64A")
    }

    func testValidGateNumberForTerminal7and8() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.getTerminal7and8GateNumberAtLAX(), "86A")
    }

    func testValidGateNumberForTerminalInternational() {
        let departingGate = Destination()

        XCTAssertEqual(departingGate.getTerminalInternationalGateNumberAtLAX(), "153")
    }

    // MARK: - Testing Valid Gate Number for Terminal Number at XNA

    func testValidGetConcourseAGateNumberAtXNA() {
        let departingGate = Destination()
        let gate = departingGate.concourseA.contains(departingGate.getConcourseAGateNumberAtXNA())

        XCTAssertTrue(gate)
    }

    func testValidGetConcourseBGateNumberAtXNA() {
        let departingGate = Destination()
        let gate = departingGate.concourseB.contains(departingGate.getConcourseBGateNumberAtXNA())

        XCTAssertTrue(gate)
    }

    // MARK: - Testing Valid Gate Number for Terminal Number at JFK

    func testValidGateNumberForTerminal1AtJFK() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber1AtJFK.contains(departingGate.getGateNumberForTerminal1AtJFK())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminal2AtJFK() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber2AtJFK.contains(departingGate.getGateNumberForTerminal2AtJFK())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminal4AtJFK() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber4AtJFK.contains(departingGate.getGateNumberForTerminal4AtJFK())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminal5AtJFK() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber5AtJFK.contains(departingGate.getGateNumberForTerminal5AtJFK())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminal7AtJFK() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber7AtJFK.contains(departingGate.getGateNumberForTerminal7AtJFK())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminal8AtJFK() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber8AtJFK.contains(departingGate.getGateNumberForTerminal8AtJFK())

        XCTAssertTrue(gate)
    }

    // MARK: - Testing Valid Gate Number for Terminal Number at HND

    func testValidGateNumberForTerminal1AtHND() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber1AtHND.contains(departingGate.getGateNumberForTerminal1AtHND())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminal2AtHND() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber2AtHND.contains(departingGate.getGateNumberForTerminal2AtHND())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminalInternationalAtHND() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumberInternationalAtHND.contains(departingGate.getGateNumberForTerminal3AtHND())

        XCTAssertTrue(gate)
    }

    // MARK: - Testing Valid Gate Number for Terminal Number at SFO

    func testValidGateNumberForTerminal1AtSFO() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber1AtSFO.contains(departingGate.getGateNumberForTerminal1AtSFO())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminal2AtSFO() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber2AtSFO.contains(departingGate.getGateNumberForTerminal2AtSFO())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminal3AtSFO() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumber3AtSFO.contains(departingGate.getGateNumberForTerminal3AtSFO())

        XCTAssertTrue(gate)
    }

    func testValidGateNumberForTerminalInternationalAtSFO() {
        let departingGate = Destination()
        let gate = departingGate.terminalNumberInternationalAtSFO.contains(departingGate.getGateNumberForTerminalInternationalAtSFO())

        XCTAssertTrue(gate)
    }

    // MARK: - Testing Valid Airline with Terminal Number at LAX

    func testValidAirlineWithTerminal1() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal1AtLAX(of: "Allegiant Air"), 1)
    }

    func testValidAirlineWithTerminal2() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal2AtLAX(of: "West Jet"), 2)
    }

    func testValidAirlineWithTerminal3() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal3AtLAX(of: "Delta Airlines"), 3)
    }

    func testValidAirlineWithTerminal4() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal4AtLAX(of: "American Airlines"), 4)
    }

    func testValidAirlineWithTerminal5() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal5AtLAX(of: "Air Canada"), 5)
    }

    func testValidAirlineWithTerminal6() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal6AtLAX(of: "Horizon Air"), 6)
    }

    func testValidAirlineWithTerminal7and8() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal7and8AtLAX(of: "United Airlines"), 7)
    }

    func testValidAirlineWithTerminalInternational() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminalInternationalAtLAX(of: "All Nippon Airways - ANA"), 8)
    }

    // MARK: - Testing Valid Airline with Terminal Number at XNA

    func testValidAirlineWithConcourseA() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithConcourseAAtXNA(of: "Delta Airlines"), 1)
    }

    func testValidAirlineWithConcourseB() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithConcourseBAtXNA(of: "American Airlines"), 2)
    }

    // MARK: - Testing Valid Airline with Terminal Number at JFK

    func testValidAirlineWithTerminal1AtJFK() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal1AtJFK(of: "Air France"), 1)
    }

    func testValidAirlineWithTerminal2AtJFK() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal2AtJFK(of: "Delta Airlines"), 2)
    }

    func testValidAirlineWithTerminal4AtJFK() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal4AtJFK(of: "Aeromexico"), 4)
    }

    func testValidAirlineWithTerminal5AtJFK() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal5AtJFK(of: "Hawaiian Airlines"), 5)
    }

    func testValidAirlineWithTerminal7AtJFK() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal7AtJFK(of: "All Nippon Airways - ANA"), 7)
    }

    func testValidAirlineWithTerminal8AtJFK() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal8AtJFK(of: "American Airlines"), 8)
    }

    // MARK: - Testing Valid Airline with Terminal Number at HND

    func testValidAirlineWithTerminal1AtHND() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal1AtHND(of: "Japan Airlines"), 1)
    }

    func testValidAirlineWithTerminal2AtHND() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal2AtHND(of: "All Nippon Airways - ANA"), 2)
    }

    func testValidAirlineWithTerminal3AtHND() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal3AtHND(of: "Air Canada"), 3)
    }

    // MARK: - Testing Valid Airline with Terminal Number at SFO

    func testValidAirlineWithTerminal1AtSFO() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal1AtSFO(of: "American Airlines"), 1)
    }

    func testValidAirlineWithTerminal2AtSFO() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal2AtSFO(of: "Delta Airlines"), 2)
    }

    func testValidAirlineWithTerminal3AtSFO() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminal3AtSFO(of: "United Airlines"), 3)
    }

    func testValidAirlineWithTerminalInternationalAtSFO() {
        let airline = Destination()

        XCTAssertEqual(airline.validAirlineWithTerminalInternationalAtSFO(of: "Alaska Airlines"), 4)
    }

    // MARK: - Generates the Estimated Time of Arrival to the Gate

    func testRandomTimeOfArrivalGenerator() {
        let departingGate = Destination()
        let gate = departingGate.timeOfArrival.contains(departingGate.randomTimeOfArrivalGenerator())

        XCTAssertTrue(gate)
    }

    // MARK: - Tests for Saving Image, Loading Image, and Loading Information

    func testSaveImage() {
        // Create the parameters needed to get a terminal map.
        var testMap = gateMap(airportName: "Los Angeles International Airport", terminalNumber: 8, airlineName: "All Nippon Airways - ANA", airportCode: "LAX", flightNumber: "922", gateNumber: "130")
        testMap.imageName = "Terminal 8.pdf"

        // Creates a gateViewController to be able to use the saveImage function.
        let historyMap = gateViewController()
        // This sets the variable that will be saved to the variable that we are testing.
        historyMap.terminalMapInstance = testMap
        historyMap.saveImage()

        let terminal = PropertyListDecoder()
        guard let savedLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            XCTFail()
            return
        }

        // Tries to decode the information that is saved in the file.
        let fileURL = savedLocation.appendingPathComponent("TerminalMap").appendingPathExtension("plist")
        guard let gameFile = try? Data(contentsOf: fileURL), let decodeTerminalMap = try? terminal.decode(gateMap.self, from: gameFile) else {
            XCTFail()
            return
        }

        // Checks to see if the saved terminal map is equal to the terminal map that was created.
        XCTAssertEqual(testMap.imageName, decodeTerminalMap.imageName)
    }

    func testLoadImageOfLAX() {
        let destination = gateViewController()

        XCTAssertEqual("", destination.terminalMapInstance?.getTerminalMapofLAX() ?? "")
    }

    func testLoadImageOfOtherAirports() {
        let destination = gateViewController()

        XCTAssertEqual("", destination.terminalMapInstance?.getTerminalMapofOtherAirports() ?? "")
    }

    func testLoadInformation() {
        // Create the parameters needed to get a terminal map.
        var testMap = gateMap(airportName: "Los Angeles International Airport", terminalNumber: 8, airlineName: "All Nippon Airways - ANA", airportCode: "LAX", flightNumber: "922", gateNumber: "130")
        testMap.imageName = "Terminal 8.pdf"

        // Writes to the file to see if the data can be loaded before testing.
        let terminalEncoder = PropertyListEncoder()
        guard let loadLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first, let encodedHistory = try? terminalEncoder.encode(testMap) else {
            return
        }

        let fileURL = loadLocation.appendingPathComponent("TerminalMap").appendingPathExtension("plist")
        try? encodedHistory.write(to: fileURL)

        // Creates a gateViewController to be able to use the testLoadInformation function.
        let historyMap = gateViewController()
        historyMap.testLoadInformation()

        // Checks to see if the testLoadInformation function isn't empty.
        guard let savedTerminalMap = historyMap.terminalMapInstance else {
            XCTFail()
            return
        }

        // Checks to see if the loaded terminal map is equal to the terminal map that was created.
        XCTAssertEqual(testMap.imageName, savedTerminalMap.imageName)
    }
}
