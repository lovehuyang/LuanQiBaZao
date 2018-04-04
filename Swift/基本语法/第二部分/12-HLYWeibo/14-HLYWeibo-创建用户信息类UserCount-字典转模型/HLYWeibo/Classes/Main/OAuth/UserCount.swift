//
//  Person.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/28.
//  Copyright © 2018年 胡小羊. All rights reserved.
//  用户账号信息类

import UIKit

class UserCount: NSObject,Codable {
    //MARK:- 定义属性
    @objc var access_token : String?
    @objc var expires_in : Double = 0 // 过期时间（秒）
    @objc var uid : String?
    
    // 有了自定义构造函数若是不写init（）方法，系统不会提示init()方法
    override init() {
        
    }
    
    //MARK:- 自定义构造函数
     init(dict : [String : AnyObject]) {
        super.init()
        print(dict)
        setValuesForKeys(dict)
    }
    
    // 重写
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    //MARK:- 重写decription
    override var description: String{
       return dictionaryWithValues(forKeys: ["expires_in","access_token","uid"]).description
    }
    
    
    
    
    
}
