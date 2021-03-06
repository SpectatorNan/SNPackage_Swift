//
//  Array_Extension.swift
//  ShenZhouDaDiXing
//
//  Created by spectator Mr.Z on 2016/11/4.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
