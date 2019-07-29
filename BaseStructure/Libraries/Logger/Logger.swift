//
//  Logger.swift
//  
//
//  Created by Tien on 6/16/19.
//  Copyright © 2019 Tien. All rights reserved.
//

import UIKit

enum LogEvent: String{
    
    case error = "[🔥]"
    case info = "[ℹ️]"
    case debug = "[💬]"
    case warning = "[⚠️]"
    
}

final class Logger{
    
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!.replacingOccurrences(of: ".swift", with: "")
    }
    
    
    class func log(message: String,event: LogEvent, fileName: String = #file, line: Int = #line, funcName: String = #function){
        
        let date = Date().toString(dateFormat: "yyyy-MM-dd hh:mm")
        print("\n\(date) \(event.rawValue) [\(sourceFileName(filePath: fileName)).\(funcName)] [\(line)]:\n")
        print("----- START -----")
        print("\n\(message)\n")
        print("-----  END  -----")
        print("")
        
    }
    
}
