//
//  ViewController.swift
//  TradingApp
//
//  Created by Luda Parfenova on 03/04/2022.
//

import UIKit
import Firebase

class BalanceViewController: UIViewController {

    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseCommunication.sharedInstance.getBalance(completion: completion)
    }

    func completion(result: BalanceModel) {
        DispatchQueue.main.async {
            self.balanceLabel.text = "\(result.amount)" + " " + result.currency
        }
        
    }
}

