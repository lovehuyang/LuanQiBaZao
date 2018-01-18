//
//  ViewController.m
//  Copy_Demo
//
//  Created by tzsoft on 2018/1/18.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1 = [UIButton new];
    btn1.frame = CGRectMake(100, 100, 100, 40);
    [btn1 setTitle:@"浅拷贝" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(copyArr) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor redColor]];
    
    UIButton *btn2 = [UIButton new];
    btn2.frame = CGRectMake(100, 150, 100, 40);
    [btn2 setTitle:@"深拷贝" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(mutableCopyArr) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor redColor]];
}

#pragma mark - 浅拷贝

/**
 “浅拷贝仅仅是把对象的引用复制，或者说指向对象的指针“
 
 不是所有对象都能使用copy ，使用了copy必须遵守协议（实现 copyWithZone: 方法）对于很多现有的类，如Nsstring, NSDictionary 已经实现了CopyWithZone:。如果我们需要一个新的类，就需要手动来重写CopyWithZone的方法。
 */

- (void)copyArr{

    // 1、当copy一个不可变对象时
    NSArray *array1 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    NSArray *copyArray1 = [array1 copy];
    NSLog(@"内存地址：array1:%p  copyArray1:%p",array1,copyArray1);
    
    //2、当copy一个可变对象时
    NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    NSMutableArray *copyArray2 = [array2 copy];// 注：此时的copyArray2类型为NSArray类型
    //    [copyArray2 addObject:@"5"]; // 会崩溃（因为copyArray2变成了不可变数组）
    
    NSLog(@"内存地址：array2:%p  copyArray2:%p",array2,copyArray2);
    
    /*
     总结
     
     (1)当我们copy的是一个不可变的对象时，他的作用相当于retain
     (2)当我们copy 的是一个可变对象时，副本对象是不可变的，同样实现了真正意义上的拷贝（copy一个Mutable类型可以深复制,但是其返回的 还是一个不可变的类型.）。
     (3)copy方法，得到的是不可变对象，不管以前的是可变还是不可变。
     
     */
}

#pragma mark - 深拷贝
/**
 ”内容拷贝，源对象和副本指向的是不同的两个对象”，mutableCopy需要继承NSMutableCopying 协议才可以使用mutableCopy（实现 mutableCopyWithZone: 方法）
 */
- (void)mutableCopyArr{
    //1、当mutableCopy一个可变对象时
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    NSMutableArray *copyArray1 = [array1 mutableCopy];
    NSLog(@"内存地址：array1:%p  copyArray1:%p",array1,copyArray1);
    
    //2、当mutableCopy一个不可变对象时
    NSArray *array2 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    NSArray *copyArray2 = [array2 mutableCopy];
    NSLog(@"内存地址：array2:%p  copyArray2:%p",array2, copyArray2);
    /*
     总结
     
     （1）源对象引用计数器不变，副本计数器设置为1
     （2）当我们使用mutabelCopy 时 ，无论源对象是否可变，复制对象是否可变，都能实现了真正意义上得拷贝
     （3）mutableCopy方法，得到的是可变对象，不管以前的是可变还是不可变。
     
     */
}
@end
