//
//  ViewController.swift
//  MyCoin
//
//  Created by Alexandre Robaert on 09/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var manager = BiscointManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
    }
    @IBAction func updatePressed(_ sender: UIButton) {
        manager.fetchQuote()
        indicator.isHidden = false
    }
}

extension HomeViewController: BiscointManagerDelegate {
    func fetchCrypto(_ biscointManager: BiscointManager, biscointModel model: BiscointModel) {
        DispatchQueue.main.sync {
            valueLabel.text = "R$ \(model.valor)"
            self.indicator.isHidden = true
        }
    }
}
