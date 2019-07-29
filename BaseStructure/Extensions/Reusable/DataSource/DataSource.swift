//
//  DataSource.swift
//  
//
//  Created by Tien on 6/18/19.
//  Copyright © 2019 Tien. All rights reserved.
//

import UIKit

class DataSource<Model: Any>: NSObject {
    
    var dataProvider: DataProvider<Model>
    
    init(dataProvider: DataProvider<Model>) {
        self.dataProvider = dataProvider
    }
    
}
