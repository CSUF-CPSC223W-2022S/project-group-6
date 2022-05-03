//
//  managerTests.swift
//  Project_Group_6Tests
//
//  Created by Diego on 2/24/22.
//

@testable import Project_Group_6
import XCTest

class AirportManagerTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialer() {
        let manager = AirportManager()
        XCTAssertTrue(!manager.Airports.isEmpty)
    }
    
    func testFunctionCalls() {
        let manager = AirportManager()
        XCTAssertEqual(manager.getCode(for: "Los Angeles International Airport"), "LAX")
        
        XCTAssertEqual(manager.getGateNumber(from: "Los Angeles International Airport", for: "344"), "13")
    }
    
    func testDifferentAirportNames() {
        let manager = AirportManager()
        XCTAssertEqual(manager.getCode(for: "Northwest Arkansas National Airport"), "XNA")
        
        XCTAssertEqual(manager.getCode(for: "J.F.K International Airport"), "JFK")
        
        XCTAssertEqual(manager.getCode(for: "Haneda International Airport"), "HND")
        
        XCTAssertEqual(manager.getCode(for: "San Francisco International Airport"), "SFO")
    }
    
    func testNonExistingAirports() {
        let manager = AirportManager()
        
        XCTAssertEqual(manager.gateNumbers(from: "Random Airport"), [])
        
        XCTAssertEqual(manager.getCode(for: "Non exiting Airport"), "")
    }
    
    func testGetAirportName() {
        let manager = AirportManager()
        
        XCTAssertEqual(manager.getAirportName(of: "LAX"), "Los Angeles International Airport")
        
        XCTAssertEqual(manager.getAirportName(of: "ASD"), "")
    }
    
    func testGetCountry() {
        let manager = AirportManager()
        
        XCTAssertEqual(manager.getCountry(of: "Los Angeles International Airport"), "United States")
        
        XCTAssertEqual(manager.getCountry(of: "Haneda International Airport"), "Japan")
        
        XCTAssertEqual(manager.getCountry(of: "random airport"), "")
    }
    
    func testGetGateNumber() {
        let manager = AirportManager()
        let Flights = manager.flightNumbers(from: "Los Angeles International Airport")
        let Gates = manager.gateNumbers(from: "Los Angeles International Airport")
        XCTAssertEqual(Flights.count, Gates.count)
        XCTAssertEqual(manager.getGateNumber(from: "Los Angeles International Airport", for: Flights[22]), Gates[22])
    }
    
    func testGetFlightNumber() {
        let manager = AirportManager()
        let Flights = manager.flightNumbers(from: "Los Angeles International Airport")
        let Gates = manager.gateNumbers(from: "Los Angeles International Airport")
        XCTAssertEqual(manager.getFlightNumber(from: "Los Angeles International Airport", for: Gates[10]), Flights[10])
    }

    func testGetFlightAndGate() {
        let manager = AirportManager()
        let flights = manager.flightNumbers(from: "J.F.K International Airport")
        let gates = manager.gateNumbers(from: "J.F.K International Airport")
        let flight = manager.getFlightNumber(from: "J.F.K International Airport", for: gates[2])
        let gate = manager.getGateNumber(from: "J.F.K International Airport", for: flights[2])
        
        XCTAssertEqual(flight, "BA3442")
        XCTAssertEqual(gate, "3")
    }
    
    func testgetMap() {
        let m = AirportManager()
        // code for getting terminal number
        var terminalX = 1
        XCTAssertEqual(m.getMap(of: "Los Angeles International Airport", terminalNumber: terminalX), "Terminal 1.pdf")
        terminalX = 8
        XCTAssertEqual(m.getMap(of: "Los Angeles International Airport", terminalNumber: terminalX), "Terminal 8.pdf")
        //code for getting terminal number
        var terminalX: Int = 1
        XCTAssertEqual(m.getMap(of: "Los Angeles International Airport", terminalNumber: terminalX), "Terminal 1")
        terminalX = 8
        XCTAssertEqual(m.getMap(of: "Los Angeles International Airport", terminalNumber: terminalX), "Terminal 8" )
    }

    func testSizeComputedProperty() {
        let m = AirportManager()
        XCTAssertEqual(m.airportSize, 5)
        XCTAssertEqual(m.airlineSize, 68)
    }
}
