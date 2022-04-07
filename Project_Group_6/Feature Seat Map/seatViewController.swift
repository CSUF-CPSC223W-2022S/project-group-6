//
//  seatViewController.swift
//  Project_Group_6
//
//  Created by Diego on 3/9/22.
//

import UIKit

class seatViewController: UIViewController,
    UITableViewDataSource,
    UITableViewDelegate
{
    let manager = AirportManager()
    //  Outlet IDs
    let startingAirportCellID = "start_Airports"
    let destinationAirportCellID = "des_Airports"
    let airlineCellID = "Airlines"
    //  tracks seat map information across different view controllers
    var seatMapTracker: SeatMapTracker!
    //  OUTLETS
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
    private var isSearching: Bool = false
    
    // private sorted arrays
    private var airportList = [String]()
    private var airlineList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatMapTracker = SeatMapTracker(name: "Created SeatMaps")
        createLists()
        setUpTextImages()
        
        // Setting up all of the tables
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  create the map instance in this seatViewController
        //  adds the seatMap object into the global tracker for use in mapViewController
        let map = seatMap(yourSeatNumber: seatNumber, flyingFrom: start, to: destination, using: airline)
        seatMapTracker.list.append(map)
        if let addSeatMap = segue.destination as? mapViewController {
            addSeatMap.seatMapTracker = seatMapTracker
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.restorationIdentifier == "AirlineTable" {
            // return airline array count
            return airlineList.count
        } else {
            // return airport array count
            return airportList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if tableView.restorationIdentifier == "STARTTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: startingAirportCellID) as UITableViewCell?)!
            cell.textLabel?.text = airportList[indexPath.row]
        } else if tableView.restorationIdentifier == "ENDTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: destinationAirportCellID) as UITableViewCell?)!
            cell.textLabel?.text = airportList[indexPath.row]
        } else if tableView.restorationIdentifier == "AirlineTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: airlineCellID) as UITableViewCell?)!
            cell.textLabel?.text = airlineList[indexPath.row]
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.restorationIdentifier == "STARTTable" {
            start = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            start_airportSearch.text = start
            start_airportSearch.endEditing(true)
        } else if tableView.restorationIdentifier == "ENDTable" {
            destination = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            des_airportSearch.text = destination
            des_airportSearch.endEditing(true)
        } else if tableView.restorationIdentifier == "AirlineTable" {
            airline = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            airlineSearch.text = airline
            airlineSearch.endEditing(true)
        }
        hideAllTables()
    }
    
    // ACTIONS Functions

    @IBAction func informationEntered(_ sender: Any) {
        //  only checks the user text box input because the tables contain valid data
        if let validText = userSeat.text {
            seatNumber = validText
        }
    }
    
    //  functions to turn the menus on and off
    
    //  user entering starting airport
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

    //  user entering destination airport
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

    //  user entering airline
    @IBAction func Airline_Clicked(_ sender: Any) {
        airlineTable.isHidden = false
        
        airportTable.isHidden = true
        destinationAirportTable.isHidden = true
    }

    @IBAction func Airline_notClicked(_ sender: Any) {
        airlineTable.isHidden = true
    }
    
    //  Private functions
    
    private func hideAllTables() {
        airportTable.isHidden = true
        destinationAirportTable.isHidden = true
        airlineTable.isHidden = true
        
        start_airportSearch.isHidden = false
        des_airportSearch.isHidden = false
        airlineSearch.isHidden = false
    }
    
    private func createLists() {
        //  sorts airport dictionary and
        //  places the keys(strings) into
        //  an array
        let sortedAirports = manager.Airports.sorted {
            $0.key < $1.key
        }
        for (name, _) in sortedAirports {
            airportList.append(name)
        }
        //  does the same for airlines
        let sortedAirlines = manager.Airlines.sorted {
            $0.key < $1.key
        }
        for (name, _) in sortedAirlines {
            airlineList.append(name)
        }
    }
    
    private func setUpTextImages() {
        let arrow = UIImageView(image: UIImage(systemName: "arrow.down.square"))
        arrow.tintColor = UIColor.lightGray
        let arrow2 = UIImageView(image: UIImage(systemName: "arrow.down.square"))
        arrow2.tintColor = UIColor.lightGray
        let arrow3 = UIImageView(image: UIImage(systemName: "arrow.down.square"))
        arrow3.tintColor = UIColor.lightGray
        start_airportSearch.rightView = arrow
        start_airportSearch.rightViewMode = .unlessEditing
        
        des_airportSearch.rightView = arrow2
        des_airportSearch.rightViewMode = .unlessEditing

        airlineSearch.rightView = arrow3
        airlineSearch.rightViewMode = .unlessEditing
        
    }
}
