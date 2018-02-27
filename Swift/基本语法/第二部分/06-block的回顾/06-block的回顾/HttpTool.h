//
//  HttpTool.h
//  06-block的回顾
//
//  Created by tzsoft on 2018/2/23.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

typedef void (^testBlock)(NSArray *dataArr);

- (void)loadData:(void (^)(NSString *jsonData))callBack;
@end
