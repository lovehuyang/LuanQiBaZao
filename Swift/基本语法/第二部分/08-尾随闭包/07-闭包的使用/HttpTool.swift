//
//  HttpTool.swift
//  07-闭包的使用
//
//  Created by tzsoft on 2018/2/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class HttpTool: NSObject {

    var callBack:((String ,String)->() )?
    
    // 闭包的类型：(参数类型) -> (返回值类型)
    func loadData(callBack: @escaping (String,String)->()) {
        print("发送网络请求")
        self.callBack  = callBack
        callBack("数据这是", "1231312")
    }
}
