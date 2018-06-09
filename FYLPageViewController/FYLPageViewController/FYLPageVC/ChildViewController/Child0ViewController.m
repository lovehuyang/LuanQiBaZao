//
//  TestViewController.m
//  FYLPageViewController
//
//  Created by FuYunLei on 2017/4/17.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "Child0ViewController.h"

@interface Child0ViewController ()

@end

@implementation Child0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
}

int getRandomNumber(){
    
    return arc4random()%256;
}

@end
