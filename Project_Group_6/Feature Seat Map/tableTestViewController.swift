//
//  tableTestViewController.swift
//  Project_Group_6
//
//  Created by diego on 3/26/22.
//

import UIKit

class tableTestViewController: UIViewController,
    UITableViewDelegate,
    UITableViewDataSource {
    @IBOutlet var airportSearch: UITextField!
    @IBOutlet var airportTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Airports", for: indexPath)
           
           // Configure the cell’s contents.
           cell.textLabel!.text = "Cell text"
               
           return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        airportTable.isHidden = true
    }
    
    // MARK: - Navigation
     
    @IBAction func onClicked(_ sender: Any) {
        airportTable.isHidden = false
    }
    
}
