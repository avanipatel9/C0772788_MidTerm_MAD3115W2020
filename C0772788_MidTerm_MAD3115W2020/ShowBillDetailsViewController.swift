//
//  ShowBillDetailsViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/6/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {
       
    var customer : Customer?
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displaySelectedCustomerDetails()
    }
// function to display details by selecting cutomer from CustomerListTableViewController
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
