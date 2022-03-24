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
    
    var filteredFlightNumberData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        filteredFlightNumberData = flightNumber
        
        // Sets the background color.
        view.backgroundColor = .systemBlue
        
        // Sets the text field's text color and background color.
        let searchTextField = searchBar.searchTextField
        searchTextField.textColor = UIColor.white
        searchTextField.clearButtonMode = .never
        searchTextField.backgroundColor = UIColor.black
    }

    // MARK: - Table view data source

    // This is only going to have one section of items inside of the table view.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // The number of rows are equal to the amount of data inside of the filteredFlightNumberData.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFlightNumberData.count
    }
    
    // This function tells the computer what I want to show as each of my cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flight")! as UITableViewCell
        cell.textLabel?.text = filteredFlightNumberData[indexPath.row]
        return cell
    }
    
    // This function gets the user's selectedFlightNumber and prints the flight number.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFlightNumber = flightNumber[indexPath.row]
        print(selectedFlightNumber)
        // This closes the keyboard when the user selects a cell.
        searchBar.searchTextField.endEditing(true)
    }
    
    // MARK: - Search Bar Configuration
    
    // Whenever the text inside of the search bar changes, run the code inside of the function.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredFlightNumberData = []
        if searchText == "" {
            filteredFlightNumberData = flightNumber
        } else {
            for flight in flightNumber {
                if flight.lowercased().contains(searchText.lowercased()) {
                    filteredFlightNumberData.append(flight)
                }
            }
        }
        tableView.reloadData()
    }
    
    // This function is used when the user pressed the "Cancel" button.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        tableView.reloadData()
    }
}
