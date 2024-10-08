//
//  String+Ext.swift
//  GitHubFollowers
//
//  Created by Sovit Thapa on 2024-09-13.
//

import Foundation

extension String{
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_CA")
        dateFormatter.timeZone = .current
        
        
        return dateFormatter.date(from: self)!
    }
    
    func convertToDisplayFormat() -> String{
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
}
