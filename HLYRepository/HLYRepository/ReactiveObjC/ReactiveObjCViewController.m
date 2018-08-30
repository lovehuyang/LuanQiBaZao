//
//  ReactiveObjCViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/8/30.
//  Copyright © 2018年 HLY. All rights reserved.
//  https://www.jianshu.com/p/14075b5ec5ff

#import "ReactiveObjCViewController.h"
#import "RedView.h"
#import <ReactiveObjC.h>

@interface ReactiveObjCViewController ()//<RedViewDelegate>

@end

@implementation ReactiveObjCViewController

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"ReactiveObjC";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSignal];
    [self buttonAddSignal];
    [self delegateAddSignal];
    [self textChange];
}

#pragma mark - 发送接收信号
- (void)addSignal{
    // 1、创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        // 3、发送信号
        [subscriber sendNext:@"哈哈哈"];
        // 4、信号发送完毕
        [subscriber sendCompleted];
        return nil;
    }];
    
    // 2、订阅信号
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收到的信号：%@",x);
    }];
}

#pragma mark -- 监听事件(按钮点击)

- (void)buttonAddSignal{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =  CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    /*
     原理：将系统的UIControlEventTouchUpInside事件转化为信号、我们只需要订阅该信号就可以了。
     点击按钮的时候触发UIControlEventTouchUpInside事件---> 发出信号 实际是:  执行订阅者(subscriber)的sendNext方法
     */
    
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"按钮的点击事件%@",x);
    }];
}

#pragma mark -- 代替代理
- (void)delegateAddSignal{
    RedView *redView = [[RedView alloc]initWithFrame:CGRectMake(100, 150, 200, 200)];
//    redView.delegate = self;
    [self.view addSubview:redView];
    [[redView rac_signalForSelector:@selector(btnClick)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"信号方法😆-%@",x);
    }];
}

#pragma mark -- 监听文本框的文字改变
- (void)textChange{
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 360, 200, 30)];
    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    [textField setPlaceholder:@"请输入内容"];
    [self.view addSubview:textField];
    // 检测文本框内容发生变化
    [[textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"文本框内容发生了变化-%@",x);
    }];
    
    // 对信息进行过滤:当textfild的文本长度大于5时才调用subscribeNext方法
    [[[textField rac_textSignal] filter:^BOOL(NSString * _Nullable value) {
        return value.length > 5;
    }] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"filter - %@",x);
    }];
    
    //对信息进行过滤：当输入文本为“666”时不执行subscribeNext方法
    [[[textField rac_textSignal] ignore:@"666"]subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"输入的文本不是666 - %@",x);
    }];
}



#pragma mark - RedViewDelegate
// redView 代理方法的执行
- (void)redViewClick{
    NSLog(@"代理方法执行");
}
@end
