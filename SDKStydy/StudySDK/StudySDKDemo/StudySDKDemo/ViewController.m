//
//  ViewController.m
//  StudySDKDemo
//
//  Created by tzsoft on 2018/6/14.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "ViewController.h"
#import <StudySDK/SDKView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SDKView *testView = [[SDKView alloc]initWithColor:[UIColor orangeColor]];
    testView.frame = CGRectMake(0, 80, 200, 200);
    [self.view addSubview:testView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
