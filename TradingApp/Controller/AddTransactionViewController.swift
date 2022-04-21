//
//  AddTransactionViewController.swift
//  TradingApp
//
//  Created by Luda Parfenova on 10/04/2022.
//

import UIKit

class AddTransactionViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var companyNameInput: UITextField!
    @IBOutlet weak var amoundInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addTransactionClicked(_ sender: Any) {
        addTransaction()
        //present success message
    }
    private func addTransaction() {
        
        if companyNameInput.text != nil, amoundInput.text != nil {
            let date = "\(datePicker.date)"
            let companyName = companyNameInput.text!
            let transactionAmound = Int(amoundInput.text!)!
            FirebaseCommunication.sharedInstance.postTransaction(amount: transactionAmound, company: companyName, date: date)
        }
    }
    
}
