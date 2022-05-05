//
//  currency.swift
//  Project_Group_6
//
//  Created by Marco Gabriel on 2/17/22.
//
import UIKit

class Currency: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - Properties
    
    // array for the name of the currency code
    var currency: [String] = []
    // the values of the currency
    var value: [Double] = []
    // the current active value
    var active = 0.0
    
    // MARK: - IBOutlets Curency

    @IBOutlet var label: UILabel!
    
    @IBOutlet var amount: UITextField!
    
    @IBOutlet var pickerView: UIPickerView!
    
    // MARK: - ViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // changes the amount displayed in the view controller
        amount.addTarget(self, action: #selector(updateViews), for: .editingChanged)
        // changes background color
        view.backgroundColor = .systemBlue
    }

    override func viewWillAppear(_ animated: Bool) {
        // shows the no-internet connection pop up
        showAlert()
        // calls the fetechJSON function
        fetchJSON()
    }
    
    // MARK: - PickerView Code
    
    @objc func updateViews(input: Double) {
        // guard statement that checks if textAmount is equal to amount.text
        // and if theAmount is equal to Double(textAmount)
        // else just return
        // or just go to the next statement
        guard let textAmount = amount.text, let theAmount = Double(textAmount) else {
            return
        }
        // checks if the amount.text is not equal to an empty string
        if amount.text != "" {
            // sets the total to be theAmount * the active number
            let total = theAmount * active
            // updates the view controller to see the label
            label.text = String(format: "$ %.2f", total)
        }
    }
       
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currency.count
    }
       
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currency[row]
    }
       
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        active = value[row]
        updateViews(input: active)
    }
       
    // MARK: - JSON Method to get the rates data

    func fetchJSON() {
        // guard statement if the api is not working to just return
        // else go on to the next statement
        guard let url = URL(string: Constants.API) else {
            return
        }
        // gets the API data from the internet
        URLSession.shared.dataTask(with: url) { data, _, error in
            // handls the error case if not able to retrieve the API
            // else just returns
            if error != nil {
                print(error!)
                return
            }
            
            // safely unwrap all the data
            guard let safeData = data else { return }
            do {
                // decodes the JSON Data
                let results = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                // adds the rates.keys to currency
                self.currency.append(contentsOf: results.rates.keys)
                // adds the rates,values to value
                self.value.append(contentsOf: results.rates.values)
                // prints out the results of rates
                print(results.rates)
            } catch {
                print(error)
            }
            // resumes the task if it is suspended
        }.resume()
    }
    
    // MARK: Testing Connection

    func showAlert() {
        // checks if the internet is not available
        if !isInternetAvailable() {
            let alert = UIAlertController(title: "Warning", message: "The Internet is not available", preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss", style: .default, handler: {
                _ in
                
                // will change the view controller when "Dismess" is pressed
                let view = self.storyboard!.instantiateViewController(withIdentifier: "something")
                // Handling the Offline button
                self.navigationController!.pushViewController(view, animated: true)
                
            })
            
            alert.addAction(action)
            // Show the alert message in the view controller
            present(alert, animated: true)
        }
    }
}
