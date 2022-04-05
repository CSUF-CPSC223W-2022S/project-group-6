//
//  otherTerminalMapsManager.swift
//  Project_Group_6
//
//  Created by csuftitan on 3/31/22.
//

import Foundation

struct airports {
    //  contains all the infomation needed about a single airport

    var airportCode: String
    var country: String
    var gateNumbers: [String]
    var flightNumbers: [String]
    var terminalImages: [String]

    init(code: String, country: String, gateNumbers: [String], flightNumbers: [String], terminalImages: [String]) {
        airportCode = code
        self.country = country
        self.gateNumbers = gateNumbers
        self.flightNumbers = flightNumbers
        self.terminalImages = terminalImages
    }
}

class OtherAirportManager {
    //  contains a dictionary of Airports and functions to access the data
    let Airports: [String: airport]

    //  empty initialer because we are setting the veriable in the class
    init() {
        Airports = loadOtherAirports()
    }

    //  returns a file name which contains a full map of the airport terminals
    func getMaps(of name: String, terminalNumber: Int) -> String {
        for (names, airports) in Airports {
            if name == names {
                return airports.terminalImages[terminalNumber - 1]
            }
        }
        //  will return empty string if airport is not in the database
        return ""
    }
}
