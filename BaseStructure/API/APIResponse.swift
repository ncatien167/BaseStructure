//
//  APIResponse.swift
//  
//
//  Created by Tien on 6/16/19.
//  Copyright © 2019 Tien. All rights reserved.
//

struct ErrorResponse: Decodable {
    var statusCode: Int?
    var statusMessage: String?
}

struct Response<T: Decodable>: Decodable {
    var data: T?
}
