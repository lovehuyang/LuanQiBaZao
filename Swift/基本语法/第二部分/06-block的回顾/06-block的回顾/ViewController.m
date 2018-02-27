//
//  ViewController.m
//  06-block的回顾
//
//  Created by tzsoft on 2018/2/23.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "ViewController.h"
#import "HttpTool.h"

@interface ViewController ()

@property (nonatomic ,strong) HttpTool *tools;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tools = [[HttpTool alloc]init];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.tools loadData:^(NSString *jsonData) {
        NSLog(@"jsonData");
    }];
}

@end
