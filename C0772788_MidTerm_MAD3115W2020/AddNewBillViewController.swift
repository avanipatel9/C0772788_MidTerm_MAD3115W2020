//
//  AddNewBillViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/12/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController, UITextFieldDelegate {
    
    var validation = Validation()
    @IBOutlet weak var viewSaveBill: UIView!
    @IBOutlet weak var viewHydro: UIView!
    @IBOutlet weak var viewInternet: UIView!
    @IBOutlet weak var viewMobile: UIView!
    @IBOutlet weak var segBillType: UISegmentedControl!
    var customer : Customer?
    var datePicker : UIDatePicker!
    
    @IBOutlet weak var txtBillID: UITextField!
    @IBOutlet weak var txtBillDate: UITextField!
    @IBOutlet weak var txtAgencyName: UITextField!
    @IBOutlet weak var txtUnitConsumed: UITextField!
    @IBOutlet weak var txtManufacturerName: UITextField!
    @IBOutlet weak var txtPlanName: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtMobileGBUsed: UITextField!
    @IBOutlet weak var txtMinutesUsed: UITextField!
    @IBOutlet weak var txtInternetProviderName: UITextField!
    @IBOutlet weak var txtInternetGBUsed: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtBillDate.delegate = self
        self.viewHydro.isHidden = true
        self.viewMobile.isHidden = true
        self.viewInternet.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(self.txtBillDate)
    }
    
    func pickUpDate(_ textField: UITextField)
    {
        //Date Picker
        self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.datePicker
        
        //Toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .red
        toolBar.sizeToFit()
        
        //Adding Button Toolbar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewBillViewController.doneClick))
        let spaceButton =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(AddNewBillViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    //Button Done and Cancel
    @objc func doneClick()
    {
        let dateformatter1 = DateFormatter()
        dateformatter1.dateStyle = .medium
        dateformatter1.timeStyle = .none
        txtBillDate.text = dateformatter1.string(from: datePicker.date)
        txtBillDate.resignFirstResponder()
    }
    
    @objc func cancelClick()
    {
        txtBillDate.resignFirstResponder()
    }
    
    
    
    @IBAction func segmentBillType(_ sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            viewHydro.isHidden = false
            viewMobile.isHidden = true
            viewInternet.isHidden = true
        }
        else if sender.selectedSegmentIndex == 1
        {
            viewInternet.isHidden = false
            viewHydro.isHidden = true
            viewMobile.isHidden = true
        }
        else if sender.selectedSegmentIndex == 2
        {
            viewMobile.isHidden = false
            viewHydro.isHidden = true
            viewInternet.isHidden = true
        }
    }
    
    @IBAction func btnSaveBillClick(_ sender: UIButton) {
        var validatedCustomerPhone = String()
        guard let newBillID = txtBillID.text else {return}
        guard let newBillDate = txtBillDate.text else {return}
        guard let newAgencyName = txtAgencyName.text else {return}
        guard let newUnitConsumed = txtUnitConsumed.text else {return}
        guard let newProviderName = txtInternetProviderName.text else {return}
        guard let newInternetGBUsed = txtInternetGBUsed.text else {return}
        guard let newMobileManufacturerName = txtManufacturerName.text else {return}
        guard let newPlanName = txtPlanName.text else {return}
        guard let newMobileNumber = txtMobileNumber.text else {return}
        guard let newMobileGBUsed = txtMobileGBUsed.text else {return}
        guard let newMinutesUsed = txtMinutesUsed.text else {return}
        
        
        if segBillType.selectedSegmentIndex == 0
        {
            if newBillID == ""
            {
                showAlert(message: "Please Enter Bill ID")
                return
            }
            else if newBillDate == ""
            {
                showAlert(message: "Please Enter Bill Date")
            }
            else if newAgencyName == ""
            {
                showAlert(message: "Please Enter Agency Name")
            }
            else if newUnitConsumed == ""
            {
                showAlert(message: "Please Enter Units Consumed")
            }
            else
            {
                let tempBillObj = Hydro(billID: newBillID, billDate: newBillDate.toDate(), billType: BillType.HYDRO, agencyName: newAgencyName, unitConsumed: Int(newUnitConsumed)!)
                customer?.addBill(bill: tempBillObj, billID: newBillID)
                //showAlert(message: "Bill added successfully")
                navigationController?.popViewController(animated: true)
            }
        }
        else if segBillType.selectedSegmentIndex == 1
        {
            if newBillID == ""
            {
                showAlert(message: "Please Enter Bill ID")
                return
            }
            else if newBillDate == ""
            {
                showAlert(message: "Please Enter Bill Date")
            }
            else if newProviderName == ""
            {
                showAlert(message: "Please Enter Internet Provider Name")
            }
            else if newInternetGBUsed == ""
            {
                showAlert(message: "Please Enter Internet GB Used")
            }
            else
            {
                let tempBillObj = Internet(billID: newBillID, billDate: newBillDate.toDate(), billType: BillType.INTERNET, providerName: newProviderName, internetGBUsed: Double(newInternetGBUsed)!)
                customer?.addBill(bill: tempBillObj, billID: newBillID)
                //showAlert(message: "Bill added successfully")
                navigationController?.popViewController(animated: true)
            }
        }
        else if segBillType.selectedSegmentIndex == 2
        {
            if newBillID == ""
            {
                showAlert(message: "Please Enter Bill ID")
                return
            }
            else if newBillDate == ""
            {
                showAlert(message: "Please Enter Bill Date")
            }
            else if newMobileManufacturerName == ""
            {
                showAlert(message: "Please Enter Mobile Manufacturer Name")
            }
            else if newPlanName == ""
            {
                showAlert(message: "Please Enter Plan Name")
            }
            else if newMobileNumber == ""
            {
                showAlert(message: "Please Enter Mobile Number")
            }
            else if newMobileGBUsed == ""
            {
                showAlert(message: "Please Enter Internet GB Used")
            }
            else if newMinutesUsed == ""
            {
                showAlert(message: "Please Enter Minutes Used")
            }
            else
            {
                if self.validation.isValidPhone(phone: newMobileNumber) == false
                {
                    showAlert(message: "Invalid Phone Number")
                }
                else
                {
                    validatedCustomerPhone = newMobileNumber
                    
                    let tempBillObj = Mobile(billID: newBillID, billDate: newBillDate.toDate(), billType: BillType.MOBILE, mobileManufacturerName: newMobileManufacturerName, planName: newPlanName, mobileNumber: validatedCustomerPhone, internetGBUsed: Double(newMobileGBUsed)!, minuteUsed: Int(newMinutesUsed)!)
                    customer?.addBill(bill: tempBillObj, billID: newBillID)
                    //showAlert(message: "Bill added successfully")
                    navigationController?.popViewController(animated: true)
                }
            }
            
        }
        
    }
    
    func showAlert(message: String)
    {
        let alert = UIAlertController(title: "Error", message:message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
