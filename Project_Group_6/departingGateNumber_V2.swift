//
//  departingGateNumber_V2.swift
//  Project_Group_6
//
//  Created by csuftitan on 2/17/22.
//

import Foundation

class Destination {
    let airport = AirportManager()

    var getMapOfTerminal: String = ""

    // MARK: - Returning Gate Number at LAX (For Unit Testing)

    func getGateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[0])
        return gateNumberIndex
    }

    func getFirstGateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[0])
        return gateNumberIndex
    }

    func getMiddleGateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[75])
        return gateNumberIndex
    }

    func getLastGateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[156])
        return gateNumberIndex
    }

    func getTerminal1GateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[0])
        return gateNumberIndex
    }

    func getTerminal2GateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[14])
        return gateNumberIndex
    }

    func getTerminal3GateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[28])
        return gateNumberIndex
    }

    func getTerminal4GateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[40])
        return gateNumberIndex
    }

    func getTerminal5GateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[52])
        return gateNumberIndex
    }

    func getTerminal6GateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[80])
        return gateNumberIndex
    }

    func getTerminal7and8GateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[110])
        return gateNumberIndex
    }

    func getTerminalInternationalGateNumberAtLAX() -> String {
        let flightNumber = airport.flightNumbers(from: "Los Angeles International Airport")
        let gateNumberIndex = airport.getGateNumber(from: "Los Angeles International Airport", for: flightNumber[135])
        return gateNumberIndex
    }

    // MARK: - Returning Gate Number at XNA (For Unit Testing)

    func getConcourseAGateNumberAtXNA() -> String {
        let gateNumberIndex = validGateNumberForConcourseAAtXNA()
        return gateNumberIndex
    }

    func getConcourseBGateNumberAtXNA() -> String {
        let gateNumberIndex = validGateNumberForConcourseBAtXNA()
        return gateNumberIndex
    }

    // MARK: - Returning Gate Number at JFK (For Unit Testing)

    func getGateNumberForTerminal1AtJFK() -> String {
        let gateNumberIndex = validGateNumberForTerminal1AtJFK()
        return gateNumberIndex
    }

    func getGateNumberForTerminal2AtJFK() -> String {
        let gateNumberIndex = validGateNumberForTerminal2AtJFK()
        return gateNumberIndex
    }

    func getGateNumberForTerminal4AtJFK() -> String {
        let gateNumberIndex = validGateNumberForTerminal4AtJFK()
        return gateNumberIndex
    }

    func getGateNumberForTerminal5AtJFK() -> String {
        let gateNumberIndex = validGateNumberForTerminal5AtJFK()
        return gateNumberIndex
    }

    func getGateNumberForTerminal7AtJFK() -> String {
        let gateNumberIndex = validGateNumberForTerminal7AtJFK()
        return gateNumberIndex
    }

    func getGateNumberForTerminal8AtJFK() -> String {
        let gateNumberIndex = validGateNumberForTerminal8AtJFK()
        return gateNumberIndex
    }

    // MARK: - Returning Gate Number at HND (For Unit Testing)

    func getGateNumberForTerminal1AtHND() -> String {
        let gateNumberIndex = validGateNumberForTerminal1AtHND()
        return gateNumberIndex
    }

    func getGateNumberForTerminal2AtHND() -> String {
        let gateNumberIndex = validGateNumberForTerminal2AtHND()
        return gateNumberIndex
    }

    func getGateNumberForTerminal3AtHND() -> String {
        let gateNumberIndex = validGateNumberForTerminalInternationalAtHND()
        return gateNumberIndex
    }

    // MARK: - Returning Gate Number at SFO (For Unit Testing)

    func getGateNumberForTerminal1AtSFO() -> String {
        let gateNumberIndex = validGateNumberForTerminal1AtSFO()
        return gateNumberIndex
    }

    func getGateNumberForTerminal2AtSFO() -> String {
        let gateNumberIndex = validGateNumberForTerminal2AtSFO()
        return gateNumberIndex
    }

    func getGateNumberForTerminal3AtSFO() -> String {
        let gateNumberIndex = validGateNumberForTerminal3AtSFO()
        return gateNumberIndex
    }

    func getGateNumberForTerminalInternationalAtSFO() -> String {
        let gateNumberIndex = validGateNumberForTerminalInternationalAtSFO()
        return gateNumberIndex
    }

    // MARK: - Returning Terminal Map at LAX

    func validAirlineWithTerminal1AtLAX(of name: String) -> Int {
        let airlineListForTerminal1: [String] = ["G4", "WN", "SY", "VB"]
        for airlineCode in airlineListForTerminal1 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 1
            }
        }
        return 0
    }

    func validAirlineWithTerminal2AtLAX(of name: String) -> Int {
        let airlineListForTerminal2: [String] = ["EI", "AM", "WS"]
        for airlineCode in airlineListForTerminal2 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 2
            }
        }
        return 0
    }

    func validAirlineWithTerminal3AtLAX(of name: String) -> Int {
        let airlineListForTerminal3 = ["DL"]
        for airlineCode in airlineListForTerminal3 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 3
            }
        }
        return 0
    }

    func validAirlineWithTerminal4AtLAX(of name: String) -> Int {
        let airlineListForTerminal4 = ["AA"]
        for airlineCode in airlineListForTerminal4 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 4
            }
        }
        return 0
    }

    func validAirlineWithTerminal5AtLAX(of name: String) -> Int {
        let airlineListForTerminal5: [String] = ["AC", "B6", "NK"]
        for airlineCode in airlineListForTerminal5 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 5
            }
        }
        return 0
    }

    func validAirlineWithTerminal6AtLAX(of name: String) -> Int {
        let airlineListForTerminal6: [String] = ["AS", "QX", "MW"]
        for airlineCode in airlineListForTerminal6 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 6
            }
        }
        return 0
    }

    func validAirlineWithTerminal7and8AtLAX(of name: String) -> Int {
        let airlineListForTerminal7and8 = ["UA"]
        for airlineCode in airlineListForTerminal7and8 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 7
            }
        }
        return 0
    }

    var airlineListForTerminalInternational: [String] = ["SU", "CA", "AF", "NZ", "TN", "NH", "G4", "OZ", "OS", "AV", "BA", "CX", "CI", "MU", "CZ", "CM", "LY", "EK", "EY", "BR", "FJ", "AY", "HU", "IB", "JL", "B6", "KL", "KE", "4M", "LO", "LH", "DY", "PR", "QF", "QR", "SV", "SK", "3U", "SQ", "SY", "LX", "TK", "VB", "VS", "Y4", "MF"]

    func validAirlineWithTerminalInternationalAtLAX(of name: String) -> Int {
        for airlineCode in airlineListForTerminalInternational {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 8
            }
        }
        return 0
    }

    // MARK: - Returning Terminal Map at XNA

    func validAirlineWithConcourseAAtXNA(of name: String) -> Int {
        let airlineListForConcourseA: [String] = ["MQ", "UA", "DL"]
        for airlineCode in airlineListForConcourseA {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 1
            }
        }
        return 0
    }

    func validAirlineWithConcourseBAtXNA(of name: String) -> Int {
        let airlineListForTerminal2: [String] = ["G4", "AA"]
        for airlineCode in airlineListForTerminal2 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 2
            }
        }
        return 0
    }

    // MARK: - Returning Terminal Map at JFK

    var airlineListForTerminal1: [String] = ["SU", "CA", "AF", "OS", "MU", "BR", "4O", "JL", "KE", "LH", "DY", "PR", "SV", "LX", "TK", "VB", "Y4"]

    func validAirlineWithTerminal1AtJFK(of name: String) -> Int {
        for airlineCode in airlineListForTerminal1 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 1
            }
        }
        return 0
    }

    func validAirlineWithTerminal2AtJFK(of name: String) -> Int {
        let airlineListForTerminal2 = ["DL"]
        for airlineCode in airlineListForTerminal2 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 2
            }
        }
        return 0
    }

    func validAirlineWithTerminal4AtJFK(of name: String) -> Int {
        let airlineListForTerminal4: [String] = ["AM", "OZ", "CI", "CZ", "CM", "LY", "EK", "EY", "KL", "4M", "SQ", "VS", "WS", "MF"]
        for airlineCode in airlineListForTerminal4 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 4
            }
        }
        return 0
    }

    func validAirlineWithTerminal5AtJFK(of name: String) -> Int {
        let airlineListForTerminal5: [String] = ["EI", "HA", "B6"]
        for airlineCode in airlineListForTerminal5 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 5
            }
        }
        return 0
    }

    func validAirlineWithTerminal7AtJFK(of name: String) -> Int {
        let airlineListForTerminal7: [String] = ["AS", "NH", "BA", "IB", "LO", "UA"]
        for airlineCode in airlineListForTerminal7 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 7
            }
        }
        return 0
    }

    func validAirlineWithTerminal8AtJFK(of name: String) -> Int {
        let airlineListForTerminal8: [String] = ["AA", "CX", "AY", "QR"]
        for airlineCode in airlineListForTerminal8 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 8
            }
        }
        return 0
    }

    // MARK: - Returning Terminal Map at HND

    func validAirlineWithTerminal1AtHND(of name: String) -> Int {
        let airlineListForTerminal1 = ["JL"]
        for airlineCode in airlineListForTerminal1 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 1
            }
        }
        return 0
    }

    func validAirlineWithTerminal2AtHND(of name: String) -> Int {
        let airlineListForTerminal2 = ["NH"]
        for airlineCode in airlineListForTerminal2 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 2
            }
        }
        return 0
    }

    var airlineListForTerminal3: [String] = ["AC", "CA", "AF", "AA", "OZ", "BA", "CX", "CI", "MU", "CZ", "DL", "EK", "BR", "HU", "HA", "KE", "LH", "PR", "QF", "QR", "SQ", "UA"]

    func validAirlineWithTerminal3AtHND(of name: String) -> Int {
        for airlineCode in airlineListForTerminal3 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 3
            }
        }
        return 0
    }

    // MARK: - Returning Terminal Map at SFO

    func validAirlineWithTerminal1AtSFO(of name: String) -> Int {
        let airlineListForTerminal1: [String] = ["AA", "B6", "WN"]
        for airlineCode in airlineListForTerminal1 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 1
            }
        }
        return 0
    }

    func validAirlineWithTerminal2AtSFO(of name: String) -> Int {
        let airlineListForTerminal2: [String] = ["AS", "DL"]
        for airlineCode in airlineListForTerminal2 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 2
            }
        }
        return 0
    }

    func validAirlineWithTerminal3AtSFO(of name: String) -> Int {
        let airlineListForTerminal3 = ["UA"]
        for airlineCode in airlineListForTerminal3 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 3
            }
        }
        return 0
    }

    var airlineListForTerminal4: [String] = ["AM", "AF", "AS", "AV", "BA", "CX", "CI", "MU", "CZ", "CM", "LY", "EK", "BR", "AY", "HA", "IB", "JL", "KL", "KE", "PR", "QF", "QR", "SY", "VS", "WS", "EI", "AC", "CA", "NZ", "NH", "OZ", "FJ", "LH", "SQ", "TK"]

    func validAirlineWithTerminalInternationalAtSFO(of name: String) -> Int {
        for airlineCode in airlineListForTerminal4 {
            if airlineCode == airport.getAirlineCode(of: name) {
                return 4
            }
        }
        return 0
    }

    // MARK: - Returning Gate Number at LAX

    var terminalNumber1AtLAX: [String] = ["9", "11A", "11B", "12B", "13", "14", "15", "16", "17A", "17B", "18A", "18B"]

    func validGateNumberForTerminal1AtLAX() -> String {
        let randomTerminalNumber = terminalNumber1AtJFK.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber2AtLAX: [String] = ["21", "21B", "22", "23A", "23B", "24", "25A", "25B", "26A", "26B", "27", "28"]

    func validGateNumberForTerminal2AtLAX() -> String {
        let randomTerminalNumber = terminalNumber2AtJFK.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber3AtLAX: [String] = ["31B", "32", "33A", "33B", "34", "35", "35P", "36", "37A", "37B", "38"]

    func validGateNumberForTerminal3AtLAX() -> String {
        let randomTerminalNumber = terminalNumber3AtLAX.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber4AtLAX: [String] = ["41", "42A", "42B", "43", "44", "45", "46A", "46B", "46C", "47A", "47B", "48A", "48B", "49A", "49B"]

    func validGateNumberForTerminal4AtLAX() -> String {
        let randomTerminalNumber = terminalNumber4AtLAX.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber5AtLAX: [String] = ["50", "51A", "51B", "52A", "52B", "52C", "52D", "52E", "52F", "52G", "52H", "52I", "52J", "53A", "53B", "54A", "54B", "55A", "56A", "56B", "56C", "56D", "57", "58", "59"]

    func validGateNumberForTerminal5AtLAX() -> String {
        let randomTerminalNumber = terminalNumber5AtLAX.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber6AtLAX: [String] = ["60", "60B", "61", "62", "63", "64A", "64B", "65A", "65B", "65C", "66", "67", "68A", "68B", "69A", "69B"]

    func validGateNumberForTerminal6AtLAX() -> String {
        let randomTerminalNumber = terminalNumber6AtLAX.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber7and8AtLAX: [String] = ["70A", "70B", "71A", "71B", "72A", "72B", "73", "74", "75A", "75B", "76A", "76B", "77", "80", "81", "82", "83", "84", "85", "86A", "86B"]

    func validGateNumberForTerminal7and8AtLAX() -> String {
        let randomTerminalNumber = terminalNumber7and8AtLAX.randomElement()!
        return randomTerminalNumber
    }

    var terminalInternationalAtLAX: [String] = ["130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "201A", "201B", "202", "203", "204", "205", "206", "207", "208", "209A", "209B", "210A", "210B", "221", "225"]

    func validGateNumberForTerminalInternationalAtLAX() -> String {
        let randomTerminalNumber = terminalInternationalAtLAX.randomElement()!
        return randomTerminalNumber
    }

    // MARK: - Returning Gate Number at XNA

    var concourseA: [String] = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11"]

    func validGateNumberForConcourseAAtXNA() -> String {
        let randomTerminalNumber = concourseA.randomElement()!
        return randomTerminalNumber
    }

    var concourseB: [String] = ["B1", "B2", "B3", "B4", "B6", "B7", "B8", "B9", "B10"]

    func validGateNumberForConcourseBAtXNA() -> String {
        let randomTerminalNumber = concourseB.randomElement()!
        return randomTerminalNumber
    }

    // MARK: - Returning Gate Number at JFK

    var terminalNumber1AtJFK: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]

    func validGateNumberForTerminal1AtJFK() -> String {
        let randomTerminalNumber = terminalNumber1AtJFK.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber2AtJFK: [String] = ["C60", "C61", "C62", "C63", "C64", "C65", "C66", "C67", "C68", "C69", "C70"]

    func validGateNumberForTerminal2AtJFK() -> String {
        let randomTerminalNumber = terminalNumber2AtJFK.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber4AtJFK: [String] = ["A3", "A5", "B20", "B22", "B23", "B24", "B25", "B26", "B27", "B28", "B29", "B30", "B31", "B32", "B33", "B34", "B35", "B36", "B37", "B38", "B39", "B41"]

    func validGateNumberForTerminal4AtJFK() -> String {
        let randomTerminalNumber = terminalNumber4AtJFK.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber5AtJFK: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]

    func validGateNumberForTerminal5AtJFK() -> String {
        let randomTerminalNumber = terminalNumber5AtJFK.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber7AtJFK: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]

    func validGateNumberForTerminal7AtJFK() -> String {
        let randomTerminalNumber = terminalNumber7AtJFK.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber8AtJFK: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "10", "12", "14", "16", "31A", "31B", "31C", "31D", "31E", "32F", "32G", "32H", "32I", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47"]

    func validGateNumberForTerminal8AtJFK() -> String {
        let randomTerminalNumber = terminalNumber8AtJFK.randomElement()!
        return randomTerminalNumber
    }

    // MARK: - Returning Gate Number at HND

    var terminalNumber1AtHND: [String] = ["1", "2", "3", "4", "5A", "5B", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]

    func validGateNumberForTerminal1AtHND() -> String {
        let randomTerminalNumber = terminalNumber1AtHND.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber2AtHND: [String] = ["51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67A", "67B", "68", "69", "70", "71", "72", "73"]

    func validGateNumberForTerminal2AtHND() -> String {
        let randomTerminalNumber = terminalNumber2AtHND.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumberInternationalAtHND: [String] = ["105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "131", "132", "133", "134", "135", "136", "137", "138", "139", "141", "142", "143", "144", "145", "146", "147", "148"]

    func validGateNumberForTerminalInternationalAtHND() -> String {
        let randomTerminalNumber = terminalNumberInternationalAtHND.randomElement()!
        return randomTerminalNumber
    }

    // MARK: - Returning Gate Number at SFO

    var terminalNumber1AtSFO: [String] = ["B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12", "B13", "B14", "B15", "B16", "B17", "B18", "B19", "B20", "B21", "B22", "B23", "B24", "B25", "B26", "B27"]

    func validGateNumberForTerminal1AtSFO() -> String {
        let randomTerminalNumber = terminalNumber1AtSFO.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber2AtSFO: [String] = ["C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D14", "D15", "D16", "D17", "D18"]

    func validGateNumberForTerminal2AtSFO() -> String {
        let randomTerminalNumber = terminalNumber2AtSFO.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumber3AtSFO: [String] = ["E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12", "E13", "F1", "F2", "F3", "F3A", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "F19", "F20", "F21", "F22"]

    func validGateNumberForTerminal3AtSFO() -> String {
        let randomTerminalNumber = terminalNumber3AtSFO.randomElement()!
        return randomTerminalNumber
    }

    var terminalNumberInternationalAtSFO: [String] = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", "A13", "A14", "A15", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12", "G13", "G14"]

    func validGateNumberForTerminalInternationalAtSFO() -> String {
        let randomTerminalNumber = terminalNumberInternationalAtSFO.randomElement()!
        return randomTerminalNumber
    }

    // MARK: - Generates the Estimated Time of Arrival to the Gate

    var timeOfArrival: [String] = ["6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]

    func randomTimeOfArrivalGenerator() -> String {
        let randomTimeOfArrival = timeOfArrival.randomElement()!
        return randomTimeOfArrival
    }
}
