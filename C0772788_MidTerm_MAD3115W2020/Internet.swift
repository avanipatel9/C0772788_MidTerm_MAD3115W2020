//
//  Internet.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/10/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import Foundation
class Internet: Bill
{
    var providerName: String
    var internetGBUsed: Double
    var ratePerGB: Double = 7.5
    
    init(billID: String, billDate: Date, billType: BillType, providerName: String, internetGBUsed: Double)
    {
        self.providerName = providerName
        self.internetGBUsed = internetGBUsed
        super.init(billID: billID, billDate: billDate, billType: billType)
    }
    
    override func calculateTotalBill()
    {
        self.billAmount = internetGBUsed*ratePerGB
    }
}
