//
//  Person.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/28.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class Person: NSObject,Codable {
    //MARK:- 定义属性
    var access_token : String?
    // 过期时间（秒）
    var expires_in : Double = 0
    var uid : String?
    
    // 有了自定义构造函数若是不写init（）方法，系统不会提示init()方法
   
    
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
