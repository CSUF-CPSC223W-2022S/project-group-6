//
//  airportManager.swift
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
    var country: String
    var gateNumbers: [String]
    var flightNumbers: [String]
    var terminalImages: [String]
    
    init(code: String, country: String,  gateNumbers: [String], flightNumbers: [String], terminalImages: [String]) {
        self.airportCode = code
        self.country = country
        self.gateNumbers = gateNumbers
        self.flightNumbers = flightNumbers
        self.terminalImages = terminalImages
    }
}

struct airline {
    //  contains all the information needed about a single Airline
    
    var airlineCode: String //     "AA"
    var connectedAirports : [String]//    names only, no need to have the entire airport struct
    //                                    ["Los Angeles International Airport", "San Franciso International Airport", ""]
}

class AirportManager {
    //  contains a dictionary of Airports and functions to access the data
    //  contains a dictionary of Airlines and functions to access the data
    let Airports: [String: airport]
    let Airlines: [String: airline]
    
    //  empty initialer because we are setting the veriable in the class
    init() {
        Airports = loadAirports()
        Airlines = loadAirlines()
    }
    
    //  returns size of Airports Dictionary
    var airportSize: Int{
        return Airports.count
    }
    
    //  returns size of Airlines Dictionary
    var airlineSize: Int {
        return Airlines.count
    }
    
    //  returns 3 letter code of airport
    func getCode(for name: String) -> String {
        for (names, airport) in Airports {
            if name == names {
                return airport.airportCode
            }
        }
    //  will return empty string if airport is not in the database
        return ""
    }
    
    //  returns full name of Airport
    func getAirportName(of code: String) -> String {
        for (name, airport) in Airports {
            if airport.airportCode == code {
                return name
            }
        }
    //  will return empty string if airport is not in the database
        return ""
    }
    
    //  returns the country that an airport is located at
    func getCountry(of airportName: String) -> String {
        for (name, airport) in Airports {
            if airportName == name {
                return airport.country
            }
        }
    //  will return empty string if airport is not in the database
        return ""
    }
    
    //  returns an array of gate numbers located at desired Airport
    func gateNumbers(from name: String) -> [String] {
        //code find
        for (names, airport) in Airports {
            if name == names {
                return airport.gateNumbers
            }
        }
    //  will return an empty array if airport is not in the database
        return []
    }
    
    //  returns an array of flight numbers for the day
    func flightNumbers(from name: String) -> [String] {
        //code find
        for (names, airport) in Airports {
            if name == names {
                return airport.flightNumbers
            }
        }
    //  will return an empty array if airport is not in the database
        return []
    }
    
    //  will return a specific gate number based on the flight number or empty string
    func getGateNumber(from airport: String, for flightNumber: String) -> String {
        for index in 0...Airports[airport]!.flightNumbers.count - 1 {
            if Airports[airport]!.flightNumbers[index] == flightNumber {
                return Airports[airport]!.gateNumbers[index]
            }
            
        }
        return ""
    }
    
    //  will return a specific flight number based on the gate number or empty string
    func getFlightNumber(from airport: String, for gateNumber: String) -> String {
        for index in 0...Airports[airport]!.gateNumbers.count - 1 {
            if Airports[airport]!.gateNumbers[index] == gateNumber {
                return Airports[airport]!.flightNumbers[index]
            }
            
        }
        return ""
    }
    
    //  returns a file name which contains a full map of the airport terminals
    func getMap(of name: String, terminalNumber: Int) -> String {
        for (names, airport) in Airports {
            if name == names {
                return airport.terminalImages[terminalNumber - 1]
            }
        }
    //  will return empty string if airport is not in the database
        return ""
    }
    
    //  !!!!    functions for get airline data starts here   !!!!
    
    //return airline 2 letter code base on the full name passed in or empty string
    func getAirlineCode(of name: String) -> String {
        for names in Airlines.keys {
            if name == names {
                return Airlines[name]!.airlineCode
            }
        }
        return ""
    }
    
    //returns airline name based on the 2 letter code passed in or empty string
    func getAirlineName(for code: String) -> String {
        for airline in Airlines {
            if airline.value.airlineCode == code {
                return airline.key
            }
        }
        return ""
    }
    
    //returns a list(array) of all the airports that this airline flys to or from or empty array
    func getAirlineConnectedAirports(for airlineName: String) -> [String] {
        for airline in Airlines {
            if airline.key == airlineName {
                return airline.value.connectedAirports
            }
        }
        return []
    }
}
