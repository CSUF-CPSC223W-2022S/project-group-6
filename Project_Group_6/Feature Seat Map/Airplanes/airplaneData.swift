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


func loadAirplanes() -> [String: [plane] ] {
    let dictionary: [String: [plane] ] = [
        
"American Airlines": [
    plane("Airbus A319", .eDomestic, "airbusA319.pdf"), plane("Airbus A320", .eDomestic, "airbusA320.pdf"),
    plane("Airbus A321", .eDomestic, "airbusA321.pdf"), plane("Boeing 737-800", .eDomestic, "boeing737.pdf"),
    plane("Boeing 777", .eInternational, "boeing777.pdf"), plane("CJR-700", .eDomestic, "cjr700.pdf"),
    plane("EJR-175", .eInternational, "ejr175.pdf")
    ],
"Aer Lingus": [
    plane("ATR", .eDomestic, "atr.pdf"), plane("Airbus A320", .eDomestic, "airbus320.pdf"),
    plane("Airbus A321", .eDomestic, "airbusA321.pdf"), plane("Airbus A330-300", .eInternational, "airbusA330.pdf")
    ],
"Aeroflot": [
    plane("Airbus A321", .eDomestic, "airbusA321.pdf"), plane("Boeing 737-800", .eDomestic, "boeing737.pdf"),
    plane("Boeing 777", .eInternational, "boeing777.pdf"), plane("Airbus A350", .eInternational, "airbusA350.pdf"),
    plane("Sukhoi Superjet 100", .eDomestic, "sukhoijet.pdf")
    ],
"Aeromexico": [
    plane("Boeing 737-800", .eDomestic, "boeing737.pdf"), plane("787-9 Dreamliner", .eInternational, "dreamliner787.pdf")
    ],
"Air Canada": [
    plane("Airbus A319", .eDomestic, "airbusA319.pdf"), plane("Airbus A320", .eDomestic, "airbusA320.pdf"),
    plane("Airbus A321", .eDomestic, "airbusA321.pdf"), plane("Boeing 737-800", .eDomestic, "boeing737.pdf"),
    plane("Boeing 777", .eInternational, "boeing777.pdf"), plane("Mitsubishi", .eDomestic, "cjr200.pdf"),
    plane("De Havilland", .eDomestic, "dehavilland.pdf")
    ]

    ]
    
    return dictionary
}
