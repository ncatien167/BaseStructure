//
//  APIManager.swift
//  
//
//  Created by Tien on 6/16/19.
//  Copyright © 2019 Tien. All rights reserved.
//

import Alamofire

enum APIManager {
    
    case login
    
}

extension APIManager {
    
    var baseURL: String { return "" }
    
    //MARK: - URL
    
    var url: String {
        
        var path = ""
        
        switch self {
        case .login: path = ""
            
        }
        return baseURL + path
        
    }
    
    //MARK: - METHOD
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .get
        }
    }
    
    //MARK: - HEADER
    
    var header: HTTPHeaders? {
        switch self{
        default:
            return nil
        }
    }
    
    //MARK: - ENCODING
    
    var encoding: ParameterEncoding {
        
        switch self {
        default:
            return URLEncoding.default
        }
        
    }
}
