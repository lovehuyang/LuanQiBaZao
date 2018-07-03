//
//  GCDViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/7/2.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"GCD多线程的使用";
    [self createUI];
}

- (void)createUI{
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    [btn1 setTitle:@"线程锁死" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clickGCD1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 140, 200, 30)];
    [btn2 setTitle:@"线程不被锁死" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(clickGCD2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 170, 200, 30)];
    [btn3 setTitle:@"全局并发队列" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(clickGCD3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    [btn4 setTitle:@"串行异步队列" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(clickGCD4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(100, 230, 200, 30)];
    [btn5 setTitle:@"串行同步队列" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(clickGCD5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc] initWithFrame:CGRectMake(100, 260, 200, 30)];
    [btn6 setTitle:@"异步并行队列" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(clickGCD6) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn6];
    
    UIButton *btn7 = [[UIButton alloc] initWithFrame:CGRectMake(100, 290, 200, 30)];
    [btn7 setTitle:@"同步并行队列" forState:UIControlStateNormal];
    [btn7 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn7 addTarget:self action:@selector(clickGCD7) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn7];
    
    UIButton *btn8 = [[UIButton alloc] initWithFrame:CGRectMake(100, 320, 200, 30)];
    [btn8 setTitle:@"group" forState:UIControlStateNormal];
    [btn8 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn8 addTarget:self action:@selector(clickGCD8) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn8];
    
    UIButton *btn9 = [[UIButton alloc] initWithFrame:CGRectMake(100, 350, 200, 30)];
    [btn9 setTitle:@"延时" forState:UIControlStateNormal];
    [btn9 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn9 addTarget:self action:@selector(delay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn9];
}

#pragma mark - 同步执行线程锁死
- (void)clickGCD1{
    NSLog(@"当前线程%@",[NSThread currentThread]);
    
    // 1、创建主队列
    dispatch_queue_t queue = dispatch_get_main_queue();// 获取主线程
    // 2、 添加任务
    dispatch_sync(queue, ^{
        NSLog(@"主线程被锁死，该语句不能执行!");
    });
    
    /*
     上面的代码执行之后,首先会阻塞当前线程（主线程），然后等待主线程执行完，在回到调用线程（主线程）继续执行。如果主线程被阻塞，那么NSLog将不会被执行，也就永远无法继续执行主线程了,程序一直处于等待状态，block中的代码将执行不到,造成了死锁。
     */
}

#pragma mark - 异步执行线程不锁死
- (void)clickGCD2{
    NSLog(@"GCD2:%@",[NSThread currentThread]);
    // 1、 创建主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    // 2、 添加任务
    dispatch_async(queue, ^{
        NSLog(@"GCD2:%@",[NSThread currentThread]);
    });
}

#pragma mark - 全局并发队列
- (void)clickGCD3{
    NSLog(@"1:%@",[NSThread currentThread]);
    
    /*
     dispatch_get_global_queue 全局并发队列
     参数1：设置优先级，优先级越高越优先执行
     #define DISPATCH_QUEUE_PRIORITY_HIGH 2
     #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0
     #define DISPATCH_QUEUE_PRIORITY_LOW (-2)
     #define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
     */
    
    // 获取全局队列
    //dispatch_queue_t global = dispatch_get_global_queue(0, 0);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"2:%@",[NSThread currentThread]);
        // 回调主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"3:%@",[NSThread currentThread]);
        });
    });
}

#pragma mark - 串行异步队列
- (void)clickGCD4{
    /*
     创建队列
     参数一：char类型的
     参数二：选择串行还是并行
     DISPATCH_QUEUE_SERIAL串行
     DISPATCH_QUEUE_CONCURRENT并行
     */
    
    NSLog(@"主线程：%@",[NSThread currentThread]);
    
    // 1、创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("TestGCD", DISPATCH_QUEUE_SERIAL);
    // 2、 添加异步任务
    dispatch_async(queue, ^{
        NSLog(@"1 - %@", [NSThread currentThread]);
       
    });
    
    dispatch_async(queue, ^{
         NSLog(@"2 - %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
         NSLog(@"3 - %@", [NSThread currentThread]);
    });
    
    //三个任务是依次执行的，说明为了保证依次执行，串行队列是在同一个线程执行的任务。
}

#pragma mark - 串行同步队列
- (void)clickGCD5{
    // 1、 创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("TestGCD", DISPATCH_QUEUE_SERIAL);
    // 2、 添加同步任务
    dispatch_sync(queue, ^{
        NSLog(@"1 - %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"2 - %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"3 - %@", [NSThread currentThread]);
    });
    //三个任务是依次执行的，说明为了保证依次执行，串行队列是在同一个线程执行的任务。
}

#pragma mark - 异步并行队列

/**
 并行的概念：可以让多个任务并发（同时）执行（自动开启多个线程同时执行任务），并发功能只有在异步（dispatch_async）函数下才有效
 */
- (void)clickGCD6{
    // 1、 创建并行队列
    dispatch_queue_t queue = dispatch_queue_create("TestGCD", DISPATCH_QUEUE_CONCURRENT);
    
    // 2、 添加异步任务
    dispatch_async(queue, ^{
        NSLog(@"1 - %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"2 - %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"3 - %@",[NSThread currentThread]);
    });
    // 三个任务是并发执行的，并且线程有三个不同的标识码，说明为了保证并发执行，并行队列开启了三个不同的线程。
}

#pragma mark - 同步并行队列
- (void)clickGCD7{
    // 1、 创建并行队列
    dispatch_queue_t queue = dispatch_queue_create("TestGCD", DISPATCH_QUEUE_CONCURRENT);
    // 2、 添加异步任务
    dispatch_sync(queue, ^{
        NSLog(@"1- %@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"2- %@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"3- %@",[NSThread currentThread]);
    });
}

#pragma mark - group

/**
 在开发中我们经常有这样的需求，在多个任务异步处理之后，我们需要一个统一的回调通知，来告诉我们所有的任务都已结束，然后我们根据也无需求再去处理其他的业务。这个时候就要用到dispatch_group_t。
 */
- (void)clickGCD8{
    
     NSLog(@"主线程1：%@",[NSThread currentThread]);
    
    // 1、创建group
    dispatch_group_t group = dispatch_group_create();
    // 2、创建并行队列
    dispatch_queue_t queue = dispatch_queue_create("TestGCD", DISPATCH_QUEUE_CONCURRENT);
    // 3、添加异步任务
    dispatch_group_async(group, queue, ^{
        NSLog(@"1- %@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"2- %@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"3- %@",[NSThread currentThread]);
    });
    
    // 4、完成所有任务之后group的回调
    dispatch_group_notify(group, queue, ^{
        NSLog(@"所有任务完成");
        //5、 回调主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"主线程2：%@",[NSThread currentThread]);
        });
    });
}

- (void)clickGCD8_1{
    //关于dispatch_group_t为我们提供了下面enter和leave
    // https://www.jianshu.com/p/fc7e33852fe3
}

#pragma mark - 延时
- (void)delay{
    NSLog(@"开始时间：%@",[NSDate date]);
    dispatch_after(dispatch_time(0, (int64_t)(2 *NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"结束时间：%@",[NSDate date]);
    });
}

#pragma mark - 单例
- (void)single{
    /*
     
     static id _instance=nil;
     
     @implementation testSingle
     
     + (instancetype)shareInstance{
     static dispatch_once_t onceToken;
     dispatch_once(&onceToken, ^{
     _instance = [[testSingle alloc] init];
     NSLog(@"init the testSingle");
     });
     return _instance;
     }
     */
}
@end
