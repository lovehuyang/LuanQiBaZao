//
//  HomeViewCell.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/4/11.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit
import SDWebImage

private let edgeMargin : CGFloat = 15

class HomeViewCell: UITableViewCell {
    // 约束属性
    @IBOutlet weak var contentLabWidth: NSLayoutConstraint!
    
    //MARK:- 控件属性
    @IBOutlet weak var verifiedView: UIImageView!// 认证图标
    @IBOutlet weak var iconView: UIImageView!    // 头像
    @IBOutlet weak var contentLab: UILabel!      // 正文
    @IBOutlet weak var sourceLab: UILabel!       // 来源
    @IBOutlet weak var timeLab: UILabel!         // 时间
    @IBOutlet weak var vipView: UIImageView!     // vip
    @IBOutlet weak var screenNameLab: UILabel!   // 昵称
    
    //MARK:- 自定义属性
    var viewModel : StatusViewModel? {
        didSet{
            // 1、nil校验
            guard viewModel != nil else {
                return
            }
            // 2、 设置头像
            iconView.sd_setImage(with: viewModel?.profileURL, placeholderImage: UIImage.init(named: "headimg_placeholder"), options: .cacheMemoryOnly, completed: nil)
            // 3、 设置认证图标
            verifiedView.image = viewModel?.verifiedImg
            // 4、设置昵称
            screenNameLab.text = viewModel?.status?.user?.screen_name
            // 5、 设置会员等级
            vipView.image = viewModel?.vipImg
            // 6、 设置时间
            timeLab.text = viewModel?.createAtText
            // 7 、设置来源
            sourceLab.text = viewModel?.sourceText
            // 8、 设置正文
            contentLab.text = viewModel?.status?.text
            // 9、 设置昵称的文字颜色
            screenNameLab.textColor = viewModel?.vipImg == nil ? UIColor.black : UIColor.orange
        }
        
    }
    
    //MARK:- 加载xib时调用此方法
    override func awakeFromNib() {
        super.awakeFromNib()
        // 设置微博正文的宽度约束
        contentLabWidth.constant = UIScreen.main.bounds.width - 2 * edgeMargin
    }
}
