//
//  BiscointModel.swift
//  MyCoin
//
//  Created by Alexandre Robaert on 09/04/21.
//

import Foundation

enum Moeda: String {
    case btc = "BitCoin"
    case etc = "Etherium"
}

struct BiscointModel {
    var valor: Double
    var moeda: Moeda
}
