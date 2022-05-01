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
        
        XCTAssertEqual(getSeatMap(for: seating.airline, of: seating.planeSize), "boeing777")
    }
    func testLoadindAirplaneData() {
        let manager = planeManager()
        XCTAssertGreaterThan(manager.airplanes.count, 1)
    }
    
    func testSeatMapSaveFile() {
        var testMap = seatMap(yourSeatNumber: "A21", flyingFrom: "Los Angeles International Airport", to: "Haneda International Airport", using: "American Airlines")
        testMap.imageName = "boeing777"
        
        let historyMap: mapViewController = mapViewController()
        historyMap.seatMapInstance = testMap
        let obj = (Any).self
        historyMap.saveImage(obj)
        
        let seatMapDecoder = PropertyListDecoder()
        guard let saveLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            XCTFail()
            return
        }
        let fileURL = saveLocation.appendingPathComponent("SeatMaps").appendingPathExtension("plist")
        guard let seatMapFile = try? Data(contentsOf: fileURL), let decodedHistoryMap = try? seatMapDecoder.decode(seatMap.self, from: seatMapFile) else {
                    XCTFail()
                    return
                }
        XCTAssertEqual(testMap.imageName, decodedHistoryMap.imageName)
    }
    
}
