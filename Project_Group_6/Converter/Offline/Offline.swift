//
//  Offline.swift
//  Project_Group_6
//
//  Created by Marco Gabriel on 4/3/22.
//

import UIKit

class OfflineConverter: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: Outlets
    @IBOutlet var label: UILabel!
    @IBOutlet var amount: UITextField!
    @IBOutlet var picker: UIPickerView!
    
    // MARK: Properties
    // an array of strings with currenyc names
    var currency: [String] = [
        "USD",
        "EUR",
        "JPY",
        "BGN",
        "CZK",
        "DKK",
        "GBP",
        "HUF",
        "PLN",
        "RON",
        "SEK",
        "CHF",
        "ISK",
        "NOK",
        "HRK",
        "RUB",
        "TRY",
        "AUD",
        "BRL",
        "CAD",
        "CNY",
        "HKD",
        "IDR",
        "ILS",
        "INR",
        "KRW",
        "MXN",
        "MYR",
        "NZD",
        "PHP",
        "SGD",
        "THB",
        "ZAR",
    ]
    // the dictionary of the values
    let fallBackExchangeRates: [Double] = [
        1.1321,
        1.11,
        126.76,
        1.9558,
        25.623,
        7.4643,
        0.86290,
        321.90,
        4.2796,
        4.7598,
        10.4788,
        1.1326,
        135.20,
        9.6020,
        7.4350,
        72.6133,
        6.5350,
        1.5771,
        4.3884,
        1.5082,
        7.5939,
        8.8788,
        15954.12,
        4.0389,
        78.2915,
        1283.00,
        21.2360,
        4.6580,
        1.6748,
        58.553,
        1.5318,
        35.955,
        15.7631,
    ]
    // active value
    var active = 0.0
    
    // MARK: View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let UIPicker: UIPickerView = UIPickerView()
        picker.delegate = self as UIPickerViewDelegate
        picker.dataSource = self as UIPickerViewDataSource
        amount.addTarget(self, action: #selector(updateViews), for: .editingChanged)
    }
    
    //MARK: Function
    @objc func updateViews(input: Double) {
        guard let textAmount = amount.text, let theAmount = Double(textAmount) else {
            return
        }
        if amount.text != "" {
            let total = theAmount * active
            label.text = String(format: "%.2f", total)
        }
    }
    
    // MARK: PickerView Function
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
     }
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currency.count
     }
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = currency[row]
        return row
     }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        active = fallBackExchangeRates[row]
        updateViews(input: active)
    }
}
