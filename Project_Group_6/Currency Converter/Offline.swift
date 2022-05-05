//
//  Offline.swift
//  Project_Group_6
//
//  Created by Marco Gabriel on 4/3/22.
//

import UIKit

// MARK: Struct to save data

// This can be used for decoding and encoding.
struct sumthing: Codable {
    var currencyArray: [String]
    var fallBackExchangeRatesArray: [Double]

    init(cur currencyArray: [String], fall fallBackExchangeRatesArray: [Double]) {
        self.currencyArray = currencyArray
        self.fallBackExchangeRatesArray = fallBackExchangeRatesArray
    }

    // CodingKey protocols
    enum arrayKeys: CodingKey {
        case currencyRates
        case exchangeRates
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: arrayKeys.self)
        self.currencyArray = try valueContainer.decode([String].self, forKey: arrayKeys.currencyRates)
        self.fallBackExchangeRatesArray = try valueContainer.decode([Double].self, forKey: arrayKeys.exchangeRates)
    }

    func encode(to encoder: Encoder) throws {
        var valueContainer = encoder.container(keyedBy: arrayKeys.self)
        try valueContainer.encode(currencyArray, forKey: .currencyRates)
        try valueContainer.encode(fallBackExchangeRatesArray, forKey: .exchangeRates)
    }
}

// MARK: Class for OfflineConverter

class OfflineConverter: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: Outlets

    @IBOutlet var label: UILabel!
    @IBOutlet var amount: UITextField!
    @IBOutlet var picker: UIPickerView!

    // MARK: Properties

    // an array of strings with currency names
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
    // an array of the exchange rates
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
    var sumthingArray: sumthing!

    // current active value
    var active = 0.0

    // MARK: View did load

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.dataSource = self
        // updates the viewcontroller with the current amount
        amount.addTarget(self, action: #selector(updateViews), for: .editingChanged)
        // hides the back button
        navigationItem.hidesBackButton = true
        sumthingArray = sumthing(cur: currency, fall: fallBackExchangeRates)
        save_load_Array()
        // changes background color
        view.backgroundColor = .systemBlue
    }

    // MARK: Function

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

    // MARK: Saving Data

    func save_load_Array() {
        // saving data
        let arrayDocument = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = arrayDocument.appendingPathComponent("Array").appendingPathExtension("plist")

        let propertyListEncoder = PropertyListEncoder()
        let encodedCurrencylist = try? propertyListEncoder.encode(sumthingArray)
        try? encodedCurrencylist?.write(to: archiveURL, options: .noFileProtection)

        // loading data
        let propertyListDecoder = PropertyListDecoder()
        if let retriveArrays = try? Data(contentsOf: archiveURL),
           let decodedArrays = try?
           propertyListDecoder.decode(sumthing.self,
                                      from: retriveArrays)
        {
            print("it works \(decodedArrays.currencyArray) and this works \(decodedArrays.fallBackExchangeRatesArray)")
        }
    }
}
