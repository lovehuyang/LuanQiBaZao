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
        // <HLYWeibo.HomeViewController: 0x7fb936510660>
        
//        addChildViewController("HomeViewController", title: "首页", imageName: "tabbar_home")
//        addChildViewController("MessageViewController", title: "消息", imageName: "tabbar_message_center")
//        addChildViewController("DiscoverViewController", title: "发现", imageName: "tabbar_discover")
//        addChildViewController("ProfileViewController", title: "我", imageName: "tabbar_profile")
        
        
        // 1.获取json文件路径
        let jsonPath = Bundle.main.path(forResource: "MainViewController", ofType: "json")
        guard (jsonPath != nil) else {
            print("没有在该路径下获取文件")
            return
        }
        
        // 2.读取json文件中的内容
        // jsonData数据为二进制数据
        let jsonData = NSData.init(contentsOfFile: jsonPath!)
        guard (jsonPath != nil )else {
            print("没有获取到json文件中的数据")
            return
        }
        
        // 3.将NSData转成数组/字典(序列化)
        let dictArray = try! JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
        
        
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
