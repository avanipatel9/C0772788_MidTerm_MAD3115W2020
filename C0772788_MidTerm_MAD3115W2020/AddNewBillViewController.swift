//
//  AddNewBillViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/12/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController, UITextFieldDelegate {

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
        
        if segBillType.selectedSegmentIndex == 0{
            let tempBillObj = Hydro(billID: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.HYDRO, agencyName: txtAgencyName.text!, unitConsumed: Int(txtUnitConsumed.text!)!)
            customer?.addBill(bill: tempBillObj, billID: txtBillID.text!)
        }
        else if segBillType.selectedSegmentIndex == 1
        {
            let tempBillObj = Internet(billID: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.INTERNET, providerName: txtInternetProviderName.text!, internetGBUsed: Double(txtInternetGBUsed.text!)!)
            customer?.addBill(bill: tempBillObj, billID: txtBillID.text!)
        }
        else if segBillType.selectedSegmentIndex == 2
        {
            let tempBillObj = Mobile(billID: txtBillID.text!, billDate: (txtBillDate.text?.toDate())!, billType: BillType.MOBILE, mobileManufacturerName: txtManufacturerName.text!, planName: txtPlanName.text!, mobileNumber: txtMobileNumber.text!, internetGBUsed: Double(txtInternetGBUsed.text!)!, minuteUsed: Int(txtMinutesUsed.text!)!)
            customer?.addBill(bill: tempBillObj, billID: txtBillID.text!)
        }
        
        navigationController?.popViewController(animated: true)
    }
}
