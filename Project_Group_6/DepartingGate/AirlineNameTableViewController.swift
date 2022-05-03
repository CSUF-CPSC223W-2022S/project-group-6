//
//  AirlineNameTableViewController.swift
//  Project_Group_6
//
//  Created by csuftitan on 3/23/22.
//

import UIKit

class AirlineNameTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet var searchBar: UISearchBar!

    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    
    @IBAction func doneAction(_ sender: Any) {
        animateOut(desiredView: popupView)
        animateOut(desiredView: blurView)
    }

    let airport = AirportManager()

    var selectedAirlineName: String = ""
    var isSearching = false

    var nameOfAirport = ""
    var airportName = ""

    // This stores the filtered airline names.
    var filteredAirlineNameData = [String]()

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
    
    // MARK: - All the Airline Code Names at LAX
    
    var airlineCodeListAtLAX: [String] = ["G4", "WN", "SY", "VB", "EI", "AM", "WS", "DL", "AA", "AC", "B6", "NK", "AS", "QX", "MW", "UA", "SU", "CA", "AF", "NZ", "TN", "NH", "G4", "OZ", "OS", "AV", "BA", "CX", "CI", "MU", "CZ", "CM", "LY", "EK", "EY", "BR", "FJ", "AY", "HU", "IB", "JL", "B6", "KL", "KE", "4M", "LO", "LH", "DY", "PR", "QF", "QR", "SV", "SK", "3U", "SQ", "SY", "LX", "TK", "VB", "VS", "Y4", "MF"]
    
    // MARK: - All the Airline Code Names at XNA
    
    var airlineCodeListAtXNA: [String] = ["MQ", "UA", "DL", "G4", "AA"]
    
    // MARK: - All the Airline Code Names at JFK
    
    var airlineCodeListAtJFK: [String] = ["SU", "CA", "AF", "OS", "MU", "BR", "4O", "JL", "KE", "LH", "DY", "PR", "SV", "LX", "TK", "VB", "Y4", "DL", "AM", "OZ", "CI", "CZ", "CM", "LY", "EK", "EY", "KL", "4M", "SQ", "VS", "WS", "MF", "EI", "HA", "B6", "AS", "NH", "BA", "IB", "LO", "UA", "AA", "CX", "AY", "QR"]
    
    // MARK: - All the Airline Code Names at HND
    
    var airlineCodeListAtHND: [String] = ["JL", "NH", "AC", "CA", "AF", "AA", "OZ", "BA", "CX", "CI", "MU", "CZ", "DL", "EK", "BR", "HU", "HA", "KE", "LH", "PR", "QF", "QR", "SQ", "UA"]
    
    // MARK: - All the Airline Code Names at SFO
    
    var airlineCodeListAtSFO: [String] = ["AA", "B6", "WN", "AS", "DL", "UA", "AM", "AF", "AS", "AV", "BA", "CX", "CI", "MU", "CZ", "CM", "LY", "EK", "BR", "AY", "HA", "IB", "JL", "KL", "KE", "PR", "QF", "QR", "SY", "VS", "WS", "EI", "AC", "CA", "NZ", "NH", "OZ", "FJ", "LH", "SQ", "TK"]

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        airportName = nameOfAirport
        // debugPrint(airportName)

        // Sets the background color.
        view.backgroundColor = .systemBlue

        // Sets the text field's text color and background color.
        let searchTextField = searchBar.searchTextField
        searchTextField.textColor = UIColor.white
        searchTextField.clearButtonMode = .never
        searchTextField.backgroundColor = UIColor.black
        
        // Sets the size of the blur view to be equal to the size of the overall view.
        blurView.bounds = view.bounds
        
        // Set width = 90% of the screen and height = 40% of the screen.
        popupView.bounds = CGRect(x: 0, y: 150, width: view.bounds.width * 0.9, height: view.bounds.height * 0.3)
    }
    
    // MARK: - Animates the Pop Up View
    
    // Animates in a specified view.
    func animateIn(desiredView: UIView) {
        let backgroundView = view!
        
        // Attach our desired view to the background view.
        backgroundView.addSubview(desiredView)
        
        // Sets the view's scaling to be 120%.
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        // Animates the effect.
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    // Animates out a specified view.
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }

    // MARK: - Table View Data Source

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

    // This function gets the user's selectedAirlineName.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            selectedAirlineName = filteredAirlineNameData[indexPath.row]
            view.tintColor = .gray
        } else {
            selectedAirlineName = getAirlineNames()[indexPath.row]
            view.tintColor = .gray
        }
        
        // Passes the selectedAirlineName and the airportName to the next view controller, but checks to see if the selectedAirlineName (airline code) is in the correct airport before moving on to the next screen.
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Flight") as? FlightNumberTableViewController {
            let airlineCode = airport.getAirlineCode(of: selectedAirlineName)
            if !airlineCodeListAtLAX.contains(airlineCode), airportName == "Los Angeles International Airport" {
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
            } else if !airlineCodeListAtXNA.contains(airlineCode), airportName == "Northwest Arkansas National Airport" {
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
            } else if !airlineCodeListAtJFK.contains(airlineCode), airportName == "J.F.K International Airport" {
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
            } else if !airlineCodeListAtHND.contains(airlineCode), airportName == "Haneda International Airport" {
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
            } else if !airlineCodeListAtSFO.contains(airlineCode), airportName == "San Francisco International Airport" {
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
            } else {
                vc.nameOfAirline = selectedAirlineName
                vc.nameofAirport = airportName
                navigationController?.pushViewController(vc, animated: true)
            }
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
    
    // This function is called when the user presses the "Cancel" button, which then resets the search bar and the table view.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
