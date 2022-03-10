//
//  departingViewController.swift
//  Project_Group_6
//
//  Created by csuftitan on 3/9/22.
//

import UIKit

class departingViewController: UIViewController {
    @IBOutlet var terminalImageView: UIImageView!
    let airport = AirportManager()

    func updateUI() {
        let terminalNumber = 1
        terminalImageView.image = UIImage(named: "Terminal \(airport.getMap(of: "Los Angeles International Airport", terminalNumber: terminalNumber))")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
