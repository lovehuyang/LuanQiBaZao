//
//  UIButton-Extention.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/9.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit
extension UIButton{
    //方法一：swift中类方法是以class开头的方法（类似于oc中的+开头的方法）
    class func createButton(imageName:String , bgImageName :String) -> UIButton{
        //1 创建button
        let btn = UIButton()
        //2 设置属性
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        btn.setImage(UIImage.init(named: imageName + "_selected"), for: .selected)
        btn.setBackgroundImage(UIImage.init(named: bgImageName), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: bgImageName + "_selected"), for: .selected)
        
        btn.sizeToFit()
        return btn
    }
 
    //方法二：遍历构造函数(如果对系统的某各类扩充一个构造函数时使用遍历构造函数，方便对系统的类进行扩展)
    //convenience:遍历，使用convenience修饰的构造函数叫做遍历构造函数
    // 遍历构造函数通常用在对系统的类进行构造函数的扩充时使用
    /*
     特点：
        1、遍历构造函数通常都写在extension中
        2、遍历构造函数init钱都要加convenience
        3、遍历构造函数中都要调用self.init
     */
    convenience init(imageName:String , bgImageName:String) {
        self.init()
        setImage(UIImage.init(named: imageName), for: .normal)
        setImage(UIImage.init(named: imageName + "_selected"), for: .selected)
        setBackgroundImage(UIImage.init(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage.init(named: bgImageName + "_selected"), for: .selected)
        sizeToFit()
        // 遍历构造函数不用返回值
    }
}
