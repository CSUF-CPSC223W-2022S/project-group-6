//
//  manegerTests.swift
//  Project_Group_6Tests
//
//  Created by csuftitan on 2/24/22.
//

import XCTest
@testable import Project_Group_6

class airportManegerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialer() {
        let maneger = AIRPORTMANEGER()
        XCTAssertTrue(!maneger.Airports.isEmpty)
    }
    
    func testFunctionCalls() {
        let maneger = AIRPORTMANEGER()
        XCTAssertEqual(maneger.getCode(for: "Los Angeles International Airport"), "LAX")
        
        XCTAssertEqual(maneger.gateNumbers(for: "Los Angeles International Airport"), ["12", "24B", "5"])
        
        XCTAssertEqual(maneger.getMap(of: "Los Angeles International Airport"), "Lax_terminal_overview.pdf")
    }
    
    func testDifferentAirportNames() {
        let maneger = AIRPORTMANEGER()
        XCTAssertEqual(maneger.getCode(for: "Northwest Arkansas National Airport"), "XNA")
        
        XCTAssertEqual(maneger.getCode(for: "J.F.K International Airport"), "JFK")
        
        XCTAssertEqual(maneger.getCode(for: "Haneda International Airport"), "HND")
        
        XCTAssertEqual(maneger.getCode(for: "San Francisco International Airport"), "SFO")
    
    }
}
