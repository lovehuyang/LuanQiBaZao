//
//  WelcomeViewController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/4/4.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {
    // 用户头像
    @IBOutlet weak var iconBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var iconView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profile_image_url = UserAccountViewModel.shareInstance.account?.profile_image_url
        
        guard profile_image_url != nil else {
            return
        }
        
        // ?? 语法：如果？？ 前的可选类型有值，那么将前面的可选类型进行解包并且赋值，
        // 如果 ？？ 前面的可选类型为nil ,那么直接使用 ？？ 后面的值
        let profileUrl = URL.init(string: profile_image_url ?? "")
        
        iconView.layer.cornerRadius = 45
        iconView.layer.masksToBounds = true
        iconView.sd_setImage(with: profileUrl, placeholderImage: UIImage.init(named: "headimg_placeholder"), options: [], completed: nil)
        
        // 1 改变约束的值
        iconBottomMargin.constant = HIGHT_S - 300
        // 2 执行动画
        // Damping : 阻力系数：阻力系数越大弹性效果越不明显 0~1
        // initialSpringVelocity 初始化速度
        UIView.animate(withDuration: 2.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5.0, options: [], animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()!
            
        }
    }
}
