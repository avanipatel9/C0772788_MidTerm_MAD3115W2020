//
//  ShowBillDetailsViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/10/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {

    @IBOutlet weak var tblBills: UITableView!
    var customer : Customer?
    var bills : [Bill] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bills = customer!.getAllBills()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Customer Bills"
        
        // Do any additional setup after loading the view.
    }
}

extension ShowBillDetailsViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillCell")
//        let customer = customers[indexPath.row]
//        cell?.textLabel?.text = customer.fullName
        return cell!
    }


}
