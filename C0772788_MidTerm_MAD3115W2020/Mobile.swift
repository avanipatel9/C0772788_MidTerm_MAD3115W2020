//
//  Mobile.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/10/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import Foundation
class  Mobile: Bill
{
    var mobileManufacturerName: String
    var planName: String
    var mobileNumber: String
    var internetGBUsed: Double
    var minuteUsed: Int
    var ratePerGB: Double = 7.5
    var ratePerMinute: Double = 0.50
    
    
    init(billID: String, billDate: Date, billType: BillType, mobileManufacturerName: String, planName: String, mobileNumber: String, internetGBUsed: Double, minuteUsed: Int){
        self.mobileManufacturerName=mobileManufacturerName
        self.planName=planName
//        if !mobileNumber.isValidPhone()
//        {
//            throw CustomerError.INVALIDPHONENUMBER(phone: mobileNumber)
//        }
        self.mobileNumber=mobileNumber
        self.internetGBUsed=internetGBUsed
        self.minuteUsed=minuteUsed
        super.init(billID: billID, billDate: billDate, billType: billType)
        self.billAmount = calculateTotalBill()
    }
    override func calculateTotalBill()->Double
    {
        self.billAmount = internetGBUsed*ratePerGB + Double(minuteUsed)*ratePerMinute
        return self.billAmount
    }
}
