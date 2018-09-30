//
//  HUDManager.h
//  HLYRepository
//
//  Created by tzsoft on 2018/9/30.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface HUDManager : NSObject
#pragma mark - ------------------ show tip -----------------------------
+ (void)showTipMessageInWindow:(NSString *)message;
+ (void)showTipMessageInView:(NSString *)message;
+ (void)showTipMessageInWindow:(NSString *)message aTimer:(int)aTime;
+ (void)showTipMessageInView:(NSString *)message aTimer:(int)aTimer;

#pragma mark- ------------------- show Activity----------------------------
+ (void)showActivityMessageInWindow:(NSString *)message;
+ (void)showActivityMessageInView:(NSString *)message;
+ (void)showActivityMessageInWindow:(NSString *)message aTimer:(int)aTimer;
+ (void)showActivityMessageInView:(NSString *)message aTimer:(int)aTimer;

#pragma mark - ------------------ show Image-------------------------------
+ (void)showSuccessMessage:(NSString *)message;
+ (void)showErrorMessage:(NSString *)messag;
+ (void)showInfoMessage:(NSString *)message;
+ (void)showWarnMessage:(NSString *)message;

+ (void)loadingHUD;
+ (void)hideHUD;
@end
