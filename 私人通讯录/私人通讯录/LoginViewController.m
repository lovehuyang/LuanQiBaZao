//
//  LoginViewController.m
//  私人通讯录
//
//  Created by tzsoft on 2018/1/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
- (IBAction)loginBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

- (IBAction)autoLoginChange:(id)sender;

- (IBAction)rmbPwdChange:(id)sender;
// 数据的存储与读取
- (IBAction)saveData;
- (IBAction)readData;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 文本框文字改变时会发出通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.passwordField];
}

- (void)textChange{

    self.loginBtn.enabled = self.accountField.text.length  && self.passwordField.text.length;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


/**
 自动登录

 @param sender <#sender description#>
 */
- (IBAction)autoLoginChange:(id)sender {
    if (self.autoLoginSwitch.isOn) {
        self.rmbPwdSwitch.on = YES;
        [self.rmbPwdSwitch setOn:YES animated:YES];
    }
}


/**
 记住密码开关

 @param sender <#sender description#>
 */
- (IBAction)rmbPwdChange:(id)sender {
    if(self.rmbPwdSwitch.isOn == NO){
        self.autoLoginSwitch.on = NO;
    }
}
- (IBAction)loginBtnClick:(id)sender {
    if([self.accountField.text isEqualToString:@"123"] && [self.passwordField.text isEqualToString:@"123"]){
        [self performSegueWithIdentifier:@"pushToContactList" sender:nil];

    }else {
        
    }
}


/**
 执行sugue之后，跳转之前执行的方法（系统自动调用）
 一般在此方法中做数据传递
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UITableViewController *dvc = segue.destinationViewController;
    dvc.title = [NSString stringWithFormat:@"%@的联系人列表",self.accountField.text];
    
}
#pragma mark - 数据的存储与读取
- (IBAction)saveData {
    //1、获取沙盒的根目录
    NSString *home = NSHomeDirectory();
    
    //2、获取document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSLog(@"%@",docPath);
    
    // 3、存储至plist文件中（字符串、字典、数组、nsnumber等常见数据类型，自定义的数据模型不可以）
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    NSArray *data = @[@"asdfasf",@10];
    [data writeToFile:filePath atomically:YES];
}

- (IBAction)readData {
    //1、获取沙盒的根目录
    NSString *home = NSHomeDirectory();
    //2、获取document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSLog(@"%@",docPath);
   
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
    // 读取数据
    NSArray *dataArr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"数据读取：%@",dataArr);
}
@end
