//
//  ContactsModel.h
//  私人通讯录
//
//  Created by tzsoft on 2018/1/29.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 copy ：字符串、block
 weak：UI控件、代理
 strong：其他oc对象
 asign：基本数据类型、结构体、枚举
 */
@interface ContactsModel : NSObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *phone;
@end
