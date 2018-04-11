//
//  StatusViewModel.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/4/10.
//  Copyright © 2018年 胡小羊. All rights reserved.
//  视图模型 - 封装模型对象

import UIKit

class StatusViewModel: NSObject {
    
    //MARK:- 定义需要封装的对象属性
    var status : Status? // 对status模型进行封装
    
    
    //MARK:- 对数据处理的属性（status模型中的自定义属性）
    // Status
    var sourceText : String?// 来源
    var createAtText : String?//创建时间
    // User
    var verifiedImg : UIImage? // 认证身份显示的图标（个人认证、企业认证、微博达人）
    var vipImg : UIImage? // 会员等级图标
    
    //MARK:- 自定义构造函数
    init(status : Status) {
    
        self.status = status
        // 1、对创建时间进行处理
        if status.created_at != nil{
            createAtText = NSDate.createDateStr(createAtStr: (self.status?.created_at)!)
        }
        
        // 2、对来源进行处理
        if status.source != nil, status.source != "" {
         
            let startIndex = (status.source! as NSString) .range(of: ">").location + 1
            let length = (status.source! as NSString).range(of: "</").location - startIndex
            sourceText = (status.source! as NSString).substring(with: NSRange.init(location: startIndex, length: length))
        }
        
        // 3、认证身份显示的图标的数据处理
        let verfiedType = status.user?.verified_type ?? -1
        switch verfiedType {
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
        
        // 4、对会员等级图标的处理
        let mbrank = status.user?.mbrank ?? 0
        if (mbrank > 0 && mbrank<=7){
            vipImg = UIImage.init(named: "common_icon_membership_level\(mbrank)")
        }
    }
}
