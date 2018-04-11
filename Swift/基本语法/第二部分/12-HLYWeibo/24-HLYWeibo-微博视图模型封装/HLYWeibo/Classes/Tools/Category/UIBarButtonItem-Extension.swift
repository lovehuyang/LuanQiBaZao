//
//  UIBarButtonItem-Extension.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    convenience init(imageName:String) {
        self.init()
        
        let btn = UIButton()
        btn.setImage(UIImage.init(named: imageName), for: .selected)
        btn.setImage(UIImage.init(named: imageName + "_highlighted"), for: .normal)
        self.customView = btn
        
    }
}
