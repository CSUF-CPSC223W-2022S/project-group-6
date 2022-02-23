//
//  Daniel_File.swift
//  Project_Group_6
//
//  Created by csuftitan on 2/17/22.
//

import Foundation

class Destination : FlightList {
    // Needs to be created so that everyone one in the group can use it.
    // Create an array so that the key would be the airline name and the flight number would be the value.
    // Create a variable that sets the flight number to that variable.
    // Use the variable "flightNumber" for this portion of the code.
    
    // My portion of the code.
    // I need to inherit the array into this structure.
    // Create a third array that associates the flight number with the gate number. (The key would be the flight number and the gate number would be the value).
    var gateNumbers = ["9": "58", "6": "22"]

    // Use the variable created when it was inherited from the flight list to find the gate number in the array.
    // Create a variable that gets the gate number.
    var flightNumber : String
    var gateNumber : String
    var departingGate : String
    
    init(airplane flightNumber:String, boarding gateNumber:String, terminal departingGate:String) {
        self.flightNumber = flightNumber
        self.gateNumber = gateNumber
        self.departingGate = departingGate
    }
    
    func findsDepartingGateNumber() {
        for (flightNumber, gateNumber) in gateNumbers {
            if ((gateNumbers[flightNumber]) != nil) {
                departingGate = gateNumber
            } else {
                // Repromt the user for the flight number.
            }
        }
    }
    
    // Create an array for each terminal that has a departingGate assoicated with the terminal number.
    // Use the gate number provided to find which terminal the game number is located.
    // The terminals are from 1 - 7 and Tom Bradley International Terminal at LAX.

    var terminalNumber1 = ["9", "10"]
    var terminalNumber2 = ["10", "12"]
    var terminalNumber3 = ["11", "13"]
    var terminalNumber4 = ["12", "14"]
    var terminalNumber5 = ["13", "15"]
    var terminalNumber6 = ["14", "16"]
    var terminalNumber7 = ["15", "17"]
    var terminalInternational = ["16", "18"]
    
    func displaysDepartingGateTerminal() {
        if (terminalNumber1[departingGate]) {
            // Open the image to terminal 1 at LAX.
        }
        if (terminalNumber2[departingGate]) {
            // Open the image to terminal 2 at LAX.
        }
        if (terminalNumber3[departingGate]) {
            // Open the image to terminal 3 at LAX.
        }
        if (terminalNumber4[departingGate]) {
            // Open the image to terminal 4 at LAX.
        }
        if (terminalNumber5[departingGate]) {
            // Open the image to terminal 5 at LAX.
        }
        if (terminalNumber6[departingGate]) {
            // Open the image to terminal 6 at LAX.
        }
        if (terminalNumber7[departingGate]) {
            // Open the image to terminal 7 at LAX.
        }
        if (terminalInternational[departingGate]) {
            // Open the image to Tom Bradley International terminal at LAX.
        }
    }

    // Display the image of the terminal that the gate number is located.
    // Indicate the gate number on the image and give it a color or border that is visible.

    // Based on the location of the gate number, give an estimated time of arrival when the user has cleared the security gate.
    
    // Other international airport terminals are going to be added at a later date.
}
