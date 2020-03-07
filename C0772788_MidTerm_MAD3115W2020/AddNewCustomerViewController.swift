//
//  AddNewCustomerViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/6/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class AddNewCustomerViewController: UIViewController {
    
    @IBOutlet weak var txtCustomerID: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnAddNewCustomer(_ sender: UIButton)
    {
        let newCustomerID = txtCustomerID.text ?? ""
        let newCustomerFirstName = txtFirstName.text ?? ""
        let newCustomerLastName = txtLastName.text ?? ""
        let newCustomerEmail = txtEmail.text ?? ""
        
        if  newCustomerID == ""
        {
            showAlert(message: "Please Enter Customer ID")
        }
        else if newCustomerFirstName == ""
        {
            showAlert(message: "Please Enter First Name")
        }
        else if newCustomerLastName == ""
        {
            showAlert(message: "Please Enter Last Name")
        }
        else if newCustomerEmail == ""
        {
            showAlert(message: "Please Enter Email")
        }
        else
        {
            DataStorage.getInstance().addCustomer(customer: Customer(customerID: newCustomerID, firstName: newCustomerFirstName, lastName: newCustomerLastName, emailID: newCustomerEmail))
            
        }
    }
    
    func showAlert(message: String)
    {
        let alert = UIAlertController(title: "Error", message:message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
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
