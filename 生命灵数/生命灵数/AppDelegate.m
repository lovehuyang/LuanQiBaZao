//
//  AppDelegate.m
//  生命灵数
//
//  Created by tzsoft on 2018/1/30.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WRNavigationBar.h"
#import <AudioToolbox/AudioToolbox.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setNavBarAppearence];
    [self srtupRong];
    return YES;
}


/**
 初始化融云配置
 */
- (void)srtupRong{
    //非debug模式初始化sdk
    [[RCIM sharedRCIM] initWithAppKey:RONG_APPKEY];
    
    //设置会话列表头像和会话页面头像
    
    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];
    
    [RCIM sharedRCIM].globalConversationPortraitSize = CGSizeMake(46, 46);
    //开启消息撤回功能
    [RCIM sharedRCIM].enableMessageRecall = YES;
    
    //设置Log级别，开发阶段打印详细log
    [RCIMClient sharedRCIMClient].logLevel = RC_Log_Level_Info;
    
}

- (void)setNavBarAppearence
{
   UIColor *MainNavBarColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    UIColor *MainViewColor   = [UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1];
    
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:MainNavBarColor];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
