//
//  DetailViewController.m
//  生命灵数
//
//  Created by tzsoft on 2018/1/30.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UITextView *contentText;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setFrame];
    [self setValue];
}
- (void)setValue{
    self.titleLab.text = self.dataDict[@"title"];
    self.contentText.text = self.dataDict[@"content"];
}

- (void)setFrame{
    self.titleLab.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view, StatusHight + 44 + 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(30);
    
    self.contentText.sd_layout
    .leftEqualToView(self.titleLab)
    .topSpaceToView(self.titleLab, 10)
    .rightEqualToView(self.titleLab)
    .heightIs(200);
}

@end
