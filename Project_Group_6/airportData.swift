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
//  

func loadAirports() -> [String: airport] {
   let airportDictionary = [
    
"Los Angeles International Airport":
    airport(code:"LAX", country: "United States", gateNumbers: ["9", "11A", "11B", "12B", "13", "14", "15", "16", "17A", "17B", "18A", "18B", "21", "21B", "22", "23A", "23B", "24", "25A", "25B", "26A", "26B", "27", "28", "31B", "32", "33A", "33B", "34", "35", "35P", "36", "37A", "37B", "38", "41", "42A", "42B", "43", "44", "45", "46A", "46B", "46C", "47A", "47B", "48A", "48B", "49A", "49B", "50", "51A", "51B", "52A", "52B", "52C", "52D", "52E", "52F", "52G", "52H", "52I", "52J", "53A", "53B", "54A", "54B", "55A", "56A", "56B", "56C", "56D", "57", "58", "59", "60", "60B", "61", "62", "63", "64A", "64B", "65A", "65B", "65C", "66", "67", "68A", "68B", "69A", "69B", "70A", "70B", "71A", "71B", "72A", "72B", "73", "74", "75A", "75B", "76A", "76B", "77", "80", "81", "82", "83", "84", "85", "86A", "86B", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "201A", "201B", "202", "203", "204", "205", "206", "207", "208", "209A", "209B", "210A", "210B", "221", "225"], flightNumbers: ["633", "922", "651", "314", "344", "987", "342", "426", "179", "466", "294", "253", "210", "804", "462", "488", "724", "797", "980", "849", "806", "346", "482", "621", "790", "814", "588", "394", "941", "986", "435", "905", "500", "815", "170", "784", "454", "913", "279", "242", "792", "458", "654", "996", "349", "770", "286", "515", "243", "499", "936", "481", "644", "375", "385", "767", "182", "412", "140", "399", "864", "715", "492", "164", "103", "537", "695", "118", "383", "186", "277", "959", "480", "483", "632", "244", "619", "195", "931", "125", "254", "324", "893", "223", "105", "966", "837", "206", "801", "391", "895", "780", "381", "451", "148", "786", "158", "387", "766", "293", "207", "573", "121", "226", "739", "754", "183", "467", "925", "765", "698", "853", "308", "691", "475", "427", "743", "192", "973", "386", "434", "196", "823", "809", "685", "249", "525", "296", "939", "928", "155", "256", "263", "519", "635", "236", "543", "374", "603", "514", "924", "438", "875", "505", "214", "489", "460", "807", "871", "419", "215", "411", "165", "650", "552", "441", "840"], terminalImages: ["Terminal 1", "Terminal 2", "Terminal 3", "Terminal 4", "Terminal 5", "Terminal 6", "Terminal 7", "Terminal 8"]),
"Northwest Arkansas National Airport":
    airport(code:"XNA", country: "United States", gateNumbers: ["1", "2", "3"], flightNumbers: ["AA234", "AA127", "BA3442"], terminalImages: ["XnaMap","Lax_terminal_2"]),
"J.F.K International Airport":
    airport(code:"JFK", country: "United States", gateNumbers: ["1", "2", "3"], flightNumbers: ["AA234", "AA127", "BA3442"],  terminalImages: ["JFK_Map", "Lax_terminal_2"]),
"Haneda International Airport":
    airport(code:"HND", country: "Japan", gateNumbers: ["1", "2", "3"], flightNumbers: ["AA234", "AA127", "BA3442"], terminalImages: ["HNDterminalMap"]),
"San Francisco International Airport":
    airport(code:"SFO", country: "United States", gateNumbers: ["1", "2", "3"],flightNumbers: ["AA234", "AA127", "BA3442"], terminalImages: ["SFO_Map"])

    ]
    
    return airportDictionary
}
func loadAirlines() -> [String: airline] {
    let airlineDictionary = [
        
            "Aer Lingus": airline(airlineCode: "EI", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Aeroflot": airline(airlineCode: "SU", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Aeromexico": airline(airlineCode: "AM", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Air Canada": airline(airlineCode: "AC", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Air China": airline(airlineCode: "CA", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Air France": airline(airlineCode: "AF", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Air New Zealand": airline(airlineCode: "NZ", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Air Tahiti Nui": airline(airlineCode: "TN", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Alaska Airlines": airline(airlineCode: "AS", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Northwest Arkansas National Airport"]),
            "All Nippon Airways - ANA": airline(airlineCode: "NH", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Allegiant Air": airline(airlineCode: "G4", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "American Airlines": airline(airlineCode: "AA", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport", "Northwest Arkansas National Airport"]),
            "American Eagle": airline(airlineCode: "MQ", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Northwest Arkansas National Airport"]),
            "Asiana Airlines": airline(airlineCode: "OZ", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Austrian Airlines": airline(airlineCode: "OS", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Avianca Airlines": airline(airlineCode: "AV", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Boutique Airlines": airline(airlineCode: "4B", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "British Airways": airline(airlineCode: "BA", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Cathay Pacific Airlines": airline(airlineCode: "CX", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "China Airlines": airline(airlineCode: "CI", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "China Cargo Airlines": airline(airlineCode: "CK", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "China Eastern": airline(airlineCode: "MU", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "China Southern Airlines": airline(airlineCode: "CZ", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Copa Airlines": airline(airlineCode: "CM", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Delta Airlines": airline(airlineCode: "DL", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport", "Northwest Arkansas National Airport"]),
            "EI AI Israel Airlines": airline(airlineCode: "LY", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Emirates": airline(airlineCode: "EK", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Etihad Airways": airline(airlineCode: "EY", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "EVA Air": airline(airlineCode: "BR", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Fiji Airways": airline(airlineCode: "FJ", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Finnair": airline(airlineCode: "AY", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Hainan Airlines": airline(airlineCode: "HU", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Hawaiian Airlines": airline(airlineCode: "HA", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Horizon Air": airline(airlineCode: "QX", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Iberia Airlines": airline(airlineCode: "IB", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "InterJet": airline(airlineCode: "4O", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Japan Airlines": airline(airlineCode: "JL", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "JetBlue": airline(airlineCode: "B6", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Northwest Arkansas National Airport"]),
            "KLM Royal Dutch Airlines": airline(airlineCode: "KL", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Korean Airlines": airline(airlineCode: "KE", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "LATAM": airline(airlineCode: "4M", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Level Airlines": airline(airlineCode: "IB", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "LOT Polish": airline(airlineCode: "LO", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Lufthansa": airline(airlineCode: "LH", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Mokulele Airlines": airline(airlineCode: "MW", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Nippon Cargo Airlines": airline(airlineCode: "KZ", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Norwegian Air Shuttle": airline(airlineCode: "DY", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Philippine Airlines": airline(airlineCode: "PR", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Qantas": airline(airlineCode: "QF", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Qatar Airways": airline(airlineCode: "QR", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Saudia Airlines": airline(airlineCode: "SV", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Scandinavian Airlines": airline(airlineCode: "SK", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Sichuan Airlines": airline(airlineCode: "3U", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Singapore Airlines": airline(airlineCode: "SQ", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Southwest Airlines": airline(airlineCode: "WN", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport", "Northwest Arkansas National Airport"]),
            "Spirit Airlines": airline(airlineCode: "NK", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport", "Northwest Arkansas National Airport"]),
            "Sun Country": airline(airlineCode: "SY", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport", "Northwest Arkansas National Airport"]),
            "Swiss International Air Lines Ltd": airline(airlineCode: "LX", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Thomas Cook Airlines": airline(airlineCode: "MT", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Turkish Airlines": airline(airlineCode: "TK", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "United Airlines": airline(airlineCode: "UA", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport", "Northwest Arkansas National Airport"]),
            "Virgin Atlantic": airline(airlineCode: "VS", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Virgin Australia": airline(airlineCode: "VA", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Viva Aerobus": airline(airlineCode: "VB", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Volaris": airline(airlineCode: "Y4", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "West Jet": airline(airlineCode: "WS", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "Xiamen Airlines": airline(airlineCode: "MF", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"]),
            "XL Airways France": airline(airlineCode: "SE", connectedAirports: ["Los Angeles International Airport", "San Francisco International Airport", "John F. Kennedy International Airport", "Haneda International Airport"])


    ]
    
    return airlineDictionary
}
