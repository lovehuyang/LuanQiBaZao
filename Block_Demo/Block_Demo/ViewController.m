//
//  ViewController.m
//  Block_Demo
//
//  Created by tzsoft on 2018/1/18.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
     
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self changeValue];//改变局部变量
}

// 1、block 反向传值
- (void)returnValue{
    NextViewController *nvc = [[NextViewController alloc]init];
    nvc.returnValue = ^(NSString *value) {
        NSLog(@"返回值：%@",value);
    };
    [self.navigationController pushViewController:nvc animated:YES];
}
//2、block与局部变量
- (void)changeValue{
    
    __block int a = 10;
    int (^changeValueBlock) (int index) = ^(int index){
        NSLog(@"%d",a);
        a+=index;
        return a ;
    };
    
    a = 100;
    
    NSLog(@"block1:%d",changeValueBlock(a));
    
    NSLog(@"block2:%d",changeValueBlock(a));
    
    NSLog(@"block3:%d",changeValueBlock(a));
    
}


/**
 一、block 与局部变量和全局变量
    1、block 内修改局部变量需要用 __block 来修饰局部变量才能被 block 修改其值，否则会报编译错误
    2、block 内部引用局部变量 为了避免循环引用，在block内部应该使用weakself。（__weak typeof(self) weakself = self;）
 
 二、当项目中需要多次用到有相同的返回值和相同形参的block时，可以用typedef 定义一个block，再在属性声明时就可以声明多个名字不一样的但是具有相同返回值和相同形参的block了
 */
@end
