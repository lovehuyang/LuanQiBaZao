//
//  NextViewController.h
//  Block_Demo
//
//  Created by tzsoft on 2018/1/18.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

// 用typedef定义一个block，方便下面使用的时候重命名
typedef void (^returnBlock) (NSString *value);

@interface NextViewController : UIViewController

@property (nonatomic ,copy) returnBlock returnValue;

@end
