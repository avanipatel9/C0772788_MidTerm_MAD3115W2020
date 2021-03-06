//
//  ShowCustomerDetailsViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/10/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class ShowCustomerDetailsViewController: UIViewController {

    var customer : Customer?
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        displaySelectedCustomerDetails()
        self.addNewBillButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnViewBillsClick(_ sender: Any) {
        if customer?.bills.count == 0
        {
            showAlert(message: "Sorry, This Customer has no bills")
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let billDetailsVC = sb.instantiateViewController(identifier: "billDetailsVC") as! ShowBillDetailsViewController 
        billDetailsVC.customer = self.customer
        navigationController?.pushViewController(billDetailsVC, animated: true)
        
    }
    private func addNewBillButton()
       {
           let newBillButton = UIBarButtonItem(title: "Add Bill", style: .plain, target: self, action: #selector(self.addNewBill))
           self.navigationItem.rightBarButtonItem = newBillButton
       }
       @objc func addNewBill()
       {
           let sb = UIStoryboard(name: "Main", bundle: nil)
           let addNewBillVC = sb.instantiateViewController(identifier: "addNewBillVC") as! AddNewBillViewController
           addNewBillVC.customer = self.customer
           navigationController?.pushViewController(addNewBillVC, animated: true)
       }
    
    func showAlert(message: String)
    {
        let alert = UIAlertController(title: "Error", message:message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func displaySelectedCustomerDetails()
    {
        guard let customerID = self.customer?.customerID else {
            return
        }
        guard let customerName = self.customer?.fullName else {
            return
        }
        guard let customerEmail = self.customer?.emailID else {
            return
        }
        
        lblID.text = "ID : \(customerID)"
        lblName.text = "Name : \(customerName)"
        lblEmail.text = "Email ID : \(customerEmail)"
        
    }
}
