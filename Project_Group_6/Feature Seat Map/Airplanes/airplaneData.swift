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
            plane("CJR-700", .eDomestic, "crj700"),
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
            plane("CJR-700", .eDomestic, "crj700"),
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
        "All Nippon Airways - ANA": [
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
        ],
        "American Eagle": [
            plane("EJR-145", .eDomestic, "erj145"),
            plane("EJR-175", .eInternational, "ejr175"),
            plane("CJR-700", .eDomestic, "crj700")
        ],
        "Asiana Airlines": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Airbus A380", .eInternational, "airbusA380"),
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Austrian Airlines": [
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("EJR-195", .eDomestic, "erj195")
        ],
        "Avianca Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787"),
            plane("ATR", .eDomestic, "atr")
        ],
        "Boutique Airlines": [
            plane("PC-12", .eDomestic, "pc-12"),
            plane("King Air 350", .eDomestic, "kingair350")
        ],
        "British Airways": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Airbus A380", .eInternational, "airbusA380"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787")
        ],
        "Cathay Pacific Airlines": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "China Airlines": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777")

        ],
        "China Cargo Airlines": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "China Eastern": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Boeing 787", .eInternational, "boeing787")

        ],
        "China Southern Airlines": [
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Boeing 787", .eInternational, "boeing787"),
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("EJR-195", .eDomestic, "erj195")

        ],
        "Copa Airlines": [
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 737-800", .eInternational, "boeing737")
        ],
        "Delta Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("EJR-175", .eDomestic, "erj175"),
            plane("CRJ-200", .eDomestic, "crj200"),
            plane("CJR-700", .eDomestic, "crj700")
        ],
        "EI AI Israel Airlines": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Emirates": [
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787")
        ],
        "Etihad Airways": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Mitsubishi", .eDomestic, "crj200"),
            plane("De Havilland", .eDomestic, "dash400")
        ],
        "EVA Air": [
            plane("EJR-145", .eDomestic, "erj145"),
            plane("EJR-175", .eInternational, "ejr175"),
            plane("CJR-700", .eDomestic, "crj700")
        ],
        "Fiji Airways": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787"),
            plane("ATR", .eDomestic, "atr")
        ],
        "Finnair": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Sukhoi Superjet 100", .eDomestic, "sukhoijet")
        ],
        "Hainan Airlines": [
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("EJR-195", .eDomestic, "erj195")
        ],
        "Hawaiian Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("CJR-700", .eDomestic, "crj700"),
            plane("EJR-175", .eInternational, "ejr175")
        ],
        "Horizon Air": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787"),
            plane("ATR", .eDomestic, "atr")
        ],
        "Iberia Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Boeing 787", .eInternational, "boeing787")
        ],
        "InterJet": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Sukhoi Superjet 100", .eDomestic, "sukhoijet")
        ],
        "Japan Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Mitsubishi", .eDomestic, "crj200"),
            plane("De Havilland", .eDomestic, "dash400")
        ],
        "JetBlue": [
            plane("EJR-145", .eDomestic, "erj145"),
            plane("EJR-175", .eInternational, "ejr175"),
            plane("CJR-700", .eDomestic, "crj700")
        ],
        "KLM Royal Dutch Airlines": [
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("EJR-195", .eDomestic, "erj195")
        ],
        "Korean Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Boeing 787", .eInternational, "boeing787")
        ],
        "LATAM": [
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("787-9 Dreamliner", .eInternational, "dreamliner787")
        ],
        "Level Airlines": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Sukhoi Superjet 100", .eDomestic, "sukhoijet")
        ],
        "LOT Polish": [
            plane("EJR-145", .eDomestic, "erj145"),
            plane("EJR-175", .eInternational, "ejr175"),
            plane("CJR-700", .eDomestic, "crj700")
        ],
        "Lufthansa": [
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 737-800", .eInternational, "boeing737")
        ],
        "Mokulele Airlines": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Nippon Cargo Airlines": [
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 737-800", .eInternational, "boeing737")
        ],
        "Norwegian Air Shuttle": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Sukhoi Superjet 100", .eDomestic, "sukhoijet")
        ],
        "Philippine Airlines": [
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("EJR-195", .eDomestic, "erj195")
        ],
        "Qantas": [
            plane("PC-12", .eDomestic, "pc-12"),
            plane("King Air 350", .eDomestic, "kingair350")
        ],
        "Qatar Airways": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Saudia Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("CJR-700", .eDomestic, "crj700"),
            plane("EJR-175", .eInternational, "ejr175")
        ],
        "Scandinavian Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("CJR-700", .eDomestic, "crj700"),
            plane("EJR-175", .eInternational, "ejr175")
        ],
        "Sichuan Airlines": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Singapore Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("CJR-700", .eDomestic, "crj700"),
            plane("EJR-175", .eInternational, "ejr175")
        ],
        "Southwest Airlines": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("CJR-700", .eDomestic, "crj700"),
            plane("EJR-175", .eInternational, "ejr175")
        ],
        "Spirit Airlines": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Sun Country": [
            plane("PC-12", .eDomestic, "pc-12"),
            plane("King Air 350", .eDomestic, "kingair350")
        ],
        "Swiss International Air Lines Ltd": [
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737")
        ],
        "Thomas Cook Airlines": [
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Turkish Airlines": [
            plane("787-9 Dreamliner", .eInternational, "dreamliner787"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "United Airlines": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Airbus A380", .eInternational, "airbusA380"),
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Virgin Atlantic": [
            plane("ATR", .eDomestic, "atr"),
            plane("Airbus A320", .eDomestic, "airbus320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330")
        ],
        "Virgin Australia": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Airbus A380", .eInternational, "airbusA380"),
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "Viva Aerobus": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Airbus A380", .eInternational, "airbusA380")
        ],
        "Volaris": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("EJR-175", .eDomestic, "erj175"),
            plane("CRJ-200", .eDomestic, "crj200"),
            plane("CJR-700", .eDomestic, "crj700")
        ],
        "West Jet": [
            plane("ATR", .eDomestic, "atr"),
            plane("Airbus A320", .eDomestic, "airbus320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A330-300", .eInternational, "airbusA330")
        ],
        "Xiamen Airlines": [
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Airbus A350", .eInternational, "airbusA350"),
            plane("Airbus A380", .eInternational, "airbusA380"),
            plane("Boeing 747", .eInternational, "boeing747"),
            plane("Boeing 767", .eDomestic, "boeing767"),
            plane("Boeing 777", .eInternational, "boeing777")
        ],
        "XL Airways France": [
            plane("Airbus A319", .eDomestic, "airbusA319"),
            plane("Airbus A320", .eDomestic, "airbusA320"),
            plane("Airbus A321", .eDomestic, "airbusA321"),
            plane("Boeing 737-800", .eDomestic, "boeing737"),
            plane("Boeing 777", .eInternational, "boeing777"),
            plane("CJR-700", .eDomestic, "crj700"),
            plane("EJR-175", .eInternational, "ejr175")
        ]
    ]
    return dictionary
}
