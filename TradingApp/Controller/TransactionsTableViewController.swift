//
//  TransactionsTableViewController.swift
//  TradingApp
//
//  Created by Luda Parfenova on 10/04/2022.
//

import UIKit

class TransactionsTableViewController: UITableViewController {
    
    var transactions = [TransactionModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
        FirebaseCommunication.sharedInstance.getTransactions(completion: completion)
    }
    
    func completion(result: [TransactionModel]) {
        print("transactions", result)
        transactions = result
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell
        cell.companyName.text = transactions[indexPath.row].company
        cell.amount.text = String(transactions[indexPath.row].amount ?? 0)
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
