//
//  seatMapTests.swift
//  Project_Group_6Tests
//
//  Created by csuftitan on 3/8/22.
//

import XCTest

@testable import Project_Group_6

class seatMapTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInializer() {
        let m = AirportManager()
        let starting: airport = m.Airports["Los Angeles International Airport"]!
        let ending: airport = m.Airports["Northwest Arkansas National Airport"]!
        
        let seating = seatMap(yourSeatNumber: "7B", flyingFrom: starting, to: ending)
        
        XCTAssertEqual(seating.seatNumber, "7B")
    }
    func testIsDomestic() {
        let m = AirportManager()
        let starting: airport = m.Airports["Los Angeles International Airport"]!
        let ending: airport = m.Airports["Haneda International Airport"]!
        
        let seating = seatMap(yourSeatNumber: "34A", flyingFrom: starting, to: ending)
        
        XCTAssertEqual(seating.isflyingDomestic(), false)
    }
}
