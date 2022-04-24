//
//  TransactionsTableViewController.swift
//  TradingApp
//
//  Created by Luda Parfenova on 10/04/2022.
//

import UIKit

class TransactionsTableViewController: UITableViewController {
    
    var transactions = [TransactionModel]()
    var editedTransactionsIndexes = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        FirebaseCommunication.sharedInstance.getTransactions(completion: completion)
    }
    
    func completion(result: [TransactionModel]) {
        transactions = result
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func deleteTransactionCompletion(result: Bool, id: String) {
        if result {
            transactions = transactions.filter{$0.id != id}
            tableView.reloadData()
        } else {
            //show error message
            print("delete error")
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell
        cell.companyName.text = transactions[indexPath.row].company
        cell.amount.text = String(transactions[indexPath.row].amount!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let id = transactions[indexPath.row].id!
            FirebaseCommunication.sharedInstance.deleteTransaction(id: id, completion: deleteTransactionCompletion)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isEditing {
            let vc = storyboard?.instantiateViewController(identifier: "editViewController") as? AddTransactionViewController
            vc?.editAmount = String(transactions[indexPath.row].amount!)
            vc?.editCompany = transactions[indexPath.row].company!
            vc?.editDate = transactions[indexPath.row].date!
            vc?.editId = transactions[indexPath.row].id!
            navigationController?.pushViewController(vc!, animated: true)
        } else {
                print("did select row at \(indexPath.row)")
        }
    }
    
    override func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        print("did begin editing roe at \(indexPath.row)")
    }
    
}

