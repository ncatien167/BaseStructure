//
//  Date + Helpers.swift
//  
//
//  Created by Tien on 6/16/19.
//  Copyright © 2019 Tien. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(dateFormat format: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
        
    }
    
}
