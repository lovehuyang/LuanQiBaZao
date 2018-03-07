//
//  ViewController.swift
//  02-02处理异常的练习
//
//  Created by tzsoft on 2018/3/7.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 正则表达式
        //1、创建正则表达式的规则
        let pattern = "abc"
        //2、创建正则表达式对象
        
        
        // 方式一：try方式
        do{
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        }catch{
            
        }
        
        // 方式二：try？方式
        let regex2 = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        
        
        
        
        // 方式二：try!方式
        let regex3 = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        
        
    }
}

