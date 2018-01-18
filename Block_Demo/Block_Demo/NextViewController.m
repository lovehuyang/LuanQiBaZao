//
//  NextViewController.m
//  Block_Demo
//
//  Created by tzsoft on 2018/1/18.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "NextViewController.h"
#import "WRNavigationBar.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第二页";
    // 设置导航栏颜色
    [self wr_setNavBarBarTintColor:[UIColor redColor]];
    self.returnValue(@"返回值");
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

@end
