//
//  HUDManager.m
//  HLYRepository
//
//  Created by tzsoft on 2018/9/30.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "HUDManager.h"
#import <UIKit/UIKit.h>


#define kScreen_height  [[UIScreen mainScreen] bounds].size.height
#define kScreen_width   [[UIScreen mainScreen] bounds].size.width
#define kDefaultRect     CGRectMake(0, 0, kScreen_width, kScreen_height)

#define kDefaultView [[UIApplication sharedApplication] keyWindow]

#define kGloomyBlackColor  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]
#define kGloomyClearCloler  [UIColor colorWithRed:1 green:1 blue:1 alpha:0]

// 加载提示语
static NSString *const loadingMessage = @"加载中";

@implementation HUDManager

#pragma mark - 创建指示器
+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message?message:loadingMessage;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

#pragma mark - ------------------ show tip -----------------------------
+ (void)showTipMessageInWindow:(NSString *)message
{
    [self showTipMessage:message inWindow:YES timer:2];
    
}
+ (void)showTipMessageInView:(NSString *)message
{
    [self showTipMessage:message inWindow:NO timer:2];
}
+ (void)showTipMessageInWindow:(NSString *)message aTimer:(int)aTimer
{
    [self showTipMessage:message inWindow:YES timer:aTimer];
    
}
+ (void)showTipMessageInView:(NSString *)message aTimer:(int)aTimer
{
    
    [self showTipMessage:message inWindow:NO timer:aTimer];
}
+ (void)showTipMessage:(NSString *)message inWindow:(BOOL)inWindow timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:inWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:2];
}

#pragma mark- ------------------- show Activity----------------------------
+ (void)showActivityMessageInWindow:(NSString *)message{
    [self showActivityMessage:message  inWindow:YES aTimer:0];
}
+ (void)showActivityMessageInView:(NSString *)message
{
    [self showActivityMessage:message  inWindow:NO aTimer:0];
}
+ (void)showActivityMessageInWindow:(NSString *)message aTimer:(int)aTimer{
    [self showActivityMessage:message  inWindow:YES aTimer:aTimer];
}
+ (void)showActivityMessageInView:(NSString *)message aTimer:(int)aTimer
{
    [self showActivityMessage:message  inWindow:NO aTimer:aTimer];
}
+ (void)showActivityMessage:(NSString *)message inWindow:(BOOL)inWindow aTimer:(int)aTimer
{
    MBProgressHUD *hub = [self createMBProgressHUDviewWithMessage:message  isWindiw:inWindow];
    hub.mode = MBProgressHUDModeDeterminate;
    if (aTimer > 0) {
        [hub hideAnimated:YES afterDelay:aTimer];
    }
}

#pragma mark - ------------------ show Image-------------------------------
+ (void)showSuccessMessage:(NSString *)message
{
    NSString *name =@"loading.gif";
    [self showCustomIconInWindow:name message:message];
}
+ (void)showErrorMessage:(NSString *)message
{
    NSString *name =@"MBHUD_Error";
    [self showCustomIconInWindow:name message:message];
}
+ (void)showInfoMessage:(NSString *)message
{
    NSString *name =@"MBHUD_Info";
    [self showCustomIconInWindow:name message:message];
}
+ (void)showWarnMessage:(NSString *)message
{
    NSString *name =@"MBHUD_Warn";
    [self showCustomIconInWindow:name message:message];
}
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:true];
    
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:false];
}

#pragma mark - 显示自定义指示器
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow{
    
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:2];
}

#pragma mark - 显示加载动画（帧图片）
+ (void)loadingHUD:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    UIImageView *loadingImgView = [UIImageView new];
    NSMutableArray *loadingImageArr = [NSMutableArray array];
    for (int i = 1; i < 20; i ++) {
        NSString *imgName = [NSString stringWithFormat:@"WechatIMG%d.jpeg",i];
        UIImage *image = [UIImage imageNamed:imgName];
        [loadingImageArr addObject:image];
    }
    loadingImgView.animationImages = loadingImageArr; //动画图片数组
    loadingImgView.animationDuration = 1.5; //执行一次完整动画所需的时长
    loadingImgView.animationRepeatCount = 0;
    [loadingImgView startAnimating];
    hud.customView = loadingImgView;
    hud.detailsLabel.text = @"加载中...";
    hud.mode = MBProgressHUDModeCustomView;
//    hud.backgroundColor = [UIColor redColor];// 设置背景颜色
//    hud.animationType = MBProgressHUDAnimationZoom;
//    hud.contentColor = [UIColor yellowColor];// 字体颜色
}

#pragma mark - 隐藏指示器
+ (void)hideHUD{
    
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideHUDForView:winView animated:YES];
    [MBProgressHUD hideHUDForView:[self getCurrentUIVC].view animated:YES];
}


#pragma mark - 获取当前Window视图
+(UIViewController*)getCurrentUIVC
{
    UIViewController   *cc;
    UINavigationController  *na = (UINavigationController*)[[self class] getCurrentNaVC];
    if ([na isKindOfClass:[UINavigationController class]]) {
        cc =  na.viewControllers.lastObject;
        
        if (cc.childViewControllers.count>0) {
            
            cc = [[self class] getSubUIVCWithVC:cc];
        }
    }else
    {
        cc = (UIViewController*)na;
    }
    return cc;
}

+(UINavigationController*)getCurrentNaVC
{
    
    UIViewController  *viewVC = (UIViewController*)[ self getCurrentWindowVC ];
    UINavigationController  *naVC;
    if ([viewVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController  *tabbar = (UITabBarController*)viewVC;
        naVC = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        if (naVC.presentedViewController) {
            while (naVC.presentedViewController) {
                naVC = (UINavigationController*)naVC.presentedViewController;
            }
        }
    }else
        if ([viewVC isKindOfClass:[UINavigationController class]]) {
            
            naVC  = (UINavigationController*)viewVC;
            if (naVC.presentedViewController) {
                while (naVC.presentedViewController) {
                    naVC = (UINavigationController*)naVC.presentedViewController;
                }
            }
        }else
            if ([viewVC isKindOfClass:[UIViewController class]])
            {
                if (viewVC.navigationController) {
                    return viewVC.navigationController;
                }
                return  (UINavigationController*)viewVC;
            }
    return naVC;
}

//获取当前屏幕显示的viewcontroller
+(UIViewController*)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到它
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = nil;
    UIViewController *appRootVC = window.rootViewController;
    //1、通过present弹出VC，appRootVC.presentedViewController不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        //2、通过navigationcontroller弹出VC
        //        NSLog(@"subviews == %@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    return nextResponder;
}
+(UIViewController *)getSubUIVCWithVC:(UIViewController*)vc
{
    UIViewController   *cc;
    cc =  vc.childViewControllers.lastObject;
    if (cc.childViewControllers>0) {
        
        [[self class] getSubUIVCWithVC:cc];
    }else
    {
        return cc;
    }
    return cc;
}
@end
