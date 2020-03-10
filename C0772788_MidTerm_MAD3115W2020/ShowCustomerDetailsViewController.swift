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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnViewBillsClick(_ sender: Any) {
        
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