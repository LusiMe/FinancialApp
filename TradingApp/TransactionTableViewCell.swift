//
//  TransactionTableViewCell.swift
//  TradingApp
//
//  Created by Mark Parfenov on 19/04/2022.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var editCompanyName: UITextField!
    @IBOutlet weak var editAmount: UITextField!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
