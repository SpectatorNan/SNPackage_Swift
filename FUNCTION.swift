//
//  FUNCTION.swift
//  SZLogisticsLiteVersion
//
//  Created by spectator Mr.Z on 2016/9/26.
//  Copyright © 2016年 spectator Mr.Z. All rights reserved.
//

import Foundation
import UIKit

public func SNLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    
    var fileName = file as NSString
    
    fileName = fileName.lastPathComponent as NSString
    print("[\(fileName)--\(function)--\(line) : \(message)]")
}


public func getCurrentVC() -> UIViewController {
    
    var result:UIViewController?
    
    var  window = UIApplication.shared.keyWindow
    
    if window?.windowLevel != UIWindowLevelNormal {
        
        let windows = UIApplication.shared.windows
        
        for tmpWin in windows {
            
            if tmpWin.windowLevel == UIWindowLevelNormal {
                window = tmpWin
                break
            }
        }
    }
    
    
    let frontView = window?.subviews[0]
    let nextResponer = frontView?.next
    
    if (nextResponer?.isKind(of: UIViewController.self))! {
        result = nextResponer as! UIViewController?
    } else {
        result = window?.rootViewController
    }
    
    return result!
}


func dic2Json(dictionary: Dictionary<String,String>) {
    
    
    let result = dictionary.map {
        "\($0):\"\($1)\""
        }.joined(separator: ",")
    
    SNLog(result)
}


func modelToDic<T>(model:T) -> Dictionary<String,String> {
    
    
    let aBookmark = model
    let aMirror = Mirror(reflecting: aBookmark)
    SNLog(aMirror.subjectType)
    
    var resultDic: [String:String] = [:]
    
    for p in aMirror.children {
        SNLog("label \(p.label!),value \(p.value)")
        
        let value = p.value as? String
        
        if value == "" {
            continue
        }
        else
        {
            resultDic[p.label!] = value
        }
    }
    
    return resultDic
}

func dic2JSONStr(dictionary:Dictionary<String,Any>) -> String {
    
    var jsonStr = ""
    do {
        
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        
         jsonStr = String(data: jsonData, encoding: .utf8)!
        
        SNLog(jsonStr)
    } catch let error as NSError {
        SNLog(error)
    }
    
    return jsonStr
}

func text2Doubel(_ text: String) -> Double {
    
    return text == "" ? 0.0 : Double(text)!
}

func validNumber(text: String) -> Bool {
    
    let number = "^[0-9]+$"
    
    let numberPre = NSPredicate(format: "SELF MATCHES %@", number)
    
    let result = numberPre.evaluate(with: text)
    
    SNLog("string is number result: \(result)")
    
    return result
}

func validCharacter(text: String) -> Bool {
    
    let character = "^[A-Z]+$"
    
    let characterPre = NSPredicate(format: "SELF MATCHES %@", character)
    
    let result = characterPre.evaluate(with: text)
    
    SNLog("string is character result: \(result)")
    
    return result
}

func getCurrentTime(format: String) -> String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = format
    let currentDate = Date()
    let date = dateformatter.string(from: currentDate)
    return date
}
