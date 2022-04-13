//
//  FirebaseCommunication.swift
//  TradingApp
//
//  Created by Mark Parfenov on 12/04/2022.
//

import Foundation
import Firebase

class FirebaseCommunication {
    
    public static let sharedInstance = FirebaseCommunication()
    
    
   public func getBalance(completion: @escaping(BalanceModel) -> Void) {
    let docRef = db.collection("finance").document("balance")

    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Document data: \(dataDescription)")
            let data = BalanceModel(snapshot: document as! DocumentSnapshot)
            completion(data)
        } else {
            print("Document does not exist")
        }
    }
}
}
