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
    @objc var source : String? {              // 来源
        // 属性监听器
        didSet{
            //1、 nil校验 并且 不是空字符串
            guard source != nil, source != "" else {
                return
            }
            // 2、 对来源的字符串进行处理
            let startIndex = (source! as NSString) .range(of: ">").location + 1
            let length = (source! as NSString).range(of: "</").location - startIndex
            sourceText = (source! as NSString).substring(with: NSRange.init(location: startIndex, length: length))
        }
    }
    @objc var text : String?                  // 正文
    @objc var mid : Int = 0                   // 微博的id
    @objc var user : User?
    
    //MARK:- 自定义属性
    var sourceText : String?
    
    //MARK:- 自定义构造函数
    init (dict : [String : AnyObject]){
        super.init()
        setValuesForKeys(dict)
        
        // 1、 将用户字典转成用户模型对象
        let userDict = dict["user"] as? [String : AnyObject]
        if userDict != nil {
            user = User.init(dict: userDict!)
        }
    }
    
    //MARK:- 重写
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
