//
//  ViewController.m
//  LifeTime
//
//  Created by tzsoft on 2018/4/18.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "ViewController.h"
#import "BEMAnalogClockView.h"

@interface ViewController ()<BEMAnalogClockDelegate>
@property (strong, nonatomic)  BEMAnalogClockView *clock;// 时钟

@property (nonatomic,strong) NSDateFormatter *dateFormatter;
@property (nonatomic,strong) NSCalendar *calendar;
@property (nonatomic,strong) NSDate *date;
@property (nonatomic,strong) NSString *currentTime;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupClock];// 初始化时钟
}


- (void)setupClock{
    
    self.clock = [[BEMAnalogClockView alloc]init];
//    [self.view addSubview:self.clock];
    self.clock.sd_layout
    .leftSpaceToView(self.view, 125)
    .rightSpaceToView(self.view, 125)
    .topSpaceToView(self.view, 150)
    .heightEqualToWidth();
    self.clock.enableShadows = YES;
    self.clock.realTime = YES;
    self.clock.currentTime = YES;
    self.clock.setTimeViaTouch = NO;// 不允许拨动指针
    self.clock.borderColor = [UIColor blackColor];// 边框颜色
    self.clock.borderWidth = 5;
    self.clock.hourHandColor = [UIColor blackColor];// 时针颜色
    self.clock.minuteHandColor = [UIColor blackColor];// 分针颜色
    self.clock.secondHandColor = [UIColor redColor];// 秒针的颜色
    self.clock.faceBackgroundColor = [UIColor redColor];
    self.clock.faceBackgroundAlpha = 0;
    self.clock.delegate = self;
    self.clock.digitFont = [UIFont fontWithName:@"HelveticaNeue-Thin" size:13];
    self.clock.digitColor = [UIColor lightGrayColor]; // 数字颜色
    self.clock.enableDigit = YES;
    self.clock.tag = 1;
}
- (CGFloat)analogClock:(BEMAnalogClockView *)clock graduationLengthForIndex:(NSInteger)index {
    if (clock.tag == 1) {
        if ((!(index % 5)) == 1) { // Every 5 graduation will be longer.
            return 10;
        } else {
            return 3;
        }
    }
    else return 0;
}

- (UIColor *)analogClock:(BEMAnalogClockView *)clock graduationColorForIndex:(NSInteger)index {
    if ((!(index % 15)) == 1) { // Every 15 graduation will be blue.
        return [UIColor blackColor];
    } else {
        return [UIColor lightGrayColor];
    }
}

- (void)currentTimeOnClock:(BEMAnalogClockView *)clock Hours:(NSString *)hours Minutes:(NSString *)minutes Seconds:(NSString *)seconds {
    if (clock.tag == 1) {
        int hoursInt = [hours intValue];
        int minutesInt = [minutes intValue];
        int secondsInt = [seconds intValue];
        self.currentTime = [NSString stringWithFormat:@"%02d:%02d:%02d", hoursInt, minutesInt, secondsInt];
        NSLog(@"当前时间%@",self.currentTime);
        
        NSString *birthdayStr=@"1990-02-19 00:00:00.000";
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
        NSDate *birthdayDate = [dateFormatter dateFromString:birthdayStr];
        NSString *age = [self ageWithDateOfBirth:birthdayDate];
        NSLog(@"年龄%@",age);
    }
}

- (NSString *)ageWithDateOfBirth:(NSDate *)date{
    
    NSDate *endDate = [NSDate date];
    
    NSTimeInterval _intervatTime = [endDate timeIntervalSinceDate: date];
    
    int years = (int)(_intervatTime)/(3600 * 24 * 365);
    
    int month = ((int)(_intervatTime) - years * 3600 * 24 * 365)/(3600 * 24 * 30);
    
    int days = (((int)_intervatTime) - years * 3600 * 24 * 365 - month * 3600 * 24 * 30)/(3600*24);
    
    int hours = (((int)_intervatTime) - years * 3600 * 24 * 365 - month * 3600 * 24 * 30 - days * 3600 * 24)%(3600*24)/3600;

    int minutes = (((int)_intervatTime) - years * 3600 * 24 * 365 - month * 3600 * 24 * 30 - days * 3600 * 24 - hours * 3600)/60;
    
    int seconds = (((int)_intervatTime) - years * 3600 * 24 * 365 - month * 3600 * 24 * 30 - days * 3600 * 24 - hours * 3600 - minutes * 60);
    
    return [NSString stringWithFormat:@"%d年%d月%d天%d小时%d分钟%d秒",years,month,days,hours,minutes,seconds];
}
@end
