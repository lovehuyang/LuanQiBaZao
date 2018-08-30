//
//  LocationViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/7/4.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "LocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController ()<CLLocationManagerDelegate>// 添加位置代理

@property (nonatomic ,strong) CLLocationManager *locationManager;//定位服务

@property (nonatomic ,copy)  NSString *city;//城市
@property (nonatomic ,copy)  NSString *latitude;//经度
@property (nonatomic ,copy)  NSString *longititude;//维度

@property (nonatomic ,strong) UILabel *locationLab;//位置lab
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"定位";
    self.view.backgroundColor = [UIColor whiteColor];
    self.locationLab = [UILabel new];
    self.locationLab.frame = CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 200);
    self.locationLab.numberOfLines = 0;
    [self.view addSubview:self.locationLab];
    self.locationLab.text = @"位置信息获取中...";
    self.locationLab.textAlignment = NSTextAlignmentCenter;
    //获取经纬度
    [self getLocation];
    
}

- (void)getLocation{
    
    // 判断定位功能是否开启
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager requestWhenInUseAuthorization];
        
        /*
         kCLLocationAccuracyBestForNavigation    最适合导航
         kCLLocationAccuracyBest    精度最好的
         kCLLocationAccuracyNearestTenMeters    附近10米
         kCLLocationAccuracyHundredMeters    附近100米
         kCLLocationAccuracyKilometer    附近1000米
         kCLLocationAccuracyThreeKilometers
         */
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;// 定位精度（枚举）
        
        // 设置精度，距离过滤
//        self.locationManager.distanceFilter = 5;
        [self.locationManager startUpdatingLocation];// 开启定位
    }else{
        NSLog(@"定位服务未开启");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - CLLocationManagerDelegate
// 更新位置信息成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
//    [self.locationManager stopUpdatingLocation];// 停止位置功能
    
    CLLocation *currentLocation = locations.lastObject;
    NSLog(@"位置信息：纬度：%f - 经度%f", currentLocation.coordinate.latitude , currentLocation.coordinate.longitude);
    
    //反地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks.firstObject;
            self.city = placeMark.locality;
            if (!self.city) {
                NSLog(@"无法定位");
                return ;
            }
            
            NSString *locationStr = [[NSString alloc]initWithFormat:@"%@ - %@ - %@ - %@ - %@",placeMark.country,placeMark.locality, placeMark.subLocality,placeMark.thoroughfare,placeMark.name];
            self.locationLab.text = locationStr;
        }
    }];
}

// 更新位置信息失败
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"定位失败：%@",error.description);
    self.locationLab.text = error.description;
}

@end
