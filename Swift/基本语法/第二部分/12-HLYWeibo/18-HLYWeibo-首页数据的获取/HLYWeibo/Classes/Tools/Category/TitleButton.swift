//
//  TitleButton.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/13.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    // 重写init 方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage.init(named: "navigationbar_arrow_down"), for: .normal)
        setImage(UIImage.init(named: "navigationbar_arrow_up"), for: .selected)
        setTitleColor(UIColor.black, for: .normal)
        sizeToFit()
    }
    
    // swift中规定：重写控件的init（frame方法）或者init（）方法，必须重写init?(coder aDecoder: NSCoder)
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // 重写 layoutSubviews方法
    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width + 5
    }
    
}
