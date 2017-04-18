//
//  CGRect_Extension.swift
//  ShenZhouDaDiXing
//
//  Created by spectator Mr.Z on 2016/12/18.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import UIKit

extension CGRect {
    
    
}

func CGRectAdjust(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
    return  CGRect(x: adjustSize(attribute: x), y: adjustSize(attribute: y), width: adjustSize(attribute: width), height: adjustSize(attribute: height))
}
