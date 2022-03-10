//
//  currency.swift
//  Project_Group_6
//
//  Created by Marco Gabriel on 2/17/22.
//

import UIKit

class Currency{
    //MARK: - Properties
    // array for the name of the currency code
    var currency: [String] = []
    // the values of the currency
    var value: [Double] = []
    var active = 0.0
    
    // MARK: - Method to get the rates data
    func fetchJSON() {
        guard let url = URL(string: "https://open.er-api.com/v6/latest/USD") else {
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
