//
//  AddViewController.m
//  生命灵数
//
//  Created by tzsoft on 2018/1/30.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *contentText;
@property (strong, nonatomic) NSArray *dataArr;
- (IBAction)confirmBtnClick:(id)sender;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updataFrame];
    [self readFile];// 读取本地文件
}
- (void)updataFrame{
    self.titleField.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view, StatusHight + 44 + 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(30);
    [self.titleField becomeFirstResponder];
    
    self.contentText.sd_layout
    .leftEqualToView(self.titleField)
    .topSpaceToView(self.titleField, 10)
    .rightEqualToView(self.titleField)
    .heightIs(200);
}

- (IBAction)confirmBtnClick:(id)sender {
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.dataArr];
    for (NSDictionary *tempDict in tempArr) {
        NSString *titleStr =tempDict[@"title"];
        if ([titleStr isEqualToString:self.titleField.text]) {
            [tempDict setValue:self.contentText.text forKey:@"content"];
            
            NSArray *addArr = [NSArray arrayWithArray:tempArr];
            [addArr writeToFile:[self getPath] atomically:YES];
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }
    }
    
    NSDictionary *data = @{@"title":self.titleField.text , @"content":self.contentText.text};
    [tempArr addObject:data];
    NSArray *addArr = [NSArray arrayWithArray:tempArr];
    [addArr writeToFile:[self getPath] atomically:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)readFile{
    self.dataArr = [NSArray arrayWithContentsOfFile:[self getPath]];
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

@end
