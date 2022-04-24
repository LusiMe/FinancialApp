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
    
    private let balanceRef = db.collection("finance").document("balance")
    
    private let transactionsRef = db.collection("finance").document("transaction")
    
    public func getBalance(completion: @escaping(BalanceModel) -> Void) {
        balanceRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = BalanceModel(snapshot: document )
                completion(data)
            } else {
                print("Document does not exist")
            }
        }
    }
    
    public func getTransactions(completion: @escaping([TransactionModel]) -> Void) {
        transactionsRef.getDocument { (document, error) in
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
        transactionsRef.setData(["transaction": [
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
    
    func updateTransaction(id: String, amount: Int, company: String, date: String) {
        transactionsRef.updateData(["transaction": [
            "id"+"\(id)": [
                "amount": amount,
                "company": company,
                "date": date,
                "id": id
        ]]])
        { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written")
            }
        }
    }
    
    func deleteTransaction(id: String, completion: @escaping(Bool, String) -> Void) {
        transactionsRef.updateData(["transaction.id\(id)": FieldValue.delete()]) { err in
            if let err = err {
                print("Error updating document: \(err)")
                completion(false, id)
            } else {
                print("Document successfully updated")
                completion(true, id)
            }
        }
    }
}
