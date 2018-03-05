//
//  MainViewController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/2/27.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(HomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileViewController(), title: "我", imageName: "tabbar_profile")
        
    }
    // swift 支持方法的重载
    // 方法的承载：方法名相同，但是参数不同（1、参数的类型不同，2、参数的个数不同）
    // private方法私用话（方法只能在当前文件中访问）
    private func addChildViewController(_ childController: UIViewController,title :String , imageName:String) {
        
        //2、 设置子控制器的属性
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
        
        // 3、 包装导航栏控制器
        let childControllerNav = UINavigationController(rootViewController: childController)
        
        //4、 添加控制器
        addChildViewController(childControllerNav)
        
    }

}
