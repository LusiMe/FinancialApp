//
//  TransactiomModel.swift
//  TradingApp
//
//  Created by Luda Parfenova on 19/04/2022.
//

import FirebaseFirestore
import Firebase

struct TransactionModel: Codable {
    let company, date: String
    let amount: Int

init(snapshot: [String: Any]) {
    company =  snapshot["company"] as! String
    amount = snapshot["amount"] as! Int
    date = snapshot["date"] as! String
  }
}

