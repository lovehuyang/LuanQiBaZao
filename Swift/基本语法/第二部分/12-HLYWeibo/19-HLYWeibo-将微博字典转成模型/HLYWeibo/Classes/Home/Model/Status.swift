//
//  Status.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/4/9.
//  Copyright © 2018年 胡小羊. All rights reserved.
//  微博数据模型

import UIKit

class Status: NSObject {
    //MARK:- 属性
    @objc var created_at : String?            // 创建时间
    @objc var source : String?                // 来源
    @objc var text : String?                  // 正文
    @objc var mid : Int = 0                   // 微博的id
    
    //MARK:- 自定义构造函数
    init (dict : [String : AnyObject]){
        super.init()
        setValuesForKeys(dict)
    }
    
    //MARK:- 重写
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
