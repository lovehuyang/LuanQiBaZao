//
//  ChildViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/6/9.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *colorBg = [UIColor colorWithRed:getRandomNumber()/255.f green:getRandomNumber()/255.f blue:getRandomNumber()/255.f alpha:1.0];
    self.view.backgroundColor = colorBg;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    label.center = self.view.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"第%zi个控制器",_index];
    [self.view addSubview:label];
}

#pragma mark - 随机颜色

int getRandomNumber(){
    
    return arc4random()%256;
}

@end
