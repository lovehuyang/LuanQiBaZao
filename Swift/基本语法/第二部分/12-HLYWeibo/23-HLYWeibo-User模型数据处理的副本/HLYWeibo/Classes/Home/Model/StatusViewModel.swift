//
//  StatusViewModel.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/4/10.
//  Copyright © 2018年 胡小羊. All rights reserved.
//  视图模型 - 封装模型对象

import UIKit

class StatusViewModel: NSObject {
    //MARK:- 定义属性
    var status : Status?
    
    //MARK:- 自定义构造函数
    init(status : Status) {
     self.status = status
    }
}
