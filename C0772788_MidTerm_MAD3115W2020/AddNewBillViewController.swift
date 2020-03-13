//
//  AddNewBillViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/12/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController {

    var customer : Customer?
    
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
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentBillType(_ sender: UISegmentedControl)
    {
        
    }
}
