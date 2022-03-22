//
//  seatViewController.swift
//  Project_Group_6
//
//  Created by Diego on 3/9/22.
//

import UIKit

class seatViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let m = AirportManager()
    //  outlets
    @IBOutlet var userSeat: UITextField!
    @IBOutlet var picker: UIPickerView!
    //  variables to store temporary information
    private var seatNumber: String = ""
    private var start: String = ""
    private var destination: String = ""
    private var airline: String = ""
    //  information for the picker view
    private var pickerData: [[String]] = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        loadPickerData()
    }

    @IBAction func informationEntered(_ sender: Any) {
        //  only checks the user text box input because the picker has valid data
        if let validText = userSeat.text {
            seatNumber = validText
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  create the map instance in this seatViewController, pass a string of the image name to the next
        //  mapViewController
        let map = seatMap(yourSeatNumber: seatNumber, flyingFrom: start, to: destination, using: airline)
        debugPrint(map.getSeatMap())
        segue.destination.navigationItem.title = "LAX_terminal_overview" // map.getSeatMap()
    }

    func loadPickerData() {
        //  sorts and creates arrays based on the libraries dictionaries
        let sortedAirports = m.Airports.sorted {
            $0.key < $1.key
        }
        var airports = [String]()
        for (name, _) in sortedAirports {
            airports.append(name)
        }
        let sortedAirlines = m.Airlines.sorted {
            $0.key < $1.key
        }

        var airlines = [String]()
        for (name, _) in sortedAirlines {
            airlines.append(name)
        }

        //  adds the 3 arrays into pickerData[][]
        pickerData.append(airports)
        pickerData.append(airports)
        pickerData.append(airlines)
    }

    // number of Columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    //  number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }

    //  data that displays at this column and this row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }

    //  called when the picker stops scrolling (i.e when the user has made a selection)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //  switch statement to determine when col is being scrolled through and sets the appropriate variable
        switch component {
        case 0: //   starting airport
            start = pickerData[component][row]
        case 1: //   destination airport
            destination = pickerData[component][row]
        default: //  default because swift(case 2:)
            airline = pickerData[component][row]
        }
    }
}
