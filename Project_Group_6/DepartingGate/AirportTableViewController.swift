//
//  AirportTableViewController.swift
//  Project_Group_6
//
//  Created by csuftitan on 3/29/22.
//

import UIKit

class AirportTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet var searchBar: UISearchBar!

    // This function appends the list of airport names into a list.
    func getAirportName() -> [String] {
        var airportName: [String] = []
        airportName.append(contentsOf: [AirportManager().getAirportName(of: "HND")])
        airportName.append(contentsOf: [AirportManager().getAirportName(of: "JFK")])
        airportName.append(contentsOf: [AirportManager().getAirportName(of: "LAX")])
        airportName.append(contentsOf: [AirportManager().getAirportName(of: "SFO")])
        airportName.append(contentsOf: [AirportManager().getAirportName(of: "XNA")])
        return airportName
    }

    // This stores the filtered airport names.
    var filteredAirportData: [String]!

    var selectedAirport: String = ""

    var isSearching = false

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        filteredAirportData = getAirportName()

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
            return filteredAirportData.count
        } else {
            return getAirportName().count
        }
    }

    // This function will do the same thing as the previous function above, but it will return the airport names for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Airport")! as UITableViewCell
        if isSearching {
            cell.textLabel?.text = filteredAirportData[indexPath.row]
        } else {
            cell.textLabel?.text = getAirportName()[indexPath.row]
        }
        return cell
    }

    // This function gets the user's selectedAirport.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            selectedAirport = filteredAirportData[indexPath.row]
            view.tintColor = .gray
        } else {
            selectedAirport = getAirportName()[indexPath.row]
            view.tintColor = .gray
        }

        // Passes the selectedAirport to the next view controller.
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Airline") as? AirlineNameTableViewController {
            vc.nameOfAirport = selectedAirport
            navigationController?.pushViewController(vc, animated: true)
        }

        // This closes the keyboard when the user selects a cell.
        searchBar.searchTextField.endEditing(true)
    }

    // MARK: - Search Bar Configuration

    // This function is being called every time a change is made to the search bar and it detects if the text that is being typed in the search bar matches with an item that is in the list of airport names.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredAirportData = getAirportName().filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
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
