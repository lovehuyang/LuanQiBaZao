//
//  EditViewController.h
//  私人通讯录
//
//  Created by tzsoft on 2018/1/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactsModel;

@interface EditViewController : UIViewController
@property (nonatomic ,strong)ContactsModel *model;
@property (nonatomic ,copy)void (^saveEvent)(ContactsModel *editModel);
@end
