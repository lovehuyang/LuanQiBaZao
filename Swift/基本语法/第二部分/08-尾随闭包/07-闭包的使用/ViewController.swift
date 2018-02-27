//
//  ViewController.swift
//  07-闭包的使用
//
//  Created by tzsoft on 2018/2/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tools:HttpTool = HttpTool() // 创建类
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 重写的父类的方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        tools.loadData {[weak self] (param1, param2) in
            print(param1,param2)
                self?.view.backgroundColor = UIColor.red
        }
        
        //尾随闭包：如果闭包作为方法的最后一个参数，那么闭包可以将（）省略掉
        
        // 普通写法
        tools.loadData (callBack: {[weak self] (param1, param2) in
            print(param1,param2)
            self?.view.backgroundColor = UIColor.red
        })
        
        // 尾随闭包的写法一
        tools.loadData (){[weak self] (param1, param2) in
            print(param1,param2)
            self?.view.backgroundColor = UIColor.red
        }
        
        // 尾随闭包的写法二：
        tools.loadData {[weak self](param1, param2) in
            self?.view.backgroundColor = UIColor.red
        }
    }

    deinit {
        
    }
}

