//
//  UIViewController + Extensions.swift
//
//
//  Created by Tien on 6/16/19.
//  Copyright © 2019 Tien. All rights reserved.
//

import UIKit

extension UIViewController: Reusable {
    
    static func loadFromNib<T: UIViewController>(bundle: Bundle? = nil) -> T {
        return T(nibName: T.reuseIdentifier, bundle: bundle)
    }
    
}
