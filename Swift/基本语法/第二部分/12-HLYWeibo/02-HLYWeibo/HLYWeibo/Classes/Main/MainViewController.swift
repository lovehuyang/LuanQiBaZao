//
//  MainViewController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/2/27.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

/*
本节重点：
 通过字符串建对象
 */

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 命名空间 HLYWeibo,在本工程下创建的所有的类都在HLYWeibo这个命名空间之下
        // 通过字符串创建类必须要先获取命名空间
        print(HomeViewController())

        // 1.获取json文件路径
        let jsonPath = Bundle.main.path(forResource: "MainViewController", ofType: "json")
        guard (jsonPath != nil) else {
            print("没有在该路径下获取文件")
            return
        }
    
        let url = URL(fileURLWithPath: jsonPath!)
        // 如果在调用系统的某个方法时，该方法的最后有一个throws，说明该方法会抛出异常，如果一个方法会抛出异常，那么需要对该异常进行处理带throws的方法需要抛异常
        /*
         在swift中提供了三种处理异常的方式
         1、try方式：程序员手动处理异常(不太常用)
            do{
            try JSONSerialization.jsonObject(with: nil, options: .mutableContainers)
            }catch{
                print(error)
            }
         
         2、try?方式：系统帮助处理异常，如果该方法出现异常则该方法返回nil，否则返回对应的对象（常用方式）
            guard let anyObject :Any = try? JSONSerialization.jsonObject(with: nil, options: JSONSerialization.ReadingOptions.mutableContainers )
            else{
         
            }
         
         3、try!方式（不推荐，很危险的操作）:直接告诉系统该方法没有异常，若是该方法出现了异常则崩溃
            let anyObjc = try!JSONSerialization.jsonObject(with: nil, options: JSONSerialization.ReadingOptions.mutableContainers )
         */
        
        
        
        
        
        do {
            /*
             * try 和 try! 的区别
             * try 发生异常会跳到catch代码中
             * try! 发生异常程序会直接crash
             */
            let data = try Data(contentsOf: url)
            
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            let jsonArr = jsonData as! NSArray
            
            // 遍历字典
            for dict in jsonArr {
                print(dict)
                let tempDict = dict as! [String : String]
                let vcName = tempDict["vcName"]
                let title = tempDict["title"]
                let imageName = tempDict["imageName"]
                addChildViewController(vcName!, title: title!, imageName: imageName!)

            }
        } catch let error as Error! {
            print("读取本地数据出现错误!",error)
        }
    }
    
    
    // swift 支持方法的重载
    private func addChildViewController(_ childVcName: String,title :String , imageName:String) {
        
        // 1.获取命名空间 (!:强制解包, as? 把可选类型转成其他类型)
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        
        guard nameSpace != nil else {
            print("没有命名空间")
            return;
        }
        
        
        // 2、根据字符串生成相应的class
        let childClass = NSClassFromString(nameSpace! + "." + childVcName)
        
        guard (childClass != nil) else {
            print("没有获取到字符串对应的class")
            return
        }
        print("获取到了字符串对应的class")
        
        //3.将对应的AnyObject转成控制器的类型
        let childVcType = childClass as? UIViewController.Type
        
        guard childVcType != nil else {
            print("没有获取到对应的控制器的类型")
            return
        }
        
        
        //4.创建对应的控制器
        let childController = (childVcType?.init())!
        
        //1、 设置子控制器的属性
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")

        // 2、 包装导航栏控制器
        let childControllerNav = UINavigationController(rootViewController: childController)

        //3、 添加控制器
        addChildViewController(childControllerNav)
        
    }
}

