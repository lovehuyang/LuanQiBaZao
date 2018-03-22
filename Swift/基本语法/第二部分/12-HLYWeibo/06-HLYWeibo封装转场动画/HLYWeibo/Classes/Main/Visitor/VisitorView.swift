//
//  VisitorView.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/9.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    
    //MARK:- 控件属性
    @IBOutlet weak var tipLab: UILabel!
    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var rotationImgView: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!// 登录按钮
    @IBOutlet weak var registerBtn: UIButton!// 注册按钮
    
    // 通过xib创建view
    // class类方法创建
    class func visitorView() -> VisitorView{
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.first as! VisitorView
        
    }
    
    //MARK:- 自定义函数
    func setupVisitorInfo(iconName:String ,title:String)  {
        tipLab.text = title
        iconImgView.image = UIImage.init(named: iconName)
        rotationImgView.isHidden = true
    }
    
    func addRotationAnim()  {
        // 1 创建动画
        let rotationAnim = CABasicAnimation.init(keyPath: "transform.rotation.x")
        //2 设置动画的属性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 5
        rotationAnim.isRemovedOnCompletion = false
        
        // 3 将动画添加到图层中
        rotationImgView.layer.add(rotationAnim, forKey: nil)
        
        
    }
}
