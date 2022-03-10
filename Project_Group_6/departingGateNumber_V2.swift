//
//  departingGateNumber_V2.swift
//  Project_Group_6
//
//  Created by csuftitan on 2/17/22.
//

import Foundation

class Destination {
    let airport = AirportManager()

    var terminalNumber: String = ""
    var terminalX: Int = 1
    var getMapOfTerminal: String = ""

    func getGateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[0])
        return gateNumberIndex
    }

    func getFirstGateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[0])
        return gateNumberIndex
    }

    func getMiddleGateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[75])
        return gateNumberIndex
    }

    func getLastGateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[156])
        return gateNumberIndex
    }

    func getTerminal1GateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[0])
        return gateNumberIndex
    }

    func getTerminal2GateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[14])
        return gateNumberIndex
    }

    func getTerminal3GateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[28])
        return gateNumberIndex
    }

    func getTerminal4GateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[40])
        return gateNumberIndex
    }

    func getTerminal5GateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[52])
        return gateNumberIndex
    }

    func getTerminal6GateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[80])
        return gateNumberIndex
    }

    func getTerminal7and8GateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[110])
        return gateNumberIndex
    }

    func getTerminalInternationalGateNumber() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[135])
        return gateNumberIndex
    }

    func getGateMap() -> String {
        let gateMap = airport.getMap(of: "Los Angeles International Airport", terminalNumber: terminalX)
        return gateMap
    }

    // ------------------------------------------------------------------------------------------------------

    var terminalNumber1: [String] = ["9", "11A", "11B", "12B", "13", "14", "15", "16", "17A", "17B", "18A", "18B"]

    // 12 gate numbers
    func validGateNumberForTerminal1() -> String {
        // let convertGateNumber = Int(getGateNumber()) ?? 0
        // if convertGateNumber >= 0, convertGateNumber <= 11 {
        // if getGateMap() == "Terminal 1.pdf" {
        //    terminalNumber = "1"
        // }
        // }
        for gateNumber in terminalNumber1 {
            if gateNumber == getTerminal1GateNumber() {
                terminalNumber = "1"
            }
        }
        return terminalNumber
    }

    var terminalNumber2: [String] = ["21", "21B", "22", "23A", "23B", "24", "25A", "25B", "26A", "26B", "27", "28"]

    // 12 gate numbers
    func validGateNumberForTerminal2() -> String {
        for gateNumber in terminalNumber2 {
            if gateNumber == getTerminal2GateNumber() {
                terminalNumber = "2"
            }
        }
        return terminalNumber
    }

    var terminalNumber3: [String] = ["31B", "32", "33A", "33B", "34", "35", "35P", "36", "37A", "37B", "38"]

    // 11 gate numbers
    func validGateNumberForTerminal3() -> String {
        for gateNumber in terminalNumber3 {
            if gateNumber == getTerminal3GateNumber() {
                terminalNumber = "3"
            }
        }
        return terminalNumber
    }

    var terminalNumber4: [String] = ["41", "42A", "42B", "43", "44", "45", "46A", "46B", "46C", "47A", "47B", "48A", "48B", "49A", "49B"]

    // 15 gate numbers
    func validGateNumberForTerminal4() -> String {
        for gateNumber in terminalNumber4 {
            if gateNumber == getTerminal4GateNumber() {
                terminalNumber = "4"
            }
        }
        return terminalNumber
    }

    var terminalNumber5: [String] = ["50", "51A", "51B", "52A", "52B", "52C", "52D", "52E", "52F", "52G", "52H", "52I", "52J", "53A", "53B", "54A", "54B", "55A", "56A", "56B", "56C", "56D", "57", "58", "59"]

    // 25 numbers
    func validGateNumberForTerminal5() -> String {
        for gateNumber in terminalNumber5 {
            if gateNumber == getTerminal5GateNumber() {
                terminalNumber = "5"
            }
        }
        return terminalNumber
    }

    var terminalNumber6: [String] = ["60", "60B", "61", "62", "63", "64A", "64B", "65A", "65B", "65C", "66", "67", "68A", "68B", "69A", "69B"]

    // 16 numbers
    func validGateNumberForTerminal6() -> String {
        for gateNumber in terminalNumber6 {
            if gateNumber == getTerminal6GateNumber() {
                terminalNumber = "6"
            }
        }
        return terminalNumber
    }

    var terminalNumber7and8: [String] = ["70A", "70B", "71A", "71B", "72A", "72B", "73", "74", "75A", "75B", "76A", "76B", "77", "80", "81", "82", "83", "84", "85", "86A", "86B"]

    // 21 numbers
    func validGateNumberForTerminal7and8() -> String {
        for gateNumber in terminalNumber7and8 {
            if gateNumber == getTerminal7and8GateNumber() {
                terminalNumber = "7"
            }
        }
        return terminalNumber
    }

    var terminalInternational: [String] = ["130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "201A", "201B", "202", "203", "204", "205", "206", "207", "208", "209A", "209B", "210A", "210B", "221", "225"]

    // 45 numbers
    func validGateNumberForTerminalInternational() -> String {
        for gateNumber in terminalInternational {
            if gateNumber == getTerminalInternationalGateNumber() {
                terminalNumber = "8"
            }
        }
        return terminalNumber
    }

    // ------------------------------------------------------------------------------------------------------

    var airlineListForTerminal1: [String] = ["G4", "WN", "SY", "VB"]

    func validAirlineWithTerminal1() -> String {
        let convertTerminalNumber = Int(validGateNumberForTerminal1()) ?? 0
        for airlineCode in airlineListForTerminal1 {
            if airlineCode == airport.getAirlineCode(of: "Allegiant Air") {
                getMapOfTerminal = airport.getMap(of: "Los Angeles International Airport", terminalNumber: convertTerminalNumber)
            }
        }
        return getMapOfTerminal
    }

    var airlineListForTerminal2: [String] = ["EI", "AM", "DL", "WS"]

    func validAirlineWithTerminal2() -> String {
        let convertTerminalNumber = Int(validGateNumberForTerminal2()) ?? 0
        for airlineCode in airlineListForTerminal2 {
            if airlineCode == airport.getAirlineCode(of: "West Jet") {
                getMapOfTerminal = airport.getMap(of: "Los Angeles International Airport", terminalNumber: convertTerminalNumber)
            }
        }
        return getMapOfTerminal
    }

    var airlineListForTerminal3: [String] = ["DL"]

    func validAirlineWithTerminal3() -> String {
        let convertTerminalNumber = Int(validGateNumberForTerminal3()) ?? 0
        for airlineCode in airlineListForTerminal3 {
            if airlineCode == airport.getAirlineCode(of: "Delta Airlines") {
                getMapOfTerminal = airport.getMap(of: "Los Angeles International Airport", terminalNumber: convertTerminalNumber)
            }
        }
        return getMapOfTerminal
    }

    var airlineListForTerminal4: [String] = ["AA"]

    func validAirlineWithTerminal4() -> String {
        let convertTerminalNumber = Int(validGateNumberForTerminal4()) ?? 0
        for airlineCode in airlineListForTerminal4 {
            if airlineCode == airport.getAirlineCode(of: "American Airlines") {
                getMapOfTerminal = airport.getMap(of: "Los Angeles International Airport", terminalNumber: convertTerminalNumber)
            }
        }
        return getMapOfTerminal
    }

    var airlineListForTerminal5: [String] = ["AC", "AA", "B6", "NK"]

    func validAirlineWithTerminal5() -> String {
        let convertTerminalNumber = Int(validGateNumberForTerminal5()) ?? 0
        for airlineCode in airlineListForTerminal5 {
            if airlineCode == airport.getAirlineCode(of: "Air Canada") {
                getMapOfTerminal = airport.getMap(of: "Los Angeles International Airport", terminalNumber: convertTerminalNumber)
            }
        }
        return getMapOfTerminal
    }

    var airlineListForTerminal6: [String] = ["AC", "AS", "QX", "MW"]

    func validAirlineWithTerminal6() -> String {
        let convertTerminalNumber = Int(validGateNumberForTerminal6()) ?? 0
        for airlineCode in airlineListForTerminal6 {
            if airlineCode == airport.getAirlineCode(of: "Horizon Air") {
                getMapOfTerminal = airport.getMap(of: "Los Angeles International Airport", terminalNumber: convertTerminalNumber)
            }
        }
        return getMapOfTerminal
    }

    var airlineListForTerminal7and8: [String] = ["UA"]

    func validAirlineWithTerminal7and8() -> String {
        let convertTerminalNumber = Int(validGateNumberForTerminal7and8()) ?? 0
        for airlineCode in airlineListForTerminal7and8 {
            if airlineCode == airport.getAirlineCode(of: "United Airlines") {
                getMapOfTerminal = airport.getMap(of: "Los Angeles International Airport", terminalNumber: convertTerminalNumber)
            }
        }
        return getMapOfTerminal
    }

    var airlineListForTerminalInternational: [String] = ["SU", "CA", "AF", "NZ", "TN", "NH", "G4", "OZ", "OS", "AV", "BA", "CX", "CI", "MU", "CZ", "CM", "DL", "LY", "EK", "EY", "BR", "FJ", "AY", "HU", "IB", "JL", "B6", "KL", "KE", "4M", "LO", "LH", "DY", "PR", "QF", "QR", "SV", "SK", "3U", "SQ", "SY", "LX", "TK", "VB", "VS", "Y4", "MF"]

    func validAirlineWithTerminalInternational() -> String {
        let convertTerminalNumber = Int(validGateNumberForTerminalInternational()) ?? 0
        for airlineCode in airlineListForTerminalInternational {
            if airlineCode == airport.getAirlineCode(of: "All Nippon Airways - ANA") {
                getMapOfTerminal = airport.getMap(of: "Los Angeles International Airport", terminalNumber: convertTerminalNumber)
            }
        }
        return getMapOfTerminal
    }

    // Display the image of the terminal that the gate number is located.
    // Indicate the gate number on the image and give it a color or border that is visible.

    // Based on the location of the gate number, give an estimated time of arrival when the user has cleared the security gate.

    // Other international airport terminals are going to be added at a later date.
}
