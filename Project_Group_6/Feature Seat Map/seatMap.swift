//
//  seatMap.swift
//  Project_Group_6
//
//  Created by Diego on 3/8/22.
//

import Foundation

class SeatMapTracker {
    var name: String
    var list: [seatMap]
    
    init(name: String) {
        self.name = name
        self.list = []
    }
}

struct seatMap: Codable {
    //  used to determine what type of plane I'll use for the seatList
    
    //  basic variables
    var seatNumber: String
    var starting: String
    var destination: String
    var airline: String
    var imageName: String
    //  Manager variables
    let pManager = planeManager()
    let aManager = AirportManager()
    
    //  variable has to be private since the enum is private
    var planeSize: planeType {
        if isflyingDomestic() {
            return .eDomestic
        } else {
            return .eInternational
        }
    }
    
    //  must create an instance of seatMap with this information
    //  will be user given information
    init(yourSeatNumber seatNumber: String, flyingFrom starting: String, to destination: String, using airlineName: String, _ imageName: String = "") {
        self.seatNumber = seatNumber
        self.starting = starting
        self.destination = destination
        self.airline = airlineName
        self.imageName = imageName
    }
    
    // will return true if the flight both airports are in the same country
    func isflyingDomestic() -> Bool {
        // if starting airport is in Country X and destination airport is in Country X then
        // return true
        // else
        // return false
        // I will use this function to determine what type of image I will use for the seat Map
        // returning true means I should use a small plane image
        // returning false means I should use a larger plane image ( 500 > passengers )
        let begin: String = aManager.getCountry(of: starting)
        let end: String = aManager.getCountry(of: destination)
        if begin == end {
            return true
        } else {
            return false
        }
    }
    
    //  CodingKey protocals
    enum seatMapCodingKeys: CodingKey {
        case seatNumber
        case starting
        case destination
        case airline
        case imageName
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: seatMapCodingKeys.self)
        self.seatNumber = try valueContainer.decode(String.self, forKey: seatMapCodingKeys.seatNumber)
        self.starting = try valueContainer.decode(String.self, forKey: seatMapCodingKeys.starting)
        self.destination = try valueContainer.decode(String.self, forKey: seatMapCodingKeys.destination)
        self.airline = try valueContainer.decode(String.self, forKey: seatMapCodingKeys.airline)
        self.imageName = try valueContainer.decode(String.self, forKey: seatMapCodingKeys.imageName)
    }

    func encode(to encoder: Encoder) throws {
        var valueContainer = encoder.container(keyedBy: seatMapCodingKeys.self)
        try valueContainer.encode(seatNumber, forKey: .seatNumber)
        try valueContainer.encode(starting, forKey: .starting)
        try valueContainer.encode(destination, forKey: .destination)
        try valueContainer.encode(airline, forKey: .airline)
        try valueContainer.encode(imageName, forKey: .imageName)
    }
}

func getSeatMap(for airline: String, of planeSize: planeType) -> String {
    let pManager = planeManager()
    return pManager.getAirplaneImage(for: airline, of: planeSize)
}
