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
        //self.navigationItem.hidesBackButton = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillTableViewCell", for: indexPath) as! BillTableViewCell
        let bill = bills[indexPath.row]
            if bill.billType == .HYDRO
            {
                cell.imgBillType.image = UIImage(named: "hydro1")
                cell.lblBillID.text = "ID : \(bill.billID)"
                cell.lblBillDate.text = "Date : \(bill.billDate.getForamttedDate())"
                cell.lblBillAmount.text = "Amount : $\(bill.billAmount)"
            }
            else if bill.billType == .MOBILE
            {
                cell.imgBillType.image = UIImage(named: "mobile1")
                cell.lblBillID.text = "ID : $\(bill.billID)"
                cell.lblBillDate.text = "Date : \(bill.billDate.getForamttedDate())"
                cell.lblBillAmount.text = "Amount : $\(bill.billAmount)"
            }
            else if bill.billType == .INTERNET
            {
                cell.imgBillType.image = UIImage(named: "wifi1")
                cell.lblBillID.text = "ID : \(bill.billID)"
                cell.lblBillDate.text = "Date : \(bill.billDate.getForamttedDate())"
                cell.lblBillAmount.text = "Amount : $\(bill.billAmount)"
            }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150.0)
    }
    
}
