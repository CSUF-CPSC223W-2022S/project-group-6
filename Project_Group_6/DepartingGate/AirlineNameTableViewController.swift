//
//  AirlineNameTableViewController.swift
//  Project_Group_6
//
//  Created by csuftitan on 3/23/22.
//

import UIKit

class AirlineNameTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet var searchBar: UISearchBar!

    let airport = AirportManager()

    var selectedAirlineName: String = ""

    // This function is storing the selected airline name.
    func getSelectedAirlineName() -> String {
        return selectedAirlineName
    }

    var filteredAirlineNameData = [String]()

    var isSearching = false

    // This function sorts through the list of airline names and arranges them in alphabetical order.
    func getAirlineNames() -> [String] {
        let sorted = airport.Airlines.sorted {
            $0.key < $1.key
        }
        var list: [String] = []
        for (name, _) in sorted {
            list.append(name)
        }
        return list
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self

        // Sets the background color.
        view.backgroundColor = .systemBlue

        // Sets the text field's text color and background color.
        let searchTextField = searchBar.searchTextField
        searchTextField.textColor = UIColor.white
        searchTextField.clearButtonMode = .never
        searchTextField.backgroundColor = UIColor.black
    }

    // MARK: - Table view data source

    // This function will return the number of items from the search results when it is true, otherwise it will return all of the items.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredAirlineNameData.count
        } else {
            return getAirlineNames().count
        }
    }

    // This function will do the same thing as the previous function above, but it will return the airline names for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Airline")! as UITableViewCell
        if isSearching {
            cell.textLabel?.text = filteredAirlineNameData[indexPath.row]
        } else {
            cell.textLabel?.text = getAirlineNames()[indexPath.row]
        }
        return cell
    }

    // This function gets the user's selectedAirlineName and prints the airline name.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            selectedAirlineName = filteredAirlineNameData[indexPath.row]
            print(selectedAirlineName)
        } else {
            selectedAirlineName = getAirlineNames()[indexPath.row]
            print(selectedAirlineName)
        }
        // This closes the keyboard when the user selects a cell.
        searchBar.searchTextField.endEditing(true)
    }

    // MARK: - Search Bar Configuration

    // This function is being called every time a change is made to the search bar and it detects if the text that is being typed in the search bar matches with an item that is in the list of airline names.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredAirlineNameData = getAirlineNames().filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
        isSearching = true
        tableView.reloadData()
    }

    // This function is used when the user pressed the "Cancel" button.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
