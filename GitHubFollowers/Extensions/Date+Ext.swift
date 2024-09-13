//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-13.
//

import Foundation

extension Date{
    func convertToMonthYearFormat() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
    
}
