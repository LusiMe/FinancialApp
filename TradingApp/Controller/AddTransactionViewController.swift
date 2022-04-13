//
//  AddTransactionViewController.swift
//  TradingApp
//
//  Created by Mark Parfenov on 10/04/2022.
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
        let date = "\(datePicker.date)"
        if companyNameInput.text != nil, amoundInput.text != nil {
            let companyName = companyNameInput.text!
        let transactionAmound = amoundInput.text!
        ServerCommunication.sharedInstance.postCall(date: date, company: companyName, amound: transactionAmound)
        }
    }

}
