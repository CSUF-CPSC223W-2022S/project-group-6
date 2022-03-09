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
   
        let seating = seatMap(yourSeatNumber: "7B", flyingFrom: "Los Angeles International Airport", to: "Northwest Arkansas National Airport")
        
        XCTAssertEqual(seating.seatNumber, "7B")
    }
    func testIsDomestic() {
        
        let seating = seatMap(yourSeatNumber: "34A", flyingFrom: "Los Angeles International Airport", to: "Haneda International Airport")
        
        XCTAssertEqual(seating.isflyingDomestic(), false)
    }
    
    func testCreatingALargeSeatMap() {
        let seating = seatMap(yourSeatNumber: "34A", flyingFrom: "Los Angeles International Airport", to: "Haneda International Airport")
        XCTAssertTrue(!seating.seatList.isEmpty)
        XCTAssert(seating.seatList.contains("34A"))
        XCTAssert(seating.seatList.contains("19A"))
        XCTAssert(seating.seatList.contains("45K"))
    }
    
    func testCreatingASmallSeatMap() {
        let seating = seatMap(yourSeatNumber: "27C", flyingFrom: "Los Angeles International Airport", to: "Northwest Arkansas National Airport")
        XCTAssertTrue(!seating.seatList.isEmpty)
        XCTAssert(seating.seatList.contains("27C"))
        XCTAssert(seating.seatList.contains("7A"))
        XCTAssert(seating.seatList.contains("34F"))
    }
}
