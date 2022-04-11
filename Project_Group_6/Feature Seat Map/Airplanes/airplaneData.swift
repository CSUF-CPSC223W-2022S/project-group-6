//
//  airplaneData.swift
//  Project_Group_6
//
//  Created by diego on 3/15/22.
//

import Foundation

enum planeType {
    case eDomestic
    case eInternational
    case eBoth
}

func loadAirplanes() -> [String: [plane]] {
    let dictionary: [String: [plane]] = [
        "American Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("CJR-700", .eDomestic, "cjr700"),
            plane("EJR-175", .eInternational, "ejr175")
        ],
        "Aer Lingus": [
            plane("ATR", .eDomestic, "atr"),
            plane("Airbus A320", .eDomestic, "airbus320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330")
        ],
        "Aeroflot": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Sukhoi Superjet 100", .eDomestic, "sukhoijet")
        ],
        "Aeromexico": [
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787")
        ],
        "Air Canada": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Mitsubishi", .eDomestic, "crj200"),
            plane("De Havilland", .eDomestic, "dash400")
        ],
        "Air China": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("ARJ21-700", .eDomestic, "arj700")
        ],
        "Air France": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("CJR-700", .eDomestic, "cjr700"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787")
        ],
        "Air New Zealand": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787"),
            plane("ATR", .eDomestic, "atr"),
            plane("Dash 300", .eDomestic, "dash300")
        ],
        "Air Tahiti Nui": [
            plane("787-9 Dreamliner", .eInternational, "dreamliner787")
        ],
        "Alaska Airlines": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("De Havilland", .eDomestic, "dash400"),
            plane("EJR-175", .eInternational, "ejr175")
        ],
        "All Nippon Airways": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Dash 300", .eDomestic, "dash300")
        ],
        "Allegiant Air": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320")
        ]
    ]
    return dictionary
}
