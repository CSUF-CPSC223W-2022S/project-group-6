//
//  planeManager.swift
//  Project_Group_6
//
//  Created by diego on 3/12/22.
//

import Foundation

/* struct Seat {

     var seatName: String
     var firstClass: Bool
     var buisness: Bool
     var enconomyPlus: Bool
     var enconomy: Bool

     init(_ seatName: String, firstClass:Bool = false, buisness:Bool = false, enconomyPlus:Bool = false,
          enconomy:Bool = false) {
         self.seatName = seatName
         self.firstClass = firstClass
         self.buisness = buisness
         self.enconomyPlus = enconomyPlus
         self.enconomy = enconomy
     }
     init() {
         seatName = ""
         firstClass = false
         buisness = false
         enconomyPlus = false
         enconomy = false
     }
 } */

struct plane {
    //  name of a plane
    var planeName: String
    //  is it used for international or domestic flights or both?
    var planeUse: planeType
    //  each plane will have a different image (Seat maps)
    var imageFileName: String

    init(_ name: String, _ type: planeType, _ fileName: String) {
        planeName = name
        planeUse = type
        imageFileName = fileName
    }
}

class planeManager {
    //  Dictionary of airline names connected to airplanes that airline uses
    //  i.e American Airlines uses planes [a, b, c, d]
    let airplanes: [String: [plane]]
    var connectedAirports: [String] = .init()
    init() {
        airplanes = loadAirplanes()
    }

    func getAirplane(for airlineName: String, of type: planeType) -> plane {
        for (name, list) in airplanes {
            if name == airlineName {
                let random = list.randomElement()!
                if random.planeUse == type {
                    return random
                } else {
                    for plane in list {
                        if type == plane.planeUse {
                            return plane
                        }
                    }
                }
            }
        }
        return plane("", .eDomestic, "")
    }

    func getAirplaneImage(for airlineName: String, of type: planeType) -> String {
        return getAirplane(for: airlineName, of: type).imageFileName
    }
}
