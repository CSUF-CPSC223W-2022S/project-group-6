//
//  airportData.swift
//  Project_Group_6
//
//  Created by Diego on 2/27/22.
//

import Foundation

//  File for containing all of the data. Instead of creating the database inside of Airport Manager, we create it
//  here and send it over by call the 2 functions
//  Maybe in the future we will have other functions to read data in from files and it will all be done in this
//  file.
//  for example:
//  airports.csv
//  airport_name | airport_code | country | gate_number | flight_number | map_of_airport
//  "          " | "          " | "     " | "         " | "           " | "            "

func loadAirports() -> [String: airport] {
   let airportDictionary = [
    
"Los Angeles International Airport":
    airport(code:"LAX", country: "United States", gateNumbers: ["12", "24B", "5"], flightNumbers: ["AA234", "AA127", "BA3442"], fullMapImage: "Lax_terminal_overview.pdf"),
"Northwest Arkansas National Airport":
    airport(code:"XNA", country: "United States", gateNumbers: ["1", "2", "3"], flightNumbers: ["AA234", "AA127", "BA3442"], fullMapImage:"XnaMap.pdf"),
"J.F.K International Airport":
    airport(code:"JFK", country: "United States", gateNumbers: ["1", "2", "3"], flightNumbers: ["AA234", "AA127", "BA3442"],  fullMapImage:"JFK_Map.pdf"),
"Haneda International Airport":
    airport(code:"HND", country: "Japan", gateNumbers: ["1", "2", "3"], flightNumbers: ["AA234", "AA127", "BA3442"], fullMapImage:"HNDterminalMap.pdf"),
"San Francisco International Airport":
    airport(code:"SFO", country: "United States", gateNumbers: ["1", "2", "3"],flightNumbers: ["AA234", "AA127", "BA3442"], fullMapImage:"SFO_Map.pdf")

    ]
    
    return airportDictionary
}
func loadAirlines() -> [String: airline] {
    let airlineDictionary = [
        
"American Airlines": airline(airlineCode: "AA", connectedAirports: ["Los Angeles International Airport", "San Franciso International Airport"]),
"Delta Airlines": airline(airlineCode: "DAL", connectedAirports: ["Tokyo Area Airports", "Los Angeles International Airport", "London Heathrow International Airport"])

    ]
    
    return airlineDictionary
}
