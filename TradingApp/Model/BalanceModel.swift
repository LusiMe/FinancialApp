//
//  BalanceModel.swift
//  TradingApp
//
//  Created by Luda Parfenova on 06/04/2022.
//

import FirebaseFirestore
import Firebase

struct BalanceModel: Codable {
    let currency: String
    let amount: Int

init(snapshot: DocumentSnapshot) {
    let snapshotValue = snapshot.data()
    currency =  snapshotValue?["currency"] as! String
    amount = snapshotValue?["amount"] as! Int
  }
}
