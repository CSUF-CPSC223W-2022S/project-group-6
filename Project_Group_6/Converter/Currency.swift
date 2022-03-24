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
    var active = 0.0
    
    // MARK: - IBOutlets

    @IBOutlet var label: UILabel!
    
    @IBOutlet var amount: UITextField!
    
    @IBOutlet var pickerView: UIPickerView!
    
    // MARK: - ViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        fetchJSON()
        amount.addTarget(self, action: #selector(updateViews), for: .editingChanged)
    }
    
    // MARK: - PickerView Code

    @objc func updateViews(input: Double) {
        guard let textAmount = amount.text, let theAmount = Double(textAmount) else {
            return
        }
        if amount.text != "" {
            let total = theAmount * active
            label.text = String(format: "%.2f", total)
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
         guard let url = URL(string: Constants.API) else {
             return
         }
         URLSession.shared.dataTask(with: url) { data, response, error in
             // handle errors
             if error != nil {
                 print(error!)
                 return
             }
            
             // safely unwrap all the data
             guard let safeData = data else { return }
            
             // decode the JSON Data
             do {
                 let results = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                 self.currency.append(contentsOf: results.rates.keys)
                 self.value.append(contentsOf: results.rates.values)
                 print(results.rates)
             } catch {
                 print(error)
             }
         }.resume()
     }
}
