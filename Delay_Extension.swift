//
//  Delay_Extension.swift
//  ShenZhouDaDiXing
//
//  Created by spectator Mr.Z on 2016/10/23.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import UIKit

typealias Task = (_ cancel: Bool) -> ()

func delay(time: TimeInterval, block: @escaping () -> ()) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
        block()
    })
}


func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    var closure: (()->Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

func cancel(_ task: Task?) {
    task?(true)
}
