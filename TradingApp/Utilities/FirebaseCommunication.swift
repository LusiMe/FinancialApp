//
//  FirebaseCommunication.swift
//  TradingApp
//
//  Created by Luda Parfenova on 12/04/2022.
//

import Foundation
import Firebase

class FirebaseCommunication {
    
    public static let sharedInstance = FirebaseCommunication()
    
    public func getBalance(completion: @escaping(BalanceModel) -> Void) {
        let docRef = db.collection("finance").document("balance")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = BalanceModel(snapshot: document )
                completion(data)
            } else {
                print("Document does not exist")
            }
        }
    }
    
    public func getTransactions(completion: @escaping([TransactionModel]) -> Void) {
        let docRef = db.collection("finance").document("transaction")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let transactions = document.data()!["transaction"] as! [String: Any]
                let data = transactions.map{ TransactionModel(snapshot: $0.value as! [String : Any]) }
                completion(data)
            } else {
                print("Document does not exist")
            }
        }
    }
    
    public func postTransaction(amount: Int, company: String, date: String) {
        let id = UUID().uuidString
        print("id", id)
        let docRef = db.collection("finance").document("transaction").setData(["transaction": [
            "id"+"\(id)": [
                "amount": amount,
                "company": company,
                "date": date,
                "id": id
        ]]],
        merge: true)
        { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written")
            }
        }
           }
}
