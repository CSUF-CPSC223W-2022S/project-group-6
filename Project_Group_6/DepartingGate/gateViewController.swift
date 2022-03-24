//
//  gateViewController.swift
//  Project_Group_6
//
//  Created by csuftitan on 3/9/22.
//

import UIKit

class gateViewController: UIViewController {
    @IBOutlet var terminalImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets the background color.
        view.backgroundColor = .systemBlue

        // updateUI()
    }

    // MARK: - Terminal Map

    let airport = AirportManager()

    func updateUI() {
        let terminalNumber = 1
        terminalImageView.image = UIImage(named: "Terminal \(airport.getMap(of: "Los Angeles International Airport", terminalNumber: terminalNumber))")
    }
}
