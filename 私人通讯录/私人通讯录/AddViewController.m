//
//  AddViewController.m
//  私人通讯录
//
//  Created by tzsoft on 2018/1/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "AddViewController.h"
#import "ContactsModel.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)addButtonClick:(id)sender;


@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fieldChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fieldChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
   
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     [self.nameField becomeFirstResponder];
}

- (void)fieldChange{
   
    self.addButton.enabled = self.nameField.text.length && self.phoneField.text.length;
}

#pragma mark - 添加时间
- (IBAction)addButtonClick:(id)sender {
    
    ContactsModel *model = [[ContactsModel alloc]init];
    model.name = self.nameField.text;
    model.phone = self.phoneField.text;
    //2、传递数据给上一级页面
    self.addBlock(model);
    
    //1、关闭当前页面
    [self.navigationController popViewControllerAnimated:YES];
}
@end
