//
//  BalanceModel.swift
//  TradingApp
//
//  Created by Mark Parfenov on 06/04/2022.
//

import FirebaseFirestore
import Firebase

struct BalanceModel: Codable {
    let currency: String
    let amount: Int
    
    var dictionary: [String: Any] {
        return [
            "currency": currency,
            "commentDescription": amount
        ]
    }

init(snapshot: DocumentSnapshot) {
    let snapshotValue = snapshot.data()
    currency =  snapshotValue?["currency"] as! String
    amount = snapshotValue?["amount"] as! Int
  }
}
