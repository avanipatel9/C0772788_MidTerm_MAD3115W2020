//
//  Customer.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/5/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import Foundation
class Customer: CalculateBill
{
    var customerID:String
    var firstName:String
    var lastName:String
    var fullName:String
    {
        return "\(firstName) \(lastName)"
    }
    var emailID:String
    lazy var bills = [String : Bill]()
    var totalBillToPay : Double = 0.0
    
    init(customerID:String, firstName:String, lastName:String, emailID:String) {
        self.customerID=customerID
        self.firstName=firstName
        self.lastName=lastName
        self.emailID=emailID
        //self.totalBillToPay = calculateTotalBill()
    }
    
    func addBill(bill: Bill, billID: String)
    {
        bills.updateValue(bill, forKey: billID)
        self.totalBillToPay = self.totalBillToPay+bill.billAmount;
    }
    
    func removeBill(bill: Bill, billID: String)
    {
        bills.removeValue(forKey: billID)
        print("Bill removed with ID \(billID)")
    }
    func getAllBills() -> [Bill]
    {
        var allBills = [Bill]()
        for bill in bills
        {
            allBills.append(bill.value)
        }
        return allBills
    }
    
    func calculateTotalBill()-> Double {
//        for i in bills {
//            self.totalBillToPay = self.totalBillToPay + i.value.billAmount
//        }
//        return totalBillToPay
        return self.totalBillToPay;
    }
    
}
