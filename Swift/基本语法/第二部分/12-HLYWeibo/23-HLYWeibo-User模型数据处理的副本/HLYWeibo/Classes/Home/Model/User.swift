//
//  User.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/4/10.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class User: NSObject {

    //MARK:- 属性
    @objc var name : String?
    @objc var id :Int = 0
    @objc var screen_name : String?         //昵称
    @objc var profile_image_url : String?   // 头像
    @objc var verified : Bool = false       // 认证
    @objc var avatar_large : String?        // 头像大图
    @objc var verified_type : Int = -1{     // 认证类型
        didSet{
            switch verified_type {
            case 0:
                verifiedImg = UIImage.init(named: "avatar_vip")
                break
            case 2,3,5:
                verifiedImg = UIImage.init(named: "avatar_enterprise_vip")
                break
            case 220:
                verifiedImg = UIImage.init(named: "avatar_grassroot")
                break
            default:
                verifiedImg = nil
                break
            }
        }
    }
    
    @objc var mbrank :  Int = 0{            //会员等级
        didSet{
            if mbrank > 0 && mbrank<=7{
                vipImg = UIImage.init(named: "common_icon_membership_level\(mbrank)")
            }
        }
    }
    
    //MARK:- 自定义属性
    var verifiedImg : UIImage? // 认证身份显示的图标（个人认证、企业认证、微博达人）
    var vipImg : UIImage? // 会员等级图标
    
    //MARK:- 自定义构造函数 
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
