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
   
        let seating = seatMap(yourSeatNumber: "7B", flyingFrom: "Los Angeles International Airport", to: "Northwest Arkansas National Airport", using: "Aeroflot")
        
        XCTAssertEqual(seating.seatNumber, "7B")
    }
    func testIsDomestic() {
        
        let seating = seatMap(yourSeatNumber: "34A", flyingFrom: "Los Angeles International Airport", to: "Haneda International Airport", using: "American Airlines")
        
        XCTAssertEqual(seating.isflyingDomestic(), false)
    }
    func testGetSeatMap() {
        let seating = seatMap(yourSeatNumber: "34A", flyingFrom: "Los Angeles International Airport", to: "Haneda International Airport", using: "American Airlines")
        
        XCTAssertEqual(seating.getSeatMap(), "boeing777.pdf")
    }
    
}
