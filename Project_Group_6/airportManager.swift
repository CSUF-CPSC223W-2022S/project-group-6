//
//  airportManeger.swift
//  Project_Group_6
//
//  Created by diego on 2/24/22.
//
import Foundation

//  using class, instead of struct, to pass everything by reference
//  airport is a struct because it does not have a lot of information?

struct airport {
    //  contains all the infomation needed about a single airport
    
    var airportCode: String
    var gateNumbers: [String]
    var fullMapImage: String
    
    init(code: String, gateNumbers: [String], fullMapImage: String) {
        self.airportCode = code
        self.gateNumbers = gateNumbers
        self.fullMapImage = fullMapImage
    }
}
class AIRPORTMANAGER {
    //  contains a dictionary of Airports and functions to access the data
    
    let Airports: [String: airport] =
    [
        "Los Angeles International Airport":
            airport(code:"LAX", gateNumbers: ["12", "24B", "5"], fullMapImage: "Lax_terminal_overview.pdf"),
        "Northwest Arkansas National Airport":
            airport(code:"XNA", gateNumbers: ["1", "2", "3"], fullMapImage:"XnaMap.pdf"),
        "J.F.K International Airport":
            airport(code:"JFK", gateNumbers: ["1", "2", "3"], fullMapImage:"JFK_Map.pdf"),
        "Haneda International Airport":
            airport(code:"HND", gateNumbers: ["1", "2", "3"], fullMapImage:"HNDterminalMap.pdf"),
        "San Francisco International Airport":
            airport(code:"SFO", gateNumbers: ["1", "2", "3"], fullMapImage:"SFO_Map.pdf")
    ]
    
    //  empty initialer because we are setting the veriable in the class
    init() {  }
    
    //  returns 3 letter code of airport
    func getCode(for name: String) -> String {
        for names in Airports.keys {
            if name == names {
                return Airports[name]!.airportCode
            }
        }
    //  will return empty string if airport is not in the database
        return ""
    }
    
    //  returns full name of Airport
    func getAirportName(of code: String) -> String {
        for airport in Airports {
            if airport.value.airportCode == code {
                return airport.key
            }
        }
    //  will return empty string if airport is not in the database
        return ""
    }
    
    //  returns an array of gate numbers located at desired Airport
    func gateNumbers(from name: String) -> [String] {
        //code find
        for names in Airports.keys {
            if name == names {
                return Airports[name]!.gateNumbers
            }
        }
    //  will return an empty array if airport is not in the database
        return []
    }
    
    //  returns a file name which contains a full map of the airport terminals
    func getMap(of name: String) -> String {
        for names in Airports.keys {
            if name == names {
                return Airports[name]!.fullMapImage
            }
        }
    //  will return empty string if airport is not in the database
        return ""
    }
}

class COUNTRYMANAGER {
    let countryList: [String] = ["United States", "United Kingdom", "Japan", "Mexico"]
    
    init() {  }
    
    func find(name: String) -> String {
        var returnValue: String = ""
        for country in countryList {
            if name == country {
                returnValue = country
            }
        }
        return returnValue
    }
}