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
    var savedSeatMap: seatMap?
    var seatMapInstance: seatMap!
    //  OUTLETS
    @IBOutlet var userSeat: UITextField!
    
    @IBOutlet var start_searchBar: UISearchBar!
    @IBOutlet var des_searchBar: UISearchBar!
    @IBOutlet var airline_searchBar: UISearchBar!
    
    @IBOutlet var airportTable: UITableView!
    @IBOutlet var destinationAirportTable: UITableView!
    @IBOutlet var airlineTable: UITableView!
    
    @IBOutlet var loadButton: UIButton!
    @IBOutlet var savedInformation: UILabel!
    //  variables to store temporary information
    private var seatNumber: String = ""
    private var start: String = ""
    private var destination: String = ""
    private var airline: String = ""
    private var imageName: String = ""
    
    // private sorted arrays
    private var airportList = [String]()
    private var airlineList = [String]()
    private var searchedAirports = [String]()
    private var searchedAirlines = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  Attempts to load seatMap information hides the label in case it doesn't exits
        savedInformation.isHidden = true
        loadButton.isHidden = true
        loadInfomation()
        //  changes background color
        view.backgroundColor = .systemBlue
        //  createe the global tracker that will contain the seatMaps passed between controllers
        seatMapTracker = SeatMapTracker(name: "Created SeatMaps")
        //  creates sorted arrays and sets them in the beginning
        createLists()
        searchedAirlines = airlineList
        searchedAirports = airportList
        
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
        //  Continue button is pressed
        if segue.identifier == "informationEntered" {
            seatMapInstance = seatMap(yourSeatNumber: seatNumber, flyingFrom: start, to: destination, using: airline)
            imageName = getSeatMap(for: airline, of: seatMapInstance.planeSize)
            let map = seatMap(yourSeatNumber: seatNumber, flyingFrom: start, to: destination, using: airline, imageName)
            seatMapTracker.list.append(map)
        } else { //  Load Saved Image is pressed
            if let validMap = savedSeatMap {
                seatMapTracker.list.append(validMap)
            }
        }
        if let addSeatMap = segue.destination as? mapViewController {
            addSeatMap.seatMapTracker = seatMapTracker
        }
    }

    //  everytime the seatMapViewController is shown it tries to read data from a file to update the savedInformation
    override func viewWillAppear(_ animated: Bool) {
        loadInfomation()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //  determines the amount of cell the table should have
        if tableView.restorationIdentifier == "AirlineTable" {
            // return airline array count
            return searchedAirlines.count
        } else {
            // return airport array count
            return searchedAirports.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  creates / sets the data that will be presented in the table
        var cell = UITableViewCell()
        if tableView.restorationIdentifier == "STARTTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: startingAirportID) as UITableViewCell?)!
            cell.textLabel?.text = searchedAirports[indexPath.row]
        } else if tableView.restorationIdentifier == "ENDTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: destinationAirportID) as UITableViewCell?)!
            cell.textLabel?.text = searchedAirports[indexPath.row]
        } else if tableView.restorationIdentifier == "AirlineTable" {
            cell = (tableView.dequeueReusableCell(withIdentifier: airlineID) as UITableViewCell?)!
            cell.textLabel?.text = searchedAirlines[indexPath.row]
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  sets the variable to what the user selects from the table
        if tableView.restorationIdentifier == "STARTTable" {
            start = searchedAirports[indexPath.row]
            start_searchBar.text = start
            start_searchBar.searchTextField.endEditing(true)
        } else if tableView.restorationIdentifier == "ENDTable" {
            destination = searchedAirports[indexPath.row]
            des_searchBar.text = destination
            des_searchBar.searchTextField.endEditing(true)
        } else if tableView.restorationIdentifier == "AirlineTable" {
            airline = searchedAirlines[indexPath.row]
            airline_searchBar.text = airline
            airline_searchBar.searchTextField.endEditing(true)
        }
        //  after you select something, hide the tables to be able to click on other tables or buttons
        hideAllTables()
    }
    
    //  function is called when a searchBar is being edited
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.restorationIdentifier == startingAirportID {
            if searchText.isEmpty {
                searchedAirports = airportList
            } else {
                searchedAirports = airportList.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
            }
            airportTable.reloadData()
        } else if searchBar.restorationIdentifier == destinationAirportID {
            //  if the search bar is empty, use original airportList
            //  else use filtered data
            if searchText.isEmpty {
                searchedAirports = airportList
            } else {
                searchedAirports = airportList.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
            }
            destinationAirportTable.reloadData()
        } else if searchBar.restorationIdentifier == airlineID {
            if searchText.isEmpty {
                searchedAirlines = airlineList
            } else {
                searchedAirlines = airlineList.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
            }
            airlineTable.reloadData()
        }
    }

    //  called when you hit the cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.restorationIdentifier == startingAirportID {
            searchBar.text = ""
            start = ""
            airportTable.reloadData()
        } else if searchBar.restorationIdentifier == destinationAirportID {
            searchBar.text = ""
            destination = ""
            destinationAirportTable.reloadData()
            
        } else if searchBar.restorationIdentifier == airlineID {
            searchBar.text = ""
            airline = ""
            airlineTable.reloadData()
        }
        seatNumber = ""
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

    //  Reads from a file and tries to saved it into an optional seatMap variable
    private func loadInfomation() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("SeatMaps").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedData = try? Data(contentsOf: archiveURL), let decodedSeatMap = try? propertyListDecoder.decode(seatMap.self, from: retrievedData) {
            savedSeatMap = decodedSeatMap
            savedInformation.text = "Seat Number: \(savedSeatMap!.seatNumber)\nStarting Airport: \(savedSeatMap!.starting)\nDestination Airport: \(savedSeatMap!.destination)\nAirline: \(savedSeatMap!.airline)"
            imageName = decodedSeatMap.imageName
            savedInformation.isHidden = false
            loadButton.isHidden = false
        }
    }

    //  had to copy the load function to this test verison because the UIbutton/UIlabel in the other loadInformation causes issues for the test
    func testloadInfomation() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("SeatMaps").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedData = try? Data(contentsOf: archiveURL), let decodedSeatMap = try? propertyListDecoder.decode(seatMap.self, from: retrievedData) {
            savedSeatMap = decodedSeatMap
            imageName = decodedSeatMap.imageName
        }
    }
}
