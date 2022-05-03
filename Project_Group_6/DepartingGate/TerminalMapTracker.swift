//
//  TerminalMapTracker.swift
//  Project_Group_6
//
//  Created by csuftitan on 4/27/22.
//

import Foundation

class TerminalMapTracker {
    // Creates a list that contains all of the variables needed.
    var list: [gateMap]

    init() {
        self.list = []
    }
}

// Codable protocols
struct gateMap: Codable {
    var airport: String
    var terminal: Int
    var airline: String
    var code: String
    var flight: String
    var gate: String
    var imageName: String

    let airports = OtherAirportManager()
    let airportManager = AirportManager()

    // Creates an initializer with the user inputted information.
    init(airportName airport: String, terminalNumber terminal: Int, airlineName airline: String, airportCode code: String, flightNumber flight: String, gateNumber gate: String, _ imageName: String = "") {
        self.airport = airport
        self.terminal = terminal
        self.airline = airline
        self.code = code
        self.flight = flight
        self.gate = gate
        self.imageName = imageName
    }

    // Returns the terminal map of LAX.
    func getTerminalMapofLAX() -> String {
        return airportManager.getMap(of: airport, terminalNumber: terminal)
    }

    // Returns the terminal map of the other four airports.
    func getTerminalMapofOtherAirports() -> String {
        return airports.getMaps(of: airport, terminalNumber: terminal)
    }

    // CodingKey protocols
    // This can be used for decoding and encoding.
    enum gateMapCodingKeys: CodingKey {
        case airport
        case terminal
        case airline
        case code
        case flight
        case gate
        case imageName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: gateMapCodingKeys.self)
        self.airport = try container.decode(String.self, forKey: gateMapCodingKeys.airport)
        self.terminal = try container.decode(Int.self, forKey: gateMapCodingKeys.terminal)
        self.airline = try container.decode(String.self, forKey: gateMapCodingKeys.airline)
        self.code = try container.decode(String.self, forKey: gateMapCodingKeys.code)
        self.flight = try container.decode(String.self, forKey: gateMapCodingKeys.flight)
        self.gate = try container.decode(String.self, forKey: gateMapCodingKeys.gate)
        self.imageName = try container.decode(String.self, forKey: gateMapCodingKeys.imageName)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: gateMapCodingKeys.self)
        try container.encode(airport, forKey: .airport)
        try container.encode(terminal, forKey: .terminal)
        try container.encode(airline, forKey: .airline)
        try container.encode(code, forKey: .code)
        try container.encode(flight, forKey: .flight)
        try container.encode(gate, forKey: .gate)
        try container.encode(imageName, forKey: .imageName)
    }
}
