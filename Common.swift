//
//  Common.swift
//  ChouNiMei-Client
//
//  Created by Spectator on 16/7/15.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import Foundation
import UIKit
class common: NSObject {
    
}
//MARK: - 公共属性

let ScreenW = UIScreen.main.bounds.width

let ScreenH = UIScreen.main.bounds.height

//时间设置
let SZTimeSetting = "SZTimeSetting"
//上传设置
//let SZUploadSetting = "SZUploadSetting"
//件数设置
let SZCountSetting = "SZCountSetting"

//基础价格

//收件网点
let SZReceiveNetpotSetting = "SZReceiveNetpotSetting"
//到件网点
let SZArriveNetpotSetting = "SZArriveNetpotSetting"
//快递单价
let SZChargeSetting = "SZChargeSetting"


let SZPrintReceiveLable = "SZReceiveLabel"
let SZPrintPrice = "SZPrintPrice"


//目标城市
let SZAimCitySetting = "SZAimCitySetting"
//终端网点
let SZTermianlPotSetting = "SZTermianlPotSetting"
//收货人电话
let SZReceivePhone = "SZReceivePhone"
//收货人姓名
let SZReceiveName = "SZReceiveName"
//收获地址
let SZReceiveAddress = "SZReceiveAddress"
//运单备注
let SZWayBillTip = "SZWayBillTip"

//结算方式
let SZPayMehtod = createBillDefaultClearMethodConst//createBillDefaultClearMethodConst

let SZSettingDict = ["时间设置":SZTimeSetting,
                     "件数设置": SZCountSetting,
                     "收件网点":SZReceiveNetpotSetting,
                     "到件网点":SZArriveNetpotSetting,
                     "快递单价":SZChargeSetting,
                     "目的城市":SZAimCitySetting,
                     "终端网点":SZTermianlPotSetting,
                     "收货人电话":SZReceivePhone,
                    "收货人姓名":SZReceiveName,
                    "收货地址":SZReceiveAddress,
                    "运单备注":SZWayBillTip,
                    "结算方式":SZPayMehtod]



func ZJLog<T>(messagr : T ,file : String = #file,function : String = #function, line : Int = #line  )
{
    #if DEBUG
        let str1 = (file as NSString).lastPathComponent
        let str2 = NSMutableString.init(string: str1)
        let range = NSRange.init(location: 0, length: str2.length)
        str2.replaceOccurrences(of: ".swift", with: "", options: NSString.CompareOptions.backwards, range: range)
        print("<\(str2)--\(function)>[\(line)]:\(messagr)")
    #endif
}
func ColorRGB(red: CGFloat, green: CGFloat , blue: CGFloat ) -> UIColor {
    
    return ColorRGBA(red: red, green: green, blue: blue, alpha: 1.0)
}
func ColorRGBA(red: CGFloat, green: CGFloat , blue: CGFloat ,alpha: CGFloat) -> UIColor {
    let color = UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    
    return color
}

func adjustSize(attribute: CGFloat) -> CGFloat {
    var result : CGFloat = 0.0
    switch ScreenW {
    case 414:
        result = attribute
   case 375:
        result = attribute/1.104
    default:
        result = attribute/1.29375
    }
    return result
}

func adjustSizeWithUiDesign(attribute: CGFloat,UiDesignWidth: CGFloat) -> CGFloat {
    let rate = UiDesignWidth/414.0
    
    return adjustSize(attribute: attribute/rate)
}

func cellIdentify(cellClass : AnyClass) -> String {
    return NSStringFromClass(cellClass)
    
}

        
