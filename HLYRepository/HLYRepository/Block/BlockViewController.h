//
//  BlockViewController.h
//  HLYRepository
//
//  Created by tzsoft on 2018/7/3.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import <UIKit/UIKit.h>

// block
typedef void(^Myblock)();

@interface BlockViewController : UIViewController

@property (nonatomic ,copy)  Myblock myBlock ;// 定义一个Myblock属性

@end
