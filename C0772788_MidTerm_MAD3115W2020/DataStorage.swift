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
    
    func loadData()
    {
        customerList.updateValue(Customer(customerID: "C001", firstName: "Avani", lastName: "Patel", emailID: "admin@gmail.com"), forKey: "C001")
         customerList.updateValue(Customer(customerID: "C002", firstName: "Jyothi", lastName: "Thomas", emailID: "admin@gmail.com"), forKey: "C002")
         customerList.updateValue(Customer(customerID: "C003", firstName: "Charmi", lastName: "Patel", emailID: "admin@gmail.com"), forKey: "C003")
         customerList.updateValue(Customer(customerID: "C004", firstName: "Shreya", lastName: "Vaghasiya", emailID: "admin@gmail.com"), forKey: "C004")
         customerList.updateValue(Customer(customerID: "C005", firstName: "Kashyap", lastName: "Zaveri", emailID: "admin@gmail.com"), forKey: "C005")
    }
}
