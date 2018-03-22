//
//  HLYPresentationController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/15.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class HLYPresentationController: UIPresentationController {
    
    //MARK:- 懒加载
    private lazy var coverView = UIView()
    
    //重写即将布局的方法 WillLayoutSubviews
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        // 设置弹出 view 的尺寸
        presentedView?.frame = CGRect(x: WIDTH_S/2, y: HIGHT_STATUS + 44, width: 180, height: 250)
        presentedView?.center = CGPoint(x: WIDTH_S/2, y: (presentedView?.center.y)!)
        
        // 2 添加蒙版
        setupCoverView()
        
    }
}

extension HLYPresentationController{
    func setupCoverView()  {
        // 1 添加蒙版
        containerView?.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        
        // 2 添加手势
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(tapGesEvent))
        containerView?.addGestureRecognizer(tapGes)
        
    }
}

extension HLYPresentationController{
    @objc func tapGesEvent()  {
        presentedViewController.dismiss(animated: true) {
            
        }
    }
}
