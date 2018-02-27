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
        
        // 解决循环引用的方式一：
//        weak var wealkSelf = self
//        tools.loadData { (param1, param2) in
//            print(param1,param2)
//            /*
//             wealkSelf?.view
//             如果前面的可选类型没有值，后面的代码不会执行
//             如果前面的可选类型有值，系统会自动将weakself进行解包，并且使用weakself
//             */
//            wealkSelf?.view.backgroundColor = UIColor.red
//        }
        
        
        // 解决循环引用方式二：
        // 这个方法相当于
        // [unowned self]
//        tools.loadData {[unowned self] (param1, param2) in
//            print(param1,param2)
//            /*
//             wealkSelf?.view
//             如果前面的可选类型没有值，后面的代码不会执行
//             如果前面的可选类型有值，系统会自动将weakself进行解包，并且使用weakself
//             */
//            self.view.backgroundColor = UIColor.red
//        }
        
        
        //解决循环引用的方式三：推荐使用方式
        //[weak self]
        tools.loadData {[weak self] (param1, param2) in
            print(param1,param2)
            /*
             wealkSelf?.view
             如果前面的可选类型没有值，后面的代码不会执行
             如果前面的可选类型有值，系统会自动将weakself进行解包，并且使用weakself
                     */
                self?.view.backgroundColor = UIColor.red
        }
        
    }
    
    //deinit 相当于OC中的dealloc方法，当对象被销毁时会调用该函数
    deinit {
        
    }
}

