//
//  seatMap.swift
//  Project_Group_6
//
//  Created by Diego on 3/8/22.
//

import Foundation
struct seatMap {
    let airportManager = AirportManager()
    
    var seatNumber: String
    var starting: airport
    var destination: airport
    init(yourSeatNumber seatNumber:String, flyingFrom starting: airport, to destination: airport) {
        self.seatNumber = seatNumber
        self.starting = starting
        self.destination = destination
    }
    
    //will return true if the flight both airports are in the same country
    func isflyingDomestic() -> Bool {
        //if starting airport is in Country X and destination airport is in Country X then
        //return true
        //else
        //return false
        //I will use this function to determine what type of image I will use for the seat Map
        //returning true means I should use a small plane image
        //returning false means I should use a larger plane image ( 500 > passengers )
        if starting.country == destination.country {
            return true
        } else {
            return false
        }
    }
    
}
