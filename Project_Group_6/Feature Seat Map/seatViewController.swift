//
//  seatViewController.swift
//  Project_Group_6
//
//  Created by Diego on 3/9/22.
//

import UIKit

class seatViewController: UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {
    
    let m = AirportManager()
    let startingAirportCellID = "start_Airports"
    let destinationAirportCellID = "des_Airports"
    let airlineCellID = "Airlines"
    //  tracks seat map information across different view controllers
    var seatMapTracker: SeatMapTracker!
    //  outlets
    @IBOutlet var userSeat: UITextField!
    
    @IBOutlet var start_airportSearch: UITextField!
    @IBOutlet var des_airportSearch: UITextField!
    @IBOutlet var airlineSearch: UITextField!
    
    @IBOutlet var airportTable: UITableView!
    @IBOutlet var destinationAirportTable: UITableView!
    @IBOutlet var airlineTable: UITableView!
    //  variables to store temporary information
    private var seatNumber: String = ""
    private var start: String = ""
    private var destination: String = ""
    private var airline: String = ""
    
    // private sorted arrays
    var airportList = [String]()
    var airlineList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatMapTracker = SeatMapTracker(name: "Created SeatMaps")
        createLists()
        
        airportTable.register(UITableViewCell.self, forCellReuseIdentifier: startingAirportCellID)
        airportTable.delegate = self
        airportTable.dataSource = self
        airportTable.isHidden = true
        
        destinationAirportTable.register(UITableViewCell.self, forCellReuseIdentifier: destinationAirportCellID)
        destinationAirportTable.delegate = self
        destinationAirportTable.dataSource = self
        destinationAirportTable.isHidden = true
        
        airlineTable.register(UITableViewCell.self, forCellReuseIdentifier: airlineCellID)
        airlineTable.delegate = self
        airlineTable.dataSource = self
        airlineTable.isHidden = true
        
        
        
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
        seatMapTracker.list.append(map)
        if let addSeatMap = segue.destination as? mapViewController {
            addSeatMap.seatMapTracker = seatMapTracker
        }
        
        //debugPrint(map.getSeatMap())
        //segue.destination.navigationItem.title =  map.getSeatMap()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.restorationIdentifier == "AirlineTable" {
            //return airline array count
            return airlineList.count
        } else {
            //return airport array count
            return airportList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell()
        if tableView.restorationIdentifier == "STARTTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: startingAirportCellID) as UITableViewCell?)!
            cell.textLabel?.text = airportList[indexPath.row]
        } else if tableView.restorationIdentifier == "ENDTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: destinationAirportCellID) as UITableViewCell?)!
            cell.textLabel?.text = airportList[indexPath.row]
        } else if tableView.restorationIdentifier == "AirlineTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: airlineCellID) as UITableViewCell?)!
            cell.textLabel?.text = airlineList[indexPath.row]
        } else {
            cell = (tableView.dequeueReusableCell(withIdentifier: startingAirportCellID) as UITableViewCell?)!
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.restorationIdentifier == "STARTTable" {
            start = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            start_airportSearch.text = start
        } else if tableView.restorationIdentifier == "ENDTable" {
            destination = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            des_airportSearch.text = destination
        } else if tableView.restorationIdentifier == "AirlineTable" {
            airline = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            airlineSearch.text = airline
        }
    }
    
    //  functions to turn the menus on and off
    @IBAction func hideAllTables(_ sender: Any) {
        airportTable.isHidden = true
        destinationAirportTable.isHidden = true
        airlineTable.isHidden = true
        
        start_airportSearch.isHidden = false 
        des_airportSearch.isHidden = false
        airlineSearch.isHidden = false
    }
    @IBAction func Start_Airport_Clicked(_ sender: Any) {
        airportTable.isHidden = false
        des_airportSearch.isHidden = true
        airlineSearch.isHidden = true
        
        destinationAirportTable.isHidden = true
        airlineTable.isHidden = true
    }
    @IBAction func Start_Airport_notClicked(_ sender: Any) {
        airportTable.isHidden = true
        des_airportSearch.isHidden = false
        airlineSearch.isHidden = false
    }
    @IBAction func End_Airport_Clicked(_ sender: Any) {
        destinationAirportTable.isHidden = false
        airlineSearch.isHidden = true
        
        airportTable.isHidden = true
        airlineTable.isHidden = true
    }
    @IBAction func End_Airport_notClicked(_ sender: Any) {
        destinationAirportTable.isHidden = true
        airlineSearch.isHidden = false 
    }
    @IBAction func Airline_Clicked(_ sender: Any) {
        airlineTable.isHidden = false
        
        airportTable.isHidden = true
        destinationAirportTable.isHidden = true
    }
    @IBAction func Airline_notClicked(_ sender: Any) {
        airlineTable.isHidden = true
    }
    
    
    private func createLists() {
        //  sorts airport dictionary and
        //  places the keys(strings) into
        //  an array
        let sortedAirports = m.Airports.sorted {
            $0.key < $1.key
        }
        for (name, _) in sortedAirports {
            airportList.append(name)
        }
        //  does the same for airlines
        let sortedAirlines = m.Airlines.sorted {
            $0.key < $1.key
        }
        for (name, _) in sortedAirlines {
            airlineList.append(name)
        }
    }
}
