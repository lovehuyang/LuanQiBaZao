//
//  NSDate+Extension.swift
//  20-时间处理
//
//  Created by tzsoft on 2018/4/10.
//  Copyright © 2018年 胡小羊. All rights reserved.
//  NSDate类的拓展

import Foundation

extension NSDate{
    //MARK:- 类方法
    class func createDateStr(createAtStr : String) -> ( String) {
        
        // 1、创建时间格式化对象
        let fmt = DateFormatter()
        fmt.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"//格式化的格式
        fmt.locale = NSLocale(localeIdentifier:"en") as Locale!
        
        // 2、将字符串时间转成NSDate类型
        let createDate = fmt.date(from: createAtStr)
        guard createDate != nil else {
            return ""
        }
        
        // 3、 创建当前时间
        let nowDate = NSDate()
        
        // 4、 比较两个时间
        let interval = Int(nowDate.timeIntervalSince(createDate!))
        
        // 5、 对时间间隔的处理
        // 5.1 显示刚刚
        if (interval < 60){
            return "刚刚"
        }
        // 5.2 xx分钟前
        if interval < 60 * 60 {
            return "\(interval/60)分钟前"
        }
        
        // 5.3 XX小时前(一天之内)
        if interval < 60 * 60 * 24 {
            return "\(interval/60/60)小时前"
        }
        // 5.4 创建日历对象
        let calendar = NSCalendar.current
        // 5.5 处理昨天数据 昨天 12：33
        if calendar.isDateInYesterday(createDate!){
            fmt.dateFormat = "昨天 HH:mm"
            let timeStr = fmt.string(from: createDate!)
            return timeStr
        }
        
        // 5.8 处理一年之内4-9 15：58
        if interval < 60 * 60 * 24 * 365{
            fmt.dateFormat = "MM-dd-HH:mm"
            let timeStr = fmt.string(from: createDate!)
            return timeStr
        }
        
        // 5.9 一年多的
        if interval > 60 * 60 * 24 * 365 {
            fmt.dateFormat = " yyyy-MM-dd HH:mm"
            let timeStr = fmt.string(from: createDate!)
            return timeStr
        }
        
        return "未知时间"
    }
}
