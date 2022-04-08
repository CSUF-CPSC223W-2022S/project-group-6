//
//  seatViewController.swift
//  Project_Group_6
//
//  Created by Diego on 3/9/22.
//

import UIKit

class seatViewController: UIViewController,
    UITableViewDataSource,
    UITableViewDelegate,
    UISearchBarDelegate
{
    let manager = AirportManager()
    //  Outlet IDs
    let startingAirportID = "start_Airports"
    let destinationAirportID = "des_Airports"
    let airlineID = "Airlines"
    //  tracks seat map information across different view controllers
    var seatMapTracker: SeatMapTracker!
    //  OUTLETS
    @IBOutlet var userSeat: UITextField!
    
    @IBOutlet var start_searchBar: UISearchBar!
    @IBOutlet var des_searchBar: UISearchBar!
    @IBOutlet var airline_searchBar: UISearchBar!
    
    @IBOutlet var airportTable: UITableView!
    @IBOutlet var destinationAirportTable: UITableView!
    @IBOutlet var airlineTable: UITableView!
    
    //  variables to store temporary information
    private var seatNumber: String = ""
    private var start: String = ""
    private var destination: String = ""
    private var airline: String = ""
    
    private var startIsSearching: Bool = false
    private var desIsSearching: Bool = false
    private var airlineIsSearching: Bool = false
    
    // private sorted arrays
    private var airportList = [String]()
    private var airlineList = [String]()
    private var searchedData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatMapTracker = SeatMapTracker(name: "Created SeatMaps")
        createLists()
        
        // set up search bars
        start_searchBar.delegate = self
        des_searchBar.delegate = self
        airline_searchBar.delegate = self
        
        // Setting up all of the tables
        airportTable.register(UITableViewCell.self, forCellReuseIdentifier: startingAirportID)
        airportTable.delegate = self
        airportTable.dataSource = self
        airportTable.isHidden = true
        
        destinationAirportTable.register(UITableViewCell.self, forCellReuseIdentifier: destinationAirportID)
        destinationAirportTable.delegate = self
        destinationAirportTable.dataSource = self
        destinationAirportTable.isHidden = true
        
        airlineTable.register(UITableViewCell.self, forCellReuseIdentifier: airlineID)
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
            if airlineIsSearching { return searchedData.count }
            else {
                return airlineList.count
            }
        } else {
            // return airport array count
            if startIsSearching { return searchedData.count }
            else if desIsSearching { return searchedData.count }
            else {
                return airportList.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if tableView.restorationIdentifier == "STARTTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: startingAirportID) as UITableViewCell?)!
            if startIsSearching {
                cell.textLabel?.text = searchedData[indexPath.row]
            } else {
                cell.textLabel?.text = airportList[indexPath.row]
            }
        } else if tableView.restorationIdentifier == "ENDTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: destinationAirportID) as UITableViewCell?)!
            if desIsSearching {
                cell.textLabel?.text = searchedData[indexPath.row]
            } else {
                cell.textLabel?.text = airportList[indexPath.row]
            }
        } else if tableView.restorationIdentifier == "AirlineTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: airlineID) as UITableViewCell?)!
            if airlineIsSearching {
                cell.textLabel?.text = searchedData[indexPath.row]
            } else {
                cell.textLabel?.text = airlineList[indexPath.row]
            }
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.restorationIdentifier == "STARTTable" {
            if startIsSearching {
                start = searchedData[indexPath.row]
            } else {
                start = airportList[indexPath.row]
            }
            start_searchBar.text = start
            start_searchBar.searchTextField.endEditing(true)
        } else if tableView.restorationIdentifier == "ENDTable" {
            if desIsSearching {
                destination = searchedData[indexPath.row]
            } else {
                destination = airportList[indexPath.row]
            }
            des_searchBar.text = destination
            des_searchBar.searchTextField.endEditing(true)
        } else if tableView.restorationIdentifier == "AirlineTable" {
            if airlineIsSearching {
                airline = searchedData[indexPath.row]
            } else {
                airline = airlineList[indexPath.row]
            }
            airline_searchBar.text = airline
            airline_searchBar.searchTextField.endEditing(true)
        }
        hideAllTables()
    }
    
    //  function is called when a searchBar is being edited
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.restorationIdentifier == startingAirportID {
            searchedData = airportList.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
            startIsSearching = true
            airportTable.reloadData()
        } else if searchBar.restorationIdentifier == destinationAirportID {
            searchedData = airportList.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
            desIsSearching = true
            destinationAirportTable.reloadData()
            
        } else if searchBar.restorationIdentifier == airlineID {
            searchedData = airlineList.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
            airlineIsSearching = true
            airlineTable.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.restorationIdentifier == startingAirportID {
            searchBar.text = ""
            startIsSearching = false
            airportTable.reloadData()
        } else if searchBar.restorationIdentifier == destinationAirportID {
            searchBar.text = ""
            desIsSearching = false
            destinationAirportTable.reloadData()
            
        } else if searchBar.restorationIdentifier == airlineID {
            searchBar.text = ""
            airlineIsSearching = false
            airlineTable.reloadData()
        }
        hideAllTables()
    }
    
    //  called when the user first clicks onto any search bar
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar.restorationIdentifier == startingAirportID {
            airportTable.isHidden = false
            des_searchBar.isHidden = true
            airline_searchBar.isHidden = true
            
            destinationAirportTable.isHidden = true
            airlineTable.isHidden = true
        } else if searchBar.restorationIdentifier == destinationAirportID {
            destinationAirportTable.isHidden = false
            airline_searchBar.isHidden = true
            
            airportTable.isHidden = true
            airlineTable.isHidden = true
            
        } else if searchBar.restorationIdentifier == airlineID {
            airlineTable.isHidden = false
            
            airportTable.isHidden = true
            destinationAirportTable.isHidden = true
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        hideAllTables()
    }

    // ACTIONS Functions

    @IBAction func informationEntered(_ sender: Any) {
        //  only checks the user text box input because the tables contain valid data
        if let validText = userSeat.text {
            seatNumber = validText
        }
    }
    
    //  Private functions
    
    private func hideAllTables() {
        airportTable.isHidden = true
        destinationAirportTable.isHidden = true
        airlineTable.isHidden = true
        
        start_searchBar.isHidden = false
        des_searchBar.isHidden = false
        airline_searchBar.isHidden = false
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
}
