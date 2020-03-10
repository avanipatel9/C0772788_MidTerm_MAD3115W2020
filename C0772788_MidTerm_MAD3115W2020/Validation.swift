//
//  Validation.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/7/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import Foundation
class Validation
{
// function for email validation
    func isValidEmail(email: String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    // function for phone validation
    func isValidPhone() -> Bool {
        let PHONE_REGEX = "^(?:\\+?1[-.●]?)?\\(?([0-9]{3})\\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: self)
    }
}
