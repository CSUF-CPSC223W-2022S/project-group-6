//
//  FlightNumberTableViewController.swift
//  Project_Group_6
//
//  Created by csuftitan on 3/23/22.
//

import UIKit

class FlightNumberTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet var searchBar: UISearchBar!
    
    var flightNumber = AirportManager().flightNumbers(from: "Los Angeles International Airport")
    
    // This stores the filtered flight numbers.
    var filteredFlightNumberData: [String]!
    
    var selectedFlightNumber: String = ""
    
    var isSearching = false
    
    var nameOfAirline = ""
    var nameofAirport = ""
    
    var airlineName = ""
    var airportName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        filteredFlightNumberData = flightNumber

        airlineName = nameOfAirline
        airportName = nameofAirport
        // debugPrint(airlineName)
        // debugPrint(airportName)
        
        // Sets the background color.
        view.backgroundColor = .systemBlue
        
        // Sets the text field's text color and background color.
        let searchTextField = searchBar.searchTextField
        searchTextField.textColor = UIColor.white
        searchTextField.clearButtonMode = .never
        searchTextField.backgroundColor = UIColor.black
    }
    
    // MARK: - Table View Data Source
    
    // This function will return the number of items from the search results when it is true, otherwise it will return all of the items.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredFlightNumberData.count
        } else {
            return flightNumber.count
        }
    }

    // This function will do the same thing as the previous function above, but it will return the flight numbers for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flight")! as UITableViewCell
        if isSearching {
            cell.textLabel?.text = filteredFlightNumberData[indexPath.row]
        } else {
            cell.textLabel?.text = flightNumber[indexPath.row]
        }
        return cell
    }

    // This function gets the user's selectedFlightNumber.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            selectedFlightNumber = filteredFlightNumberData[indexPath.row]
            view.tintColor = .gray
        } else {
            selectedFlightNumber = flightNumber[indexPath.row]
            view.tintColor = .gray
        }
        
        // Passes the selectedAirport, the airportName, and the airlineName to the next view controller.
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Terminal") as? gateViewController {
            vc.airlineFlightNumber = selectedFlightNumber
            vc.nameOfAirport = airportName
            vc.nameOfAirline = airlineName
            navigationController?.pushViewController(vc, animated: true)
        }
        
        // This closes the keyboard when the user selects a cell.
        searchBar.searchTextField.endEditing(true)
    }

    // MARK: - Search Bar Configuration

    // This function is being called every time a change is made to the search bar and it detects if the text that is being typed in the search bar matches with an item that is in the list of flight numbers.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredFlightNumberData = flightNumber.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
        isSearching = true
        tableView.reloadData()
    }
    
    // This function is called when the user presses the "Cancel" button, which then resets the search bar and the table view.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
