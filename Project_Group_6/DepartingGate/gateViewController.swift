//
//  gateViewController.swift
//  Project_Group_6
//
//  Created by csuftitan on 3/9/22.
//

import UIKit

class gateViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var terminalImageView: UIImageView!

    @IBOutlet var gateArrival: UILabel!
    @IBOutlet var timeToGate: UILabel!
    
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!

    @IBAction func doneAction(_ sender: Any) {
        animateOut(desiredView: popupView)
        animateOut(desiredView: blurView)
    }
    
    let terminal = Destination()
    let airport = AirportManager()
    let airports = OtherAirportManager()

    var nameOfAirport = ""
    var nameOfAirline = ""
    var airlineFlightNumber = ""
    
    var airportName = ""
    var airlineName = ""
    var flightNumber = ""

    var airportCode = ""
    var terminalNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        flightNumber = airlineFlightNumber
        airlineName = nameOfAirline
        airportName = nameOfAirport
        debugPrint(flightNumber)
        debugPrint(airlineName)
        debugPrint(airportName)
        
        airportCode = airport.getCode(for: airportName)
        
        // Sets the background color.
        view.backgroundColor = .systemBlue
        
        updateUI()
        
        // Sets the size of the blur view to be equal to the size of the overall view.
        blurView.bounds = view.bounds
        
        // Set width = 90% of the screen and height = 30% of the screen.
        popupView.bounds = CGRect(x: 0, y: 0, width: view.bounds.width * 0.9, height: view.bounds.height * 0.3)
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
    
    // MARK: - Zoom in and out of the Terminal Map

    // This function allows for the terminal map to be zoomed in and out.
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return terminalImageView
    }

    // MARK: - Displaying the terminal map of the different airports.
    
    func updateUI() {
        navigationDisplayForLAX()
        navigationDisplayForXNA()
        navigationDisplayForJFK()
        navigationDisplayForHND()
        navigationDisplayForSFO()

        terminalMap()
    }
    
    // MARK: - Navigation Display For LAX
    
    func navigationDisplayForLAX() {
        if airportName == "Los Angeles International Airport" {
            navigationItem.prompt = "Airline Name: \(airlineName) / Flight Number: \(airlineFlightNumber) / Airline Code: \(airportCode)"
            if findingTerminalNumberAtLAX() == 1 {
                let gateNumber = terminal.validGateNumberForTerminal1AtLAX()
                navigationItem.title = "Gate \(gateNumber) in Terminal 1"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtLAX() == 2 {
                let gateNumber = terminal.validGateNumberForTerminal2AtLAX()
                navigationItem.title = "Gate \(gateNumber) in Terminal 2"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtLAX() == 3 {
                let gateNumber = terminal.validGateNumberForTerminal3AtLAX()
                navigationItem.title = "Gate \(gateNumber) in Terminal 3"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtLAX() == 4 {
                let gateNumber = terminal.validGateNumberForTerminal4AtLAX()
                navigationItem.title = "Gate \(gateNumber) in Terminal 4"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtLAX() == 5 {
                let gateNumber = terminal.validGateNumberForTerminal5AtLAX()
                navigationItem.title = "Gate \(gateNumber) in Terminal 5"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtLAX() == 6 {
                let gateNumber = terminal.validGateNumberForTerminal6AtLAX()
                navigationItem.title = "Gate \(gateNumber) in Terminal 6"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtLAX() == 7 {
                let gateNumber = terminal.validGateNumberForTerminal7and8AtLAX()
                navigationItem.title = "Gate \(gateNumber) in Terminal 7"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtLAX() == 8 {
                let gateNumber = terminal.validGateNumberForTerminalInternationalAtLAX()
                navigationItem.title = "Gate \(gateNumber) in Terminal Intl"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
        }
    }
    
    // MARK: - Navigation Display For XNA

    func navigationDisplayForXNA() {
        if airportName == "Northwest Arkansas National Airport" {
            navigationItem.prompt = "Airline Name: \(airlineName) / Flight Number: \(airlineFlightNumber) / Airline Code: \(airportCode)"
            if findingTerminalNumberAtXNA() == 1 {
                let gateNumber = terminal.validGateNumberForConcourseAAtXNA()
                navigationItem.title = "Gate \(gateNumber) in Terminal A"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtXNA() == 2 {
                let gateNumber = terminal.validGateNumberForConcourseBAtXNA()
                navigationItem.title = "Gate \(gateNumber) in Terminal B"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
        }
    }

    // MARK: - Navigation Display For JFK

    func navigationDisplayForJFK() {
        if airportName == "J.F.K International Airport" {
            navigationItem.prompt = "Airline Name: \(airlineName) / Flight Number: \(airlineFlightNumber) / Airline Code: \(airportCode)"
            if findingTerminalNumberAtJFK() == 1 {
                let gateNumber = terminal.validGateNumberForTerminal1AtJFK()
                navigationItem.title = "Gate \(gateNumber) in Terminal 1"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtJFK() == 2 {
                let gateNumber = terminal.validGateNumberForTerminal2AtJFK()
                navigationItem.title = "Gate \(gateNumber) in Terminal 2"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtJFK() == 3 {
                let gateNumber = terminal.validGateNumberForTerminal4AtJFK()
                navigationItem.title = "Gate \(gateNumber) in Terminal 4"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtJFK() == 4 {
                let gateNumber = terminal.validGateNumberForTerminal5AtJFK()
                navigationItem.title = "Gate \(gateNumber) in Terminal 5"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtJFK() == 5 {
                let gateNumber = terminal.validGateNumberForTerminal7AtJFK()
                navigationItem.title = "Gate \(gateNumber) in Terminal 7"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtJFK() == 6 {
                let gateNumber = terminal.validGateNumberForTerminal8AtJFK()
                navigationItem.title = "Gate \(gateNumber) in Terminal 8"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
        }
    }
    
    // MARK: - Navigation Display For HND
    
    func navigationDisplayForHND() {
        if airportName == "Haneda International Airport" {
            navigationItem.prompt = "Airline Name: \(airlineName) / Flight Number: \(airlineFlightNumber) / Airline Code: \(airportCode)"
            if findingTerminalNumberAtHND() == 1 {
                let gateNumber = terminal.validGateNumberForTerminal1AtHND()
                navigationItem.title = "Gate \(gateNumber) in Terminal 1"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtHND() == 2 {
                let gateNumber = terminal.validGateNumberForTerminal2AtHND()
                navigationItem.title = "Gate \(gateNumber) in Terminal 2"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtHND() == 3 {
                let gateNumber = terminal.validGateNumberForTerminalInternationalAtHND()
                navigationItem.title = "Gate \(gateNumber) in Terminal Intl"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
        }
    }
    
    // MARK: - Navigation Display For SFO
    
    func navigationDisplayForSFO() {
        if airportName == "San Francisco International Airport" {
            navigationItem.prompt = "Airline Name: \(airlineName) / Flight Number: \(airlineFlightNumber) / Airline Code: \(airportCode)"
            if findingTerminalNumberAtSFO() == 1 {
                let gateNumber = terminal.validGateNumberForTerminal1AtSFO()
                navigationItem.title = "Gate \(gateNumber) in Terminal 1"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtSFO() == 2 {
                let gateNumber = terminal.validGateNumberForTerminal2AtSFO()
                navigationItem.title = "Gate \(gateNumber) in Terminal 2"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtSFO() == 3 {
                let gateNumber = terminal.validGateNumberForTerminal3AtSFO()
                navigationItem.title = "Gate \(gateNumber) in Terminal 3"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
            if findingTerminalNumberAtSFO() == 4 {
                let gateNumber = terminal.validGateNumberForTerminalInternationalAtSFO()
                navigationItem.title = "Gate \(gateNumber) in Terminal Intl"
                animateIn(desiredView: blurView)
                animateIn(desiredView: popupView)
                gateArrival.text = "Estimated Time of Arrival to Gate \(gateNumber)"
                timeToGate.text = "\(terminal.randomTimeOfArrivalGenerator()) minutes from the security checkpoint to Gate \(gateNumber)"
            }
        }
    }

    // MARK: - Finding Terminal Number At LAX
    
    func findingTerminalNumberAtLAX() -> Int {
        if airportName == "Los Angeles International Airport" {
            if terminal.validAirlineWithTerminal1AtLAX(of: airlineName) == 1 {
                terminalNumber = 1
            }
            if terminal.validAirlineWithTerminal2AtLAX(of: airlineName) == 2 {
                terminalNumber = 2
            }
            if terminal.validAirlineWithTerminal3AtLAX(of: airlineName) == 3 {
                terminalNumber = 3
            }
            if terminal.validAirlineWithTerminal4AtLAX(of: airlineName) == 4 {
                terminalNumber = 4
            }
            if terminal.validAirlineWithTerminal5AtLAX(of: airlineName) == 5 {
                terminalNumber = 5
            }
            if terminal.validAirlineWithTerminal6AtLAX(of: airlineName) == 6 {
                terminalNumber = 6
            }
            if terminal.validAirlineWithTerminal7and8AtLAX(of: airlineName) == 7 {
                terminalNumber = 7
            }
            if terminal.validAirlineWithTerminalInternationalAtLAX(of: airlineName) == 8 {
                terminalNumber = 8
            }
        }
        return terminalNumber
    }
    
    // MARK: - Finding Terminal Number At XNA
    
    func findingTerminalNumberAtXNA() -> Int {
        if airportName == "Northwest Arkansas National Airport" {
            if terminal.validAirlineWithConcourseAAtXNA(of: airlineName) == 1 {
                terminalNumber = 1
            }
            if terminal.validAirlineWithConcourseBAtXNA(of: airlineName) == 2 {
                terminalNumber = 2
            }
        }
        return terminalNumber
    }
    
    // MARK: - Finding Terminal Number At JFK
    
    func findingTerminalNumberAtJFK() -> Int {
        if airportName == "J.F.K International Airport" {
            if terminal.validAirlineWithTerminal1AtJFK(of: airlineName) == 1 {
                terminalNumber = 1
            }
            if terminal.validAirlineWithTerminal2AtJFK(of: airlineName) == 2 {
                terminalNumber = 2
            }
            if terminal.validAirlineWithTerminal4AtJFK(of: airlineName) == 4 {
                terminalNumber = 3
            }
            if terminal.validAirlineWithTerminal5AtJFK(of: airlineName) == 5 {
                terminalNumber = 4
            }
            if terminal.validAirlineWithTerminal7AtJFK(of: airlineName) == 7 {
                terminalNumber = 5
            }
            if terminal.validAirlineWithTerminal8AtJFK(of: airlineName) == 8 {
                terminalNumber = 6
            }
        }
        return terminalNumber
    }
    
    // MARK: - Finding Terminal Number At HND
    
    func findingTerminalNumberAtHND() -> Int {
        if airportName == "Haneda International Airport" {
            if terminal.validAirlineWithTerminal1AtHND(of: airlineName) == 1 {
                terminalNumber = 1
            }
            if terminal.validAirlineWithTerminal2AtHND(of: airlineName) == 2 {
                terminalNumber = 2
            }
            if terminal.validAirlineWithTerminal3AtHND(of: airlineName) == 3 {
                terminalNumber = 3
            }
        }
        return terminalNumber
    }
    
    // MARK: - Finding Terminal Number At SFO
    
    func findingTerminalNumberAtSFO() -> Int {
        if airportName == "San Francisco International Airport" {
            if terminal.validAirlineWithTerminal1AtSFO(of: airlineName) == 1 {
                terminalNumber = 1
            }
            if terminal.validAirlineWithTerminal2AtSFO(of: airlineName) == 2 {
                terminalNumber = 2
            }
            if terminal.validAirlineWithTerminal3AtSFO(of: airlineName) == 3 {
                terminalNumber = 3
            }
            if terminal.validAirlineWithTerminalInternationalAtSFO(of: airlineName) == 4 {
                terminalNumber = 4
            }
        }
        debugPrint(terminalNumber)
        return terminalNumber
    }
    
    // MARK: - Finding Terminal Map
    
    func terminalMap() {
        if airportName == "Los Angeles International Airport" {
            terminalImageView.image = UIImage(named: airport.getMap(of: "Los Angeles International Airport", terminalNumber: findingTerminalNumberAtLAX()))
        }
        if airportName == "Northwest Arkansas National Airport" {
            terminalImageView.image = UIImage(named: airports.getMaps(of: "Northwest Arkansas National Airport", terminalNumber: findingTerminalNumberAtXNA()))
        }
        if airportName == "J.F.K International Airport" {
            terminalImageView.image = UIImage(named: airports.getMaps(of: "J.F.K International Airport", terminalNumber: findingTerminalNumberAtJFK()))
        }
        if airportName == "Haneda International Airport" {
            terminalImageView.image = UIImage(named: airports.getMaps(of: "Haneda International Airport", terminalNumber: findingTerminalNumberAtHND()))
        }
        if airportName == "San Francisco International Airport" {
            terminalImageView.image = UIImage(named: airports.getMaps(of: "San Francisco International Airport", terminalNumber: findingTerminalNumberAtSFO()))
        }
    }
}
