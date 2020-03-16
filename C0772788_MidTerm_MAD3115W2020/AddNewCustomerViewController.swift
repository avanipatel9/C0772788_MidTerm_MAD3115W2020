//
//  AddNewCustomerViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/6/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class AddNewCustomerViewController: UIViewController {
    var validation = Validation()
    @IBOutlet weak var txtCustomerID: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var cntLastNameHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cntLastNameHeight.constant = 0
//        txtLastName.layoutIfNeeded()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnAddNewCustomer(_ sender: UIButton)
    {
        var validatedCustomerEmail = String()
        guard let newCustomerID = txtCustomerID.text else {return}
        guard let newCustomerFirstName = txtFirstName.text else {return}
        guard let newCustomerLastName = txtLastName.text else {return}
        guard let newCustomerEmail = txtEmail.text else {return}
        
        //validating empty fields and showing alert for it
        if  newCustomerID == ""
        {
            showAlert(message: "Please Enter Customer ID")
            return
        }
        else if newCustomerFirstName == ""
        {
            showAlert(message: "Please Enter First Name")
            return
        }
        else if newCustomerLastName == ""
        {
            showAlert(message: "Please Enter Last Name")
            return
        }
        else if newCustomerEmail == ""
        {
            showAlert(message: "Please Enter Email")
            return
        }
        // adding new customer
        else
        {
            if self.validation.isValidEmail(email: newCustomerEmail) == false
            {
                showAlert(message: "Invalid Email ID")
                return
            }
            else
            {
                validatedCustomerEmail = newCustomerEmail
            }
            DataStorage.getInstance().addCustomer(customer: Customer(customerID: newCustomerID, firstName: newCustomerFirstName, lastName: newCustomerLastName, emailID: validatedCustomerEmail))
            navigationController?.popViewController(animated: true)
        }
    }
    
// function to show alert
    func showAlert(message: String)
    {
        let alert = UIAlertController(title: "Error", message:message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
