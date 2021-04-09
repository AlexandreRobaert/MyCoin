//
//  BiscointData.swift
//  MyCoin
//
//  Created by Alexandre Robaert on 09/04/21.
//

import Foundation

// MARK: - BiscointData
struct BiscointData: Codable {
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let base, quote: String
    let vol, low, high, last: Double
    let ask: Double
    let askQuoteAmountRef: Int
    let askBaseAmountRef, bid: Double
    let bidQuoteAmountRef: Int
    let bidBaseAmountRef: Double
    let timestamp: String
}
