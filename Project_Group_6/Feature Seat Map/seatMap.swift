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

struct seatMap {
    //  used to determine what type of plane I'll use for the seatList
    
    //  basic variables
    var seatNumber: String
    var starting: String
    var destination: String
    var airline: String
    
    //  Manager variables
    let pManager = planeManager()
    let aManager = AirportManager()
    
    //  variable has to be private since the enum is private
    private var planeSize: planeType {
        if isflyingDomestic() {
            return .eDomestic
        } else {
            return .eInternational
        }
    }
    
    

    //  must create an instance of seatMap with this information
    //  will be user given information
    init(yourSeatNumber seatNumber: String, flyingFrom starting: String, to destination: String, using airlineName: String) {
        self.seatNumber = seatNumber
        self.starting = starting
        self.destination = destination
        self.airline = airlineName
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
    
    func getSeatMap() -> String {
        return pManager.getAirplaneImage(for: airline, of: planeSize)
    }
}
