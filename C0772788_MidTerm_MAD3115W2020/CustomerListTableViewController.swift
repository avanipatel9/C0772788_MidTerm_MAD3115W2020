//
//  CustomerListViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/5/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class CustomerListTableViewController: UIViewController {

    @IBOutlet weak var tblCustomer: UITableView!
    var customers:[Customer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Customer List"
        customers = DataStorage.getInstance().getAllCustomers()
    }
    override func viewWillAppear(_ animated: Bool) {
        customers = DataStorage.getInstance().getAllCustomers()
        tblCustomer.reloadData()
    }
}

extension CustomerListTableViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell")
        let customer = customers[indexPath.row]
        cell?.textLabel?.text = customer.fullName
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
// shows the selected customers details in ShowBillDetailsViewController
        let customers = DataStorage.getInstance().getAllCustomers()
        let selectedCustomer = customers[indexPath.row]
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let custDetailsVC = sb.instantiateViewController(identifier: "customerDetailsVC") as ShowCustomerDetailsViewController
        let billDetailsVC = sb.instantiateViewController(identifier: "billDetailsVC") as ShowBillDetailsViewController
        custDetailsVC.customer = selectedCustomer
        billDetailsVC.customer = selectedCustomer
        
        self.navigationController?.pushViewController(custDetailsVC, animated: true)
        
    }
    
}
