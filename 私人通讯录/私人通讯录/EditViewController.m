//
//  EditViewController.m
//  私人通讯录
//
//  Created by tzsoft on 2018/1/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "EditViewController.h"
#import "ContactsModel.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *savaBtn;

- (IBAction)saveBtnClick:(id )sender;

- (IBAction)edit:(UIBarButtonItem *)item;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.text = self.model.name;
    self.phoneField.text = self.model.phone;
 
}


- (IBAction)saveBtnClick:(id)sender {
    self.model.name = self.nameField.text;
    self.model.phone = self.phoneField.text;
    self.saveEvent(self.model);
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)edit:(UIBarButtonItem *)item {
    
    if([item.title isEqualToString:@"编辑"]){
        item.title = @"取消";
        self.nameField.enabled = YES;
        self.phoneField.enabled = YES;
        self.savaBtn.hidden = NO;
        [self.nameField becomeFirstResponder];
    }else{
        item.title = @"编辑";
        self.nameField.enabled = NO;
        self.phoneField.enabled = NO;
        self.savaBtn.hidden = YES;
        [self.nameField resignFirstResponder];
        [self.phoneField resignFirstResponder];
        self.nameField.text = self.model.name;
        self.phoneField.text = self.model.phone;
        
    }
    
}
@end
