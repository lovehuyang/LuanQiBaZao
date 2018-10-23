//
//  MBProgressHUDViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/9/30.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "MBProgressHUDViewController.h"
#import "HUDManager.h"

@interface MBProgressHUDViewController ()

@end

@implementation MBProgressHUDViewController

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"MBProgressHUD的使用";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [HUDManager showInfoMessage:@"请登录"];
     [HUDManager loadingHUD:self.view];// 加载中
    
}
@end
