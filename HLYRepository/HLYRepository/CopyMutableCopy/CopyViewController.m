//
//  CopyViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/7/2.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "CopyViewController.h"

@interface CopyViewController ()
@property (nonatomic , copy) NSMutableArray *aArray;
@property (nonatomic ,strong) NSMutableArray * bArray;

@property (nonatomic ,strong) NSArray * array1;
@property (nonatomic ,copy) NSArray * array2;

@end

@implementation CopyViewController
/*
 概念：
 浅复制：不拷贝对象本身，仅仅是拷贝指向对象的指针
 深复制：是直接拷贝整个对象内存到另一块内存中
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Copy&MutableCopy";
//    [self createUI1];
//    [self createUI2];
//    [self createUI3];
//    [self createUI4];
    [self createUI5];
}
- (void)createUI1{
    
    // 带 “=”的基本上都是浅复制
    UIView *view1 = [[UIView alloc]init];
    UIView *view2 = [[UIView alloc]init];
    view1.frame = CGRectMake(100, 100, 100, 100);
    view2.frame = CGRectMake(100, 200, 100, 100);
    view1.backgroundColor = [UIColor redColor];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    
//    NSLog(@"%p - %p" ,view1 , view2);
//    view1 = view2;
//     NSLog(@"%p - %p" ,view1 , view2);
    
    
    NSString *str1 = [NSString stringWithFormat:@"123"];
    NSMutableString *mutStr1 = [str1 mutableCopy];
    NSLog(@"str1:%p / %p- mutStr1:%p/%p",str1,&str1, mutStr1,&mutStr1);
    
    NSMutableString *mutStr2 = [NSMutableString stringWithFormat:@"1234"];
    NSString *str2 = [mutStr2 copy];
    NSLog(@"str2:%p/%p - mutStr2:%p/%p",str2,&str2, mutStr2,&mutStr2);
    
    NSString *str3 = [NSString stringWithFormat:@"12345"];
    NSString *str4 = [str3 copy];
    NSLog(@"str3:%p/%p - str4:%p/%p",str3,&str3, str4,&str4);
    str3 = @"3214";
    NSLog(@"%@ - %@",str3,str4);

    
}

- (void)createUI2{
    NSArray *arr = @[@"123",@"456",@"789"];
    NSArray *copyarr = [arr copy];
    NSMutableArray *mutArr = [arr mutableCopy];
    NSLog(@"%p - %p - %p",arr,copyarr,mutArr);
    
}

#pragma mark - 原数组为可变时
- (void)createUI3{
    // https://blog.csdn.net/winzlee/article/details/51752354
    
    // 一
    /* copy修饰可变数组时
     当声明一个属性是用copy修饰时：
     @property (nonatomic , copy) NSMutableArray *aArray;
     进行如下操作：
     NSMutableArray *cArray = [NSMutableArray array];
     self.aArray = cArray;// 此时self.aArray的类型为不可变类型
     
     可以等同于：
     @property (nonatomic , strong) NSMutableArray *aArray;
     NSMutableArray *cArray = [NSMutableArray array];
     self.aArray = [cArray copy];//复制得到的数组类型为不可变类型
     */
    
    // 二
    /* strong修饰可变数组时
     如果是strong，直接是赋值a = b；右边是什么，左边就是什么，并且是强引用新值，左边的类型会与右边的相同，不会改变。
     */
    
    NSMutableArray *cArray = [NSMutableArray array];
    self.aArray = cArray;
    self.bArray = cArray;
    NSLog(@"\n aArray:%@ \n bArray:%@",[self.aArray class],[self.bArray class]);
   
    [self.bArray removeAllObjects];
//    [self.aArray removeAllObjects];//
}

#pragma mark - 原数组为不可变时
- (void)createUI4{
    /*
     当源对象为不可变的时候，最后得到的aArray和bArray都是不可变的。aArray是不可变的原因是被copy，bArray是不可变的原因是源对象为不可变，与源对象保持一致。并且在对bArray进行删除操作的时候就crash了。
     */
    
    NSArray *cArray = [NSArray array];
    self.aArray = cArray;
    self.bArray = cArray;
    
    NSLog(@"\n aArray:%@ \n bArray:%@",[self.aArray class],[self.bArray class]);
    
    
    [self.aArray removeAllObjects];
    [self.bArray removeAllObjects];
}

#pragma mark - NSArray被copy、strong修饰后的变化
- (void)createUI5{
    
    /* strong
      被strong修饰之后，由于只是强引用，所以副本对象数组和源对象数组只是指向同一个内存区域，这样就会造成副本对象数组会随着源对象数组的改变而改变,即便有时候你并不想让副本对象跟着改变。
      如下，self.array1 是被strong修饰的，当原数组的值发生变化时会影响到self.array1
     */
    
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"12",@"34",@"56", nil];
    self.array1 = arr1;
    [arr1 removeLastObject];
    NSLog(@"%@",self.array1);
    
    /* copy
     被copy修饰之后，源对象数组被copy了一份，源对象数组和副本对象数组是不同的，所以副本对象数组并不会随着源对象数组改变。
     如下，self.array2 是被copy修饰的，当原数组的值发生变化时不会影响到self.array2
     */
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@"ab",@"cd",@"ef", nil];
    self.array2 = arr2;
    [arr2 addObject:@"tt"];
    NSLog(@"%@",self.array2);
    
    /*
     
     当修饰可变类型的属性时，如NSMutableArray、NSMutableDictionary、NSMutableString，用strong。
     
     当修饰不可变类型的属性时，如NSArray、NSDictionary、NSString，用copy。
     
     */
}
@end
