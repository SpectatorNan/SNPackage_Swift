//
//  String_Extension.swift
//  ShenZhouDaDiXing
//
//  Created by Spectator on 2016/11/15.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import Foundation

extension String {
    
    func value(at: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: at)
        let boolStr = self[index]
        return "\(boolStr)"
    }
    
    func substring(star: Int, end: Int) -> String {
        let new = self[self.startIndex.advance(2, for: self)..<self.startIndex.advance(4, for: self)]
        
        return new
    }
}

extension String.Index{
    func successor(in string:String)->String.Index{
        return string.index(after: self)
    }
    
    func predecessor(in string:String)->String.Index{
        return string.index(before: self)
    }
    
    func advance(_ offset:Int, `for` string:String)->String.Index{
        return string.index(self, offsetBy: offset)
    }
}
