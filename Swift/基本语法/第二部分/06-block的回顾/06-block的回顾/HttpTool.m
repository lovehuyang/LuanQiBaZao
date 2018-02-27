//
//  HttpTool.m
//  06-block的回顾
//
//  Created by tzsoft on 2018/2/23.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool
- (void)loadData:(void (^)(NSString *))callBack{
    //
    dispatch_async(dispatch_get_global_queue(0, 0),^{
        // 回调主线程
        dispatch_sync(dispatch_get_main_queue(),^{
            callBack(@"哈哈");
        });
    });
}
@end
