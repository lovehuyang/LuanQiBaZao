//
//  TestViewCell.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/4/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class TestViewCell: UITableViewCell {
    @IBOutlet weak var iconImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImg.image = UIImage.init(named: "tabbar_compose_movie_neo")
    }
}
