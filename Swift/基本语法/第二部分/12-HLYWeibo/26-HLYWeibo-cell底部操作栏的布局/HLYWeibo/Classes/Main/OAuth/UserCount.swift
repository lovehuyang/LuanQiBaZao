//
//  Person.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/28.
//  Copyright © 2018年 胡小羊. All rights reserved.
//  用户账号信息类

import UIKit

class UserCount: NSObject,NSCoding {
    // 归档
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(screen_name, forKey: "screen_name")
        aCoder.encode(profile_image_url, forKey: "profile_image_url")
    }
    // 解档
    required init?(coder aDecoder: NSCoder) {
     
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expires_in = aDecoder.decodeObject(forKey: "expires_in") as? NSNumber
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        screen_name = aDecoder.decodeObject(forKey: "screen_name") as? String
        profile_image_url = aDecoder.decodeObject(forKey: "profile_image_url") as? String
    }
    
    //MARK:- 定义属性
    @objc var access_token : String?
    @objc var expires_in : NSNumber? // 过期时间（秒）
    @objc var uid : String?
    
    /// 昵称
    @objc var screen_name : String?
    /// 头像地址
    @objc var profile_image_url : String?
    
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
       return dictionaryWithValues(forKeys: ["expires_date","access_token","uid"]).description
    }
}
