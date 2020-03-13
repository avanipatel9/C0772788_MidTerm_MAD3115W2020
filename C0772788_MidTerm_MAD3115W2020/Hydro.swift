//
//  Hydro.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/10/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import Foundation
class Hydro: Bill
{
    var agencyName: String
    var unitConsumed: Int
    var ratePerUnit: Double = 20.0
    
    init(billID: String, billDate: Date, billType: BillType, agencyName: String, unitConsumed: Int) {
        self.agencyName=agencyName
        self.unitConsumed=unitConsumed
        super.init(billID: billID, billDate: billDate, billType: billType)
        self.billAmount = calculateTotalBill()
    }
    
    override func calculateTotalBill() -> Double
    {
        self.billAmount = Double(unitConsumed)*ratePerUnit
        return self.billAmount
    }
}
