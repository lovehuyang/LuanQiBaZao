//
//  UserAccountTool.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/4/3.
//  Copyright © 2018年 胡小羊. All rights reserved.
//  MVVM 设计模式 - 对模型数据进行封装

import UIKit


class UserAccountViewModel {
    
    //MARK:- 将类设计成单例
    static let shareInstance : UserAccountViewModel = UserAccountViewModel.init()
    
    var account : UserCount?
    var isLogin : Bool = false
    
    
    //MARK:- 计算属性
    var  accountPath : String{
        let  accountPath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString)/account.plist"
        return accountPath
    }
    
    init() {
        // 解档
        account  = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserCount
        
        if account != nil {
            isLogin = true
        }else{
            isLogin = false
        }
    }
}
