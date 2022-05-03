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
        //  creates our test control variable
        var testMap = seatMap(yourSeatNumber: "A21", flyingFrom: "Los Angeles International Airport", to: "Haneda International Airport", using: "American Airlines")
        testMap.imageName = "boeing777"
        
        // creates a mapViewController to use the save function
        let historyMap = mapViewController()
        //  sets the variable that will be saved to our test variable
        historyMap.seatMapInstance = testMap
        let obj = Any.self
        historyMap.saveImage(obj)
        // -----------------------------------------------------
        
        let seatMapDecoder = PropertyListDecoder()
        guard let saveLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            XCTFail()
            return
        }
        //  trys to decode the information that should be saved into the file
        let fileURL = saveLocation.appendingPathComponent("SeatMaps").appendingPathExtension("plist")
        guard let seatMapFile = try? Data(contentsOf: fileURL), let decodedHistoryMap = try? seatMapDecoder.decode(seatMap.self, from: seatMapFile) else {
            XCTFail()
            return
        }
        //  ensure the saved seat Map == to our original variable
        XCTAssertEqual(testMap.imageName, decodedHistoryMap.imageName)
    }
    
    func testSeatMapLoadFile() {
        var testMap = seatMap(yourSeatNumber: "A21", flyingFrom: "Los Angeles International Airport", to: "Haneda International Airport", using: "American Airlines")
        testMap.imageName = "boeing777"
        
        //  first you must write to the file before testing if you can load the data
        let seatEncoder = PropertyListEncoder()
        guard let saveLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first, let encodedHistory = try? seatEncoder.encode(testMap) else {
            return
        }
        let fileURL = saveLocation.appendingPathComponent("SeatMaps").appendingPathExtension("plist")
        try? encodedHistory.write(to: fileURL)
        //  ------------------------------------------------------------------------
        
        //  Create an seatViewController to use the load function
        let historyMap = seatViewController()
        historyMap.testloadInfomation()
        
        //  checks to see if the load function did load something else it fails the whole test
        guard let saveSeatMap = historyMap.savedSeatMap else {
            XCTFail()
            return
        }
        
        //  ensure that the load seat map == the original test map
        XCTAssertEqual(testMap.imageName, saveSeatMap.imageName)
    }
}
