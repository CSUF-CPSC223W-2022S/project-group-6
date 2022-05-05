//
//  ExchangeRates.swift
//  Project_Group_6
//
//  Created by Marco Gabriel on 3/6/22.
//
import Foundation

// codable to later be used to decode the api's data
struct ExchangeRates: Codable {
    // a dictionary that holds the rates
    let rates: [String: Double]
}
