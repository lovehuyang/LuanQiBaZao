//
//  ViewController.swift
//  11-自定义Log
//
//  Created by tzsoft on 2018/2/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1 获取打印所在的文件
        let file = #file
        print("\(file)")
        
        // 2 获取打印所在的方法
        let funName = #function
        print("\(funName)")
        
        // 3 获取打印所在的行数
        let lineNum = #line
        print("\(lineNum)")
        
        DLog(message: "自定义log")
        DLog(message: "hahahahaahha")
    }
}

