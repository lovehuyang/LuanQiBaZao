//
//  ViewController.m
//  生命灵数
//
//  Created by tzsoft on 2018/1/30.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "ViewController.h"

#define kMaxLength 4



@interface ViewController ()
{
    NSInteger currentYear;
}
- (IBAction)confirmBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UILabel *currentLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextField *birthField;
@property (weak, nonatomic) IBOutlet UILabel *resultLab;
@property (strong, nonatomic)  NSArray *dataArr;
- (IBAction)chatViewList:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updataFrame];
    [self setValue];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.birthField];
    
}
// 设置值
- (void)setValue{
    NSDate *date =[NSDate date];//简书 FlyElephant
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    currentYear=[[formatter stringFromDate:date] integerValue];
    self.currentLab.text = [NSString stringWithFormat:@"现在是%ld年",(long)currentYear];
    self.titleLab.text = @"出生日期";
}

// 设置坐标
- (void)updataFrame{
    self.currentLab.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(self.view, StatusHight + 44 + 20)
    .heightIs(40);
    self.currentLab.backgroundColor = [UIColor whiteColor];
    
    self.titleLab.sd_layout
    .topSpaceToView(self.currentLab, 20)
    .leftEqualToView(self.currentLab)
    .widthIs(80)
    .heightIs(35);
    self.titleLab.backgroundColor = [UIColor whiteColor];
    
    self.birthField.sd_layout
    .leftSpaceToView(self.titleLab, 10)
    .topEqualToView(self.titleLab)
    .rightEqualToView(self.currentLab)
    .heightRatioToView(self.titleLab, 1);
    [self.birthField becomeFirstResponder];
    
    self.confirmBtn.sd_layout
    .leftSpaceToView(self.view, 40)
    .rightSpaceToView(self.view, 40)
    .heightIs(40)
    .topSpaceToView(self.birthField, 20);
    [self.confirmBtn setBackgroundImage:[UIImage imageNamed:@"zc_button_click"] forState:UIControlStateNormal];
    [self.confirmBtn setBackgroundImage:[UIImage imageNamed:@"dl_button_no_click"] forState:UIControlStateDisabled];
    
    self.resultLab.sd_layout
    .leftEqualToView(self.titleLab)
    .rightEqualToView(self.birthField)
    .heightRatioToView(self.titleLab, 1)
    .topSpaceToView(self.confirmBtn, 5);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.birthField resignFirstResponder];
}

- (void)textChange{
    self.confirmBtn.enabled = self.birthField.text.length;
    
    UITextField *textField =self.birthField;
    NSString *toBeString = textField.text;
    if (toBeString.length > kMaxLength) {
        textField.text = [toBeString substringToIndex:kMaxLength];
    }
}

#pragma mark - 点击事件
- (IBAction)confirmBtnClick:(id)sender {
    
    NSInteger value = [self.birthField.text integerValue];
    NSInteger qianValue = value/1000;
    NSInteger baiVlaue = (value - qianValue * 1000)/100;
    NSInteger shiValue =  (value - qianValue * 1000 - baiVlaue * 100)/10;
    NSInteger geValue = value - qianValue * 1000 - baiVlaue* 100 - shiValue * 10;
    NSLog(@"%ld- %ld -%ld- %ld",(long)qianValue,(long)baiVlaue,(long)shiValue,(long)geValue);
    
    NSInteger plusValue = qianValue + baiVlaue + shiValue + geValue + 2 + 0 + 1 + 8;
    [self result:plusValue];
}

- (void)result:(NSInteger )value{
    
    while (value >= 10) {
        NSInteger qianValue = value/1000;
        NSInteger baiVlaue = (value - qianValue * 1000)/100;
        NSInteger shiValue =  (value - qianValue * 1000 - baiVlaue * 100)/10;
        NSInteger geValue = value - qianValue * 1000 - baiVlaue* 100 - shiValue * 10;
        NSLog(@"%ld- %ld -%ld- %ld",(long)qianValue,(long)baiVlaue,(long)shiValue,(long)geValue);
        value = qianValue + baiVlaue + shiValue + geValue;
    }

    self.resultLab.text = [NSString stringWithFormat:@"您的生命灵数为：%ld",(long)value];
    NSString *valueStr = [NSString stringWithFormat:@"%ld",value];
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.dataArr];
    for (NSDictionary *tempDict in tempArr) {
        NSString *titleStr =tempDict[@"title"];
        if ([titleStr isEqualToString:valueStr]) {
            UIPasteboard *pboard = [UIPasteboard generalPasteboard];
            pboard.string = tempDict[@"content"];
            return;
        }
    }
}

#pragma mark - 获取沙河目录
- (NSString *)getPath{
    NSString *home = NSHomeDirectory();
    //2、获取document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSLog(@"%@",docPath);
    
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    return filePath;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.dataArr = [NSArray arrayWithContentsOfFile:[self getPath]];
}
- (IBAction)chatViewList:(id)sender {
    
    NSString *token = @"Y93DOv20oLAs8O2xTPSUj5RwHxgRHIqxppxuAL3e1Zaqt7R8fvP7cAX6bV1FMHiD0hpD2XhBw4lkJeDGFQuyXyKYPlHC4FKF";
    
    RCNetworkStatus status = [[RCIMClient sharedRCIMClient] getCurrentNetworkStatus];
    
    if (RC_NotReachable == status) {
        NSLog(@"当前网络不可用，请检查！");
        return;
    } else {
        NSLog(@"当前网络可用！");
    }

    [AFHttpTool loginWithPhone:userName
                      password:password
                        region:@"86"
                       success:^(id response) {
                           if ([response[@"code"] intValue] == 200) {
                               NSString *token = response[@"result"][@"token"];
                               NSString *userId = response[@"result"][@"id"];
                               [self loginRongCloud:userName userId:userId token:token password:password];
                           } else {
                               //关闭HUD
                               [hud hide:YES];
                               int _errCode = [response[@"code"] intValue];
                               NSLog(@"NSError is %d", _errCode);
                               if (_errCode == 1000) {
                                   _errorMsgLb.text = @"手机号或密码错误！";
                               }
                               [_pwdTextField shake];
                           }
                       }
                       failure:^(NSError *err) {
                           [hud hide:YES];
                           _errorMsgLb.text = @"登录失败，请检查网络。";
                       }];
} else {
    _errorMsgLb.text = @"请检查手机号和密码";
}
    
    RCConversationListViewController *rvc = [[RCConversationListViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
    //登录融云服务器
//    [[RCIM sharedRCIM] connectWithToken:token
//                                success:^(NSString *userId) {
//                                    NSLog([NSString stringWithFormat:@"token is %@  userId is %@", token, userId], nil);
//
//
//                                }error:^(RCConnectErrorCode status) {
//                                    NSLog(@"");
//                                  }
//                         tokenIncorrect:^{
//                             NSLog(@"");
//                         }];
}
@end
