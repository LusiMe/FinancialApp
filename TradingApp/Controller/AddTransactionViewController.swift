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
    @IBOutlet weak var button: UIButton!
    
    var inEdit = Bool()
    var editId = String()
    var editCompany = String()
    var editAmount = String()
    var editDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !editDate.isEmpty {
            self.button.titleLabel?.text = "Update"
            presentEditableDetails()
        }
    }
    
    @IBAction func addTransactionClicked(_ sender: Any) {
        addTransaction()
        //present success message to user
    }
    
    private func addTransaction() {
        if companyNameInput.text != nil, amoundInput.text != nil {
            let date = "\(datePicker.date)"
            let companyName = companyNameInput.text!
            let transactionAmound = Int(amoundInput.text!)!
            if inEdit {
                FirebaseCommunication.sharedInstance.updateTransaction(id: editId, amount: transactionAmound, company: companyName, date: date)
            } else {
            FirebaseCommunication.sharedInstance.postTransaction(amount: transactionAmound, company: companyName, date: date)
        }
        }
    }
    
    private func presentEditableDetails () {
        inEdit = true
        self.amoundInput.text = editAmount
        self.companyNameInput.text = editCompany
//        self.datePicker.date = Date(editDate)
    }
    
}
