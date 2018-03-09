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
    //MARK:- 懒加载一个加号按钮
    private lazy var composeBtn:UIButton = UIButton()
    
    
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
        //2 设置按钮属性
        composeBtn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_os7"), for: .normal)
        composeBtn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted_os7"), for: .selected)
        composeBtn.setImage(UIImage.init(named: "tabbar_compose_icon_add_os7"), for: .normal)
        composeBtn.setImage(UIImage.init(named: "tabbar_compose_icon_add_os7"), for: .selected)
        
        composeBtn.sizeToFit()
        // 3 设置位置
        composeBtn.center = CGPoint.init(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
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
