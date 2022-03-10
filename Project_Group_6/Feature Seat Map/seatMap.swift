//
//  seatMap.swift
//  Project_Group_6
//
//  Created by Diego on 3/8/22.
//

import Foundation
import UIKit

struct seatMap {
    //  used to determine what type of plane I'll use for the seatList
    private enum planeType {
        case eDomestic //  small plane
        case eInternational //  large plane
    }
    
    //  basic variables
    var seatNumber: String
    var starting: String
    var destination: String
    
    //  variable has to be private since the enum is private
    private var planeSize: planeType {
        if isflyingDomestic() {
            return .eDomestic
        } else {
            return .eInternational
        }
    }
    
    //  Array of seats (7A-34F for small plane) (19A-45K for large plane)
    var seatList: [String] {
        var list = [""]
        if planeSize == .eDomestic {
            list = createSmallSeatMap()
        } else if planeSize == .eInternational {
            list = createLargeSeatMap()
        }
        
        return list
    }

    //  must create an instance of seatMap with this information
    //  will be user given information
    init(yourSeatNumber seatNumber: String, flyingFrom starting: String, to destination: String) {
        self.seatNumber = seatNumber
        self.starting = starting
        self.destination = destination
    }
    
    // will return true if the flight both airports are in the same country
    func isflyingDomestic() -> Bool {
        // if starting airport is in Country X and destination airport is in Country X then
        // return true
        // else
        // return false
        // I will use this function to determine what type of image I will use for the seat Map
        // returning true means I should use a small plane image
        // returning false means I should use a larger plane image ( 500 > passengers )
        let m = AirportManager()
        let begin: String = m.getCountry(of: starting)
        let end: String = m.getCountry(of: destination)
        if begin == end {
            return true
        } else {
            return false
        }
    }
    
    //  Two private functions that create an Array of seat numbers
    private func createSmallSeatMap() -> [String] {
        var list: [String] = []
        var index: Int
        for i in 7...34 {
            index = 0
            while index < 6 {
                let letter = indexToRow(index: index, size: planeSize)
                let fullNumber: String = "\(i)" + "\(letter)"
                list.append(fullNumber)
                index += 1
            }
        }
        return list
    }

    private func createLargeSeatMap() -> [String] {
        var list: [String] = []
        var index: Int
        for i in 19...45 {
            index = 0
            while index < 9 {
                let letter = indexToRow(index: index, size: planeSize)
                let fullNumber: String = "\(i)" + "\(letter)"
                list.append(fullNumber)
                index += 1
            }
        }
        return list
    }
    
    //  private func to convert a number to a specific row letter changes based on planeType
    private func indexToRow(index: Int, size: planeType) -> String {
        var letter: String?
        if size == planeType.eDomestic {
            switch index {
                case 0:
                    letter = "A"
                case 1:
                    letter = "B"
                case 2:
                    letter = "C"
                case 3:
                    letter = "D"
                case 4:
                    letter = "E"
                default:
                    letter = "F"
            }
        } else if size == planeType.eInternational {
            switch index {
                case 0:
                    letter = "A"
                case 1:
                    letter = "B"
                case 2:
                    letter = "C"
                case 3:
                    letter = "D"
                case 4:
                    letter = "E"
                case 5:
                    letter = "G"
                case 6:
                    letter = "H"
                case 7:
                    letter = "J"
                default:
                    letter = "K"
            }
        }
        if let validLetter = letter {
            return validLetter
        } else {
            return ""
        }
    }
}
