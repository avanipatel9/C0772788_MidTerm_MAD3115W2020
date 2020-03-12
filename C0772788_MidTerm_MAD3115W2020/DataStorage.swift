//
//  DataStorage.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/5/20.
//  Copyright © 2020 Avani Patel. All rights reserved.

//Singleton class

import Foundation
class DataStorage
{
    private static let dataStorage = DataStorage()
    private lazy var customerList: [String : Customer] = [:]
    
    private init(){}
       
    static func getInstance() -> DataStorage
    {
        return dataStorage
    }
// function to add new customer
    func addCustomer(customer: Customer) {
        self.customerList.updateValue(customer, forKey: customer.customerID)
    }
// function to get all customer
    func getAllCustomers() -> [Customer] {
        return Array(customerList.values);
    }
//    func getBillsByCustomerID(customerID: String) -> [Bill]
//    {
//        return null;
//    }
    
    var m1 = Mobile(billID: "MOB001", billDate: Date.from(year: 2019, month: 01, day: 20)!, billType: BillType.MOBILE, mobileManufacturerName: "Galaxy Samsung", planName: "Prepaid Talk + Text plan", mobileNumber: "+1(467)-345-6789", internetGBUsed: 5.0, minuteUsed: 356)
    var m2 = Mobile(billID: "MOB002", billDate: Date.from(year: 2018, month: 08, day: 15)!, billType: BillType.MOBILE, mobileManufacturerName: "Apple", planName: "Prepaid + Text plan", mobileNumber: "6471234567", internetGBUsed: 2.0, minuteUsed: 250)
    var i1 = Internet(billID: "NET001", billDate: Date.from(year: 2018, month: 07, day: 29) ?? Date(), billType: BillType.INTERNET, providerName: "Bell", internetGBUsed: 500.0)
    var i2 = Internet(billID: "NET002", billDate: Date.from(year: 2018, month: 12, day: 17) ?? Date(), billType: BillType.INTERNET, providerName: "Roger", internetGBUsed: 300)
    var i3 = Internet(billID: "NET003", billDate: Date.from(year: 2020, month: 01, day: 31) ?? Date(), billType: BillType.INTERNET, providerName: "Bell", internetGBUsed: 250)

    var h1 = Hydro(billID: "HYD001", billDate: Date.from(year: 2019, month: 04, day: 01) ?? Date(), billType: BillType.HYDRO, agencyName: "Planet Energy", unitConsumed: 29)
    var h2 = Hydro(billID: "HYD002", billDate: Date.from(year: 2019, month: 10, day: 12) ?? Date(), billType: BillType.HYDRO, agencyName: "Planet Energy", unitConsumed: 50)

    var c1 = Customer(customerID: "C001", firstName: "Avani", lastName: "Patel", emailID: "admin@gmail.com")

    var c2 = Customer(customerID: "C002", firstName: "Jyothi", lastName: "Thomas", emailID: "admin@gmail.com")
    var c3 = Customer(customerID: "C003", firstName: "Charmi", lastName: "Patel", emailID: "admin@gmail.com")
    var c4 = Customer(customerID: "C004", firstName: "Shreya", lastName: "Vaghasiya", emailID: "admin@gmail.com")
    var c5 = Customer(customerID: "C005", firstName: "Kashyap", lastName: "Zaveri", emailID: "admin@gmail.com")
    
    
    
// function to load all Customer Data
    func loadData()
    {
        c1.addBill(bill: i1, billID: i1.billID)
        c1.addBill(bill: h1, billID: h1.billID)
        
        c2.addBill(bill: i2, billID: i2.billID)
        c2.addBill(bill: i3, billID: i3.billID)
        c2.addBill(bill: m2, billID: m2.billID)
        
        c3.addBill(bill: h2, billID: h2.billID)
        
        customerList.updateValue(c1, forKey: c1.customerID)
        customerList.updateValue(c2, forKey: c2.customerID)
        customerList.updateValue(c3, forKey: c3.customerID)
        customerList.updateValue(c4, forKey: c4.customerID)
        customerList.updateValue(c5, forKey: c5.customerID)
    }
}
