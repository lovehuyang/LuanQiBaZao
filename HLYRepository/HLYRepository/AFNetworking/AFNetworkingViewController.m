//
//  AFNetworkingViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/9/7.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "AFNetworkingViewController.h"
#import <AFNetworking.h>

@interface AFNetworkingViewController ()

@end

@implementation AFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self requestEvent];
}

- (void)requestEvent{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    
    
    NSString *url = @"http://www.tzsign.com.cn:8072/mobileshield/user/appLogin.do";
    NSDictionary *paramDict = @{@"IMEI":@"EB2A4DC0-57A9-47BC-A1C4-8ADD14617B50",@"loginpwd":@"111111",@"loginuser":@"huluyang",@"lpbClientPri":@"7340220A455B4DDC5AD3771FB2FCC133C114A06A6D489E4A22808535285B237943EC894F3271B14B599EC853EEA82F4108FCBAD82B711B00CE0FD151F12F315B2554FDD617FB169BAFC5DD640827BC112198B07ABA0077354292B296AC038C2F"};
    [manager POST:url parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
}

@end
