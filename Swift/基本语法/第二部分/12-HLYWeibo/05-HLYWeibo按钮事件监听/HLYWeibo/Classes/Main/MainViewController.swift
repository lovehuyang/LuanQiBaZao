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

    // MARK: - 懒加载
   private lazy var imageNames = ["tabbar_message_center_selected","tabbar_message_center_selected","","tabbar_discover_selected","tabbar_profile_selected"]
    //MARK:- 懒加载一个加号按钮tabbar_compose_icon_add
//    private lazy var composeBtn:UIButton = UIButton.createButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    private lazy var composeBtn:UIButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    
    //MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComposeBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabbarItems()
    }
}

//MARK:- 初始化页面
extension MainViewController{
    /// 初始化加号按钮
    private func setupComposeBtn(){
        // 添加加号按钮
        //1 将加号按钮添加到tabbar中
        tabBar.addSubview(composeBtn)
        // 2 设置位置
        composeBtn.center = CGPoint.init(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        //3 添加监听
        /*
         Selector的两种写法：
            1>:Selector("方法名")
            2>:"方法名"
         */
        composeBtn.addTarget(self, action: #selector(composeBtnClick), for: .touchUpInside)
    }
    

    ///
    private func setupTabbarItems(){
        // 修改tabbar的属性
        // 修改方法必须写在viewWillAppear中，若是写在viewDidLoad
        //1 遍历所有的item
        for (index , item) in (tabBar.items?.enumerated())! {
            if(index == 2){
                // 2 如果下标值为2，则item不可与用户交互
                item.isEnabled = false
                continue
            }
            
            //3 设置其他的item选中的时候的图片
            item.selectedImage = UIImage.init(named: imageNames[index])
        }
    }
}


//MARK: - 事件监听 @objc
extension MainViewController{
    // 事件监听本质是发送消息，但是发送消息是oc的特性
    // 发送消息的过程是将方法包装成@sel  --> 类中查找方法 -->根据@sel找到imp指针（函数指针）-->执行函数
    // 如果swift中将一个函数声明成private，那么该函数不会被添加到方法列表中
    //如果在private中加上 @objc ，那么该方法依然会被添加到方法列表中
    @objc private func composeBtnClick(){
        print("点击事件")
    }
}
