//
//  Bill.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/10/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import Foundation
enum BillType
{
    case INTERNET, MOBILE, HYDRO, INSURANCE
}

class Bill
{
    var billID: String
    var billDate: Date
    var billType: BillType
    var billAmount: Double = 0.0
    
    init(billID: String, billDate: Date, billType: BillType) {
        self.billID = billID
        self.billDate = billDate
        self.billType = billType
    }
}
