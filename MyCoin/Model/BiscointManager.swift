//
//  BiscointManager.swift
//  MyCoin
//
//  Created by Alexandre Robaert on 09/04/21.
//

//API Key
//73277baa158a92d0572f2621401e8e57b239bdc7b22b3e5c3cf393d7138df4e2
//
//API Secret
//ffa159125472b237440002bc58cc979772a2234fba42a1b70b2cc415955a2848

import Foundation

protocol BiscointManagerDelegate {
    func fetchCrypto(_ biscointManager: BiscointManager, biscointModel model: BiscointModel)
}

struct BiscointManager {
    private var urlBase = "https://api.biscoint.io/v1/ticker?base=BTC&quote=BRL"
    
    var delegate: BiscointManagerDelegate?
    
    public func fetchQuote(){
        let session = URLSession(configuration: .default)
        let url = URL(string: urlBase)!
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let selfData = data {
                if let model = parseJSON(selfData){
                    self.delegate?.fetchCrypto(self, biscointModel: model)
                }
            }
            
        }
        task.resume()
    }
    
    private func parseJSON(_ data: Data) -> BiscointModel? {
        do {
            let biscointData = try JSONDecoder().decode(BiscointData.self, from: data)
            let moeda = biscointData.data.base == Moeda.btc.rawValue ? Moeda.btc : Moeda.etc
            return BiscointModel(valor: biscointData.data.last, moeda: moeda)
        }catch{
            print(error)
            return nil
        }
    }
}
