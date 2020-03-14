//
//  Extension+String.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/13/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import Foundation
extension String
{
    func toDate(withFormat format: String = "MMM dd, yyyy") -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else
        {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}
