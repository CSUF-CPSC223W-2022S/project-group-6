//
//  Offline.swift
//  Project_Group_6
//
//  Created by Marco Gabriel on 3/17/22.
//

import Foundation

// MARK: Private Classes

// private var exchangeRates : [CurrencyName : Double] = [:]
private enum CurrencyConverterLocalData {
    // MARK: Structs:

    enum Keys {
        static let mostRecentExchangeRates = "CurrencyConverterLocalData.Keys.mostRecentExchangeRates"
    }
    
    // MARK: Static Properties:

    // This will never be used once the method CustrrencyConverter.updateExchangeRates is called with internet access.
    // an emergency callback, in case the user doesn't have internet access the first time running the app.
    static let fallBackExchangeRates: [CurrencyName: Double] = [
        .USD: 1.1321,
        .JPY: 126.76,
        .BGN: 1.9558,
        .CZK: 25.623,
        .DKK: 7.4643,
        .GBP: 0.86290,
        .HUF: 321.90,
        .PLN: 4.2796,
        .RON: 4.7598,
        .SEK: 10.4788,
        .CHF: 1.1326,
        .ISK: 135.20,
        .NOK: 9.6020,
        .HRK: 7.4350,
        .RUB: 72.6133,
        .TRY: 6.5350,
        .AUD: 1.5771,
        .BRL: 4.3884,
        .CAD: 1.5082,
        .CNY: 7.5939,
        .HKD: 8.8788,
        .IDR: 15954.12,
        .ILS: 4.0389,
        .INR: 78.2915,
        .KRW: 1283.00,
        .MXN: 21.2360,
        .MYR: 4.6580,
        .NZD: 1.6748,
        .PHP: 58.553,
        .SGD: 1.5318,
        .THB: 35.955,
        .ZAR: 15.7631,
    ]
    
    // MARK: Static Methods:

    // Saves the most recent exchange rates by locally storing it. */
    static func saveMostRecentExchangeRates(_ exchangeRates: [CurrencyName: Double]) {
        let convertedExchangeRates = convertExchangeRatesForUserDefaults(exchangeRates)
        UserDefaults.standard.set(convertedExchangeRates, forKey: Keys.mostRecentExchangeRates)
    }
    
    // Loads the most recent exchange rates from the local storage. */
    static func loadMostRecentExchangeRates() -> [CurrencyName: Double] {
        if let userDefaultsExchangeRates = UserDefaults.standard.dictionary(forKey: Keys.mostRecentExchangeRates) as? [String: Double] {
            return convertExchangeRatesFromUserDefaults(userDefaultsExchangeRates)
        } else {
            // Fallback:
            return fallBackExchangeRates
        }
    }
    
    // MARK: Private Static Methods:
    
    // Converts the [String : Double] dictionary with the exchange rates to a [Currency : Double] dictionary
    private static func convertExchangeRatesFromUserDefaults(_ userDefaultsExchangeRates: [String: Double]) -> [CurrencyName: Double] {
        var exchangeRates: [CurrencyName: Double] = [:]
        for userDefaultExchangeRate in userDefaultsExchangeRates {
            if let currency = CurrencyName(rawValue: userDefaultExchangeRate.key) {
                exchangeRates.updateValue(userDefaultExchangeRate.value, forKey: currency)
            }
        }
        return exchangeRates
    }
    
    // Converts the [Currency : Double] dictionary with the exchange rates to a [String : Double] one so it can be stored locally.
    private static func convertExchangeRatesForUserDefaults(_ exchangeRates: [CurrencyName: Double]) -> [String: Double] {
        var userDefaultsExchangeRates: [String: Double] = [:]
        for exchangeRate in exchangeRates {
            userDefaultsExchangeRates.updateValue(exchangeRate.value, forKey: exchangeRate.key.rawValue)
        }
        return userDefaultsExchangeRates
    }
}
